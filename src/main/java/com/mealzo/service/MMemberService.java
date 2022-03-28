package com.mealzo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealzo.dao.IMMemberDao;

@Service
public class MMemberService {

	@Autowired
	IMMemberDao mdao;
}
