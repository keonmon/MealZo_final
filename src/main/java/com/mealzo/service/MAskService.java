package com.mealzo.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealzo.dao.IMAskDao;

@Service
public class MAskService {

	@Autowired
	IMAskDao madao;

	public void listMAsk(HashMap<String, Object> paramMap) {
		madao.listMask(paramMap);
		
		
	}

	public void getAsk(HashMap<String, Object> paramMap) {
	madao.getAsk(paramMap);
		
	}

	public void getAllCountAsk(HashMap<String, Object> paramMap) {
	 madao.getAllCountAsk(paramMap);
		
	}

	public void insertAsk(HashMap<String, Object> paramMap) {
		madao.insertAsk(paramMap);
		
	}
	
	
	
}
