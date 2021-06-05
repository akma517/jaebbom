package com.sku.jaebbom.main.controller;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MainController {
	
	@RequestMapping(value="/",method= RequestMethod.GET)
	public String mainPage() {
		return "main/mainPage";
	}
	
	@RequestMapping(value="/reportPage.do",method= RequestMethod.GET)
	public String reportPage() {
		return "main/reportPage";
	}
}
