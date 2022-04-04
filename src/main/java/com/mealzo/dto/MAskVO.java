package com.mealzo.dto;

import java.sql.Timestamp;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class MAskVO {

	private int aseq;
	@NotBlank(message="제목 입력해주세요 !!!!!!!!!!!!!")
	private String title;
	
	@NotBlank(message="내용 입력해주세요 ~ !!!")
	private String content_a;
	
	private String id;
	private int pseq;
	private Timestamp indate_a;
	private int arseq;
	
	@NotNull(message="제목을 입력하세요")
	@NotEmpty(message="제목을 입력하세요")
	@NotBlank(message="댓글입력해쥬세여 !!!!!!!!!!!!!")
	private String content_r;
	
	private Timestamp indate_r;   
 	private String pname;
 	private String image;
 	private int price2;
}
