package com.iu.boot3.member;

import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class MemberVO {
	
	@NotBlank
	private String id;
	

	
	@Size(min = 4, max = 8)//, message ="비번은 최소 4자리 이상 8글자 이하여야 합니다")
	private String pw;
	
	private String checkPw;
	
	
	@NotBlank(message = "이름은 필수 입니다")
	private String name;
	@Email
	@NotBlank(message="이메일 형식으로 입력해주세요")
	private String email;
	private String phone;
	
	private List<MemberFilesVO> memberFilesVO;
	
	private List<RoleVO> roleVOs;
}
