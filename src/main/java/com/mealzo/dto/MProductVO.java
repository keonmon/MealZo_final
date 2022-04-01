package com.mealzo.dto;

import java.sql.Timestamp;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.Data;
@Data
public class MProductVO {

	private Integer pseq;
	
	@NotBlank(message="상품명을 입력하세요")
	private String name;
	
	@NotBlank(message="상품분류를 입력하세요")
	private String kind;
	
	@NotNull(message="원가를 입력하세요")
	//@NotBlank(message="원가를 입력하세요")
	private int price1;
	
	@NotNull(message="판매가를 입력하세요")
	//@NotBlank(message="판매가를 입력하세요")
	private int price2;
	
	private String bestyn;
	private String content;
	private String useyn;
	
	@NotBlank(message="썸네일 이미지를 입력하세요")
	private String image;
	private Timestamp indate;
	private int replycnt;
	
	// 아래 상세이미지는 임시저장 -> mpdimg, mpdimg2로 저장될 것임 
	private String image1;
	private String image2;
	
}
