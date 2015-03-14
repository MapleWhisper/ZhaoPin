
package com.zhaopin.admin.controller;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhaopin.admin.server.PrivilegeService;
import com.zhaopin.client.server.AdminServer;
import com.zhaopin.po.Admin;
import com.zhaopin.po.Privilege;

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
	
	@Resource(name="privilegeServiceImpl")
	private PrivilegeService privilegeService;
	
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
	 * 增加管理员页面
	 * @return
	 */
	@RequestMapping("/admin/add")
	public String addAdmin(Model model){
		model.addAttribute("privilegeList", privilegeService.findAll());		
		return "admin/addAdmin";	//转到添加页面
	}
	
	/**
	 * 保存管理员
	 * @return
	 */
	@RequestMapping("/admin/save")
	public String save(@ModelAttribute Admin admin){
		Integer[] a = admin.getPrivilegeIds();
		HashSet<Privilege> set = new HashSet<>();
		for(int i:a){
			set.add(privilegeService.getById(i));
		}
		admin.setPrivileges(set);
		adminServer.save(admin);
		return "redirect:/admin/admin";	//保存完成后  跳转到管理员列表页面
	}
	
	/**
	 * 修改管理员页面
	 * @return
	 */
	@RequestMapping("/admin/edit/id/{id}")
	public String editAdmin(@PathVariable int id,Model model){
		
		Admin admin = adminServer.getById(id);
		Set<Privilege> privileges =  admin.getPrivileges();
		Integer [] ids = new Integer[privileges.size()+1];
		if(privileges!=null){
			
			Arrays.fill(ids, 0);
			int index = 0 ;
			for(Privilege p : privileges){
				ids[index++]=p.getId();
			}
		}
		admin.setPrivilegeIds(ids);
		model.addAttribute("privilegeList", privilegeService.findAll());	
		model.addAttribute("admin",admin);
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
		Integer[] ids = admin.getPrivilegeIds();
		HashSet<Privilege> set = new HashSet<>();
		for(int i:ids){
			set.add(privilegeService.getById(i));
		}
		a.setUsername(admin.getUsername());
		a.setName(admin.getName());
		a.setPosition(admin.getPosition());
		a.setPrivileges(set);
		adminServer.updata(a);
		return "redirect:/admin/admin";	//跳到管理员列表页面
	}
	
	/**
	 * 删除管理员
	 * @param id 需要删除的管理员id
	 * @return	返回到管理员列表页面
	 */
	@RequestMapping("admin/delete/id/{id}")
	public String delete(@PathVariable int id){
		
		adminServer.delete(id);
		
		return "redirect:/admin/admin";	//跳到管理员列表页面
	}
	
	
	
	
	

	public AdminServer getAdminServer() {
		return adminServer;
	}

	public void setAdminServer(AdminServer adminServer) {
		this.adminServer = adminServer;
	}
	
	
}
