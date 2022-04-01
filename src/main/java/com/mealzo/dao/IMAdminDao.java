package com.mealzo.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMAdminDao {

	void getAdmin(HashMap<String, Object> paramMap);

	void getAllcountAdmin(HashMap<String, Object> paramMap);

	void adminlistReview(HashMap<String, Object> paramMap);

	void deletReview(HashMap<String, Object> paramMap);




}
