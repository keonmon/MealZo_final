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

import com.mealzo.dto.MReviewVO;
import com.mealzo.service.MReviewService;


@Controller
public class MReviewController {
	
	@Autowired
	MReviewService rs;
	
	@RequestMapping("/reviewForm") 
	public ModelAndView reviewForm(Model model, HttpServletRequest request) {
		 ModelAndView mav =new ModelAndView();
		    HttpSession session = request.getSession();
			HashMap<String, Object> loginUser =
	     	(HashMap<String, Object>)session.getAttribute("loginUser");

			if(loginUser==null) {
				mav.setViewName("member/login");
				return mav;
			}else {
				HashMap<String, Object> paramMap =new HashMap<String, Object>();
				paramMap.put("id", loginUser.get("ID"));
				paramMap.put("ref_cursor", null);
				rs.listReview(paramMap);
				ArrayList<HashMap<String, Object>> list 
				= (ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor");
				
			
			
			mav.addObject("myReviewList",list);
			mav.setViewName("mypage/myReview");
			}
	return mav;
	}

	@RequestMapping("/reviewWriteForm") 
	public ModelAndView reviewWriteForm(Model model, HttpServletRequest request,
			@RequestParam("pseq") int pseq) {
		 ModelAndView mav =new ModelAndView();
		    HttpSession session = request.getSession();
			HashMap<String, Object> loginUser =
	     	(HashMap<String, Object>)session.getAttribute("loginUser");

			if(loginUser==null) {
				mav.setViewName("member/login");
				return mav;
	}else {
		mav.setViewName("mypage/myReviewWrite");
			request.setAttribute("pseq",pseq);
			System.out.println("pseq" + pseq);
	}
	return mav;
	}
	@RequestMapping(value="/reviewWrite" , method=RequestMethod.POST)
	public ModelAndView reviewWrite(Model model, HttpServletRequest request,
		@RequestParam("pseq") String pseq , @RequestParam("content") String content,
		@ModelAttribute("dto") @Valid MReviewVO mreviewvo, BindingResult result) {

	ModelAndView mav = new ModelAndView();
	HttpSession session = request.getSession();
	HashMap<String, Object> loginUser
		=(HashMap<String, Object>)session.getAttribute("loginUser");
	if (loginUser == null) {
		mav.setViewName("member/login");
		return mav;
	} else if (result.getFieldError("content") != null) {
		mav.addObject("message", result.getFieldError("content").getDefaultMessage());
		mav.setViewName("mypage/myReviewWrite");
   return mav;
	}
	 HashMap<String, Object> paramMap =  new HashMap<String, Object>();
	 
	 paramMap.put("id", loginUser.get("ID"));
	 paramMap.put("content", content);
	 paramMap.put("pseq", pseq);
	 
	 rs.insertReview(paramMap);
	 mav.addObject("pseq",pseq);
	 mav.setViewName("redirect:/productDetail");
			
		
return mav;	
}
}