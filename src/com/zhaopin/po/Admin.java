package com.zhaopin.po;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
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
public class Admin implements Serializable{
	
	private Integer id;
	private String name;					//姓名
	private String username;				//用户名	长度不能超过20
	private String password;				//密码	长度不能超过20
	private String position;				//职位	长度不能超过30
	private Set<Privilege> privileges;		//管理员拥有的权限
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(length=20,unique=true)
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Column(length=20)
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
		@Column(length=30)
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	
	
	
	
	@Column(length=20)
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	@ManyToMany(cascade={CascadeType.PERSIST,CascadeType.MERGE})
	@JoinTable(
			name="admin_privilege",
			joinColumns=@JoinColumn(name="admin_id"),
			inverseJoinColumns=@JoinColumn(name="privilege_id")
	)
	public Set<Privilege> getPrivileges() {
		return privileges;
	}
	public void setPrivileges(Set<Privilege> privileges) {
		this.privileges = privileges;
	}
	
}
