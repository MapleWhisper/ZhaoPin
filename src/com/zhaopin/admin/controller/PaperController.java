package com.zhaopin.admin.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.zhaopin.admin.server.PaperService;
import com.zhaopin.admin.server.ProblemService;
import com.zhaopin.po.Paper;
import com.zhaopin.po.Problem;
import com.zhaopin.utils.PaperCart;

/**
 * 试卷控制
 *
 */
@Controller
@RequestMapping("/admin")

public class PaperController {
	
	@Resource(name="paperServiceImpl")
	private PaperService paperService;
	
	@Resource(name="problemServiceImpl")
	private ProblemService problemService;
	
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
	 * 组成试卷页面
	 * @return
	 */
	@RequestMapping("paper/item/{id}")
	public String addPaper(@PathVariable int id,Model model){
		List<Problem> problemList = problemService.findAll();
		model.addAttribute("problemList",problemList);
		
		return "admin/problemList";
	}
	
	
	
	/**
	 * 保存试卷
	 * @return
	 */
	@RequestMapping("paper/save")
	public String save(String title ,String auther,HttpSession session){
		Paper paper = new Paper();
		PaperCart cart = (PaperCart) session.getAttribute("paperCart");
		if(cart==null){
			return "redirect:/admin/paper/item/1";
		}
		paper.setTitle(title);
		paper.setAuther(auther);
		paper.setCreateDate(new Date());
		
		paper.setSingleNumber(cart.getsingleNumber());
		paper.setMultChoiceNumber(cart.getMultChoiceNumber());
		paper.setJudgeNumber(cart.getJudgeNumber());
		paper.setQuestionNumber(cart.getQuestionNumber());
		
		paper.setJudege(JSON.toJSONString(cart.getSingles()));
		paper.setMultChoice(JSON.toJSONString(cart.getMultChoices()));
		
		
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
	@RequestMapping("paper/update")
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
