package com.zhaopin.client.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * 进入客户端的IndexControl
 * @author 广路
 *
 */
@Controller
@RequestMapping("/client")
public class IndexController {
	
	@RequestMapping("index")
	public ModelAndView execute(){
		System.out.println("ok");
		return new ModelAndView("success");
	}
}
