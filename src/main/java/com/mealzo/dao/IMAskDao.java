package com.mealzo.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMAskDao {

	void listMask(HashMap<String, Object> paramMap);

	void getAsk(HashMap<String, Object> paramMap);

	void getAllCountAsk(HashMap<String, Object> paramMap);

	void insertAsk(HashMap<String, Object> paramMap);

}
