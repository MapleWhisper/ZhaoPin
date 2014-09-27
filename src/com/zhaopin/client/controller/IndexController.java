package com.zhaopin.client.controller;

import java.util.ArrayList;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.zhaopin.client.server.PositionServer;

/**
 * 
 * 进入Index页的 Control
 * 
 * @author 于广路
 *
 */
@Controller
@RequestMapping("/client")
public class IndexController {
	@Resource(name="positionServerImpl")
	private PositionServer positionServer;
	
	
	/**
	 * 此方法是用来加载主页数据，然后跳转到主页上的
	 * 
	 * @param model	//模型，需要加入的数据
	 * @return	返回到主页 index页面上
	 */
	@RequestMapping("/index")
	public String index(ModelMap map,HttpServletRequest req){
		if(!map.containsAttribute("positionList")){
			map.addAttribute("positionList",positionServer.getByEndDate());	//把简历列表信息 加载到主页面
		}
		ArrayList<Integer> list = new ArrayList<>();
		list.add(1);
		list.add(2);
		list.add(3);
		if(!map.containsAttribute("positionName")){
			map.addAttribute("positionName",positionServer.getPositionName());
			req.getSession().setAttribute("positionName",positionServer.getPositionName());
		}
		map.addAttribute("list",list);
		System.out.println("ok");
		return "client/index";
	}
	
}
