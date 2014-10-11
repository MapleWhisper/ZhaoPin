package com.zhaopin.client.controller;

import java.util.Arrays;
import java.util.Date;
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
import com.zhaopin.client.server.UserServer;
import com.zhaopin.po.Apply;
import com.zhaopin.po.Paper;
import com.zhaopin.po.User;
import com.zhaopin.utils.ApplyState;
import com.zhaopin.utils.SystemConstant;


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
	
	@Resource(name="userServerImpl")
	private UserServer userServer;
	
	/**
	 * 用户开始答题
	 * 
	 * @param paperId 试卷Id
	 * @param applyId 用户的申请Id
	 * @return
	 */
	@RequestMapping("/paper/startAnswer/{applyId}/{paperId}")
	public String startAnswer(Model model , @PathVariable int paperId , @PathVariable int applyId ,HttpSession session){
		
		User u = (User) session.getAttribute("user");
		User user = userServer.getById(u.getId());
		Apply apply = applyService.getById(applyId);
		boolean flag = true;
		if(apply.getUser().getId().intValue() != u.getId().intValue()){		//如果提交的简历不属于当前用户 返回
			flag = false;
		}
		if(!apply.getState().equals(ApplyState.待答题.toString())){		//如果申请的状态不是 待答题 返回
			flag = false;
		}
		if(apply.getPaper().getId().intValue() != paperId){				//如果申请的试卷Id  和 Url 试卷Id不相同，返回
			flag = false;
		}
		
		if(!flag){
			return "redirect:/client/personalCenter";
		}
		
		Paper paper = paperService.getById(paperId);
	
		if(apply.getStartAnswerDate() == null){
			apply.setStartAnswerDate(new Date());
			applyService.updata(apply);
		}else{
			Date start = apply.getStartAnswerDate();
			Date now = new Date();
			int diff = (int) (now.getTime() - start.getTime()); 
		    int day = diff / (24 * 60 * 60 * 1000);  
            int hour = (diff / (60 * 60 * 1000) - day * 24);  
            int min = ((diff / (60 * 1000)) - day * 24 * 60 - hour * 60);  
            int sec = (diff/1000-day*24*60*60-hour*60*60-min*60);  
            if(day>0 || hour>0 || min >= 30){
            	apply.setFinishDate(new Date());
            	apply.setState(ApplyState.待批阅.toString());
            	 applyService.updata(apply);
            	return "redirect:/client/personalCenter"; //	如果试卷已经超时返回答题页面
            }
            min = SystemConstant.Paper_Time - min -1;
            sec = 60 - sec;
			model.addAttribute("timeLeft", min+":"+sec );
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
		Apply apply = applyService.getById(applyId);
		String state = apply.getState();
		
		if(!state.equals(ApplyState.待答题.toString())){		//如果申请的状态不是 待答题 返回
			return "redirect:/client/personalCenter";
		}
		
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
		
		
		apply.setAnswer(ans);
		apply.setState(ApplyState.待批阅.toString());
		applyService.updata(apply);
		
		
		return "redirect:/client/personalCenter";
	}
	
}
