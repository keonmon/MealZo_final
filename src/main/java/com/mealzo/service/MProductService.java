package com.mealzo.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mealzo.dao.IMProductDao;

@Service
public class MProductService {

	@Autowired
	IMProductDao pdao;

	public void getNewBestProduct(HashMap<String, Object> paramMap) {
		pdao.getNewBestProduct(paramMap);
	}

	public void getAllCount(HashMap<String, Object> paramMap) {
		pdao.getAllCount(paramMap);
	}

	public void listProduct(HashMap<String, Object> paramMap) {
		pdao.listProduct(paramMap);
	}

	public void getalow(HashMap<String, Object> paramMap) {
		pdao.getalow(paramMap);
	}

	public void getahight(HashMap<String, Object> paramMap) {
		pdao.getahight(paramMap);
	}

	public void getAllCountByBest(HashMap<String, Object> paramMap) {
		pdao.getAllCountByBest(paramMap);
	}

	public void getBest(HashMap<String, Object> paramMap) {
		pdao.getBest(paramMap);
	}

	public void getBLow(HashMap<String, Object> paramMap) {
		pdao.getBLow(paramMap);		
	}

	public void getBHight(HashMap<String, Object> paramMap) {
		pdao.getBHight(paramMap);			
	}

	public void getNewList(HashMap<String, Object> paramMap) {
		pdao.getNewList(paramMap);
	}

	public void getNewLow(HashMap<String, Object> paramMap) {
		pdao.getNewLow(paramMap);
	}

	public void getNewHight(HashMap<String, Object> paramMap) {
		pdao.getNewHight(paramMap);
	}

	public void getAllCountByKind(HashMap<String, Object> paramMap) {
		pdao.getAllCountByKind(paramMap);
	}

	public void getKind(HashMap<String, Object> paramMap) {
		pdao.getKind(paramMap);
	}

	public void getLow(HashMap<String, Object> paramMap) {
		pdao.getLow(paramMap);
	}

	public void getHight(HashMap<String, Object> paramMap) {
		pdao.getHight(paramMap);
	}
	
	public void getProduct(HashMap<String, Object> paramMap) {
		pdao.getProduct(paramMap);
	}

	public void getImages(HashMap<String, Object> paramMap) {
		pdao.getImages(paramMap);
	}

	@Transactional(rollbackFor = Exception.class)
	public void insertProduct(HashMap<String, Object> paramMap) {
		pdao.insertProduct(paramMap);
	}

	@Transactional(rollbackFor = Exception.class)
	public void updateProduct(HashMap<String, Object> paramMap) {
		pdao.updateProduct(paramMap);
	}

	@Transactional(rollbackFor = Exception.class)
	public void deleteProduct(HashMap<String, Object> paramMap) {
		pdao.deleteProduct(paramMap);
	}

	@Transactional(rollbackFor = Exception.class)
	public void updateProductResult(HashMap<String, Object> paramMap) {
		pdao.updateProductResult(paramMap);
  }
  
	@Transactional(rollbackFor = Exception.class)
	public void updateProductUseyn(HashMap<String, Object> paramMap) {
		pdao.updateProductUseyn(paramMap);
	}
  
}
