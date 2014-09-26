package com.zhaopin.po;


import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;
/**
 * 
 * @author 武玉密
 *
 */
@Entity
@Table
@Component
public class Resume implements Serializable{
	 
	

	private Integer id;//逻辑主键
	private String name;//	姓名	
	private String sex;//性别
	private Date birthday;//出生日期
	private String idType;//证件类型
	private String idNumber;//证件号码
	private String marry;//婚姻状况
	private Integer workAge;//工作年限
	private String phoneNumber;//电话
	private String email;//电子邮件
	private String livePlace;//居住地点
	private String schoolName;//现任学校名字
	private String teach;//在学校所教授课程
	private Integer exceptSalary;//期待工资待遇
	private String graduateSchool;//毕业学校
	private String educatinBackground;//毕业学历
	private String major;//专业名称
	private String company;//曾工作单位名称
	private String workTime;//任职时间
	private String workDescribe;//职位描述
	private String reward;//所获奖励
	private User user;

	
	@OneToOne(mappedBy="resume",fetch=FetchType.LAZY)
	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	@Id()
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Integer getId() {
		return id;
	}

	
	public void setId(Integer id) {
		this.id = id;
	}

	@Column(length=20,nullable=true)
	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}

	@Column(length=10,nullable=true)
	public String getSex() {
		return sex;
	}


	public void setSex(String sex) {
		this.sex = sex;
	}
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@Column(nullable=true)
	public Date getBirthday() {
		return birthday;
	}


	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	

	

	@Column(length=10,nullable=true)
	public String getMarry() {
		return marry;
	}


	public void setMarry(String marry) {
		this.marry = marry;
	}

	@Column(length=10,nullable=true)
	public Integer getWorkAge() {
		return workAge;
	}


	public void setWorkAge(Integer workAge) {
		this.workAge = workAge;
	}

	

	@Column(length=50,nullable=true)
	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}

	@Column(length=20,nullable=true)
	public String getLivePlace() {
		return livePlace;
	}


	public void setLivePlace(String livePlace) {
		this.livePlace = livePlace;
	}

	@Column(length=50,nullable=true)
	public String getSchoolName() {
		return schoolName;
	}


	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	

	
	@Column(length=1000,nullable=true)
	public String getGraduateSchool() {
		return graduateSchool;
	}


	public void setGraduateSchool(String graduateSchool) {
		this.graduateSchool = graduateSchool;
	}

	@Column(length=1000,nullable=true)
	public String getEducatinBg() {
		return educatinBackground;
	}


	public void setEducatinBg(String educatinBackground) {
		this.educatinBackground = educatinBackground;
	}

	@Column(length=1000,nullable=true)
	public String getMajor() {
		return major;
	}


	public void setMajor(String major) {
		this.major = major;
	}

	

	@Column(length=20,nullable=true)
	public String getWorkTime() {
		return workTime;
	}


	public void setWorkTime(String workTime) {
		this.workTime = workTime;
	}

	@Column(length=5000,nullable=true)
	public String getWorkDescribe() {
		return workDescribe;
	}


	public void setWorkDescribe(String workDescribe) {
		this.workDescribe = workDescribe;
	}
	@Column(length=5000,nullable=true)
	public String getReward() {
		return reward;
	}


	public void setReward(String reward) {
		this.reward = reward;
	}

	@Column(length=20,nullable=true)
	public String getIdType() {
		return idType;
	}


	public void setIdType(String idType) {
		this.idType = idType;
	}

	@Column(length=30,nullable=true)
	public String getIdNumber() {
		return idNumber;
	}


	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}

	@Column(length=20,nullable=true)
	public String getPhoneNumber() {
		return phoneNumber;
	}


	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	@Column(length=20,nullable=true)
	public String getTeach() {
		return teach;
	}


	public void setTeach(String teach) {
		this.teach = teach;
	}

	@Column(length=10,nullable=true)
	public Integer getExceptSalary() {
		return exceptSalary;
	}


	public void setExceptSalary(Integer exceptSalary) {
		this.exceptSalary = exceptSalary;
	}

	@Column(length=1000,nullable=true)
	public String getEducatinBackground() {
		return educatinBackground;
	}


	public void setEducatinBackground(String educatinBackground) {
		this.educatinBackground = educatinBackground;
	}

	@Column(length=1000,nullable=true)
	public String getCompany() {
		return company;
	}


	public void setCompany(String company) {
		this.company = company;
	}
	
	
	
}
