package com.mealzo.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealzo.dao.IMAdminDao;

@Service
public class MAdminService {

	@Autowired
	IMAdminDao adao;

	public void getAdmin(HashMap<String, Object> paramMap) {
		adao.getAdmin(paramMap);
	}

	public void getAllcountAdmin(HashMap<String, Object> paramMap) {
		adao.getAllcountAdmin(paramMap);
	}

	public void adminlistReview(HashMap<String, Object> paramMap) {
	adao.adminlistReview(paramMap);
		
		
	}

	public void deleteReview(HashMap<String, Object> paramMap) {
	  adao.deletReview(paramMap);
	  
	}



}
