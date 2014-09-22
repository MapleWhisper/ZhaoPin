package com.zhaopin.admin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhaopin.client.server.AdminServer;
import com.zhaopin.po.Admin;

/**
 * 后台的管理员账号管理，可以查看列表，添加管理员，初始化密码，删除管理员，修改管理员信息
 * 
 * @author 于广路
 *
 */
@Controller("adminControl")
@RequestMapping("/admin")
public class AdminController {
	
	
	@Resource(name="adminServerImpl")
	private AdminServer adminServer;	//注入admin服务	adminServerImpl
	
	/**
	 * 显示管理员列表页面
	 * @return
	 */
	@RequestMapping("/admin")
	public String loginAdmin(Model model){
		
		List<Admin> adminList = adminServer.findAll();	//查询管理员列表
		model.addAttribute("adminList", adminList);
		return "admin/admin";				//直接返回  前缀加 字符串+jsp的页面
	}
	
	/**
	 * 显示 管理员增加页面
	 * @return
	 */
	@RequestMapping("/admin/add")
	public String addAdmin(Model model){
		model.addAttribute("action", "save");
		
		return "admin/addAdmin";	//转到添加页面
	}
	
	/**
	 * 保存管理员
	 * @return
	 */
	@RequestMapping("/admin/save")
	public String save(@ModelAttribute Admin admin){
		adminServer.save(admin);
		return "redirect:/admin/admin";	//保存完成后返回列表页面
	}
	
	/**
	 * 修改管理员页面
	 * @return
	 */
	@RequestMapping("/admin/edit/id/{id}")
	public String editAdmin(@PathVariable int id,Model model){
		model.addAttribute("admin",adminServer.getById(id));
		model.addAttribute("action", "update");
		model.addAttribute("id", id);
		
		return "admin/editAdmin";	//转到修改页面
	}
	
	/**
	 * 修改管理员
	 * @return
	 */
	@RequestMapping("/admin/update")
	public String update(Admin admin){
		//修改流程	先根据id 从数据库中获取到数据，然后插入要修改的数据，再保存进数据库
		Admin a = adminServer.getById(admin.getId());
		a.setUsername(admin.getUsername());
		a.setName(admin.getName());
		a.setPosition(admin.getPosition());
		adminServer.updata(a);
		return "redirect:/admin/admin";	//跳到管理员列表页面
	}
	
	/**
	 * 
	 * 初始化管理员密码
	 * @param id
	 * @return
	 */
	@RequestMapping("/admin/initPassword/id/{id}")
	public String initPassword(@PathVariable int id){
		Admin a = adminServer.getById(id);
		a.setPassword("1234");
		adminServer.updata(a);
		return "redirect:/admin/position";
	}
	
	/**
	 *  退出管理员登陆
	 * @param session
	 * @return
	 */
	@RequestMapping("/admin/logout")
	public String logout(HttpSession session){
		
		session.removeAttribute("admin");	//将管理员信息从session中移除
		
		return "redirect:/client/loginAdmin";
	}
	
	

	public AdminServer getAdminServer() {
		return adminServer;
	}

	public void setAdminServer(AdminServer adminServer) {
		this.adminServer = adminServer;
	}
	
	
}
