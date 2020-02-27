package com.moneybook.mb.controller;



import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.moneybook.mb.dao.MemberDAO;
import com.moneybook.mb.vo.Member;


@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberDAO dao;
	
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	private String loginForm() {
		logger.info("로그인 폼 이동");
		return "loginForm";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	private String login(Member member, HttpSession session) {
		logger.info("로그인 하기");
		
		Member newMember = dao.memberSelectOne(member.getUserid());
		logger.info("DB에서 꺼내온 객체 : {}",newMember);
		logger.info("로그인한 비밀번호 : {}", member.getUserpwd());
		logger.info("DB에서 꺼내온 비밀번호 : {}", newMember.getUserpwd());
		//로그인 성공
		//세션에 유저 아이디를 저장하고 메인화면으로 이동	
		
		
		if(newMember != null) {
			if(member.getUserpwd().equals(newMember.getUserpwd())){
				session.setAttribute("loginId", member.getUserid());
				logger.info("member 객체 : {}",member);
				logger.info("로그인 성공");
				return "redirect:/";
			}
		}
		
		//로그인 실패
		//메인화면으로 이동
		logger.info("로그인 실패");
		return "redirect:/";

	}
	
	@RequestMapping(value="/joinForm", method=RequestMethod.GET)
	private String joinForm() {
		logger.info("회원가입 폼 이동");
		return "joinForm";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	private String join(Member member) {
		logger.info("회원가입 하기");
		
		int cnt = dao.memberInsert(member);
		
		//회원 가입 성공
		//로그인 화면 이동
		if(cnt != 0) {
			logger.info("회원가입 성공");
			return "redirect:/loginForm";
		}
		//회원 가입 실패
		//회원가입 화면 이동
		else {
			logger.info("회원가입 실패");
			return "redirect:/joinForm";
		}
	}


	@RequestMapping(value="/logout", method=RequestMethod.GET)
	private String logout(HttpSession session) {
		logger.info("로그아웃 이동");
		session.removeAttribute("loginId");
		return "redirect:/";
	}
}
