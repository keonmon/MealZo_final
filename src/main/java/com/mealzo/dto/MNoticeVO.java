package com.mealzo.dto;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;
@Data
public class MNoticeVO {
	private int nseq ;
	
	@NotEmpty(message="공지 제목을 입력하세요")
	@NotNull(message="공지 제목을 입력하세요")
	private String subject ;
	
	@NotEmpty(message="공지 내용을 입력하세요")
	@NotNull(message="공지 내용을 입력하세요")
	private String content ;
	
	private Timestamp indate;
	private String image1;
	private String useyn;
	
}
