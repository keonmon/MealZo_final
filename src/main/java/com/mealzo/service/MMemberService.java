package com.mealzo.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mealzo.dao.IMMemberDao;

@Service
public class MMemberService {

	@Autowired
	IMMemberDao mdao;

	public void getMember(HashMap<String, Object> paramMap) {
		mdao.getMember(paramMap);
	}

	@Transactional(rollbackFor = Exception.class)
	public void insertMember(HashMap<String, Object> paramMap) {
		mdao.insertMember(paramMap);
	}

	public void selectAddressByDong(HashMap<String, Object> paramMap) {
		mdao.selectAddressByDong(paramMap);
	}

	@Transactional(rollbackFor = Exception.class)
	public void updateMember(HashMap<String, Object> paramMap) {
		mdao.updateMember(paramMap);
	}

	@Transactional(rollbackFor = Exception.class)
	public void updateUseyn(HashMap<String, Object> paramMap) {
		mdao.updateUseyn(paramMap);
	}

	public void getMemberByemail(HashMap<String, Object> paramMap) {
		mdao.getMemberByemail(paramMap);
	}

	public void getMemberByphone(HashMap<String, Object> paramMap) {
		mdao.getMemberByphone(paramMap);
	}

	public void listMember(HashMap<String, Object> paramMap) {
		mdao.listMember(paramMap);
	}

	public void updateMemberResult(HashMap<String, Object> paramMap) {
		mdao.updateMemberResult(paramMap);
		
	}
	
	
}
