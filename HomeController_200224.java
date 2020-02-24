package com.sesoc.ajaxtest;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	
	@RequestMapping(value = "/getListForm", method = RequestMethod.GET)
	public String getListForm() {
		return "list"; //list.jsp로 이동
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
	
	//서버에서 map으로 받기
	@RequestMapping(value = "/test6", method = RequestMethod.POST)
	@ResponseBody   
	public HashMap<String, Object> test6() { 
		HashMap<String, Object> map = new HashMap<>();
		
		ArrayList<TestVO> list = new ArrayList<>();
		list.add(new TestVO("aaa", "111"));
		list.add(new TestVO("bbb", "222"));
		list.add(new TestVO("ccc", "333"));
		list.add(new TestVO("ddd", "444"));
		list.add(new TestVO("eee", "555"));
		
		map.put("list", list); //HashMap에 list를 키와 밸류를 통해 집어넣음
		
		return map;
	}
	
	//파일 저장
	@RequestMapping(value = "/test7", method = RequestMethod.POST)
	@ResponseBody   
	public void test7(TestVO vo, MultipartFile uploadFile) { 
		logger.info(vo.toString());
		FileService.saveFile(uploadFile, "C:/test/"); //업로드된 파일, 저장 경로	
	}
	
	
}	

