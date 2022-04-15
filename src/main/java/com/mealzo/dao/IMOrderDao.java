package com.mealzo.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMOrderDao {


	void listOrder(HashMap<String, Object> paramMap);

	void insertOrder(HashMap<String, Object> paramMap);
  
	void listOrderByIdAll(HashMap<String, Object> paramMap1);
  
	void listOrderByOseq(HashMap<String, Object> paramMap2);

	void selectOseqOrderAll(HashMap<String, Object> paramMap);
  
	void deleteOrders(HashMap<String, Object> paramMap);
  
	void deleteOrder_detail(HashMap<String, Object> paramMap);

	void updateOrderResult(HashMap<String, Object> paramMap);

	void orderCancelDetail(HashMap<String, Object> paramMap);

	void orderCancelForm(HashMap<String, Object> paramMap);

	void listOrderByIdIng(HashMap<String, Object> paramMap1);

	void nowOrder(HashMap<String, Object> paramMap);

	
}
