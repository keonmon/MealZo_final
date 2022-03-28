package com.mealzo.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealzo.dao.IMProductDao;

@Service
public class MProductService {

	@Autowired
	IMProductDao pdao;

	public void getNewBestProduct(HashMap<String, Object> paramMap) {
		pdao.getNewBestProduct(paramMap);
		
	}
}
