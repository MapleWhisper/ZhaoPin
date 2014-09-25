package com.zhaopin.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 申请 相关操作
 * 
 * @author 于广路
 *
 */
@Controller
@RequestMapping("/admin")
public class ApplyController {
	
	@RequestMapping("/apply")
	public String apply(){
		return "admin/apply";
	}
}
