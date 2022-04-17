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

import com.mealzo.dto.MAskVO;
import com.mealzo.dto.Paging;
import com.mealzo.service.MAskService;

@Controller
public class MMAskController {
	@Autowired
	MAskService mas;
	
	
	
  @RequestMapping("/mobileAskForm")
  public ModelAndView askForm(Model model, HttpServletRequest request) {
	  ModelAndView mav =new ModelAndView();
	    HttpSession session = request.getSession();
		HashMap<String, Object> loginUser =
     	(HashMap<String, Object>)session.getAttribute("loginUser");

		if(loginUser==null) {
			mav.setViewName("mobile/member/mobileLogin");
			return mav;
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
		  mas.getAllCountAsk(paramMap);
			
			
			   int cnt = Integer.parseInt(paramMap.get("cnt").toString());
			    paging.setTotalCount(cnt);
			    paging.paging();
			    paramMap.put("startNum", paging.getStartNum());
			    paramMap.put("endNum", paging.getEndNum());
			
			paramMap.put("id", loginUser.get("ID"));
			//paramMap.put("pseq", pseq);
			paramMap.put("ref_cursor", null);
			mas.listMAsk(paramMap);
			System.out.println(cnt);
			ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor");
		
			mav.addObject("paging", paging);
			mav.addObject("myAskList", list);
			
			mav.setViewName("mobile/mypage/mobileMyAsk");
			
		}
			
	  return mav;
	  
	  
  }
  @RequestMapping("/mobileAskDetail")
  public ModelAndView askDetail(@RequestParam("aseq") int aseq , Model model, HttpServletRequest request) {
	  ModelAndView mav = new ModelAndView();
	  HttpSession session = request.getSession();
			HashMap<String, Object> loginUser =
	     	(HashMap<String, Object>)session.getAttribute("loginUser");

			if(loginUser==null) {
				mav.setViewName("mobile/member/mobileLogin");
				return mav;
				
			}else {
				HashMap<String, Object> paramMap = new HashMap<String, Object>();
			    paramMap.put("aseq", aseq);
			    paramMap.put("ref_cursor", null);
			    mas.getAsk(paramMap);
			    
			    ArrayList<HashMap<String, Object>> list 
			     =(ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor");
			    mav.addObject("maskVO", list.get(0));
			    mav.setViewName("mobile/mypage/mobileAskDetail");
			}
  return mav;
  }
		  
  @RequestMapping("/mobileAskWriteForm")
  public String askWriteForm(HttpServletRequest request,
		  @RequestParam("pseq") int pseq) {
		HttpSession session = request.getSession();
		session.setAttribute("redirectUrl", "mobileAskWriteForm?pseq="+pseq);
		HashMap<String, Object> loginUser
			= (HashMap<String, Object>)session.getAttribute("loginUser");
		
		
		if( loginUser == null) {
		 return "mobile/member/mobileLogin";
		}else {
			request.setAttribute("pseq",pseq);
			System.out.println("pseq" + pseq);
		}
		return "mobile/mypage/mobileMyAskWrite";
		
	}
  
  @RequestMapping(value="/mobileAskWrite", method=RequestMethod.POST)
  public ModelAndView askWrite(@ModelAttribute("dto") @Valid MAskVO askvo, BindingResult result,
		  @RequestParam("title") String title, @RequestParam("content_a") String content_a,
		  HttpServletRequest request ,  @RequestParam("pseq") String pseq
		  ) {
	  
	  //int pseq = Integer.parseInt(request.getParameter("pseq"));
	  
	  ModelAndView mav = new ModelAndView();
	  HttpSession session = request.getSession();
	 
		HashMap<String, Object> loginUser =
				(HashMap<String, Object>)session.getAttribute("loginUser");

		if(loginUser==null) {
			mav.setViewName("mobile/member/mobileLogin");
			return mav;
			
		}else {
			if(result.getFieldError("title") !=null) {
				mav.addObject("message", result.getFieldError("title").getDefaultMessage());
				mav.setViewName("mobile/mypage/mobileMyAskWrite");
				return mav;
			}else if(result.getFieldError("content_a") !=null) {
				mav.addObject("message", result.getFieldError("content_a").getDefaultMessage());
				mav.setViewName("mobile/mypage/mobileMyAskWrite");
				return mav;
			}
			
				HashMap<String, Object> paramMap = new HashMap<String , Object>();
				paramMap.put("id", loginUser.get("ID"));
				paramMap.put("title", title);
				paramMap.put("content_a", content_a);
				paramMap.put("pseq", pseq);
			
				mas.insertAsk(paramMap);
				mav.setViewName("redirect:/mobileAskForm");
		}
	  
	  return mav;
	  
	  
  }
   
}
