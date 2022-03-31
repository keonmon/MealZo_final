package com.mealzo.dto;

import java.sql.Timestamp;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class MQnaVO {
	
	private Integer qseq;
	
	@NotNull(message="제목을 입력하세요")
	@NotEmpty(message="제목을 입력하세요")
	@NotBlank(message="제목 입력해 !!!!!!!!!!!!!")
	private String subject;
	
	//@NotEmpty(message="내용을 입력하세요 !")
	//@NotNull(message="내용을 입력하세요 !")
	@NotBlank(message="빈칸으로 하면 속을줄 알았냐 ? 내용 입력해 !!!!!!!!!!!!!")
	private String content;
	
	private String reply;
	private String id;
	private String rep;
	private Timestamp indate;
	
}
