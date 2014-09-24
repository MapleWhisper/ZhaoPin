package com.zhaopin.admin.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhaopin.admin.server.ProblemService;
import com.zhaopin.po.Problem;


/**
 * 
 * 试卷页面 跳到试卷管理主页面
 * @author 广路
 *
 */
@Controller
@RequestMapping("/admin")
public class ProblemController {
	
	@Resource(name="problemServiceImpl")
	private ProblemService problemService;
	
	/**
	 * 
	 * 跳转到试卷主页面
	 * @return
	 */
	@RequestMapping("/problem")
	public String problem(){
		
		return "admin/problem";
	}
	
	/**
	 * 保存试卷
	 * 
	 * @return
	 */
	@RequestMapping("/problem/save")
	public String save(@ModelAttribute Problem problem ,Model model){
		
		System.out.println("ok");
		
		problemService.save(problem);
		
		return "redirect:/admin/problem";
	}
}



	