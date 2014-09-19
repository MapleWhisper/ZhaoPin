package com.zhaopin.client.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * 进入客户端的IndexControl
 * 访问/ZhaoPin/client/index
 * 看到Succeess说明spring mvc成功
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
