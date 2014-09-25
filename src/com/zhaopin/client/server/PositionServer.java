package com.zhaopin.client.server;

import java.util.HashMap;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.zhaopin.base.BaseServer;
import com.zhaopin.po.Position;

/**
 * 
 * 职位接口
 * @author 广路
 *
 */
@Transactional
public interface PositionServer extends BaseServer<Position> {

	public List<Position> getByKey(HashMap<String,String> map);
	public List<Position>getPositionName();
}
