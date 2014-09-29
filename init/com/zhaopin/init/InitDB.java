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
		Privilege p5 = new Privilege();
		
		p1.setName("管理员列表");
		p1.setUrl("/admin/admin");
		
		p2.setName("岗位列表");
		p2.setUrl("/admin/position");
		
		p3.setName("试卷列表");
		p3.setUrl("/admin/paper");
		
		p4.setName("试题列表");
		p4.setUrl("/admin/problem");
		
		p5.setName("申请审核");
		p5.setUrl("/admin/apply");
		

		session.save(p1);
		session.save(p2);
		session.save(p3);
		session.save(p4);
		session.save(p5);
		session.getTransaction().commit();
	}
}
