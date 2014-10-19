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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;

import org.springframework.stereotype.Component;

@Entity
@Component
public class User implements Serializable{
	private Integer id;				//id
	private String username;		//用户名
	private String password;		//密码
	private String name;			//姓名
	private String email;			//邮箱
	private String phoneNumber;		//手机号
	private Resume resume;			//简历
	private Set<Apply> applys;			//申请
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(unique=true)
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(unique=true)
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(insertable=true,unique=true,name="resume_id")
	public Resume getResume() {
		return resume;
	}
	public void setResume(Resume resume) {
		this.resume = resume;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	@OneToMany(cascade={CascadeType.ALL},mappedBy="user")
	@OrderBy("applyDate")
	public Set<Apply> getApplys() {
		return applys;
	}
	public void setApplys(Set<Apply> applys) {
		this.applys = applys;
	}
	
	
	
	
	
	
}
