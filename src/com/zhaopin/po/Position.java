package com.zhaopin.po;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;
	
@Component
@Entity
public class Position {
	private Integer id;		//岗位id
	private String name;	//岗位名称
	
	private String workPlace;		//工作地点
	private String position;		//职位	教师，管理
	private String type;			//类型  全职，专职，兼职，实习
	private String company;			//公司
	private String salary;			//薪水
	
	private Date createdate;		//创建日期
	private Date endDate;			//截止日期
	private String workExper;		//工作经验
	private Integer recruitNumber;	 //招聘人数
	private String educationNeed;	//学历需求     专科 本科 硕士 博士
	private String languageNeed;	//语言要求    中文 英语
	private String positionInfo;    //岗位要求
	private Integer scanNumber;		//浏览人数
	private Integer applyNumber;	//申请人数
	private Integer successNumber;	//成功人数
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getWorkPlace() {
		return workPlace;
	}
	public void setWorkPlace(String workPlace) {
		this.workPlace = workPlace;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getType() {
		return type;
	}
	
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getWorkExper() {
		return workExper;
	}
	public void setWorkExper(String workExper) {
		this.workExper = workExper;
	}
	public Integer getRecruitNumber() {
		return recruitNumber;
	}
	public void setRecruitNumber(Integer recruitNumber) {
		this.recruitNumber = recruitNumber;
	}
	public String getEducationNeed() {
		return educationNeed;
	}
	public void setEducationNeed(String educationNeed) {
		this.educationNeed = educationNeed;
	}
	public String getLanguageNeed() {
		return languageNeed;
	}
	public void setLanguageNeed(String languageNeed) {
		this.languageNeed = languageNeed;
	}
	public String getPositionInfo() {
		return positionInfo;
	}
	public void setPositionInfo(String positionInfo) {
		this.positionInfo = positionInfo;
	}
	public Integer getScanNumber() {
		return scanNumber;
	}
	public void setScanNumber(Integer scanNumber) {
		this.scanNumber = scanNumber;
	}
	public Integer getApplyNumber() {
		return applyNumber;
	}
	public void setApplyNumber(Integer applyNumber) {
		this.applyNumber = applyNumber;
	}
	public Integer getSuccessNumber() {
		return successNumber;
	}
	public void setSuccessNumber(Integer successNumber) {
		this.successNumber = successNumber;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	
	
	
}
