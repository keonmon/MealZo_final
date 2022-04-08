package com.mealzo.dto;

import java.sql.Timestamp;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class NMQnaVO {
	
	private Integer nqseq;
	
	@NotNull(message="제목을 입력하세요")
	@NotEmpty(message="제목을 입력하세요")
	@NotBlank(message="제목 입력해 !!!!!!!!!!!!!")
	private String subject;
	
	//@NotEmpty(message="내용을 입력하세요 !")
	//@NotNull(message="내용을 입력하세요 !")
	@NotBlank(message="빈칸으로 하면 속을줄 알았냐 ? 내용 입력해 !!!!!!!!!!!!!")
	private String content;
	
	@NotBlank(message="빈칸으로 하면 속을줄 알았냐 ? 내용 입력해 !!!!!!!!!!!!!")
	private String reply;
	
	@NotNull(message="아이디를 입력하세요")
	@NotEmpty(message="아이디를 입력하세요")
	private String id;
	
	@NotNull(message="비밀번호를 입력하세요(비회원문의 확인시 필요하니 기억해두시기 바랍니다)")
	@NotEmpty(message="비밀번호를 입력하세요(비회원문의 확인시 필요하니 기억해두시기 바랍니다)")
	private String pwd;
	
	private String rep;
	private Timestamp indate;
	
}
