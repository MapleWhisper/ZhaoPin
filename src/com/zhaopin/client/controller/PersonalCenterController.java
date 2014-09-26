package com.zhaopin.client.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhaopin.po.User;


@Controller
@RequestMapping("/client")
public class PersonalCenterController {
	
	
	
	@RequestMapping("/personalCenter")
	public String personalCenter(Model model,HttpSession session){
		
		User user=(User)session.getAttribute("user");
		System.out.println(user.getId());
		System.out.println("asdasdasd");
		
		
		return "client/personalCenter";
	}
}
