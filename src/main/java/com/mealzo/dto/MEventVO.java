package com.mealzo.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MEventVO {

	private int eseq;
	private String title;
	private String content;
	private String image1;
	private String image2;
	private String subtitle;
	private Timestamp writedate;
	private Timestamp startdate;
	private Timestamp enddate;
	
}
