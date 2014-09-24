package com.zhaopin.client.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhaopin.client.server.UserServer;
import com.zhaopin.po.User;

@Controller
@RequestMapping("/client")
public class UserController {
	
	@Resource(name="userServerImpl")
	private UserServer userServer;
	
	
	/**
	 * 
	 * 显示登陆页面
	 * @return
	 */
	@RequestMapping("/login")
	public String loginUI(){
		
		
		return "client/login";
	}
	
	/**
	 * 
	 * 显示注册页面
	 * @return
	 */
	@RequestMapping("/register")
	public String registerUI(){
		
		
		return "client/register";
	}
	
	/**
	 * 
	 * 验证登陆
	 * @return
	 */
	@RequestMapping("/login/login")
	public String login(@ModelAttribute User user,HttpSession session,Model model){
		System.out.println("ok");
		User u =userServer.login(user);
		
		//登陆成功 
		if(u!=null){
			session.setAttribute("user", u);	//把用户信息添加到session中，跳转到主页面
			return "client/index";
		}
		//登陆失败
		model.addAttribute("error", "error");
		return "client/login";		//返回到登陆页面
		
	}
	
	/**
	 * 
	 * 注册用户 保存用户到数据库
	 * @param user
	 * @return
	 */
	@RequestMapping("/register/save")
	public String save(@ModelAttribute User user,Model model){
		try {
			userServer.save(user);
			System.out.println(user.getName());
			return "client/login";
		} catch (Exception e) {
			e.printStackTrace();
			//注册错误，可能是因为username冲突或其他问题
			model.addAttribute("error","注册失败，用户名重复");
			return "client/register";	//返回注册页面
		}
		
		
	}
	
	
	
	
}
