package com.sesoc.moneybook.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.sesoc.moneybook.dao.MoneybookDAO;
import com.sesoc.moneybook.vo.MoneybookVO;

@Controller
public class MoneybookController {
	
	private static final Logger logger = LoggerFactory.getLogger(MoneybookController.class);
	
	@Autowired
	private MoneybookDAO dao;
	
	//가계부 화면 이동
	@RequestMapping(value = "moneybookList", method = RequestMethod.GET)
	public String moneybookList() {
		logger.info("가계부 화면 이동");
		return "moneybookList";
	}
	
	//가계부 등록
	@RequestMapping(value = "write", method = RequestMethod.GET)
	@ResponseBody	//ajax이므로 화면전환이 없게끔 @@ResponseBody를 붙임
	public void write(MoneybookVO vo, HttpSession session) {
		logger.info("가계부 등록");
		
		//vo에 접속 중인 아이디를 넣어준다. 아이디는 vo의 필수 요소이므로 세션에 저장된 아이디를 가져와 vo에 넣어두기
		String userid = (String)session.getAttribute("userid");
		vo.setUserid(userid);
		
		//DB에 데이터 넣기
		dao.write(vo);		
	}
	
	//가계부 리스트
	@RequestMapping(value = "list", method = RequestMethod.GET)
	@ResponseBody	//ajax이므로 화면전환이 없게끔 @@ResponseBody를 붙임
	public ArrayList<MoneybookVO> list(MoneybookVO vo, HttpSession session) {
		logger.info("가계부 리스트");
			
		//vo에 접속 중인 아이디를 넣어준다. 아이디는 vo의 필수 요소이므로 세션에 저장된 아이디를 가져와 vo에 넣어두기
		String userid = (String)session.getAttribute("userid");
		vo.setUserid(userid);
			
		//DB에서 리스트 가져와서 리턴
		return dao.list(vo);		
	}
	
	//가계부 삭제
	@RequestMapping(value = "remove", method = RequestMethod.GET)
	@ResponseBody	//ajax이므로 화면전환이 없게끔 @@ResponseBody를 붙임
	public void remove(MoneybookVO vo, HttpSession session) {
		logger.info("가계부 삭제");
				
		//vo에 접속 중인 아이디를 넣어준다. 아이디는 vo의 필수 요소이므로 세션에 저장된 아이디를 가져와 vo에 넣어두기
		String userid = (String)session.getAttribute("userid");
		vo.setUserid(userid);
				
		//DB에서 삭제하기
		dao.remove(vo);			
	}
}
