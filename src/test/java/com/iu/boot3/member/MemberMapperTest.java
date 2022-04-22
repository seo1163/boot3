package com.iu.boot3.member;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
@SpringBootTest
class MemberMapperTest {
	
	@Autowired
	private MemberMapper memberMapper;

	//@Test
	void jointest() throws Exception {
		MemberVO memberVO = new MemberVO();
		memberVO.setId("id1");
		memberVO.setPw("1234");
		memberVO.setName("id1");
		memberVO.setEmail("id1@");
		memberVO.setPhone("1234");
		
		int result = memberMapper.join(memberVO);
		assertEquals(1, result);		
	}
	
	@Test
	void login() throws Exception{
		MemberVO memberVO = new MemberVO();
		memberVO.setId("id1");
		memberVO.setPw("1234");
		memberVO=memberMapper.login(memberVO);
		assertNotNull(memberVO);
	}
	
	@Test
	void myPageTest() throws Exception{
		MemberVO memberVO = new MemberVO();
		memberVO.setId("id1");
		memberVO=memberMapper.myPage(memberVO);
		assertNotNull(memberVO);
	}
	
	//@Test
	void updateTst() throws Exception{
		MemberVO memberVO = new MemberVO();
		memberVO.setName("Name Update");
		memberVO.setEmail("Email Update");
		memberVO.setPhone("01012");
		memberVO.setId("id1");
		int result = memberMapper.update(memberVO);
		assertEquals(1,result);
	}
	//@Test
	void deleteTest() throws Exception{
		MemberVO memberVO = new MemberVO();
		memberVO.setId("a1");
		int result = memberMapper.delete(memberVO);
		assertEquals(1, result);
	}
	

}
