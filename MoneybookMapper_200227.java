package com.sesoc.moneybook.dao;

import java.util.ArrayList;

import com.sesoc.moneybook.vo.MoneybookVO;

public interface MoneybookMapper {
	
	//매퍼와 xml이 연결됨 => xml에 가서 실행하고 돌아옴
	
	//가계부 등록
	public void write(MoneybookVO vo);
	
	//가계부 리스트
	public ArrayList<MoneybookVO> list(MoneybookVO vo);
	
	//가계부 삭제
	public void remove(MoneybookVO vo);
	
}
