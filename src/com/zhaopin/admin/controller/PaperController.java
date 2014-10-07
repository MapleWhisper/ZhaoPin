package com.zhaopin.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 试卷控制
 *
 */
@RequestMapping("/admin")
@Controller
public class PaperController {
	
	/**
	 * 显示试卷列表页面
	 * 列出所有试卷
	 * @return
	 */
	@RequestMapping("/paper")
	public String paper(){
		
		return "admin/paper";
	}
	
	/**
	 * 
	 * 根据Id 显示试卷
	 * @param id
	 * @return
	 */
	@RequestMapping("paper/show/{id}")
	public String show(@PathVariable int id){
		
		return "admin/showPaper";
	}
	
	/**
	 * 增加试卷页面
	 * @return
	 */
	@RequestMapping("paper/add")
	public String addPaper(){
		
		return "admin/addPaper";
	}
	
	/**
	 * 保存试卷
	 * @return
	 */
	@RequestMapping("paper/add")
	public String save(){
		
		return "redirect:/admin/paper";
	}
	
	/**
	 * 修改试卷页面
	 * @return
	 */
	@RequestMapping("paper/edit")
	public String edit(){
		
		return "admin/editPaper";
	}
	

	/**
	 * 修改试卷
	 * @return
	 */
	@RequestMapping("paper/edit")
	public String update(){
		
		return "admin/editPaper";
	}
	
	/**
	 * 根据Id删除试卷
	 * @return
	 */
	@RequestMapping("paper/delete/{id}")
	public String delete(@PathVariable int id){
		
		return "redirect:/admin/paper";
	}
	
}
