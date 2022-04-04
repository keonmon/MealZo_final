package com.mealzo.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMCartDao {

	void insertCart(HashMap<String, Object> paramMap);
	void listCart(HashMap<String, Object> paramMap);
	void deleteCart(HashMap<String, Object> paramMap);
	void deleteCart2(HashMap<String, Object> paramMap);

}
