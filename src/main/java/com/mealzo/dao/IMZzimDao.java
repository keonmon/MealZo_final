package com.mealzo.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMZzimDao {

	void getAllCountZzim(HashMap<String, Object> paramMap);

	void listZzim(HashMap<String, Object> paramMap);

	void getlistZzim(HashMap<String, Object> paramMap);
     
}
