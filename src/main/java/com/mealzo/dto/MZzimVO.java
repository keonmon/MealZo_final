package com.mealzo.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MZzimVO {
private int zseq;
private int pseq;
private String id;
private Timestamp indate;
private String name;
private String image;
private String price2;
private String kind;
private String result;
}
