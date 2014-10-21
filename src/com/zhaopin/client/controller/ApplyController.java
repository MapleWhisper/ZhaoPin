package com.zhaopin.client.controller;



import java.util.Date;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhaopin.client.server.ApplyService;
import com.zhaopin.client.server.PositionServer;
import com.zhaopin.client.server.UserServer;
import com.zhaopin.po.Apply;
import com.zhaopin.po.Position;
import com.zhaopin.po.User;
import com.zhaopin.utils.ApplyState;

/**
 * 申请 相关操作
 * 
 * @author 于广路
 *
 */
@Controller
@RequestMapping("/client")
public class ApplyController {
	@Resource(name="positionServerImpl")
	private PositionServer positionServer;
	
	@Resource(name="userServerImpl")
	private UserServer userServer;
	
	@Resource(name="applyServiceImpl")
	private ApplyService applyService;
	/**
	 * 用户 申请 岗位
	 * 
	 * @param positionId 传入岗位Id
	 * @return
	 */
	@RequestMapping("/apply/{positionId}")
	public String apply(@PathVariable int positionId,HttpSession session,Model model){
		Position position = positionServer.getById(positionId);
		if(position==null){			//如果岗位为空，跳转到主页面
			return "redirect:/client/index";
		}
		User user = (User) session.getAttribute("user");
		
		if(user==null || position==null){
			return "redirect:/client/login";	//用户为空，返回登录页面
		}
		if(user.getResume()==null){
			return "redirect:/client/resume";			//如果用户简历为空，跳到简历页面
		}
		User u = userServer.getById(user.getId());
		String meg = "";
		if(u!=null){		//如果用户不为空
			@SuppressWarnings("unchecked")
			Set<Apply> list =  u.getApplys();
			if(list.size()>=3){
				model.addAttribute("meg", "每个用户最多可以申请3个岗位哦o(╯□╰)o，感谢您的支持~");
				return "error";
			}
			for(Apply s : list){
				if(s.getPosition().getId() == positionId ){
					model.addAttribute("meg", "这个岗位您已经申请过了哦o(╯□╰)o，感谢您的支持~");
					return "error";
				}
			}
			position.setApplyNumber(position.getApplyNumber()==null?1:position.getApplyNumber()+1);		//申请次数加一
			Apply apply = new Apply();
			apply.setUser(u);
			apply.setState(ApplyState.待审核.toString());
			apply.setApplyDate(new Date());
			apply.setPosition(position);
			applyService.save(apply);
			//MailSender.sendToCheck("1170192782@qq.com",apply);
		}
		
		return "redirect:/client/personalCenter";
	}
}
