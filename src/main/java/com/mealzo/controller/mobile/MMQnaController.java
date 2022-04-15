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
import com.mealzo.dto.MQnaVO;
import com.mealzo.dto.Paging;
import com.mealzo.service.MQnaService;

@Controller
public class MMQnaController {

	@Autowired
	MQnaService qs;
	
	
	@RequestMapping("/mobileQnaForm")
	public ModelAndView mobileQnaForm(Model model, HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser =
				(HashMap<String, Object> )session.getAttribute("loginUser");
		if(loginUser ==null) {
			mav.setViewName("mobile/member/mobileLogin");
		}else {
			
			int page=1;
			if(request.getParameter("sub") !=null) {
				session.removeAttribute("page");
			}
			if(request.getParameter("page")!=null) {
				page=Integer.parseInt(request.getParameter("page"));
				session.setAttribute("page", page);
			}else if(session.getAttribute("page")!=null) {
				page=(Integer)session.getAttribute("page");
			}else {
				session.removeAttribute("page");
			}	
			
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			Paging paging = new Paging();
			paging.setPage(page); //현재 페이지
			
		
		   paramMap.put("cnt" ,0);
		   qs.getAllCountQna(paramMap);
		    
		    int cnt = Integer.parseInt(paramMap.get("cnt").toString());
		    paging.setTotalCount(cnt);
		 paging.paging();
		    paramMap.put("startNum", paging.getStartNum());
		    paramMap.put("endNum", paging.getEndNum());
			paramMap.put("id", loginUser.get("ID"));
			paramMap.put("ref_cursor", null);
			qs.listQna(paramMap);
			//System.out.println(cnt);
			
			ArrayList<HashMap<String, Object>> list
			 = (ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor");
			
			mav.addObject("paging", paging);
			mav.addObject("mqnaList", list);
			mav.setViewName("mobile/qna/mobileQnaList");
		}
		
		return mav;
			
	}
	
	@RequestMapping("/mobileQnaView")

	public ModelAndView mobileQnaView(

			@RequestParam("qseq") int qseq ,HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser =
				(HashMap<String, Object> )session.getAttribute("loginUser");
		if(loginUser ==null) {
			mav.setViewName("mobile/member/mobileLogin");
		}else {
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			
			paramMap.put("qseq", qseq);
			paramMap.put("ref_cursor", null);
			qs.getQna(paramMap);
			
			ArrayList<HashMap<String, Object>> list
			 =(ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor");
			mav.addObject("mqnaVO", list.get(0));
			mav.setViewName("mobile/qna/mobileQnaView");
			
			
		}
		
		return mav;
	}
	@RequestMapping("/mobileQnaWriteForm")

	public String mobileQnaWriteForm(HttpServletRequest request) {

		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser
			= (HashMap<String, Object>)session.getAttribute("loginUser");
		
		if( loginUser == null) {
		 return "mobile/member/mobileLogin";
		}else
			
		return "mobile/qna/mobileQnaWrite";
	}
	

	@RequestMapping(value="/mobileQnaWrite",  method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView mobileQnaWrite(HttpServletRequest request, @ModelAttribute("dto")

	@Valid MQnaVO qnavo, BindingResult result,
	@RequestParam("subject") String subject, 
	@RequestParam("content") String content) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser =
				(HashMap<String, Object> )session.getAttribute("loginUser");
		if(loginUser ==null) 
			mav.setViewName("mobile/member/mobileLogin");
		else {
			if(result.getFieldError("subject")!=null) {
				mav.addObject("message", result.getFieldError("subject").getDefaultMessage());
				mav.setViewName("mobile/qna/mobileQnaWrite");
				 return mav;
			}else if(result.getFieldError("content") !=null) {
				mav.addObject("message", result.getFieldError("content").getDefaultMessage());
				mav.setViewName("mobile/qna/mobileQnaWrite");
				return mav;
			}

			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("content", content);
			paramMap.put("subject", subject);
			paramMap.put("id", loginUser.get("ID"));
			qs.insertQna(paramMap);
			mav.setViewName("redirect:/mobileQnaForm");
		}

		return mav;
	}
	
	@RequestMapping("/mobileNmqnaForm")
	public ModelAndView mobileNonmemberqnaForm(Model model, HttpServletRequest request,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "key", required = false) String key) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser =
				(HashMap<String, Object> )session.getAttribute("loginUser");
		if(loginUser!=null) {

			mav.setViewName("redirect:/mobileQnaForm");

		}else {
			
			page=1;
			if(request.getParameter("sub") !=null) {
				session.removeAttribute("page");
			}
			if(request.getParameter("page")!=null) {
				page=Integer.parseInt(request.getParameter("page"));
				session.setAttribute("page", page);
			}else if(session.getAttribute("page")!=null) {
				page=(Integer)session.getAttribute("page");
			}else {
				session.removeAttribute("page");
			}	
			
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			Paging paging = new Paging();
			paging.setPage(page); //현재 페이지
			
		
		   paramMap.put("cnt" ,0);
		   qs.getAllCountnmQna(paramMap);
		    
		    int cnt = Integer.parseInt(paramMap.get("cnt").toString());
		    paging.setTotalCount(cnt);
		    paging.paging();
		    paramMap.put("startNum", paging.getStartNum());
		    paramMap.put("endNum", paging.getEndNum());
			paramMap.put("ref_cursor", null);
			
			qs.nmlistQna(paramMap);
			
			ArrayList<HashMap<String, Object>> list
			 = (ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor");
			mav.addObject("paging", paging);
			mav.addObject("nmqnaList", list);

			mav.setViewName("mobile/qna/mobileNmqnaList");			

		}
		return mav;	
	}
	
	@RequestMapping("/mobileNmqnaWriteForm")

	public String mobileNmqnaWriteForm(HttpServletRequest request) {

		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser
			= (HashMap<String, Object>)session.getAttribute("loginUser");
		if(loginUser!=null) {

			return "redirect:/mobileQnaForm";
		}else {
		return "mobile/qna/mobileNmqnaWrite";
		}
	}
		
	@RequestMapping(value="/mobileNmqnaWrite",  method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView mobileNmqnaWrite(HttpServletRequest request, @ModelAttribute("dto")
	@Valid MQnaVO qnavo, 
	BindingResult result,
	@RequestParam("subject") String subject, 
	@RequestParam("content") String content) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser =
				(HashMap<String, Object> )session.getAttribute("loginUser");
		if(loginUser!=null) {
			mav.setViewName("redirect:/mobileQnaForm");
		}else{
			if(result.getFieldError("id")!=null) {
				mav.addObject("message", result.getFieldError("id").getDefaultMessage());
				mav.setViewName("mobile/qna/mobileNmqnaWrite");
				 return mav;
			}else if(result.getFieldError("pwd")!=null) {
				mav.addObject("message", result.getFieldError("pwd").getDefaultMessage());
				mav.setViewName("mobile/qna/mobileNmqnaWrite");
				 return mav;
			}else if(result.getFieldError("subject")!=null) {
				mav.addObject("message", result.getFieldError("subject").getDefaultMessage());
				mav.setViewName("mobile/qna/mobileNmqnaWrite");
				 return mav;
			}else if(result.getFieldError("content") !=null) {
				mav.addObject("message", result.getFieldError("content").getDefaultMessage());
				mav.setViewName("mobile/qna/mobileNmqnaWrite");
				return mav;
			}	
			System.out.println(subject);
			System.out.println(content);
			System.out.println(qnavo.getSubject());
			System.out.println(qnavo.getContent());
			System.out.println(qnavo.getId());
			System.out.println(qnavo.getPwd());	

			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("content", content);
			paramMap.put("subject", subject);
			paramMap.put("id", qnavo.getId());
			paramMap.put("pwd", qnavo.getPwd());
			
			qs.insertnmQna(paramMap);
			
			mav.setViewName("redirect:/mobileNmqnaForm");
		}
		return mav;
	}
	
	@RequestMapping("/mobileNmqnaView")
	public ModelAndView mobileNmqnaView(
			@RequestParam(value="nqseq",  required=false) int nqseq ,
			@RequestParam("pwd") String pwd ,
			@RequestParam("mvo") String mvo ,
			@RequestParam("checkpwd") String checkpwd ,
			MMemberVO membervo,
			@RequestParam(value="message",  required=false) String message ,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser =
				(HashMap<String, Object> )session.getAttribute("loginUser");
		if(loginUser!=null) {

			mav.setViewName("redirect:/mobileQnaForm");
		}else {
			if(!checkpwd.equals(membervo.getPwd())) {
				mav.addObject("message", "비밀번호가 틀렸습니다");
				mav.setViewName("redirect:/mobilePwdcheck");				

			}else{
				HashMap<String, Object> paramMap = new HashMap<String, Object>();
				paramMap.put("nqseq", nqseq);
				paramMap.put("ref_cursor", null);
				qs.getnmQna(paramMap);
				
				ArrayList<HashMap<String, Object>> list
				 =(ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor");
				mav.addObject("mqnaVO", list.get(0));
	
				mav.setViewName("mobile/qna/mobileNmqnaView");
			}
			mav.addObject("nqseq", nqseq);
		}
		return mav;
	}
	
	@RequestMapping("/mobilePwdcheck")

	public String mobilePwdcheck(HttpServletRequest request,

			@RequestParam(value="message",  required=false) String message ,
			Model model,
			@RequestParam(value="checkpwd", required=false) String checkpwd ,
			@RequestParam(value="nqseq", required=false) int nqseq) {
		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser
			= (HashMap<String, Object>)session.getAttribute("loginUser");
		if(loginUser!=null) {

			return "redirect:/mobileQnaForm";

		}else {
			
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("nqseq", nqseq);
			paramMap.put("ref_cursor", null);
			
			qs.getNmqnaByNqseq(paramMap);
			
			ArrayList< HashMap<String, Object> > list 
			= (ArrayList< HashMap<String, Object>>)paramMap.get("ref_cursor");
			
			HashMap<String , Object > mvo = list.get(0);
			String pwd = (String)mvo.get("PWD");
			
			model.addAttribute("message", message);
			model.addAttribute("mvo", mvo);
			model.addAttribute("pwd", pwd);
			model.addAttribute("nqseq", nqseq);

			return "mobile/qna/mobilePwdcheck";	

		}	
	}
	


}

