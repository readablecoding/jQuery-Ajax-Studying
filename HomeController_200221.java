package com.sesoc.ajaxtest;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	//서버로 데이터를 변수를 전송
	@RequestMapping(value = "/test1", method = RequestMethod.GET)
	@ResponseBody   //ajax 요청을 받는 메소드는 @ResponseBody를 붙여야 한다. 이걸 안 붙이면 화면전환이 일어난다.
	public void test1(String id, String name) { //반환 값이 없으므로 void로, 키와 변수명을 같게 하면  알아서 매핑
		logger.info("ID : {}", id);
		logger.info("NAME : {}", name);
	}
	
	//서버로 데이터를 VO 객체로  전송
	@RequestMapping(value = "/test2", method = RequestMethod.POST)
	@ResponseBody   //ajax 요청을 받는 메소드는 @ResponseBody를 붙여야 한다. 이걸 안 붙이면 화면전환이 일어난다.
	public void test2(TestVO vo) { //반환 값이 없으므로 void로, 키와 변수명을 같게 하면  알아서 매핑, vo에서 값을 가져옴
		logger.info("ID : {}", vo.getId());
		logger.info("NAME : {}", vo.getName());
	}
	
	//서버로 데이터를 JSON타입으로 전송
	//화면에서 JSON데이터 타입으로 데이터를 서버로 보내려면 vo 앞에 @RequestBody를 붙여야 한다.
	@RequestMapping(value = "/test3", method = RequestMethod.POST)
	@ResponseBody   //ajax 요청을 받는 메소드는 @ResponseBody를 붙여야 한다. 이걸 안 붙이면 화면전환이 일어난다.
	public void test3(@RequestBody TestVO vo) { //반환 값이 없으므로 void로, 키와 변수명을 같게 하면  알아서 매핑, vo에서 값을 가져옴
		logger.info("ID : {}", vo.getId());
		logger.info("NAME : {}", vo.getName());
	}
	
	////서버로 데이터를 폼 태그로 전송(폼 태그 자체)
	@RequestMapping(value = "/test4", method = RequestMethod.POST)
	@ResponseBody   //ajax 요청을 받는 메소드는 @ResponseBody를 붙여야 한다. 이걸 안 붙이면 화면전환이 일어난다.
	public void test4(TestVO vo) { //반환 값이 없으므로 void로, 키와 변수명을 같게 하면  알아서 매핑, vo에서 값을 가져옴
		logger.info("ID : {}", vo.getId());
		logger.info("NAME : {}", vo.getName());
	}
		
	//서버에서 vo 객체로 데이터를 받는 것(폼 태그 자체)
	@RequestMapping(value = "/test5", method = RequestMethod.POST)
	@ResponseBody   //ajax 요청을 받는 메소드는 @ResponseBody를 붙여야 한다. 이걸 안 붙이면 화면전환이 일어난다.
	public ArrayList<TestVO> test5() { 
		ArrayList<TestVO> list = new ArrayList<>();
		list.add(new TestVO("aaa", "111"));
		list.add(new TestVO("bbb", "222"));
		list.add(new TestVO("ccc", "333"));
		list.add(new TestVO("ddd", "444"));
		list.add(new TestVO("eee", "555"));
			
		return list;		
	}
}

