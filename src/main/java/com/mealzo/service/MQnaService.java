package com.mealzo.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	@Transactional(rollbackFor = Exception.class)
	public void insertQna(HashMap<String, Object> paramMap) {
		qdao.insertQna(paramMap);
	}

	public void getAllCountQna(HashMap<String, Object> paramMap) {
		qdao.getAllCount(paramMap);
	}

	public void getAllCountnmQna(HashMap<String, Object> paramMap) {
		qdao.getAllCountnmQna(paramMap);
	}

	public void nmlistQna(HashMap<String, Object> paramMap) {
		qdao.nmlistQna(paramMap);
	}

	public void insertnmQna(HashMap<String, Object> paramMap) {
		qdao.insertnmQna(paramMap);
	}

	public void getnmQna(HashMap<String, Object> paramMap) {
		qdao.getnmQna(paramMap);
	}

	public void getNmqnaByNqseq(HashMap<String, Object> paramMap) {
		qdao.getNmqnaByNqseq(paramMap);
	}
	
}
