package com.mealzo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
public String login(@ModelAttribute("dto") @Valid MMemberVO membervo,
		BindingResult result, 
		HttpServletRequest request,
		Model model) {
		
	return "ggg";
}
}
