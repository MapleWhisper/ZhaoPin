package com.zhaopin.client.controller;

import java.util.Arrays;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;
import com.zhaopin.admin.server.PaperService;
import com.zhaopin.admin.server.ProblemService;
import com.zhaopin.client.server.ApplyService;
import com.zhaopin.client.server.ResumeService;
import com.zhaopin.po.Apply;
import com.zhaopin.po.Paper;
import com.zhaopin.po.Resume;
import com.zhaopin.po.User;
import com.zhaopin.utils.ApplyState;


/**
 * 客户端的试卷管理
 * @author 广路
 *
 */
@RequestMapping("/client")
@Controller("papercontroller")
public class PaperController {
	@Resource(name = "paperServiceImpl")
	private PaperService paperService;
	
	@Resource(name="problemServiceImpl")
	private ProblemService problemService;
	
	@Resource(name="applyServiceImpl")
	private ApplyService applyService;
	
	/**
	 * 用户开始答题
	 * 
	 * @param paperId 试卷Id
	 * @param applyId 用户的申请Id
	 * @return
	 */
	@RequestMapping("/paper/startAnswer/{applyId}/{paperId}")
	public String startAnswer(Model model , @PathVariable int paperId , @PathVariable int applyId ,HttpSession session){
		
		Paper paper = paperService.getById(paperId);
		
		if(paper==null){
			return "redirect:/client/personalCenter";
		}
		paper.setSingleList(problemService.getByIds( JSON.parseArray(paper.getSingle(), Integer.class) ) );
		paper.setMultChoiceList(problemService.getByIds(JSON.parseArray(paper.getMultChoice(), Integer.class)));
		paper.setJudegeList(problemService.getByIds(JSON.parseArray(paper.getJudege(), Integer.class)));
		paper.setQuestionList(problemService.getByIds(JSON.parseArray(paper.getQuestion(), Integer.class)));

		model.addAttribute("applyId",applyId);
		model.addAttribute("paper",paper);
		return "client/paper";
		
	}
	
	/**
	 * 提交答案
	 * @return
	 */
	@RequestMapping("/paper/answer")
	public String answer( @RequestParam int id,HttpServletRequest request , int applyId ){
		
		//处理答案
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
		//生成答案JSON字符串
		String ans  = JSON.toJSONString(answer);
		
		Apply apply = applyService.getById(applyId);
		apply.setAnswer(ans);
		apply.setState(ApplyState.待批阅.toString());
		applyService.updata(apply);
		
		
		return "redirect:/client/personalCenter";
	}
	
	
	
	
	
	
	
}
