package com.mealzo.dto;

import java.sql.Timestamp;

import lombok.Data;
@Data
public class MOrderVO {
	private int oseq;
	private Timestamp indate;
	private String id;
	private String mname ;
	private String zip_num;
	private String address;
	private String phone;
	private String pname;
	private int price2;
	private int odseq;
	private int pseq;
	private int quantity;
	private String result;
}
