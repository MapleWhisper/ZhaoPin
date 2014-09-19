package com.zhaopin.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

/**
 * 
 * 管理员类，对应于数据库中管理员表 
 * talble='admin'
 * 
 * @author 于广路
 *
 */
@Component
@Entity
public class Admin {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	
	//姓名
	@Column(length=20)
	private String name;
	
	//用户名长度不能超过20
	@Column(length=20,unique=true)
	private String username;
	
	//密码长度不能超过20
	@Column(length=20)
	private String password;
	
	//职位，长度不能超过30
	@Column(length=30)
	private String position;
	
	//管理员拥有的权限
	@Transient
	private Privilege privileges;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public Privilege getPrivileges() {
		return privileges;
	}
	public void setPrivileges(Privilege privileges) {
		this.privileges = privileges;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
