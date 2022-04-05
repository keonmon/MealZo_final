package com.mealzo.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealzo.dao.IMOrderDao;

@Service
public class MOrderService {

	@Autowired
	IMOrderDao odao;


	public void listOrder(HashMap<String, Object> paramMap) {
		odao.listOrder(paramMap);
	}

	public void insertOrder(HashMap<String, Object> paramMap) {
		odao.insertOrder( paramMap );
	}

	public void listOrderByIdAll(HashMap<String, Object> paramMap1) {
		odao.listOrderByIdAll( paramMap1 );
	}

	public void listOrderByOseq(HashMap<String, Object> paramMap2) {
		odao.listOrderByOseq( paramMap2 );
	}

	public void selectOseqOrderAll(HashMap<String, Object> paramMap) {
		odao.selectOseqOrderAll( paramMap );
	}

	public void deleteOrders(HashMap<String, Object> paramMap) {
		odao.deleteOrders( paramMap );
	}

	public void deleteOrder_detail(HashMap<String, Object> paramMap) {
		odao.deleteOrder_detail( paramMap );
	}

	public void updateOrderResult(HashMap<String, Object> paramMap) {
		odao.updateOrderResult( paramMap );
		
	}

	public void orderCancelForm(HashMap<String, Object> paramMap) {
		odao.orderCancelForm(paramMap);
		
	}

}
