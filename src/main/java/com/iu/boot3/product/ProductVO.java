package com.iu.boot3.product;

import java.util.List;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Range;

import lombok.Data;

@Data
public class ProductVO {
	
	private Long productNum;
	@NotBlank
	private String productName;
	@Min(value = 100)
	private Integer productPrice;
	@Range(min=1, max=100)
	private Integer productCount;
	@NotBlank
	private String productDetail;
	private String id;
	@NotNull
	private Integer sale;
	
	private List<ProductFilesVO> productFilesVOs;
	
}