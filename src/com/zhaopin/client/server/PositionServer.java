package com.zhaopin.client.server;

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
	
}
