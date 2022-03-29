package com.mealzo.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMProductDao {

	void getNewBestProduct(HashMap<String, Object> paramMap);

	void getAllCount(HashMap<String, Object> paramMap);

	void listProduct(HashMap<String, Object> paramMap);

	void getalow(HashMap<String, Object> paramMap);

	void getahight(HashMap<String, Object> paramMap);
	
}
