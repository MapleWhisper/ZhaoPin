package com.zhaopin.po;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

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
public class Paper implements Serializable{
	private Integer id;				//试卷Id
	
	private String title;			//试卷标题
	private String label;			//试卷的标签，方便检索该试卷
	
	private Date createDate;		//试卷的生成日期
	
	private Integer[] singles;		//单选题的题号Id数组
	private Integer[] MultChoices;	//多选题的题号Id数组
	private Integer[] judges;		//判断题的题号Id数组
	private Integer[] questions;	//简答题的题号Id数组
	
	private Integer singleNUmber;		//单选题数目
	private Integer MultChoiceNumber;	//多选题数目
	private Integer judgeNumber;		//判断题数目
	private Integer questionNumber;		//问答题数目
	
	
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
	
	
	
}
