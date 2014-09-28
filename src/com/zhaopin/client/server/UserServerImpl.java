package com.zhaopin.client.server;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhaopin.base.BaseServerImpl;
import com.zhaopin.po.User;

/**
 * 管理员登陆服务实现类
 * 
 * @author 于广路
 *
 */
@Service("userServerImpl")
@Transactional
public class UserServerImpl extends BaseServerImpl<User> implements UserServer{
	/**
	 * 判断用户用户名密码是否正确
	 * 
	 * @return true:正确
	 * 		   false:不正确	
	 */
	@Override
	public User login(User user) {
		User u = (User) getSessionFactory().openSession().createQuery("from User a where a.email = ? and a.password= ? ")
			.setParameter(0, user.getEmail()).setParameter(1, user.getPassword()).uniqueResult();
		return u;
	}
}
