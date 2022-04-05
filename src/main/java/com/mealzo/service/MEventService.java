package com.mealzo.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealzo.dao.IMEventDao;

@Service
public class MEventService {

	@Autowired
	IMEventDao edao;

	public void geteventList(HashMap<String, Object> paramMap) {
		edao.geteventList(paramMap);
	}

	public void geteventOne(HashMap<String, Object> paramMap) {
		edao.geteventOne(paramMap);
	}
}
