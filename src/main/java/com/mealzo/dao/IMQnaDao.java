package com.mealzo.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMQnaDao {

	void listQna(HashMap<String, Object> paramMap);

}
