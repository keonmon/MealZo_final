package com.mealzo.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mealzo.dto.MMemberVO;
import com.mealzo.service.MMemberService;

@Controller
public class MMemberController {

	@Autowired
	MMemberService ms;
	
	@RequestMapping("/userLogin")
	public String loginForm() {
		return "member/Login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login( @ModelAttribute("dto") @Valid MMemberVO membervo , BindingResult result, 
			HttpServletRequest request, Model model ) {
		
		// 아이디, 비번 빈칸확인
		if( result.getFieldError("id") != null ) {
			model.addAttribute("message", result.getFieldError("id").getDefaultMessage() );
			return "member/Login";
		}else if( result.getFieldError("pwd")!=null) {
			model.addAttribute("message", result.getFieldError("pwd").getDefaultMessage() );
			return "member/Login";
		}
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", membervo.getId());
		paramMap.put("ref_cursor", null);
		
		ms.getMember( paramMap );  
	
		// 리스트 조회
		ArrayList< HashMap<String, Object> >list 
			= (ArrayList< HashMap<String, Object> >)paramMap.get("ref_cursor");
		if( list.size() == 0 ) {
			model.addAttribute("message", "밀조) 아이디가 없습니다");
			return "member/Login";
		}
		
		HashMap<String, Object> mvo = list.get(0);
		
		if( mvo.get("PWD") == null ) {
			model.addAttribute("message", "밀조) 비밀번호 오류. 밀조왕에게 문의하세요");
			return "member/Login";
		}else if( !mvo.get("PWD").equals(membervo.getPwd())) {
			model.addAttribute("message", "밀조) 비밀번호가 맞지않습니다");
			return "member/Login";
		}else if( mvo.get("USEYN").equals("n")) {
			model.addAttribute("message", "밀조) 탈퇴하거나 휴먼중인 계정입니다. 밀조왕에게 문의하세요");
			return "member/Login";
		}else if( mvo.get("PWD").equals(membervo.getPwd())) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", mvo);
			return "redirect:/";
		}else {
			model.addAttribute("message", "밀조) 무슨이유인지 모르겠지만 로그인 안돼요");
			return "member/Login";
		}
	}
	
	
	
	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("loginUser");
		return "redirect:/";
	}
	
	
	@RequestMapping(value="/contract")
	public String contract() {
		return "member/Contract";
	}
	
	
	@RequestMapping("/joinForm")
	public String join_form( ) {
		return "member/Join";
	}
	
	
	
	@RequestMapping("/idcheck")
	public ModelAndView idcheck( @RequestParam("id") String id ) {
		
		ModelAndView mav = new ModelAndView();
		
		HashMap<String , Object> paramMap = new HashMap<String , Object>();
		paramMap.put("id", id);
		paramMap.put("ref_cursor", null);
		ms.getMember( paramMap );
		ArrayList< HashMap<String , Object> > list 
			= ( ArrayList< HashMap<String , Object> > )paramMap.get("ref_cursor");
		
		//System.out.println(list.size());
		if( list.size() == 0 ) mav.addObject("result" , -1);
		else mav.addObject("result", 1);
		
		mav.addObject("id", id);
		mav.setViewName("member/Idcheck");
		
		return mav;
	}
	
	
	@RequestMapping(value="/findZipNum")
	public String find_zip( HttpServletRequest request , Model model) {
		String dong=request.getParameter("dong");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		if(dong != null && dong.trim().equals("")==false){			
			paramMap.put( "ref_cursor", null );
			paramMap.put("dong", dong);
			
			ms.selectAddressByDong(paramMap);
			
			ArrayList< HashMap<String,Object> > list 
				= (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor");
			
			// System.out.println(list.size() + dong);
			
			model.addAttribute("addressList" , list);
		}
		return "member/FindZipNum";
	}
	
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public ModelAndView memberJoin( 
			@ModelAttribute("dto") @Valid MMemberVO membervo,
			BindingResult result, 
			@RequestParam("reid") String reid, 
			@RequestParam("pwdCheck") String pwchk, 
			@RequestParam("addr1") String address1, 
			@RequestParam("addr2") String address2, 
			Model model ) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/Join");  
		
		
		if( reid != null && reid.equals("") ) mav.addObject("reid", reid);
		if( result.getFieldError("id")!=null) 
			mav.addObject("message", result.getFieldError("id").getDefaultMessage() );
		else if( result.getFieldError("pwd") != null ) 
			mav.addObject("message", result.getFieldError("pwd").getDefaultMessage() );
		else if( result.getFieldError("name") != null ) 
			mav.addObject("message", result.getFieldError("name").getDefaultMessage() );
		else if( result.getFieldError("email") != null ) 
			mav.addObject("message", result.getFieldError("email").getDefaultMessage() );
		else if( result.getFieldError("phone") != null ) 
			mav.addObject("message", result.getFieldError("phone").getDefaultMessage() );
		else if( !membervo.getId().equals(reid)) 
			mav.addObject("message","아이디 중복체크가 되지 않았습니다");
		else if( !membervo.getPwd().equals(pwchk)) 
			mav.addObject("message","비밀번호 확인이 일치하시 않습니다.");
		else {  
			//ms.insertMember( membervo );
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("id", membervo.getId());
			paramMap.put("pwd", membervo.getPwd());
			paramMap.put("name", membervo.getName());
			paramMap.put("email", membervo.getEmail());
			paramMap.put("phone", membervo.getPhone());
			paramMap.put("zip_num", membervo.getZip_num());
			paramMap.put("address", address1 + " " + address2);
			
			ms.insertMember( paramMap );
			
			mav.addObject("message", "회원가입이 완료되었습니다. 로그인 하세요");
			mav.setViewName("member/Login"); 
		}
		return mav;
	}
	
	
}
