package com.iu.boot3.member;

import org.apache.ibatis.annotations.Mapper;





@Mapper
public interface MemberMapper {
	
	//login
	public MemberVO login(MemberVO memberVO)throws Exception;
	
	//join
	public int join(MemberVO memberVO) throws Exception;
	
	//update
	public int update(MemberVO memberVO) throws Exception;
	
	//delete
	public int delete(MemberVO memberVO) throws Exception;
	
	//mypage
	public MemberVO myPage(MemberVO memberVO) throws Exception;
	
	//detail
	public MemberVO Detail(MemberVO memberVO)throws Exception;
	
	//insert : setFileAdd
	public int setFileAdd(MemberFilesVO memberFilesVO)throws Exception;
}
