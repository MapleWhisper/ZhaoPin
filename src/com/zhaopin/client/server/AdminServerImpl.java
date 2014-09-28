package com.zhaopin.client.server;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhaopin.base.BaseServerImpl;
import com.zhaopin.filter.Admin;

/**
 * 管理员登陆服务实现类
 * 
 * @author 于广路
 *
 */
@Service("adminServerImpl")
@Transactional
public class AdminServerImpl extends BaseServerImpl<Admin> implements AdminServer{
	/**
	 * 判断用户用户名密码是否正确
	 * 
	 * @return true:正确
	 * 		   false:不正确	
	 */
	@Override
	public Admin login(Admin admin) {
		Admin a = (Admin) getSessionFactory().openSession().createQuery("from Admin a where a.username = ? and a.password= ? ")
			.setParameter(0, admin.getUsername()).setParameter(1, admin.getPassword()).uniqueResult();
		return a;
	}
}
