package com.sesoc.moneybook.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//HandlerInterceptorAdapter를 상속
public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	//preHandle를 오버라이딩
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//세션에 저장된 아이디 가져오기
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("userid");
		
		//로그인되지 않은 경우 로그인 페이지로 이동
		if(userid == null) {
			//절대 경로를 사용해 보내야 한다. request.getContextPath()는 루트 컨텍스트를 뽑아온다. -> http://localhost:8888/moneybook
			response.sendRedirect(request.getContextPath() + "/loginForm"); 
			//컨트롤러가 나머지를 못하도록 false 반환
			return false;
		}

		//userid가 있다면 로그인 한 것이므로 그대로 진행하도록 true 반환
		return true;		
	}
}
