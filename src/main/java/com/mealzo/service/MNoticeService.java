package com.mealzo.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mealzo.dao.IMNoticeDao;

@Service
public class MNoticeService {

	@Autowired
	IMNoticeDao ndao;

	public void getNoticeList(HashMap<String, Object> paramMap) {
		ndao.getNoticeList(paramMap);
	}

	public void getNoticeOne(HashMap<String, Object> paramMap) {
		ndao.getNoticeOne(paramMap);
	}

	@Transactional(rollbackFor = Exception.class)
	public void insertNotice(HashMap<String, Object> paramMap) {
		ndao.insertNotice(paramMap);
	}

	@Transactional(rollbackFor = Exception.class)
	public void updateNotice(HashMap<String, Object> paramMap) {
		ndao.updateNotice(paramMap);
	}

	@Transactional(rollbackFor = Exception.class)
	public void updateNoticeUseyn(HashMap<String, Object> paramMap) {
		ndao.updateNoticeUseyn(paramMap);
	}

	public void getAllCountNotice(HashMap<String, Object> paramMap) {
		ndao.getAllCountNotice(paramMap);
		
	}

	public void getNoticeAll(HashMap<String, Object> paramMap) {
		ndao.getNoticeAll(paramMap);
		
	}

}
