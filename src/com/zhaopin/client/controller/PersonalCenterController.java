package com.zhaopin.client.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhaopin.client.server.UserServer;
import com.zhaopin.po.Apply;
import com.zhaopin.po.User;
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
			Set<Apply> as=u.getApplys();
			List<Apply> al=new ArrayList<Apply>(as);
			model.addAttribute("user",u);
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
	
	/**
	 * 修改密码
	 * @param model
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping("/updatePwd")
	public String updatePwd(Model model,HttpSession session,HttpServletRequest request){
		
		User user=(User)session.getAttribute("user");
		if(user==null){
			return "redirect:/client/login";
		}
		User u=userServer.getById(user.getId());
		
		String oldPwd=request.getParameter("oldPwd");
		String newPwd=request.getParameter("newPwd");
		
		if(!u.getPassword().equals(oldPwd)){
			model.addAttribute("error", "输入原密码错误");
			return "client/personalCenter";
		}else{
			u.setPassword(newPwd);
			userServer.updata(u);
			return "redirect:/client/personalCenter";
		}
	}
}
