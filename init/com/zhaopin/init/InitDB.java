package com.zhaopin.init;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.zhaopin.po.Privilege;

public class InitDB {
	
	private static ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
	private static SessionFactory factory = (SessionFactory) ctx.getBean("sessionFactory");
	public static void main(String[] args) {
		new InitDB().initPrivileges();
	}
	
	//初始化权限
	public void initPrivileges(){
		Session session = factory.openSession();
		session.beginTransaction();
		Privilege p1 = new Privilege();
		Privilege p2 = new Privilege();
		Privilege p3 = new Privilege();
		Privilege p4 = new Privilege();
		
		//session.
	}
}
