package com.mealzo.controller.mobile;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mealzo.dto.Paging;
import com.mealzo.service.MZzimService;

@Controller
public class MMZzimController {
	
	@Autowired
	MZzimService zs;
	

	
	@RequestMapping("/mobileZzimList")
	  public ModelAndView zzimlist(HttpServletRequest request,  
				@RequestParam(value="redirectUrl",required=false)String redirectUrl) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		session.setAttribute("redirectUrl", redirectUrl);		//url 세션에 담기
		HashMap<String, Object> loginUser 
		  = (HashMap<String, Object>)session.getAttribute("loginUser");
		if(loginUser==null) {
			mav.addObject("msg" , "로그인 후 사용하시기바랍니다");
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
		     zs.getAllCountZzim(paramMap);
			
		     int cnt = Integer.parseInt(paramMap.get("cnt").toString());
			    paging.setTotalCount(cnt);
			    paging.paging();
			    paramMap.put("startNum", paging.getStartNum());
			    paramMap.put("endNum", paging.getEndNum());
			
			    paramMap.put("id", loginUser.get("ID"));
			    paramMap.put("ref_cursor", null);
			   zs.listZzim(paramMap);
			    ArrayList<HashMap<String, Object>> list 
			    =(ArrayList<HashMap<String, Object >>)paramMap.get("ref_cursor");
			 
				mav.addObject("paging", paging);
			    mav.addObject("zzimList", list);
			     mav.setViewName("mobile/mypage/mobileZzimList");
		}
		return mav;

	}
	
	@RequestMapping("/mobiledeleteZzim")
	public ModelAndView zzimdelete(HttpServletRequest request,
			@RequestParam(value="pseq", required=false)Integer pseq) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser 
		  = (HashMap<String, Object>)session.getAttribute("loginUser");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		//paramMap.put("id",loginUser.get("ID") );
		paramMap.put("pseq",pseq);
		zs.zzimdelete(paramMap);
		
	//	mav.addObject("pseq",pseq);
		mav.setViewName("redirect:/mobileZzimList");
		
		return mav;
	}
}
