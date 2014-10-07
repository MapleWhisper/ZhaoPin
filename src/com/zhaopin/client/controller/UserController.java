package com.zhaopin.client.controller;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zhaopin.client.server.UserServer;
import com.zhaopin.po.User;
import com.zhaopin.utils.ZhaoPinUtils;

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
	public String loginUI(Model model,HttpServletRequest req,HttpSession session){
		model.addAttribute("error", "");
		//如果用户拥有cookie，那么就让用户可以登陆
		if(session.getAttribute("user")==null){
			
			Cookie cookies [] =  req.getCookies();
			User user = new User();
			if(cookies!=null){
				for(Cookie c : cookies){
					if(c.getName().equals("uValue")){
						user.setEmail(c.getValue());
					}
					if(c.getName().equals("pValue")){
						user.setPassword(c.getValue());
					}
				}
			}
			
			//如果用户Cookie中有账号信息，那么登陆
			if(user.getEmail()!=null && !"".equals(user.getEmail()) && user.getPassword()!=null &&!"".equals(user.getPassword())){
				System.out.println(user.getEmail());
				System.out.println(user.getPassword());
				User u = userServer.loginWhitMd5(user);
				if(u!=null){
					System.out.println("登陆成功");
					session.setAttribute("user", u);
					return "redirect:/client/index";
				}
			}
		}
		
		return "client/login";
	}
	
	/**
	 * 
	 * 显示注册页面
	 * @return
	 */
	@RequestMapping("/register")
	public String registerUI(Model model){
		model.addAttribute("error", "");
		
		
		return "client/register";
	}
	
	/**
	 * 
	 * 验证登陆
	 * @return
	 */
	@RequestMapping(value="/login/login",method=RequestMethod.POST)
	public String login(@ModelAttribute User user,HttpSession session,Model model,String remberPwd,HttpServletResponse response){
		User u =userServer.login(user);
		
		//登陆成功 
		if(u!=null){
			session.setAttribute("user", u);	//把用户信息添加到session中，跳转到主页面
			if(remberPwd!=null){
				//如果用户需要记住密码
				Cookie cookie = new Cookie("uValue", u.getEmail());
				cookie.setMaxAge(60*60*24*3);	//保存3天
				Cookie cookie2 = new Cookie("pValue", ZhaoPinUtils.MD5String(u.getPassword()));
				cookie2.setMaxAge(60*60*24*3);	//保存3天
				response.addCookie(cookie);
				response.addCookie(cookie2);
			}
			return "redirect:/client/index";
		}
		//登陆失败
		model.addAttribute("error", "用户名或密码错误");
		return "client/login";		//返回到登陆页面
		
	}
	
	/**
	 * 
	 * 注册用户 保存用户到数据库
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/register/save",method=RequestMethod.POST)
	public String save(@ModelAttribute User user,Model model,@RequestParam String valifCode,HttpSession session){
		//如果输入的验证码不正确
		if( !valifCode.equals(session.getAttribute("valifCode") ))  {
			model.addAttribute("error","验证码错误");
			return "client/register";
		}
		
		try {
			userServer.save(user);
			System.out.println(user.getName());
			return "redirect:/client/login";
		} catch (Exception e) {
			e.printStackTrace();
			//注册错误，可能是因为username冲突或其他问题
			model.addAttribute("error","注册失败，可能是用户名重复");
			return "client/register";	//返回注册页面
		}
		
	}
	
	/**
	 * 
	 * 用户退出登录
	 * @param session
	 * @return
	 */
	@RequestMapping("/login/logout")
	public String logout(HttpSession session,HttpServletResponse response){
		session.removeAttribute("user");
		
		//用户退出登录，清楚 cookie
		response.addCookie(new Cookie("uValue", null));
		response.addCookie(new Cookie("pValue", null));
		return "redirect:/client/index";
	}
	
	/**
	 * 
	 * 修改用户密码 页面
	 * @param 
	 * @return
	 */
	@RequestMapping("/resetPwdUI")
	public String resetPwdUI(HttpSession session){
		
		if(session.getAttribute("user")==null){
			return "redirect:/client/login";
		}
		
		return "client/resetPwd";
	}
	
	
}
