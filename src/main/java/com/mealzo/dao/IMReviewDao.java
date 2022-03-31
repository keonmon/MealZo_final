package com.mealzo.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
@Mapper
public interface IMReviewDao {

	void getReviewListByPseq(HashMap<String, Object> paramMap);

	void listReview(HashMap<String, Object> paramMap);

}
