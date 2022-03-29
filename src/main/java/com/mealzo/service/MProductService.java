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

	public void getAllCount(HashMap<String, Object> paramMap) {
		pdao.getAllCount(paramMap);
	}

	public void listProduct(HashMap<String, Object> paramMap) {
		pdao.listProduct(paramMap);
	}

	public void getalow(HashMap<String, Object> paramMap) {
		pdao.getalow(paramMap);
	}

	public void getahight(HashMap<String, Object> paramMap) {
		pdao.getahight(paramMap);
		
	}
}
