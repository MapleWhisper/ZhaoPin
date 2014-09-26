package com.zhaopin.client.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhaopin.client.server.PositionServer;
import com.zhaopin.po.Position;

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
			map.addAttribute("positionList",positionServer.findAll());	//把简历列表信息 加载到主页面
		}
		ArrayList<Integer> list = new ArrayList<>();
		list.add(1);
		list.add(2);
		list.add(3);
		if(!map.containsAttribute("positionName")){

			List<Position>plist=positionServer.getPositionName();
			List<Position>li=new ArrayList<Position>();
			Iterator<Position>it=plist.iterator();
			long day=0;
			 SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd");
			 Date date=new Date();
			while(it.hasNext()){
				Position p=it.next();
				try {
					Date date1=sf.parse(sf.format(date));
					Date date2=sf.parse(sf.format(p.getCreatedate()));
					day=date1.getTime()-date2.getTime();
					day=day/1000/60/60/24;
					p.setScanNumber((int)day);
					li.add(p);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			map.addAttribute("positionName",li);
			req.getSession().setAttribute("positionName",li);

			map.addAttribute("positionName",positionServer.getPositionName());
			req.getSession().setAttribute("positionName",positionServer.getPositionName());

		}
		map.addAttribute("list",list);
		System.out.println("ok");
		return "client/index";
	}
	
}
