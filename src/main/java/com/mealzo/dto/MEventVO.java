package com.mealzo.dto;

import java.sql.Timestamp;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.Data;
@Data
public class MEventVO {
	private int eseq;
	
	@NotBlank(message="제목을 입력하세요")
	private String title;
	
	@NotBlank(message="내용을 입력하세요")
	private String content;
	
	@NotBlank(message="썸네일 이미지를 입력하세요")
	private String image1;
	
	@NotBlank(message="이미지를 입력하세요")
	private String image2;
	@NotBlank(message="서브타이틀 입력하세요")
	private String subtitle;
	private Timestamp writedate;
	
  // @NotBlank(message="시작기간을 입력하세요")
	   @NotNull(message="끝나는 기간을 입력하세요")
	private Timestamp startdate;
	
	//@NotBlank(message="끝나는 기간을 입력하세요")
   @NotNull(message="끝나는 기간을 입력하세요")
   private Timestamp enddate;
}
