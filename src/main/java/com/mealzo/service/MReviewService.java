package com.mealzo.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealzo.dao.IMReviewDao;

@Service
public class MReviewService {

	@Autowired
	IMReviewDao rdao;

	public void getReviewListByPseq(HashMap<String, Object> paramMap) {
		rdao.getReviewListByPseq(paramMap);
		
	}

	public void listReview(HashMap<String, Object> paramMap) {
		rdao.listReview(paramMap);
		
	}

	public void getproductorderList(HashMap<String, Object> paramMap) {
		rdao.productorderList(paramMap);
	}

	public void insertReview(HashMap<String, Object> paramMap) {
	  rdao.insertReview(paramMap);
		
	}

	public void reviewDelete(HashMap<String, Object> paramMap) {
		rdao.reviewDelete(paramMap);
		
	}
}
