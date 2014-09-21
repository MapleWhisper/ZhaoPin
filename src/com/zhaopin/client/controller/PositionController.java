package com.zhaopin.client.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.portlet.ModelAndView;

import com.zhaopin.client.server.PositionServer;

@Controller
@RequestMapping("/client")
public class PositionController {

	@Resource(name="positionServerImpl")
	private PositionServer positionServer;
	/**
	 * 显示职位详情页面
	 * @return
	 */
	@RequestMapping("/position/show/id/{id}")
	public ModelAndView loginAdmin( @RequestParam int id,Model model){
		model.addAttribute("position",positionServer.getById(id));
		
		return new ModelAndView("client/position");
	}
	
	
	
	
	
}
