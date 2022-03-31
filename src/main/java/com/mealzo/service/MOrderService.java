package com.mealzo.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealzo.dao.IMOrderDao;

@Service
public class MOrderService {

	@Autowired
	IMOrderDao odao;


	public void listOrder(HashMap<String, Object> paramMap) {
		odao.listOrder(paramMap);
	}

	public void insertOrder(HashMap<String, Object> paramMap) {
		odao.insertOrder( paramMap );
	}

	public void listOrderByIdAll(HashMap<String, Object> paramMap1) {
		odao.listOrderByIdAll( paramMap1 );
	}

	public void listOrderByOseq(HashMap<String, Object> paramMap2) {
		odao.listOrderByOseq( paramMap2 );
	}

}
