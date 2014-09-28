package com.zhaopin.client.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhaopin.client.server.ApplyService;
import com.zhaopin.client.server.PositionServer;
import com.zhaopin.client.server.UserServer;
import com.zhaopin.po.Apply;
import com.zhaopin.po.User;
import com.zhaopin.utils.ApplyState;
/**
 * 
 * 
 * @author wuyumi
 *
 */

@Controller
@RequestMapping("/client")
public class PersonalCenterController {
	
	@Resource(name="userServerImpl")
	private UserServer userServer;
	
	
	/**
	 *  跳转到个人中心并准备所有需要的数据（个人信息，个人申请）
	 *  
	 * @param model
	 * @param session
	 * @return
	 */
 
	@RequestMapping("/personalCenter")
	public String personalCenter(Model model,HttpSession session){
		
		User user=(User)session.getAttribute("user");
		if(user!=null){
			
			User u = userServer.getById(user.getId());
			Set<Apply> as=user.getApplys();
			List<Apply> al=new ArrayList<Apply>(as);

			model.addAttribute("appalyList",al);
			return "client/personalCenter";
		}else{
			return "redirect:/client/login";
		}
	}
	@RequestMapping("/resumeAlter")
	public String resumeAlter(){
		
		
		return "redirect:/client/resume";
	}
}
