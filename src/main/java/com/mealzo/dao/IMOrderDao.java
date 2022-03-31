package com.mealzo.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMOrderDao {

	void insertOrder(HashMap<String, Object> paramMap);
	void listOrderByIdAll(HashMap<String, Object> paramMap1);
	void listOrderByOseq(HashMap<String, Object> paramMap2);
	
}
