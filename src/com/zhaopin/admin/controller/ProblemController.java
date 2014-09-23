package com.zhaopin.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * 
 * 试卷页面 跳到试卷管理主页面
 * @author 广路
 *
 */
@Controller
@RequestMapping("/admin")
public class ProblemController {
	
	/**
	 * 跳转到试卷主页面
	 * @return
	 */
	@RequestMapping("/problem")
	public String problem(){
		
		return "admin/problem";
	}
}



	