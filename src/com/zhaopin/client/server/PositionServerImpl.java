package com.zhaopin.client.server;


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
public class PositionServerImpl extends BaseServerImpl<Position> implements PositionServer{
	
}
