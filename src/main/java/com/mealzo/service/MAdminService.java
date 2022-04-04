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

	public void adminlistAsk(HashMap<String, Object> paramMap) {
	adao.adminlistAsk(paramMap);
		
	}

	public void getAllcountAdminAsk(HashMap<String, Object> paramMap) {
		adao.getAllcountAdminAsk(paramMap);
		
	}

	public void getAdminAsk(HashMap<String, Object> paramMap) {
		adao.getAdminAsk(paramMap);
		
	}

	public void adminAskReply(HashMap<String, Object> paramMap) {
	 adao.adminAskReply(paramMap);
		
	}

	public void adminAskUpdate(HashMap<String, Object> paramMap) {
		adao.adminAskUpdate(paramMap);
		
	}

	public void adminlistQna(HashMap<String, Object> paramMap) {
	adao.adminlistQna(paramMap);
		
	}

	public void admininsertQna(HashMap<String, Object> paramMap) {
     adao.admininsertQna(paramMap);
	}



}
