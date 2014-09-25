package com.zhaopin.client.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/client")
public class PersonalCenterController {
	
	
	
	@RequestMapping("/personalCenter")
	public String personalCenter(Model model){
		
		return "client/personalCenter";
	}
}
