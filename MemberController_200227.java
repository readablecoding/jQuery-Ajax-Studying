package com.sesoc.moneybook.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sesoc.moneybook.dao.MemberDAO;
import com.sesoc.moneybook.vo.MemberVO;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberDAO dao;
	
	//회원가입 화면 이동
	@RequestMapping(value = "signupForm", method = RequestMethod.GET)
	public String signupForm() {
		logger.info("회원가입 화면 이동");
		return "signupForm";
	}
		
	//회원가입
	@RequestMapping(value = "signup", method = RequestMethod.POST)
	public String signup(MemberVO vo) {
		logger.info("회원가입 하기");
		int result = dao.signup(vo);
		if(result == 1) {
			logger.info("회원가입 성공");
			return "redirect:loginForm";
		}
		logger.info("회원가입 실패");
		return "redirect:signupForm";
	}
	
	//로그인 화면 이동
	@RequestMapping(value = "loginForm", method = RequestMethod.GET)
	public String loginForm() {
		logger.info("로그인 화면 이동");
		return "loginForm";
	}
	
	//로그인
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpSession session) {
		logger.info("로그인 하기");
		
		if(dao.login(vo) != 1) { 
			logger.info("로그인 실패");
			return "redirect:loginForm"; //로그인 실패 시 다시 로그인 창으로 이동
		}
		
		logger.info("로그인 성공");
		session.setAttribute("userid", vo.getUserid()); 	//세션에 아이디 값 저장
		return "redirect:/";								//메인으로 이동
	}
	
	//로그아웃
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("로그아웃");
		session.removeAttribute("userid"); //세션에 담겨있던 아이디 삭제
		return "redirect:/";
	}
	
}
