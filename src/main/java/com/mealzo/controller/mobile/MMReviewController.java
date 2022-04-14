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

import com.mealzo.dto.MReviewVO;
import com.mealzo.service.MReviewService;

@Controller
public class MMReviewController {		
		@Autowired
		MReviewService rs;
		
		@RequestMapping("/mobileReviewForm") 
		public ModelAndView reviewForm(Model model, HttpServletRequest request) {
			 ModelAndView mav =new ModelAndView();
			    HttpSession session = request.getSession();
				HashMap<String, Object> loginUser =
		     	(HashMap<String, Object>)session.getAttribute("loginUser");

				if(loginUser==null) {
					mav.setViewName("mobile/member/mobileLogin");
					return mav;
				}else {
					HashMap<String, Object> paramMap =new HashMap<String, Object>();
					paramMap.put("id", loginUser.get("ID"));
					paramMap.put("ref_cursor", null);
					rs.listReview(paramMap);
					ArrayList<HashMap<String, Object>> list 
					= (ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor");
					
				
				
				mav.addObject("myReviewList",list);
				mav.setViewName("mobile/mypage/mobileMyReview");
				}
		return mav;
		}

		@RequestMapping("/mobileReviewWriteForm") 
		public ModelAndView reviewWriteForm(Model model, HttpServletRequest request,
				@RequestParam("pseq") int pseq) {
			 ModelAndView mav =new ModelAndView();
			    HttpSession session = request.getSession();
				HashMap<String, Object> loginUser =
		     	(HashMap<String, Object>)session.getAttribute("loginUser");

				if(loginUser==null) {
					mav.setViewName("mobile/member/mobileLogin");
					return mav;
		}else {
			mav.setViewName("mobile/mypage/mobileMyReviewWrite");
				request.setAttribute("pseq",pseq);
				System.out.println("pseq" + pseq);
		}
		return mav;
		}
		@RequestMapping(value="/mobileReviewWrite" , method=RequestMethod.POST)
		public ModelAndView reviewWrite(Model model, HttpServletRequest request,
			@RequestParam("pseq") int pseq , @RequestParam("content") String content,
			@ModelAttribute("dto") @Valid MReviewVO mreviewvo, BindingResult result) {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser
			=(HashMap<String, Object>)session.getAttribute("loginUser");
		if (loginUser == null) {
			mav.setViewName("mobile/member/mobileLogin");
			return mav;
		} else if (result.getFieldError("content") != null) {
			mav.addObject("message", result.getFieldError("content").getDefaultMessage());
			 mav.addObject("pseq",pseq);
			mav.setViewName("mobile/mypage/mobileMyReviewWrite");
	   return mav;
		}
		 HashMap<String, Object> paramMap =  new HashMap<String, Object>();
		 
		 paramMap.put("id", loginUser.get("ID"));
		 paramMap.put("content", content);
		 paramMap.put("pseq", pseq);
		 
		 rs.insertReview(paramMap);
		 mav.addObject("pseq",pseq);
		 mav.setViewName("redirect:/mobileProductDetail");
				
			
	return mav;	
	}
		
		@RequestMapping("mobileMyReviewDelete")
		public ModelAndView myReviewDeltet(HttpServletRequest request,
				@RequestParam("rseq") int rseq) {
			

			ModelAndView mav = new ModelAndView();
			HttpSession session = request.getSession();
			HashMap<String, Object> loginUser
				=(HashMap<String, Object>)session.getAttribute("loginUser");
			if (loginUser == null) {
				mav.setViewName("mobile/member/mobileLogin");
				return mav;
			}else {
				HashMap<String, Object> paramMap = new HashMap<String, Object>();
				paramMap.put("rseq" , rseq);
				rs.reviewDelete(paramMap);
				
				mav.setViewName("redirect:/mobileReviewForm");
			}
			return mav;
		}
	}
