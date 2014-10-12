package com.zhaopin.admin.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
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
		problem.setCreateDate(new Date());
		problemService.save(problem);
		
		model.addAttribute("mes", "addSuccess");//添加数据成功
		return "redirect:/admin/problem";
	}
	
	
	@RequestMapping("/problem/list/json")
	public void list(HttpServletResponse response){
		
		List<Problem> problemList =  problemService.findAll();
		String list = JSON.toJSONString(problemList);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		try {
			response.getWriter().println(list);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/problem/search/json")
	public void search(String key,HttpServletResponse response){
		List<Problem> problemList =  problemService.search(key);
		String list = JSON.toJSONString(problemList);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		try {
			response.getWriter().println(list);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}



	