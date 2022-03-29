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

import com.mealzo.dto.MQnaVO;
import com.mealzo.dto.Paging;
import com.mealzo.service.MQnaService;

@Controller
public class MQnaController {

	@Autowired
	MQnaService qs;
	
	@RequestMapping("/mypageForm")
	public String mypageForm(HttpServletRequest request  ) {
		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser =
				(HashMap<String, Object>)session.getAttribute("loginUser");

		if(loginUser==null) {
			return "member/login";
		}else
			
		
		return "mypage/mypage";
	}
	
	@RequestMapping("/qnaForm")
	public ModelAndView qnaForm(Model model, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser =
				(HashMap<String, Object> )session.getAttribute("loginUser");
		if(loginUser ==null) {
			mav.setViewName("member/login");
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
			System.out.println(cnt);
			ArrayList<HashMap<String, Object>> list
			 = (ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor");
			mav.addObject("paging", paging);
			mav.addObject("mqnaList", list);
			mav.setViewName("qna/qnaList");
			
			
					
		}
		
		return mav;
			
	}
	
	@RequestMapping("/qnaView")
	public ModelAndView qnaView(
			@RequestParam("qseq") int qseq ,HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser =
				(HashMap<String, Object> )session.getAttribute("loginUser");
		if(loginUser ==null) {
			mav.setViewName("member/login");
		}else {
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			
			paramMap.put("qseq", qseq);
			paramMap.put("ref_cursor", null);
			qs.getQna(paramMap);
			
			ArrayList<HashMap<String, Object>> list
			 =(ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor");
			mav.addObject("mqnaVO", list.get(0));
			mav.setViewName("qna/qnaView");
			
			
		}
		
		return mav;
	}
	@RequestMapping("/qnaWriteForm")
	public String qnaWriteForm(HttpServletRequest request) {
		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser
			= (HashMap<String, Object>)session.getAttribute("loginUser");
		
		if( loginUser == null) {
		 return "member/login";
		}else
			
		return "qna/qnaWrite";
	}
	
	@RequestMapping(value="/qnaWrite",  method=RequestMethod.POST)
	public ModelAndView qnaWrite(HttpServletRequest request, @ModelAttribute("dto")
	@Valid MQnaVO qnavo, BindingResult result,
	@RequestParam("subject") String subject, @RequestParam("content") String content) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser =
				(HashMap<String, Object> )session.getAttribute("loginUser");
		if(loginUser ==null) 
			mav.setViewName("member/login");
		else {
			if(result.getFieldError("subject")!=null) {
				mav.addObject("message", result.getFieldError("subject").getDefaultMessage());
				mav.setViewName("qna/qnaWrite");
				 return mav;
			}else if(result.getFieldError("content") !=null) {
				mav.addObject("message", result.getFieldError("content").getDefaultMessage());
				mav.setViewName("qna/qnaWrite");
				return mav;
		}
		
			
			
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("content", content);
			paramMap.put("subject", subject);
			paramMap.put("id", loginUser.get("ID"));
			qs.insertQna(paramMap);
			mav.setViewName("redirect:/qnaForm");
		}

		return mav;
		}
	}
