package com.zhaopin.po;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.zhaopin.admin.server.ProblemService;

/**
 * 试卷 实体类
 * 
 * @author 
 *
 */
@Component
@Entity
public class Paper implements Serializable{
	private Integer id;				//试卷Id
	
	private String title;			//试卷标题
	private String label;			//试卷的标签，方便检索该试卷
	
	private Date createDate;		//试卷的生成日期
	private String auther;			//试卷生成人
	
	private Integer []singles;		//单选题的题号Id数组
	private Integer []MultChoices;	//多选题的题号Id数组
	private Integer []judges;		//判断题的题号Id数组
	private Integer []questions;	//简答题的题号Id数组
	
	private Integer singleNumber;		//单选题数目
	private Integer MultChoiceNumber;	//多选题数目
	private Integer judgeNumber;		//判断题数目
	private Integer questionNumber;		//问答题数目
	
	private List<Problem> singleList ;
	private List<Problem> multChoiceList ;
	private List<Problem> judegeList ;
	private List<Problem> questionList ;
	
	/*
	 * 数据库不能存储数组格式，所以把 题目数组对应Id序列化为 字符串形式保存进数据库，
	 * 然后反序列化得到数组
	 * //把数组 转化成Json字符串
		String single = JSON.toJSONString(singles);
		//把字符串 转化成Integer 数组
		Integer singles[]= (Integer[]) JSON.parse("single");
		
		//可通过该方法 根据Paper中的Integer 数组 从数据库中取得 试题的列表，然后将试题的列表在前台 paper.jsp显示
	 * problemService.getByIds(Integer ids[])
	 */
	private String single;				//需要被保存进数据库的单选题 Id的 Json字符串
	private String multChoice;			//需要被保存进数据库的多选题 Id的 Json字符串
	private String judege;				//需要被保存进数据库的判断题 Id的 Json字符串
	private String question;			//需要被保存进数据库的简答题 Id的 Json字符串
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	
	@Transient
	public Integer[] getSingles() {
		return singles;
	}
	public void setSingles(Integer[] singles) {
		this.singles = singles;
	}
	@Transient
	public Integer[] getMultChoices() {
		return MultChoices;
	}
	public void setMultChoices(Integer[] multChoices) {
		MultChoices = multChoices;
	}
	@Transient
	public Integer[] getJudges() {
		return judges;
	}
	public void setJudges(Integer[] judges) {
		this.judges = judges;
	}
	@Transient
	public Integer[] getQuestions() {
		return questions;
	}
	public void setQuestions(Integer[] questions) {
		this.questions = questions;
	}
	
	
	@Transient
	public List<Problem> getSingleList() {
		return singleList;
	}
	public void setSingleList(List<Problem> singleList) {
		this.singleList = singleList;
	}
	
	@Transient
	public List<Problem> getMultChoiceList() {
		return multChoiceList;
	}
	public void setMultChoiceList(List<Problem> multChoiceList) {
		this.multChoiceList = multChoiceList;
	}
	
	@Transient
	public List<Problem> getJudegeList() {
		return judegeList;
	}
	public void setJudegeList(List<Problem> judegeList) {
		this.judegeList = judegeList;
	}
	
	@Transient
	public List<Problem> getQuestionList() {
		return questionList;
	}
	public void setQuestionList(List<Problem> questionList) {
		this.questionList = questionList;
	}
	
	public Integer getSingleNumber() {
		return singleNumber==null?0:singleNumber;
	}
	public void setSingleNumber(Integer singleNumber) {
		this.singleNumber = singleNumber;
	}
	
	public Integer getMultChoiceNumber() {
		return MultChoiceNumber==null?0:MultChoiceNumber;
	}
	public void setMultChoiceNumber(Integer multChoiceNumber) {
		MultChoiceNumber = multChoiceNumber;
	}
	public Integer getJudgeNumber() {
		return judgeNumber==null?0:judgeNumber;
	}
	public void setJudgeNumber(Integer judgeNumber) {
		this.judgeNumber = judgeNumber;
	}
	public Integer getQuestionNumber() {
		return questionNumber==null?0:questionNumber;
	}
	public void setQuestionNumber(Integer questionNumber) {
		this.questionNumber = questionNumber;
	}
	
	
	public String getSingle() {
		return single;
	}
	public void setSingle(String single) {
		this.single = single;
	}
	public String getMultChoice() {
		return multChoice;
	}
	public void setMultChoice(String multChoice) {
		this.multChoice = multChoice;
	}
	public String getJudege() {
		return judege;
	}
	public void setJudege(String judege) {
		this.judege = judege;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	
	public String getAuther() {
		return auther;
	}
	public void setAuther(String auther) {
		this.auther = auther;
	}
	
	public Integer[] toArray(List<Integer> list){
		Integer []i = new Integer[list.size()];
		int index = 0 ;
		for(Integer tem : list){
			i[index++] = tem;
		}
		return i;
		
	}
}
