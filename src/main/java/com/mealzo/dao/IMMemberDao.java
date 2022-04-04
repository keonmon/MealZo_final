package com.mealzo.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMMemberDao {

	void getMember(HashMap<String, Object> paramMap);

	void insertMember(HashMap<String, Object> paramMap);

	void selectAddressByDong(HashMap<String, Object> paramMap);

	void updateMember(HashMap<String, Object> paramMap);

	void updateUseyn(HashMap<String, Object> paramMap);

	void getMemberByemail(HashMap<String, Object> paramMap);

	void getMemberByphone(HashMap<String, Object> paramMap);
}
