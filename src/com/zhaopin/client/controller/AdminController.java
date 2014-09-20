package com.zhaopin.client.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.portlet.ModelAndView;

import com.zhaopin.client.server.AdminServer;
import com.zhaopin.po.Admin;

@Controller
@RequestMapping("/client")
public class AdminController {
	
	//注入admin服务	adminServerImpl
	@Resource(name="adminServerImpl")
	private AdminServer adminServer;
	
	/**
	 * 显示登陆页面
	 * @return
	 */
	@RequestMapping("/loginAdmin")
	public String loginAdmin(){
		//直接返回  前缀加 字符串+jsp的页面
		return "client/loginAdmin";
	}
	
	/**
	 * 验证用户名密码是否正确
	 * @param admin
	 * @return
	 */
	@RequestMapping("/login")
	public String login(@ModelAttribute Admin admin,HttpSession session){
		System.out.println(admin.getUsername());
		System.out.println(admin.getPassword());
		Admin a =adminServer.login(admin);
		System.out.println(a==null);
		
		//登陆成功
		//重定向不受前缀后缀干扰，直接跳转到指定url
		if(a!=null){
			session.setAttribute("admin", a);
			return "redirect:/admin/position.jsp";
		}
		//登陆失败
		//重定向不受前缀后缀干扰，直接跳转到指定url
		return "redirect:/client/loginAdmin.jsp";
		
	}

	public AdminServer getAdminServer() {
		return adminServer;
	}

	public void setAdminServer(AdminServer adminServer) {
		this.adminServer = adminServer;
	}
	
	
}
