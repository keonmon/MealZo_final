package com.mealzo.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mealzo.service.MProductService;

@Controller
public class MProductController {

	@Autowired
	MProductService ps;
	
	@RequestMapping("/")
	public ModelAndView index(Model model, HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser 
			= (HashMap<String, Object>)session.getAttribute("loginUser");
		
		String sub = request.getParameter("sub");
		if( sub!=null && sub.equals("y") ) {
			session.removeAttribute("key");
			session.removeAttribute("page");
		}
		mav.setViewName("index");
		
		
		//mproductDao pdao = mproductDao.getInstance();
		HashMap<String,Object> paramMap= new HashMap<String,Object>();
		paramMap.put("ref_cursor1", null);
		paramMap.put("ref_cursor2", null);
		
		ps.getNewBestProduct(paramMap);
		// NewList 담아오기
		ArrayList<HashMap<String,Object>> newList 
			= (ArrayList<HashMap<String,Object>>) paramMap.get("ref_cursor1");
		// bestList 담아오기
		ArrayList<HashMap<String,Object>> bestList 
			= (ArrayList<HashMap<String,Object>>) paramMap.get("ref_cursor2");
		
		
		mav.addObject("newList", newList);
		mav.addObject("bestList", bestList);
		
		return mav;
	}
	
}
