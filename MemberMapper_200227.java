package com.moneybook.mb.dao;

import com.moneybook.mb.vo.Member;

public interface MemberMapper {
	
	public int memberInsert(Member member);
	
	public Member memberSelectOne(String userid);
	
}
