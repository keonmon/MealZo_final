package com.mealzo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.mealzo.service.MQnaService;

@Controller
public class MQnaController {

	@Autowired
	MQnaService qs;
	
	
}
