package com.zhaopin.client.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/client")
public class CompanyController {
	
	@RequestMapping("/company")
	public String company(Model model){
		
		return "client/company";
	}
}
