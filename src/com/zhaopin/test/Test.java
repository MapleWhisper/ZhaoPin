package com.zhaopin.test;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;

import com.zhaopin.po.Admin;

@SuppressWarnings("deprecation")
public class Test {
	public static void main(String[] args) {
		Configuration config = new AnnotationConfiguration();
		config.configure();
		SessionFactory factory = config.buildSessionFactory();
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		
		Admin admin = new Admin();
		
		admin.setUsername("admin");
		admin.setName("武玉密");
		admin.setPassword("123");
		admin.setPosition("超级管理员");
		session.saveOrUpdate(admin);
		
		tx.commit();
	}
}
