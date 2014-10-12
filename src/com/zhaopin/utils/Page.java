package com.zhaopin.utils;

/**
 * 分页工具
 * @author 广路
 *
 */
public class Page {
	private int sum;		//一共多少页
	private int cur;		//当前第几页
	private int amount;		//每页显示多少
	
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public int getCur() {
		return cur;
	}
	public void setCur(int cur) {
		this.cur = cur;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	
}
