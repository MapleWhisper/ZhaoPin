package com.zhaopin.client.server;


import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Service;

import com.zhaopin.base.BaseServerImpl;
import com.zhaopin.po.Apply;

@Service
public class ApplyServiceImpl extends BaseServerImpl<Apply> implements ApplyService {
	/**
	 * 根据传入的状态返回 申请列表	 		
	 * @param state	传入的状态 待审核，待答题，待批阅，已完成，已拒绝	
	 * @return	
	 */
	@Override
	public List<Apply> findByState(String state) {
		@SuppressWarnings("unchecked")
		List<Apply> list= (List<Apply>) getSession().createQuery("from Apply a where state = ?").setParameter(0, state).list();
		return list;
	}
	
	@Override
	public void findCountByState() {
		Query query =  getSession().createQuery("select a.state ,count(*) from Apply a group by a.state");
		
		
	}
	
}
