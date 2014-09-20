package com.zhaopin.admin.controller;

import javax.annotation.Resource;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

import com.zhaopin.client.server.PositionServer;
import com.zhaopin.po.Position;

/**
 * 
 * 后台岗位管理页面
 * 
 * @author 于广路
 *
 */
@Controller
@RequestMapping("/admin")
public class APositionController {
	
	@Resource(name="positionServerImpl")
	private PositionServer positionServer;
	
	@RequestMapping("/position")
	public String position(Model model){
		model.addAttribute("positionList",positionServer.findAll());
		return "admin/position";
	}
	
	@RequestMapping("/position/add")
	public String addUI(Model model){
		return "admin/addPosition";
	}
	
	@RequestMapping("/position/save")
	public String save(@ModelAttribute Position position){
		
		System.out.println("要保存position");
		System.out.println(position.getName());
		System.out.println(position.getSalary());
		positionServer.save(position);
		return "redirect:/admin/position";
	} 
}
