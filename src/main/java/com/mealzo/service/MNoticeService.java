package com.mealzo.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealzo.dao.IMNoticeDao;

@Service
public class MNoticeService {

	@Autowired
	IMNoticeDao ndao;

	public void getNoticeList(HashMap<String, Object> paramMap) {
		ndao.getNoticeList(paramMap);
		
	}
}
