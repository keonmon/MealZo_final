package com.mealzo.controller.mobile;

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
import com.mealzo.service.MCartService;
import com.mealzo.service.MMemberService;
import com.mealzo.service.MOrderService;

@Controller
public class MMMemberController {

	@Autowired
	MMemberService ms;
	
	@Autowired
	MOrderService os;
	
	@Autowired
	MCartService cs;
	
	//@RequestMapping("/mobileUserLogin")
	//public String mobileLoginForm() {
	//	return "mobile/member/mobileLogin";
	//}
	
	@RequestMapping(value="/mobileLogin", method= {RequestMethod.GET, RequestMethod.POST})
	public String mobileLogin( @ModelAttribute("dto") @Valid MMemberVO membervo , BindingResult result, 
			HttpServletRequest request, Model model ) {
		int cnt = 0;	// 카트 개수 초기화
		// 아이디, 비번 빈칸확인
		if( result.getFieldError("id") != null ) {
			model.addAttribute("message", result.getFieldError("id").getDefaultMessage() );
			return "mobile/member/mobileLogin";
		}else if( result.getFieldError("pwd")!=null) {
			model.addAttribute("message", result.getFieldError("pwd").getDefaultMessage() );
			return "mobile/member/mobileLogin";
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
			return "mobile/member/mobileLogin";
		}
		
		
		
		HashMap<String, Object> mvo = list.get(0);
		
		if( mvo.get("PWD") == null ) {
			model.addAttribute("message", "밀조) 비밀번호 오류. 밀조왕에게 문의하세요");
			return "mobile/member/mobileLogin";
		}else if( !mvo.get("PWD").equals(membervo.getPwd())) {
			model.addAttribute("message", "밀조) 비밀번호가 맞지않습니다");
			return "mobile/member/mobileLogin";
		}else if( mvo.get("USEYN").equals("x")) {
			model.addAttribute("message", "밀조) 탈퇴하거나 휴먼중인 계정입니다. 하단 공지에서 비회원 문의를 통해 밀조왕에게 문의하세요");
			return "mobile/member/mobileLogin";
		}else if( mvo.get("PWD").equals(membervo.getPwd())) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", mvo);
			
			// 카트 개수 세션에 담기
			paramMap.put("cnt", 0);	// 카드 개수 담아올 변수
			cs.getCartCnt(paramMap);
			//System.out.println(paramMap.get("cnt"));
			cnt = Integer.parseInt(paramMap.get("cnt").toString());
			session.setAttribute("cartCnt",cnt);
			
			return "redirect:/mobileMain";
			
			
		}else {
			model.addAttribute("message", "밀조) 무슨이유인지 모르겠지만 로그인 안돼요");
			return "mobile/member/mobileLogin";
		}
		
	}
	
	
	
	@RequestMapping(value="/mobileLogout")
	public String mobileLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("loginUser");
		// 카트 개수 세션 삭제
		session.removeAttribute("cartCnt");
		return "redirect:/mobileMain";
	}
	
	
	@RequestMapping(value="/mobileContract")
	public String mobileContract() {
		return "mobile/member/mobileContract";
	}
	
	
	@RequestMapping("/mobileJoinForm")
	public String mobileJoin_form( ) {
		return "mobile/member/mobileJoin";
	}
	
	
	
	@RequestMapping("/mobileIdcheck")
	public ModelAndView mobileIdcheck( @RequestParam("id") String id ) {
		
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
		mav.setViewName("mobile/member/mobileIdcheck");
		
		return mav;
	}
	
	
	@RequestMapping(value="/mobileFindZipNum")
	public String mobileFind_zip( HttpServletRequest request , Model model) {
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
		return "mobile/member/mobileFindZipNum";
	}
	
	
	@RequestMapping(value="/mobileJoin", method=RequestMethod.POST)
	public ModelAndView mobileMemberJoin( 
			@ModelAttribute("dto") @Valid MMemberVO membervo,
			BindingResult result, 
			@RequestParam("reid") String reid, 
			@RequestParam("pwdCheck") String pwchk, 
			@RequestParam("addr1") String address1, 
			@RequestParam("addr2") String address2, 
			Model model ) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mobile/member/mobileJoin");  
		
		
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
			
			mav.addObject("message", "회원가입이 완료되었습니다");
			mav.setViewName("mobile/member/mobileLogin"); 
		}
		return mav;
	}
	
	
	@RequestMapping(value = "/mobileUpdateForm")
	public ModelAndView mobileUpdateForm( 
			@ModelAttribute("dto") @Valid MMemberVO membervo,
			BindingResult result, 
			HttpServletRequest request,
			Model model ) {
		ModelAndView mav = new ModelAndView(); 
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser 
		= (HashMap<String, Object>)session.getAttribute("loginUser");
		
		if( loginUser == null ) {
			mav.setViewName("mobile/member/mobileLogin");
		} else {
		String address = (String)loginUser.get("ADDRESS");
		paramMap.put("id", (String)loginUser.get("ID"));
		paramMap.put("name", (String)loginUser.get("NAME"));
		paramMap.put("email", (String)loginUser.get("EMAIL"));
		paramMap.put("phone", (String)loginUser.get("PHONE"));
		paramMap.put("zip_num", (String)loginUser.get("ZIP_NUM"));
		paramMap.put("address", address);
		
		if( address != null) {
			int k1 = address.indexOf(" ");
			int k2 = address.indexOf(" ", k1+1); 
			int k3 = address.indexOf(" ", k2+1); 
			
			
			String addr1 = address.substring(0, k3);
			
			String addr2 = address.substring(k3+1);
			
			mav.addObject("addr1", addr1);
			mav.addObject("addr2", addr2);
			
		}
		mav.setViewName("mobile/member/mobileUpdate");
		}
		return mav;
	}

	
	
	
	@RequestMapping(value = "/mobileMemberUpdate", method=RequestMethod.POST)
	public String mobileMemberUpdate( @ModelAttribute("dto") @Valid MMemberVO membervo,
			BindingResult result,
			@RequestParam(value="pwdCheck", required=false) String pwdCheck,
			@RequestParam("addr1") String address1, 
			@RequestParam("addr2") String address2,
			HttpServletRequest request,
			Model model ) {
		
		if( result.getFieldError("pwd") != null ) {
			model.addAttribute("message", result.getFieldError("pwd").getDefaultMessage() );
			return "mobile/member/mobileUpdate";
		} else if( result.getFieldError("name") != null ) {
			model.addAttribute("message", result.getFieldError("name").getDefaultMessage() );
			return "mobile/member/mobileUpdate";
		} else if( result.getFieldError("email") != null ) {
			model.addAttribute("message", result.getFieldError("email").getDefaultMessage() );
			return "mobile/member/mobileUpdate";
		} else if( result.getFieldError("phone") != null ) {
			model.addAttribute("message", result.getFieldError("phone").getDefaultMessage() );
			return "mobile/member/mobileUpdate";
		} else if( pwdCheck == null || (  pwdCheck != null && !pwdCheck.equals(membervo.getPwd() ) ) ) {
			model.addAttribute("message", "비밀번호 확인 일치하지 않습니다");
			return "mobile/member/mobileUpdate";
		}
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("ID", membervo.getId() );
		paramMap.put("PWD", membervo.getPwd() );
		paramMap.put("NAME", membervo.getName() );
		paramMap.put("EMAIL", membervo.getEmail() );
		paramMap.put("PHONE", membervo.getPhone() );
		paramMap.put("ZIP_NUM", membervo.getZip_num() );
		paramMap.put("ADDRESS", address1 + " " + address2 );

		ms.updateMember( paramMap );
		
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", paramMap);

		return "redirect:/mobileMain";
	}
	
	@RequestMapping(value = "/mobileWithDrawal")
	public ModelAndView mobileWithDrawal( 
			@ModelAttribute("dto") @Valid MMemberVO membervo,
			BindingResult result, 
			HttpServletRequest request,
			Model model ) {
		ModelAndView mav = new ModelAndView(); 
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		mav.setViewName("mobile/member/mobileCompleteWithdrawal");
		
		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser 
		= (HashMap<String, Object>)session.getAttribute("loginUser");
		
		if( loginUser == null ) {
			mav.setViewName("mobile/member/mobileLogin");
		} else {
			//System.out.println((String)loginUser.get("ID"));
			paramMap.put("id", (String)loginUser.get("ID"));
			paramMap.put("ref_cursor", null);
			
			//mdao.updateUseyn( mvo.getId() );
			ms.updateUseyn( paramMap );
			
			//cdao.deleteCart( mvo.getId() );
			cs.deleteCart2( paramMap );
			
			//ArrayList<Integer> oseqList	= odao.selectOseqOrderAll( mvo.getId() );
			os.selectOseqOrderAll( paramMap );
			
			ArrayList< HashMap<String, Object> >oseqList 
			= (ArrayList< HashMap<String, Object> >)paramMap.get("ref_cursor");
			
			for(HashMap<String, Object> oseq : oseqList) {
				paramMap.put("oseq", oseqList);
				//odao.deleteOrders(oseq);
				os.deleteOrders( paramMap );
				//odao.deleteOrder_detail(oseq);
				os.deleteOrder_detail( paramMap );
				
				//System.out.println(paramMap);
				//System.out.println(oseqList);
				//System.out.println(oseq);
			}			
			session.removeAttribute("loginUser");
		}
		return mav;
	}
	
	@RequestMapping(value = "/mobileFindIdForm", method=RequestMethod.GET)
	public String mobileFindIdForm() {
	return "mobile/member/mobileFindIdForm";
	}
	
	
	@RequestMapping(value = "/mobileFindIdStep1", method=RequestMethod.POST)
	public ModelAndView mobileFindIdStep1( 
			@ModelAttribute("dto") @Valid MMemberVO membervo,
			BindingResult result, 
			@RequestParam("selected2") String selected2,
			HttpServletRequest request,
			Model model ) {
		ModelAndView mav = new ModelAndView(); 
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		mav.setViewName("mobile/member/mobileFindIdForm");
		
		if(membervo.getEmail() != null && !"".equals(membervo.getEmail())) {
			//mmemberVO mvo = mdao.getMemberByemail(name, email);
			paramMap.put("email", membervo.getEmail());
			paramMap.put("name", membervo.getName());
			paramMap.put("ref_cursor", null);
			
			ms.getMemberByemail(paramMap);
			
			ArrayList< HashMap<String, Object> >list 
			= (ArrayList< HashMap<String, Object>>)paramMap.get("ref_cursor");
		
			if( list.size() == 0 ) {
				model.addAttribute("msg", "해당회원이 없습니다");
				//mav.setViewName("member/findIdForm");
			} else {
				HashMap<String , Object > mvo = list.get(0);
				String id = (String)mvo.get("ID");
				String pwd = (String)mvo.get("PWD");
				
				model.addAttribute("id", id);
				model.addAttribute("pwd", pwd);
				model.addAttribute("email", membervo.getEmail());
				mav.setViewName("mobile/member/mobileFindIdconfirmNumber");		
				
				//System.out.println(id);
				//System.out.println(pwd);
				
			}	
		}else if(membervo.getPhone() != null && !"".equals(membervo.getPhone())){
			//mmemberVO mvo = mdao.getMemberByphone(name, phone);
			paramMap.put("phone", membervo.getPhone());
			paramMap.put("name", membervo.getName());
			paramMap.put("ref_cursor", null);
			
			ms.getMemberByphone(paramMap);
			
			ArrayList< HashMap<String, Object> > list 
			= (ArrayList< HashMap<String, Object>>)paramMap.get("ref_cursor");
			
			if( list.size() == 0 ) {
				model.addAttribute("msg", "해당회원이 없습니다");
				//mav.setViewName("member/findIdForm");
			} else {
				HashMap<String , Object > mvo = list.get(0);
				String id = (String)mvo.get("ID");
				String pwd = (String)mvo.get("PWD");
				
				model.addAttribute("id", id);
				model.addAttribute("pwd", pwd);
				model.addAttribute("phone", membervo.getPhone());
				mav.setViewName("mobile/member/mobileFindIdconfirmNumber");
			}	
		}
		model.addAttribute("name", membervo.getName());
		model.addAttribute("selected2", selected2);
		return mav;
	}
	
	
	@RequestMapping(value = "/mobileFindIdStep2", method=RequestMethod.POST)
	public ModelAndView mobileFindIdStep2( 
			@ModelAttribute("dto") @Valid MMemberVO membervo,
			BindingResult result, 
			@RequestParam("confirmNum") String confirmNum,
			@RequestParam("selected2") String selected2,
			HttpServletRequest request,
			Model model ) {
		
		
		ModelAndView mav = new ModelAndView(); 
		model.addAttribute("selected2", selected2);
		model.addAttribute("name", membervo.getName());
		model.addAttribute("pwd", membervo.getPwd());
		model.addAttribute("email", membervo.getEmail());
		model.addAttribute("phone", membervo.getPhone());
		model.addAttribute("id", membervo.getId());
		
		//System.out.println(membervo.getName());
		//System.out.println(membervo.getPwd());
		//System.out.println(membervo.getEmail());
		//System.out.println(membervo.getPhone());
		//System.out.println(membervo.getId());
		
		if(!confirmNum.equals("0000")) {
			model.addAttribute("msg", "인증번호가 맞지  않습니다");	
			mav.setViewName("mobile/member/mobileFindIdconfirmNumber");	
		}else {
			mav.setViewName("mobile/member/mobileViewId");
		}
		
		return mav;
	}
	

}
