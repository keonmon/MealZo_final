package com.mealzo.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	
}
