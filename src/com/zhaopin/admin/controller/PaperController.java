package com.zhaopin.admin.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;
import com.zhaopin.admin.server.PaperService;
import com.zhaopin.admin.server.ProblemService;
import com.zhaopin.po.Paper;
import com.zhaopin.po.Problem;
import com.zhaopin.utils.Page;
import com.zhaopin.utils.PaperCart;
import com.zhaopin.utils.SystemConstant;

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
	public String paper(Model model){
		
		
		
		List<Paper> paperList = paperService.findAll();
		model.addAttribute("paperList", paperList);
		
		return "admin/paper";
	}
	
	/**
	 * 
	 * 根据简历Id 选择试题，确认提交
	 * @return
	 */
	@RequestMapping("/paper/{resumeId}")
	public String paper(Model model,@PathVariable int resumeId){
		
		List<Paper> paperList = paperService.findAll();
		model.addAttribute("paperList", paperList);
		
		model.addAttribute("resumeId",resumeId);
		
		return "admin/paper";
	}
	
	/**
	 * 
	 * 根据Id 显示试卷
	 * @param id
	 * @return
	 */
	@RequestMapping("paper/show/{id}")
	public String show(@PathVariable int id,Model model,HttpSession session){
		
		Paper paper = paperService.getById(id);
		if(paper==null){
			return "redirect:/admin/paper";
		}
		
		paper.setSingleList(problemService.getByIds( JSON.parseArray(paper.getSingle(), Integer.class) ) );
		paper.setMultChoiceList(problemService.getByIds(JSON.parseArray(paper.getMultChoice(), Integer.class)));
		paper.setJudegeList(problemService.getByIds(JSON.parseArray(paper.getJudege(), Integer.class)));
		paper.setQuestionList(problemService.getByIds(JSON.parseArray(paper.getQuestion(), Integer.class)));
		paper.setSingleNumber(paper.getSingleList().size());
		paper.setMultChoiceNumber(paper.getMultChoiceList().size());
		paper.setJudgeNumber(paper.getJudegeList().size());
		paper.setQuestionNumber(paper.getQuestionList().size());
		
		model.addAttribute("paper", paper);
		return "admin/showPaper";
	}
	
	
	
	/**
	 * 组成试卷页面  试题列表
	 * @return
	 */
	@RequestMapping("paper/item/{cur}")
	public String addPaper(@PathVariable int cur,Model model){
		
		Page page = new Page();
		page.setAmount(SystemConstant.ProblemAmount_PerPage);		//每页页数
		page.setCur(cur);											//当前第几页
		page.setSum( problemService.getMaxPageNum(page));			//一共多少页
		List<Problem> problemList = problemService.findAll(page);	//数据
		model.addAttribute("problemList",problemList);
		model.addAttribute("page", page);
		return "admin/problemList";
	}
	
	
	
	/**
	 * 保存试卷
	 * @return
	 */
	@RequestMapping("paper/save")
	public String save(String title ,String auther,HttpSession session){
		
		PaperCart cart = (PaperCart) session.getAttribute("paperCart");
		if(cart==null){
			return "redirect:/admin/paper/item/1";
		}
		Paper paper = cart.toPaper(cart);		//根据试题篮 生成试卷
		paper.setTitle(title);
		paper.setAuther(auther);
		
		paperService.save(paper);
		
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
	 * @throws IOException 
	 */
	@RequestMapping("paper/delete/{id}")
	public void delete(@PathVariable int id ,HttpServletResponse response){
		
		try {
			paperService.delete(id);
			response.getWriter().println("{\"mes\":\"success\"}");
		} catch (Exception e) {
			e.printStackTrace();
			try {
				response.getWriter().println("{\"mes\":\"error\"}");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		
	}
	
	/**
	 * 提交答案
	 * @return
	 */
	@RequestMapping("/paper/answer")
	public String answer( @RequestParam int id,HttpServletRequest request){
		Paper paper = paperService.getById(id);
		if(paper==null){
			return "redirect:/admin/paper";
		}
		HashMap<String,String> answer = new HashMap<String,String>();
		for( Integer i : JSON.parseArray(paper.getSingle(), Integer.class) ){
			answer.put(i+"", request.getParameter(i+""));
		}
		for( Integer i : JSON.parseArray(paper.getMultChoice(), Integer.class) ){
			answer.put(i+"", Arrays.toString((request.getParameterValues(i+""))) );
		}
		for( Integer i : JSON.parseArray(paper.getJudege(), Integer.class) ){
			answer.put(i+"", request.getParameter(i+""));
		}
		for( Integer i : JSON.parseArray(paper.getQuestion(), Integer.class) ){
			answer.put(i+"", request.getParameter(i+""));
		}
		String ans  = JSON.toJSONString(answer);
		request.getSession().setAttribute("ans", ans);
		return "redirect:/admin/paper";
	}
	
	
}
