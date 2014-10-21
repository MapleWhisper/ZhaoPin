package com.zhaopin.utils;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

import com.zhaopin.po.Apply;

public class MailSender {
	private static JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
	private static JavaMailSenderImpl mailSender2 = new JavaMailSenderImpl();
	static{
		 Properties prop  =   new  Properties() ;
		 prop.put( " mail.smtp.auth " ,  " true " ) ;  //  将这个参数设为true，让服务器进行认证,认证用户名和密码是否正确 
		 prop.put( " mail.smtp.timeout " ,  " 25000 " ) ;
		 
		 mailSender.setJavaMailProperties(prop);
		 mailSender.setHost("smtp.163.com");  
		 mailSender.setUsername("boyieduzhaopin@163.com");
		 mailSender.setPassword("013579"); 
		 mailSender.setDefaultEncoding("utf-8");

		 mailSender2.setJavaMailProperties(prop);
		 mailSender2.setHost("smtp.163.com");  
		 mailSender2.setUsername("boyieduzhaopin2@163.com");
		 mailSender2.setPassword("013579"); 
		 mailSender2.setDefaultEncoding("utf-8");
	}
	
	public static void main(String[] args) throws MessagingException {
		
		/*
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		
		helper.setTo("827605162@qq.com");
		helper.setFrom("boyieduzhaopin@163.com");
		helper.setSubject("测试邮件");
		
		helper.setText("<html><h2>这是测试邮件内容<h2><html>",true);
		
		mailSender.send(message);
		System.out.println("邮件发送成功");
		*/
		
	}
	
	/**
	 * 发送邮件
	 * 
	 * @param from	发送人的名称
	 * @param to	发送到的邮箱地址
	 * @param subject	邮件标题
	 * @param htmlText	邮件内容
	 * @throws  
	 */
	public static void send(String to ,String subject , String htmlText){
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		
		try {
			
			helper.setTo(to);
			helper.setFrom(new InternetAddress(MimeUtility.encodeText("博弈教育")+"<boyieduzhaopin@163.com>"));
			helper.setSubject(subject);
			helper.setText(htmlText,true);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		mailSender.send(message);
		System.out.println("邮件发送成功");
	}
	
	/**
	 * 发送待审核
	 * @param to	需要发送的人的邮箱(管理员邮箱)
	 * @throws EncodingException 
	 */
	public static void sendAdminToAccept(String to ,Apply apply) {
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		try {
			
			//邮件信息
			helper.setTo(to);
			helper.setSubject("【待审核】你好，管理员！您有一个新的招聘待审核通知");
			helper.setFrom(new InternetAddress(MimeUtility.encodeText("博弈教育招聘")+"<boyieduzhaopin@163.com>"));
			
			//邮件内容
			StringBuilder builder = new StringBuilder();
			builder.append("<html><head></head><body>")
			.append("<h1>有新的用户发送了岗位申请</h1>")
			.append("<h2>请立即登录  招聘系统  处理审核通知</h2><br>")
			.append("<h3>申请人: "+apply.getUser().getName())
			.append("<br>申请人邮箱: "+apply.getUser().getEmail())
			.append("<br>申请人电话: "+apply.getUser().getPhoneNumber())
			.append("<br>申请岗位: "+apply.getPosition().getName())
			.append("<br>申请时间: "+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(apply.getApplyDate()))
			.append("</h3></body></html>");
			helper.setText(builder.toString(),true);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		//发送邮件
		mailSender.send(message);
		System.out.println("邮件发送成功");
	}
	
	/**
	 * 发送给用户答题
	 * @param to	需要发送的人的邮箱(管理员邮箱)
	 * @throws EncodingException 
	 */
	public static void sendUserToAnswer(String to ,Apply apply) {
		MimeMessage message = mailSender2.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		try {
			
			//邮件信息
			helper.setTo(to);
			helper.setSubject("【待答题】你好，"+apply.getUser().getName()+"！您申请的岗位已审核通过,请及时进入个人中心完成答题");
			helper.setFrom(new InternetAddress(MimeUtility.encodeText("博弈教育招聘")+"<boyieduzhaopin2@163.com>"));
			
			//邮件内容
			StringBuilder builder = new StringBuilder();
			builder.append("<html><head></head><body>")
			.append("<h1>您申请的岗位已审核通过, 请及时进入 个人中心完成答题</h1><br>")
			.append("<h3>岗位信息:"+apply.getPosition().getName())
			.append("<br>申请时间:"+apply.getApplyDate())
			.append("<br></h3></body></html>");
			helper.setText(builder.toString(),true);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		//发送邮件
		mailSender2.send(message);
		System.out.println("邮件发送成功");
	}
	
	/**
	 * 发送给管理员 批阅试卷
	 * @param to	需要发送的人的邮箱(管理员邮箱)
	 * @throws EncodingException 
	 */
	public static void sendAdminToCheck(String to ,Apply apply) {
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		try {
			
			//邮件信息
			helper.setTo(to);
			helper.setSubject("【待批阅】你好，管理员！有新的用户已完成答题，请进入个人中心页面 批阅");
			helper.setFrom(new InternetAddress(MimeUtility.encodeText("博弈教育招聘")+"<boyieduzhaopin@163.com>"));
			
			//邮件内容
			StringBuilder builder = new StringBuilder();
			builder.append("<html><head></head><body>")
			.append("<h2>请立即登录  招聘系统 处理 试卷 批阅</h2><br>")
			.append("<h3>申请人: "+apply.getUser().getName())
			.append("<br>申请人邮箱: "+apply.getUser().getEmail())
			.append("<br>申请人电话: "+apply.getUser().getPhoneNumber())
			.append("<br>申请岗位: "+apply.getPosition().getName())
			.append("<br>申请时间: "+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(apply.getApplyDate()))
			.append("</h3></body></html>");
			helper.setText(builder.toString(),true);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		//发送邮件
		mailSender.send(message);
		System.out.println("邮件发送成功");
	}
	
	/**
	 * 发送给用户申请成功
	 * @param to	需要发送的人的邮箱(管理员邮箱)
	 * @throws EncodingException 
	 */
	public static void sendUserToSuccess(String to ,Apply apply) {
		MimeMessage message = mailSender2.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		try {
			
			//邮件信息
			helper.setTo(to);
			helper.setSubject("【恭喜】你好，"+apply.getUser().getName()+"！您提交的申请已接受");
			helper.setFrom(new InternetAddress(MimeUtility.encodeText("博弈教育招聘")+"<boyieduzhaopin2@163.com>"));
			
			//邮件内容
			StringBuilder builder = new StringBuilder();
			builder.append("<html><head></head><body>")
			.append("<h1>【恭喜】您提交的申请已接受！</h1><br>")
			.append("<h3>岗位信息:"+apply.getPosition().getName())
			.append("<br>申请时间:"+apply.getApplyDate())
			.append("<br></h3></body></html>");
			helper.setText(builder.toString(),true);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		//发送邮件
		mailSender2.send(message);
		System.out.println("邮件发送成功");
	}
}
