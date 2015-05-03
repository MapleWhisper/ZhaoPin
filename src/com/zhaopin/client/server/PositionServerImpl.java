package com.zhaopin.client.server;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhaopin.base.BaseServerImpl;
import com.zhaopin.po.Position;

/**
 * 管理员登陆服务实现类
 * 
 * @author 于广路
 * 
 */
@Service()
@Transactional
@SuppressWarnings("unchecked")
public class PositionServerImpl extends BaseServerImpl<Position> implements
		PositionServer {
	/**
	 * 根据查询条件返回对象列表
	 */
	@Override
	public List<Position> getByKey(HashMap<String, String> map) {
		String hql = "from Position p where p.endDate > ? ";
		for (String key : map.keySet()) { // 生成 hql 查询条件字符串
			if (map.get(key) != null && !map.get(key).equals("")
					&& !map.get(key).equals("不限")) {

				hql += "  and p." + key + " = '" + map.get(key) + "' ";
			}
		}
		System.out.println("hql语句:" + hql);

		List<Position> list = (List<Position>) getSession().createQuery(hql)
				.setDate(0, new Date()).list();
		for (Position p : list) {
			p.setPositionInfo(null);
			p.setApplys(null);
		}
		return list;
	}

	/**
	 * 根据时间倒叙 取得最近发布的5个职位
	 */
	@Override
	public List<Position> getPositionName() {
		String hql = "from Position  p where p.endDate > ? order by p.createdate desc";
		Query query = this.getSession().createQuery(hql).setDate(0, new Date());
		query.setFirstResult(0);
		query.setMaxResults(5);
		return (List<Position>) query.list();
	}

	/**
	 * 查询所有未到截止日期的岗位
	 */
	@Override
	public List<Position> getByEndDate() {
		String hql = "from Position p where p.endDate > ?";

		return getSession().createQuery(hql).setDate(0, new Date()).list();
	}
}
