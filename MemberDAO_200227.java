package com.sesoc.moneybook.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.moneybook.vo.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession session;
	
	//회원가입
	public int signup(MemberVO vo) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		return mapper.signup(vo);	
	}
	
	//로그인
	public int login(MemberVO vo) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		return mapper.login(vo);
	}
}
