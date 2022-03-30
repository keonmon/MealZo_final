package com.mealzo.dto;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class MAdminVO {
	@NotBlank(message="관리자 아이디를 입력하십시오😥")
	private String id;
	
	@NotBlank(message="암호를 입력하십시오😥")
	private String pwd;
	
	private String name;
	private String phone;
	
}
