package com.zhaopin.client.server;

import java.util.HashMap;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.zhaopin.base.BaseServer;
import com.zhaopin.po.Position;

/**
 * 
 * 职位接口
 * 
 * @author 广路
 * 
 */
@Transactional
public interface PositionServer extends BaseServer<Position> {

	public List<Position> getByEndDate();

	/**
	 * 根据查询条件返回对象列表
	 */
	public List<Position> getByKey(HashMap<String, String> map);

	/**
	 * 得到position列表 时间倒序排序
	 * 
	 * @return
	 */
	public List<Position> getPositionName();
}
