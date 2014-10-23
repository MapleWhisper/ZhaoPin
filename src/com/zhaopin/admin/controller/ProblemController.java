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
import org.springframework.web.bind.annotation.RequestParam;

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
	 * 跳转到 试题主页面
	 * @return
	 */
	@RequestMapping("/problem")
	public String problem(){
		
		return "admin/problem";
	}
	
	/**
	 * 保存试题
	 * 
	 * @return
	 */
	@RequestMapping("/problem/save")
	public String save(@ModelAttribute Problem problem ,Model model){
		
		problem.setCreateDate(new Date());
		problemService.save(problem);
		
		model.addAttribute("mes", "addSuccess");//添加数据成功
		return "redirect:/admin/problem";
	}
	
	
	/**
	 * 根据关键字 搜索试题
	 * @param key
	 * @param response
	 */
	@RequestMapping("/problem/search/json")
	public void search(@RequestParam String key,HttpServletResponse response){
		
		System.out.println("key"+key);
		
		List<Problem> problemList =  problemService.search(key);
		String list = JSON.toJSONString(problemList);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		try {
			response.getWriter().println(list);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 修改试题
	 * @param problem
	 * @throws IOException 
	 */
	@RequestMapping("/problem/update/json")
	public void update(@ModelAttribute Problem problem,HttpServletResponse response) throws IOException{
		Problem p = problemService.getById(problem.getId());
		response.setContentType("application/json");
		if(p!=null){
			p.setTitle(problem.getTitle());
			p.setOptA(problem.getOptA());
			p.setOptB(problem.getOptB());
			p.setOptC(problem.getOptC());
			p.setOptD(problem.getOptD());
			p.setAnswer(problem.getAnswer());
			problemService.updata(p);
			response.getWriter().println("{\"mes\":\"success\"}");
		}else{
			response.getWriter().println("{\"mes\":\"error\"}");
		}
		
	}
	
	/**
	 * 删除 试题
	 * @param problem
	 * @throws IOException 
	 */
	@RequestMapping("/problem/delete/json")
	public void delete(@RequestParam int id , HttpServletResponse response) throws IOException{
		problemService.delete(id);
		response.getWriter().println("{\"mes\":\"success\"}");
	}
}



	