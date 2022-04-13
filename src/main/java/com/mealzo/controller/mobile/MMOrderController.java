package com.mealzo.controller.mobile;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mealzo.service.MCartService;
import com.mealzo.service.MOrderService;

@Controller
public class MMOrderController {

	@Autowired
	MOrderService os;
	
	@Autowired
	MCartService cs;
	
	
	@RequestMapping("/mobileMypageForm")
	public String mypageForm(HttpServletRequest request  ) {
		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser =
				(HashMap<String, Object>)session.getAttribute("loginUser");

		if(loginUser==null) {
			return "member/login";
		}else {
	    }
		return "mobile/mypage/mobileMypage";
	}
	
}
