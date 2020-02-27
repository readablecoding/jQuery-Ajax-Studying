package com.moneybook.mb.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.moneybook.mb.vo.Member;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession session;
	
	
	public int memberInsert(Member member) {
		int cnt = 0;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			cnt = mapper.memberInsert(member);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public Member memberSelectOne(String userid) {
		Member member = null;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			member = mapper.memberSelectOne(userid);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return member;
	}
}
