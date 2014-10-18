package com.zhaopin.client.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.PropertyFilter;
import com.zhaopin.client.server.PositionServer;
import com.zhaopin.client.server.UserServer;
import com.zhaopin.po.Position;

@Controller
@RequestMapping("/client")
public class PositionController {

	@Resource(name="positionServerImpl")
	private PositionServer positionServer;
	
	@Resource(name="userServerImpl")
	private UserServer userServer;
	
	
	
	/**
	 * 显示职位详情页面
	 * @return
	 */
	@RequestMapping("/position/show/id/{id}")
	public String loginAdmin( @PathVariable int id,Model model ,HttpSession session){
		Position p1 = positionServer.getById(id);
		
		if( session.getAttribute(id+"")==null ){	//如果Session是新的
			session.setAttribute(id+"", id+"");
			p1.setScanNumber(p1.getScanNumber()==null?1:p1.getScanNumber()+1);		//浏览岗位，把岗位浏览次数加一
			positionServer.updata(p1);
		}
		  
		
		if(!model.containsAttribute("positionName")){

			List<Position>plist=positionServer.getPositionName();	
			Iterator<Position>it=plist.iterator();
			long day=0;
			SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd");
			Date date=new Date();
			Position p;
			while(it.hasNext()){
				p=it.next();
				try {
					Date date1=sf.parse(sf.format(date));
					if(p.getCreatedate()!=null){
						Date date2=sf.parse(sf.format(p.getCreatedate()));
						day=date1.getTime()-date2.getTime();
						day=day/1000/60/60/24;
						p.setDay( (int)day );
						String name = p.getName();
						p.setName(name.substring(0, name.length()<10?name.length():10));
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			model.addAttribute("positionName",plist);
		}
		model.addAttribute("position",p1);
		System.out.println("ok");
		return "client/position";
	}
	

	
	/**
	 * 根据关键字查询特定的简历列表
	 * @return json形式的position数据到主页面
	 */
	@RequestMapping("/position/select/json")
	public void select(HttpServletRequest req ,HttpServletResponse resp){
		HashMap<String, String> map = new HashMap<>();
		map.put("workPlace", req.getParameter("workPlace"));		//把需要查询的条件放到map
		map.put("position", req.getParameter("position"));
		map.put("type",req.getParameter("type"));
		
		List<Position> list = positionServer.getByKey(map);			//更需条件查询列表
	
		String positionList = JSON.toJSONString(list);	//查询列表转换成Json字符串
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("application/json");
		try {
			resp.getWriter().append(positionList);		//返回json数据
			resp.getWriter().flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
