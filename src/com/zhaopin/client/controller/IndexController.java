package com.zhaopin.client.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhaopin.client.server.PositionServer;
import com.zhaopin.client.server.UserServer;
import com.zhaopin.po.Position;
import com.zhaopin.po.User;

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

	@Resource(name="userServerImpl")
	private UserServer userServer;

	/**
	 * 此方法是用来加载主页数据，然后跳转到主页上的
	 * 
	 * @param model	//模型，需要加入的数据
	 * @return	返回到主页 index页面上
	 */
	@RequestMapping("/index")
	public String index(ModelMap map,HttpServletRequest req,HttpSession session){
				
		
		if(!map.containsAttribute("positionList")){
			map.addAttribute("positionList",positionServer.getByEndDate());	//把简历列表信息 加载到主页面
		}

		if(!map.containsAttribute("positionName")){

			List<Position>plist=positionServer.getPositionName();	
			Iterator<Position>it=plist.iterator();
			long day=0;
			SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd");
			Date date=new Date();
			while(it.hasNext()){
				Position p=it.next();
				try {
					Date date1=sf.parse(sf.format(date));
					if(p.getCreatedate()!=null){
						Date date2=sf.parse(sf.format(p.getCreatedate()));
						day=date1.getTime()-date2.getTime();
						day=day/1000/60/60/24;
						String name = p.getName();
						p.setName(name.substring(0, name.length()<10?name.length():10));
						p.setDay( (int)day );
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			map.addAttribute("positionName",plist);
		}
		return "client/index";
	}

}
