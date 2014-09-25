package com.zhaopin.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;
import com.zhaopin.client.server.ApplyService;
import com.zhaopin.po.Apply;

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
		List<Apply> applyList = applyService.findByState("待审核");
		model.addAttribute("applyList", applyList);
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
		System.out.println(state);
		List<Apply> applyList = applyService.findByState(state);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		String list = JSON.toJSONStringWithDateFormat(applyList,"yyyy-MM-dd hh:mm:ss");
		System.out.println(list);
		try {
			response.getWriter().println(list);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}
