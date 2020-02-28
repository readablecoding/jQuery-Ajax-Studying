package com.sesoc.moneybook.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sesoc.moneybook.vo.MoneybookVO;

@Repository
public class MoneybookDAO {
	
	@Autowired
	private SqlSession session;
	
	//가계부 등록
	public void write(MoneybookVO vo) {
		MoneybookMapper mapper = session.getMapper(MoneybookMapper.class);
		mapper.write(vo);	
	}
	
	//가계부 리스트
	public ArrayList<MoneybookVO> list(MoneybookVO vo){
		MoneybookMapper mapper = session.getMapper(MoneybookMapper.class);
		return mapper.list(vo);
	}
	
	//가계부 삭제
	public void remove(MoneybookVO vo) {
		MoneybookMapper mapper = session.getMapper(MoneybookMapper.class);
		mapper.remove(vo);
	}
	
}
