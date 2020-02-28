package com.sesoc.moneybook.dao;

import com.sesoc.moneybook.vo.MemberVO;

public interface MemberMapper {
	
	//회원가입
	public int signup(MemberVO vo);
	
	//로그인
	public int login(MemberVO vo);
}
