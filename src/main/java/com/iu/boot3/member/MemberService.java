package com.iu.boot3.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper memberMapper;

	//회원가입
	public int join(MemberVO memberVO) throws Exception{
		return memberMapper.join(memberVO);
	}
	
	//로그인
	public MemberVO login(MemberVO memberVO) throws Exception{
		return memberMapper.login(memberVO);
	}
	
	//마이페이지
	public MemberVO myPage(MemberVO memberVO) throws Exception{
		return memberMapper.myPage(memberVO);
	}
	
	//수정	
	public int update(MemberVO memberVO) throws Exception{
		return memberMapper.update(memberVO);
	}
	
	//삭제
	public int delete(MemberVO memberVO) throws Exception{
		return memberMapper.delete(memberVO);
	}
}
