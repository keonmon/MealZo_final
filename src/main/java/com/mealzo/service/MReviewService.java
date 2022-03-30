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
}
