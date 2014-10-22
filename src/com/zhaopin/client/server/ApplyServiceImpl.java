package com.zhaopin.client.server;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

import com.zhaopin.base.BaseServerImpl;
import com.zhaopin.po.Apply;

@Service
@SuppressWarnings("unchecked")
public class ApplyServiceImpl extends BaseServerImpl<Apply> implements
		ApplyService {
	/**
	 * 根据传入的状态返回 申请列表 默认查询一个月以为的信息
	 * 
	 * @param state
	 *            传入的状态 待审核，待答题，待批阅，已完成，已拒绝
	 * @return
	 */
	@Override
	public List<Apply> findByState(String state) {
		return this.findByState(state, 1);
	}

	@Override
	public List<Apply> findByState(String state, int month) {
		List<Apply> list = null;
		Session session = getSession();
		if (state.equals("已完成") || state.equals("已拒绝")) {
			if (month == 1) { // 如果为一个月，默认返回20条记录
				list = (List<Apply>) session
						.createQuery(
								"from Apply a where a.state = ?  order by id desc")
						.setParameter(0, state).setMaxResults(20).list();
			} else if (month <= 12) { // 如果为一年以内的申请
				Calendar calendar = Calendar.getInstance();
				calendar.add(Calendar.MONTH, -month);
				list = (List<Apply>) session
						.createQuery(
								"from Apply a where a.state = ? and a.applyDate >?  order by id desc")
						.setParameter(0, state).setCalendar(1, calendar).list();
			} else { // 一年前的申请
				Calendar calendar = Calendar.getInstance();
				calendar.add(Calendar.YEAR, -1);
				list = (List<Apply>) session
						.createQuery(
								"from Apply a where a.state = ? and a.applyDate <?  order by id desc")
						.setParameter(0, state).setCalendar(1, calendar).list();
			}
		} else {
			list = (List<Apply>) session
					.createQuery(
							"from Apply a where a.state = ? order by id desc")
					.setParameter(0, state).list();
		}

		return list;
	}

	@Override
	public HashMap<String, String> findCountByState() {

		Query query = getSession().createQuery(
				"select a.state ,count(*) from Apply a group by a.state");
		List<Object[]> list = query.list();
		HashMap<String, String> map = new HashMap<>();
		for (Object[] o : list) {
			map.put(o[0].toString(), o[1].toString());
		}
		return map;
	}

}
