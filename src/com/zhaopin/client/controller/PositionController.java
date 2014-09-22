package com.zhaopin.client.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.zhaopin.client.server.PositionServer;
import com.zhaopin.po.Position;

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
	public String loginAdmin( @PathVariable int id,Model model){
		Position p = positionServer.getById(id);
		p.setScanNumber(p.getScanNumber()==null?0:p.getScanNumber()+1);		//浏览岗位，把岗位浏览次数加一
		positionServer.updata(p);
		model.addAttribute("position",p);
		System.out.println("ok");
		return "client/position";
	}
	
	/**
	 * 根据关键字查询特定的简历列表
	 * @return json形式的position数据到主页面
	 */
	@RequestMapping("/position/select/json")
	public void select(HttpServletRequest req ,HttpServletResponse resp){
		System.out.println("ajax ok");
		HashMap<String, String> map = new HashMap<>();
		map.put("workPlace", req.getParameter("workPlace"));
		map.put("position", req.getParameter("position"));
		map.put("type",req.getParameter("type"));
		
		List<Position> list = positionServer.getByKey(map);
		
		String positionList = JSON.toJSONStringWithDateFormat(list,"yyyy-MM-dd");
		System.out.println(positionList);
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("application/json");
		try {
			resp.getWriter().append(positionList);
			resp.getWriter().flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
}
