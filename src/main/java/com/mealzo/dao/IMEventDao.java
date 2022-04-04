package com.mealzo.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMEventDao {

	void geteventList(HashMap<String, Object> paramMap);

}
