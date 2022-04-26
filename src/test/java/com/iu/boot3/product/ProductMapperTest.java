package com.iu.boot3.product;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.iu.boot3.util.Pager;

@SpringBootTest
class ProductMapperTest {
	
	@Autowired
	private ProductMapper productMapper;


	
	//list
	@Test
	void getListTest() throws Exception{
		Pager pager = new Pager();
		pager.makeRow();
		List<ProductVO> ar = productMapper.getList(pager);
		System.out.println(ar);
		assertEquals(10,ar.size());
	}

}