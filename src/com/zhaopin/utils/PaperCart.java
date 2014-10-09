package com.zhaopin.utils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;

import org.springframework.stereotype.Component;

import com.zhaopin.po.Problem;

@Component
public class PaperCart {
	private List<Integer> singles;		//单选题的题号Id数组
	private List<Integer> multChoices;	//多选题的题号Id数组
	private List<Integer> judges;		//判断题的题号Id数组
	private List<Integer> questions;	//简答题的题号Id数组
	
	private Integer singleNumber;		//单选题数目
	private Integer MultChoiceNumber;	//多选题数目
	private Integer judgeNumber;		//判断题数目
	private Integer questionNumber;		//问答题数目
	
	public PaperCart() {
		singles = new ArrayList<Integer>();
		multChoices = new ArrayList<Integer>();
		judges = new ArrayList<Integer>();
		questions = new ArrayList<Integer>();
	}
	
	public List<Integer> getSingles() {
		return singles;
	}
	public void setSingles(List<Integer> singles) {
		this.singles = singles;
	}
	public List<Integer> getMultChoices() {
		return multChoices;
	}
	public void setMultChoices(List<Integer> multChoices) {
		this.multChoices = multChoices;
	}
	public List<Integer> getJudges() {
		return judges;
	}
	public void setJudges(List<Integer> judges) {
		this.judges = judges;
	}
	public List<Integer> getQuestions() {
		return questions;
	}
	public void setQuestions(List<Integer> questions) {
		this.questions = questions;
	}
	public Integer getsingleNumber() {
		return singleNumber;
	}
	public void setsingleNumber(Integer singleNumber) {
		this.singleNumber = singleNumber;
	}
	public Integer getMultChoiceNumber() {
		return MultChoiceNumber;
	}
	public void setMultChoiceNumber(Integer multChoiceNumber) {
		MultChoiceNumber = multChoiceNumber;
	}
	public Integer getJudgeNumber() {
		return judgeNumber;
	}
	public void setJudgeNumber(Integer judgeNumber) {
		this.judgeNumber = judgeNumber;
	}
	public Integer getQuestionNumber() {
		return questionNumber;
	}
	public void setQuestionNumber(Integer questionNumber) {
		this.questionNumber = questionNumber;
	}
	
	public void add(Problem problem){
		String type =  problem.getType();
		HashSet<Integer> set = new HashSet<Integer>();
		if(type.equals("单选题") ){
			singles.add(problem.getId());
			set.addAll(singles);
			singles = new ArrayList<Integer>(set);
			this.singleNumber = singles.size();
		}
		if(type.equals("多选题") ){
			multChoices.add(problem.getId());
			set.addAll(multChoices);
			multChoices = new ArrayList<Integer>(set);
			this.MultChoiceNumber = multChoices.size();
		}
		if(type.equals("判断题") ){
			judges.add(problem.getId());
			set.addAll(judges);
			judges = new ArrayList<Integer>(set);
			this.judgeNumber= judges.size();
		}
		if(type.equals("简答题") ){
			questions.add(problem.getId());
			set.addAll(questions);
			questions = new ArrayList<Integer>(set);
			this.questionNumber = questions.size();
		}
		
	}
	public void remove(Problem problem){
		String type =  problem.getType();
		if(type.equals("单选题") ){
			singles.remove(problem.getId());
			this.singleNumber = singles.size();
		}
		if(type.equals("多选题") ){
			multChoices.add(problem.getId());
			this.MultChoiceNumber = multChoices.size();
		}
		if(type.equals("判断题") ){
			singles.add(problem.getId());
			this.judgeNumber= judges.size();
		}
		if(type.equals("简答题") ){
			questions.add(problem.getId());
			this.questionNumber = questions.size();
		}
		
	}
	
}
