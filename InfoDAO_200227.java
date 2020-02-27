package com.moneybook.mb.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InfoDAO {
	
	@Autowired
	private SqlSession session;
	
}
