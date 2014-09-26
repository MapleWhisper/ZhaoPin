package com.zhaopin.admin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;
import com.zhaopin.client.server.ApplyService;
import com.zhaopin.po.Apply;
import com.zhaopin.utils.ApplyState;

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
	/**
	 * 	Ajax请求返回Json字符串
	 * 	@param state	传入的状态 		待审核，待答题，待批阅，已完成，已拒绝
	 * 	@return
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
}
