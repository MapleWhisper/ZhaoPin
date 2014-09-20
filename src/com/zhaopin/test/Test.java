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
		Configuration config = new Configuration();
		config.configure();
		SessionFactory factory = config.buildSessionFactory();
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		
		
		Admin admin = (Admin) session.load(Admin.class, 1);
		System.out.println(admin.getUsername());
		
		tx.commit();
	}
}
