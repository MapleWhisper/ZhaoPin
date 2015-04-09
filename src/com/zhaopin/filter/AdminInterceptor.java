package com.zhaopin.filter;

import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.zhaopin.po.Admin;
import com.zhaopin.po.Privilege;

/**
 * 
 * 管理员拦截器，用户拦截管理员 访问权限
 * @author 广路
 *
 */
public class AdminInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		
		String contextPath=request.getContextPath();
        String  url=request.getServletPath().toString();
        HttpSession session = request.getSession();
        Admin admin = (Admin) session.getAttribute("admin");
        if(admin ==null){
        	response.sendRedirect(contextPath+"/client/loginAdmin");	//如果用户为空，跳转到
        }
        if(admin.getUsername().equals("admin")){	//如果用户为超级管理员
        	return true;
        }
        
        Set<Privilege> set = admin.getPrivileges();
        boolean flag = false;
        for(Privilege p :  set ){
        	if(url.indexOf(p.getUrl())!=-1 ){
        		flag= true;
        	}
        }
        if(!flag){
        	response.sendRedirect(contextPath+"/admin/position");
        }
		return flag;
	}
	
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		
	}
	
	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
}
