package com.mealzo.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMMemberDao {

	void getMember(HashMap<String, Object> paramMap);
}
