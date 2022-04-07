package com.mealzo.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealzo.dao.IMZzimDao;

@Service
public class MZzimService {

	@Autowired
	IMZzimDao zdao;

	public void getAllCountZzim(HashMap<String, Object> paramMap) {
		zdao.getAllCountZzim(paramMap);
		
	}

	public void listZzim(HashMap<String, Object> paramMap) {
		zdao.listZzim(paramMap);
	}

	public void getlistZzim(HashMap<String, Object> paramMap) {
		zdao.getlistZzim(paramMap);
		
	}

	public void zzimInsert(HashMap<String, Object> paramMap) {
		zdao.zzimInsert(paramMap);
		
	}

	public void zzimdelete(HashMap<String, Object> paramMap) {
		zdao.zzimDelete(paramMap);
		
	}
}
