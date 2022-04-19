package com.iu.boot3.board;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.iu.boot3.util.Pager;

@SpringBootTest
class BoardMapperTest {

	@Autowired
	private BoardMapper boardMapper;
	
	//@Test
	void getDetailtest() throws Exception {
		BoardVO boardVO = new BoardVO();
		boardVO.setNum(1L);
		boardVO = boardMapper.getDetail(boardVO);
		System.out.println(boardVO.toString());
		assertNotNull(boardVO);
	}
	
	//list
	@Test
	void getListTest() throws Exception{
		Pager pager = new Pager();
		pager.makeRow();
		List<BoardVO> ar = boardMapper.getList(pager);
		System.out.println(ar);
		assertEquals(10, ar.size());
	}
	
	//add
	//@Test
	void setAddTest() throws Exception{
		for(int i=0;i<100;i++) {
		if(i%10 ==0) {
			Thread.sleep(1000);
		}
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle("Title Test");
		boardVO.setWriter("Writer Test");
		boardVO.setContents("Contents Test");
		
		int result = boardMapper.setAdd(boardVO);
		}
		System.out.println("FINISH");
		//assertEquals(1, result);
	}
	
	//@Test
	void setDeleteTest() throws Exception{
		BoardVO boardVO = new BoardVO();
		boardVO.setNum(3L);
		int result = boardMapper.setDelete(boardVO);
		assertEquals(1, result);
	}
	
	//@Test
	void setUpdateTest()throws Exception{
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle("Title Update");
		boardVO.setContents("Contents Update");
		boardVO.setNum(2L);
		int result = boardMapper.setUpdate(boardVO);
		assertEquals(1, result);
	}
	
	//@Test
//	void setFileAdd() throws Exception{
//		BoardFilesVO boardFilesVO = new BoardFilesVO();
//		boardFilesVO.setFileName("fileName");
//		boardFilesVO.setOriName("oriName");
//		boardFilesVO.setNum(1L);
//		
//		int result = boardMapper.setFileAdd(boardFilesVO);
//		assertEquals(1, result);
//	}
//	

}
	
