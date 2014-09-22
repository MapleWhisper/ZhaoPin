package com.zhaopin.po;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="resume")
@Table(name="resume1")
public class resume {
	 
	

	private Integer id;//逻辑主键
	private String name;//	姓名	
	private String sex;//性别
	private Date birthday;//出生日期
	private String paperType;//证件类型
	private String paperNumber;//证件号码
	private String marry;//婚姻状况
	private Integer workAge;//工作年限
	private String telphone;//电话
	private String email;//电子邮件
	private String livePlace;//居住地点
	private String schoolName;//现任学校名字
	private String schoolCalss;//在学校所教授课程
	private Integer engerWages;//期待工资待遇
	private String graduateSchool;//毕业学校
	private String educatinBackground;//毕业学历
	private String major;//专业名称
	private String workName;//曾工作单位名称
	private Integer workTime;//任职时间
	private String workDescribe;//职位描述
	private String reward;//所获奖励

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

	@Column(nullable=true)
	public Date getBirthday() {
		return birthday;
	}


	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	@Column(length=50,nullable=true)
	public String getPaperType() {
		return paperType;
	}


	public void setPaperType(String paperType) {
		this.paperType = paperType;
	}

	@Column(length=20,nullable=true)
	public String getPaperNumber() {
		return paperNumber;
	}


	public void setPaperNumber(String paperNumber) {
		this.paperNumber = paperNumber;
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

	@Column(length=20,nullable=true)
	public String getTelphone() {
		return telphone;
	}


	public void setTelphone(String telphone) {
		this.telphone = telphone;
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

	@Column(length=40,nullable=true)
	public String getSchoolCalss() {
		return schoolCalss;
	}


	public void setSchoolCalss(String schoolCalss) {
		this.schoolCalss = schoolCalss;
	}

	@Column(length=10,nullable=true)
	public Integer getWages() {
		return engerWages;
	}


	public void setWages(Integer engerWages) {
		this.engerWages = engerWages;
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

	@Column(length=1000,nullable=true)
	public String getWorkName() {
		return workName;
	}


	public void setWorkName(String workName) {
		this.workName = workName;
	}

	@Column(length=10,nullable=true)
	public Integer getWorkTime() {
		return workTime;
	}


	public void setWorkTime(Integer workTime) {
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
	
}
