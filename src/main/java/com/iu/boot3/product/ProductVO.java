package com.iu.boot3.product;

import java.util.List;

import lombok.Data;

@Data
public class ProductVO {
	
	private Long num;
	private String name;
	private Long price;
	private Long count;
	private String detail;
	
	
	private List<ProductFilesVO> filesVOs;
}
