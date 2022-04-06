package com.mealzo.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMQnaDao {

	void listQna(HashMap<String, Object> paramMap);

	void getQna(HashMap<String, Object> paramMap);

	void insertQna(HashMap<String, Object> paramMap);

	void getAllCount(HashMap<String, Object> paramMap);

	void getAllCountnmQna(HashMap<String, Object> paramMap);

	void nmlistQna(HashMap<String, Object> paramMap);

	void insertnmQna(HashMap<String, Object> paramMap);

	void getnmQna(HashMap<String, Object> paramMap);

	void getNmqnaByNqseq(HashMap<String, Object> paramMap);

}
