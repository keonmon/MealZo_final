package com.mealzo.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealzo.dao.IMMemberDao;

@Service
public class MMemberService {

	@Autowired
	IMMemberDao mdao;

	public void getMember(HashMap<String, Object> paramMap) {
		mdao.getMember(paramMap);
	}

	public void insertMember(HashMap<String, Object> paramMap) {
		mdao.insertMember(paramMap);
	}

	public void selectAddressByDong(HashMap<String, Object> paramMap) {
		mdao.selectAddressByDong(paramMap);
	}

	public void updateMember(HashMap<String, Object> mvo) {
	//	mdao.updateMember(paramMap);
	}
}
