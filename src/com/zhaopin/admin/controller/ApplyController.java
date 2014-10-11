package com.zhaopin.admin.controller;

import java.util.Date;
import java.util.HashMap;
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
import com.zhaopin.client.server.ApplyService;
import com.zhaopin.po.Apply;
import com.zhaopin.po.Paper;
import com.zhaopin.po.Problem;
import com.zhaopin.utils.ApplyState;
import com.zhaopin.utils.MailSender;

/**
 * 后台简历管理
 * 
 * @author 于广路
 *
 */
@Controller("AapplyController")
@RequestMapping("/admin")
public class ApplyController {
	
	@Resource(name="applyServiceImpl")
	private ApplyService applyService;
	
	@Resource(name="paperServiceImpl")
	private PaperService paperService;
	
	@Resource(name="problemServiceImpl")
	private ProblemService problemService;
	/**
	 * 	Ajax请求返回Json字符串
	 * 	@param state	传入的状态 		待审核，待答题，待批阅，已完成，已拒绝
	 * 	@return
	 */
	
	/**
	 * 后台 申请列表页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/apply")
	public String apply(Model model){
		List<Apply> list1 = applyService.findByState(ApplyState.待审核.toString());
		List<Apply> list2 = applyService.findByState(ApplyState.待答题.toString());
		List<Apply> list3 = applyService.findByState(ApplyState.待批阅.toString());
		List<Apply> list4 = applyService.findByState(ApplyState.已完成.toString());
		List<Apply> list5 = applyService.findByState(ApplyState.已拒绝.toString());
		HashMap<String,String> map = applyService.findCountByState();
		
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		model.addAttribute("list4", list4);
		model.addAttribute("list5", list5);
		model.addAttribute("count", map);
		
		
		return "admin/apply";
	}
	
	/*
	@RequestMapping("/apply/json")
	public void apply(@RequestParam String state ,HttpServletResponse response){
		if(state==null || state.equals("")){
			try {
				response.sendRedirect("admin/apply");	//如果传入的参数不正确，返回后台主页
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
			//applyService.findCountByState();
		System.out.println(state);
		
		List<Apply> applyList = applyService.findByState(state);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		for(Apply a: applyList){
			System.out.println(a.getState());
		}
		String list = JSON.toJSONStringWithDateFormat(applyList,"yyyy-MM-dd hh:mm:ss");
		System.out.println(list);
		try {
			response.getWriter().println(list);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	*/
	
	/**
	 * 根据 id 拒绝简历
	 * @param id
	 * @return
	 */
	@RequestMapping("apply/refuse/{id}")
	public String refuse(@PathVariable int id){
		
		Apply apply = applyService.getById(id);
		apply.setState(ApplyState.已拒绝.toString());
		
		applyService.updata(apply);
		
		return "redirect:/admin/apply";
	}
	
	/**
	 * 根据 id 接受审核
	 * @param id	简历Id
	 * @param paperId	试卷Id
	 * @return
	 */
	@RequestMapping("apply/accept/{id}/{paperId}")
	public String accept(@PathVariable int id,@PathVariable int paperId){
		
		
		
		Apply apply = applyService.getById(id);
		apply.setPaper( paperService.getById(paperId) );
		
		if(apply.getState().equals(ApplyState.待审核.toString())){
			apply.setState(ApplyState.待答题.toString());
			MailSender.sendUserToAnswer(apply.getUser().getEmail(), apply);
		}
		
		applyService.updata(apply);
		
		return "redirect:/admin/apply";
	}
	
	
	/**
	 * 根据 id 完成申请
	 * @param id
	 * @return
	 */
	@RequestMapping("apply/finish/{id}")
	public String finish(@PathVariable int id){
		
		Apply apply = applyService.getById(id);
		if(apply.getState().equals(ApplyState.待批阅.toString())){
			apply.setState(ApplyState.已完成.toString());
			apply.setFinishDate(new Date());
			MailSender.sendUserToSuccess(apply.getUser().getEmail(), apply);
		}
		applyService.updata(apply);
		
		return "redirect:/admin/apply";
	}
	
	
	/**
	 * 
	 * 根据Id 审核试卷
	 * @param id
	 * @return
	 */
	@RequestMapping("/apply/check/{id}")
	public String check(@PathVariable int id,Model model,HttpSession session){
		Apply apply = applyService.getById(id);
		
		//添加试卷
		Paper paper = apply.getPaper();
		if(paper==null){
			return "redirect:/admin/paper";
		}
		paper.setSingleList(problemService.getByIds( JSON.parseArray(paper.getSingle(), Integer.class) ) );
		paper.setMultChoiceList(problemService.getByIds(JSON.parseArray(paper.getMultChoice(), Integer.class)));
		paper.setJudegeList(problemService.getByIds(JSON.parseArray(paper.getJudege(), Integer.class)));
		paper.setQuestionList(problemService.getByIds(JSON.parseArray(paper.getQuestion(), Integer.class)));
		
		//添加答案
		String ans = apply.getAnswer();		//从Apply中取出答案
		if(ans!=null){
			HashMap<String, String> map =  JSON.parseObject(ans, HashMap.class);
			
			for(Problem p : paper.getSingleList()){				//把答案放到题目中，送到前台
				p.setUserAns(map.get(p.getId()+""));
			}
			for(Problem p : paper.getMultChoiceList()){
				p.setUserAns(map.get(p.getId()+""));
			}
			for(Problem p : paper.getJudegeList()){
				p.setUserAns(map.get(p.getId()+""));
			}
			for(Problem p : paper.getQuestionList()){
				p.setUserAns(map.get(p.getId()+""));
			}
		}
		
		model.addAttribute("apply", apply);
		model.addAttribute("paper", paper);
		return "admin/checkPaper";
	}
}
