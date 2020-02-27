package com.moneybook.mb.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class InfoController {

	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	
	@RequestMapping(value="/myMoneyBook", method=RequestMethod.GET)
	public String myMoneyBook() {
		logger.info("회원가입 이동");
		return "myMoneyBook";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write() {
		logger.info("가계부 등록");
		
		
		return "";
		
	}
	
	
}
