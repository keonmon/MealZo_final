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

import com.ezen.spg16.dto.MemberVO;
import com.mealzo.dto.MMemberVO;
import com.mealzo.service.MMemberService;

@Controller
public class MMemberController {

	@Autowired
	MMemberService ms;
	
	@RequestMapping("/userLogin")
	public String loginForm() {
		return "member/login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login( @ModelAttribute("dto") @Valid MMemberVO membervo , BindingResult result, 
			HttpServletRequest request, Model model ) {
		
		// 아이디, 비번 빈칸확인
		if( result.getFieldError("id") != null ) {
			model.addAttribute("message", result.getFieldError("id").getDefaultMessage() );
			return "member/login";
		}else if( result.getFieldError("pwd")!=null) {
			model.addAttribute("message", result.getFieldError("pwd").getDefaultMessage() );
			return "member/login";
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
			return "member/login";
		}
		
		HashMap<String, Object> mvo = list.get(0);
		
		if( mvo.get("PWD") == null ) {
			model.addAttribute("message", "밀조) 비밀번호 오류. 밀조왕에게 문의하세요");
			return "member/login";
		}else if( !mvo.get("PWD").equals(membervo.getPwd())) {
			model.addAttribute("message", "밀조) 비밀번호가 맞지않습니다");
			return "member/login";
		}else if( mvo.get("USEYN").equals("n")) {
			model.addAttribute("message", "밀조) 탈퇴하거나 휴먼중인 계정입니다. 밀조왕에게 문의하세요");
			return "member/login";
		}else if( mvo.get("PWD").equals(membervo.getPwd())) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", mvo);
			return "redirect:/";
		}else {
			model.addAttribute("message", "밀조) 무슨이유인지 모르겠지만 로그인 안돼요");
			return "member/login";
		}
	}
	
	
	
	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("loginUser");
		return "redirect:/";
	}
	
	
	
	@RequestMapping("/memberJoinForm")
	public String join_form( ) {
		return "member/memberJoinForm";
	}
	
	
	
	@RequestMapping("/idcheck")
	public ModelAndView idcheck( @RequestParam("userid") String userid ) {
		
		ModelAndView mav = new ModelAndView();
		
		HashMap<String , Object> paramMap = new HashMap<String , Object>();
		paramMap.put("userid", userid);
		paramMap.put("ref_cursor", null);
		ms.getMember( paramMap );
		ArrayList< HashMap<String , Object> > list 
			= ( ArrayList< HashMap<String , Object> > )paramMap.get("ref_cursor");
		
		if( list.size() == 0 ) mav.addObject("result" , -1);
		else mav.addObject("result", 1);
		
		mav.addObject("userid", userid);
		mav.setViewName("member/idcheck");
		
		return mav;
	}
	
	
	
	@RequestMapping(value="/memberJoin", method=RequestMethod.POST)
	public ModelAndView memberJoin( 
			@ModelAttribute("dto") @Valid MemberVO membervo,
			BindingResult result, 
			@RequestParam("re_id") String reid, 
			@RequestParam("pwd_check") String pwchk, 
			Model model ) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/memberJoinForm");  
		if( reid != null && reid.equals("") ) mav.addObject("re_id", reid);
		if( result.getFieldError("userid")!=null) 
			mav.addObject("message", "아이디 입력하세요");
		else if( result.getFieldError("pwd") != null ) 
			mav.addObject("message", "비밀번호 입력하세요");
		else if( result.getFieldError("name") != null ) 
			mav.addObject("message", result.getFieldError("name").getDefaultMessage() );
		else if( !membervo.getUserid().equals(reid)) 
			mav.addObject("message","아이디 중복체크가 되지 않았습니다");
		else if( !membervo.getPwd().equals(pwchk)) 
			mav.addObject("message","비밀번호 확인이 일치하시 않습니다.");
		else {  
			//ms.insertMember( membervo );
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("userid", membervo.getUserid());
			paramMap.put("pwd", membervo.getPwd());
			paramMap.put("name", membervo.getName());
			paramMap.put("email", membervo.getEmail());
			paramMap.put("phone", membervo.getPhone());
			ms.insertMember( paramMap );
			mav.addObject("message", "회원가입이 완료되었습니다. 로그인 하세요");
			mav.setViewName("member/loginForm"); // 정상 회원가입이 이루어졌을때 로그인폼으로 이동 목적지를 바꿉니다
		}
		return mav;
	}
	
	
}
