package com.zhaopin.client.server;

import java.util.List;

import com.zhaopin.base.BaseServer;
import com.zhaopin.po.Apply;

public interface ApplyService extends BaseServer<Apply>{
	
	
	/**
	 * 根据传入的状态返回 申请列表		
	 * @param state	传入的状态 	待审核，待答题，待批阅，已完成，已拒绝
	 * @return	
	 */
	public List<Apply> findByState(String state);
	
	/**
	 * 返回每个状态的数目
	 */
	public void findCountByState();

}
