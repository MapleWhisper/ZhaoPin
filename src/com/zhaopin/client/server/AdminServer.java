package com.zhaopin.client.server;

import org.springframework.transaction.annotation.Transactional;

import com.zhaopin.base.BaseServer;
import com.zhaopin.po.Admin;

/**
 * 
 * 管理员登陆实现接口
 * @author 广路
 *
 */
@Transactional
public interface AdminServer extends BaseServer<Admin> {
	/**
	 * 判断用户用户名密码是否正确
	 * 
	 * @param admin 传入的需要验证的管理员
	 * 
	 * @return 登陆得到的对象，可以判断是否为空来确认用户名和密码是否正确
	 */
	public Admin login(Admin admin);
}
