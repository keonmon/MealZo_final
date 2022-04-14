package com.mealzo.controller.mobile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mealzo.service.MNoticeService;

@Controller
public class MMService {

	@Autowired
	MNoticeService ns;
	
	@RequestMapping(value="/mobileCompany")
	public String company() {
		return "mobile/service/mobileCompany";
	}
}
