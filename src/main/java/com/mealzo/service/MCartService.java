package com.mealzo.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mealzo.dao.IMCartDao;

@Service
public class MCartService {

	@Autowired
	IMCartDao cdao;

	@Transactional(rollbackFor = Exception.class)
	public void insertCart(HashMap<String, Object> paramMap) {
		cdao.insertCart( paramMap );
	}
	public void listCart(HashMap<String, Object> paramMap) {
		cdao.listCart( paramMap );
	}

	@Transactional(rollbackFor = Exception.class)
	public void deleteCart(HashMap<String, Object> paramMap) {
		cdao.deleteCart( paramMap );
	}

	@Transactional(rollbackFor = Exception.class)
	public void deleteCart2(HashMap<String, Object> paramMap) {
		cdao.deleteCart2( paramMap );
	}
	public void getCartCnt(HashMap<String, Object> paramMap) {
		cdao.getCartCnt( paramMap );
		
	}
}
