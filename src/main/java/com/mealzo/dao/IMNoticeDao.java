package com.mealzo.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMNoticeDao {

	void getNoticeList(HashMap<String, Object> paramMap);

	void getNoticeOne(HashMap<String, Object> paramMap);

}
