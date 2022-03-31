package com.mealzo.dto;

import java.sql.Timestamp;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class MReviewVO {
	private Integer rseq;
	private Integer pseq;
	
	@NotNull(message="내용을 입력하세요!")
	@NotEmpty(message="내용을 입력하세요!")
	@NotBlank(message="내용입력해주세요!!!!!")
	private String content;
	
	private String id;
	private Timestamp indate;
	private String pname;
	
}
