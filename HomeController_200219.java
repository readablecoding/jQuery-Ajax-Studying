package com.jquery.test;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping(value = "sel1", method = RequestMethod.GET)
	public String sel1() {
		return "sel1";
	}
	
	@RequestMapping(value = "sel2", method = RequestMethod.GET)
	public String sel2() {
		return "sel2";
	}
	
	@RequestMapping(value = "sel3", method = RequestMethod.GET)
	public String sel3() {
		return "sel3";
	}
	
	@RequestMapping(value = "homework_200218", method = RequestMethod.GET)
	public String homework_200218() {
		return "homework_200218";
	}
	
	@RequestMapping(value = "/hw1", method = RequestMethod.GET)
	public String hw1() {
		return "hw1";
	}
	
	@RequestMapping(value = "/each", method = RequestMethod.GET)
	public String each() {
		return "each";
	}
	
	@RequestMapping(value = "/css", method = RequestMethod.GET)
	public String css() {
		return "css";
	}
	
	@RequestMapping(value = "/exClass", method = RequestMethod.GET)
	public String exClass() {
		return "class";
	}
	
	@RequestMapping(value = "/homework_200219", method = RequestMethod.GET)
	public String homework_200219() {
		return "homework_200219";
	}
	
}
