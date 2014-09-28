package com.zhaopin.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements  Filter{
	private List<String> list;
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		list = new ArrayList<>();
		list.add("/personalCenter");
		list.add("/resume");
		list.add("/apply");
		list.add("/paper");
		
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req =  (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		String path = req.getRequestURI();	//得到请求Url
		HttpSession session = req.getSession();
		if(session.getAttribute("admin")!=null){	//如果管理员登陆，继续
				chain.doFilter(request, response);
				return;
		}else{	//管理员没有登陆
			if(path.indexOf("/admin")!=-1){		//用户访问管理员
				resp.sendRedirect("/ZhaoPin/client/loginAdmin");
				return ;
			}else{
				if(session.getAttribute("user")!=null){	//如果用户已经登陆
					chain.doFilter(request, response);
					return;
				}else{		//如果用户没有登陆
					
					for(String s:list){
						if(path.indexOf(s)!=-1){	//如果用户访问了 需要登陆的地址
							resp.sendRedirect("/ZhaoPin/client/login");
							return ;
						}
					}
					chain.doFilter(request, response);
					
				}
			}
			
		}
		
		
	}
	@Override
	public void destroy() {
		
	}
}
