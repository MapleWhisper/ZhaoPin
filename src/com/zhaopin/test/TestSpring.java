package com.zhaopin.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.zhaopin.filter.Admin;

public class TestSpring {
	
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		Admin admin = (Admin) ctx.getBean("admin");
		
	}
}
