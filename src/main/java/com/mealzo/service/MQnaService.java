package com.mealzo.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealzo.dao.IMQnaDao;

@Service
public class MQnaService {

	@Autowired
	IMQnaDao qdao;

	public void listQna(HashMap<String, Object> paramMap) {
		qdao.listQna(paramMap);
		
		
	}

	public void getQna(HashMap<String, Object> paramMap) {
		qdao.getQna(paramMap);
		
	}

	public void insertQna(HashMap<String, Object> paramMap) {
		qdao.insertQna(paramMap);
		
	}

	public void getAllCountQna(HashMap<String, Object> paramMap) {
		qdao.getAllCount(paramMap);
		
	}
	
}
