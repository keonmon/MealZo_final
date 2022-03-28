package com.mealzo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealzo.dao.IMQnaDao;

@Service
public class MQnaService {

	@Autowired
	IMQnaDao qdao;
	
}
