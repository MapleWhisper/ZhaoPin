package com.zhaopin.admin.server;

import java.util.List;

import org.springframework.stereotype.Service;

import com.zhaopin.base.BaseServerImpl;
import com.zhaopin.po.Paper;

@Service
@SuppressWarnings("unchecked")
public class PaperServiceImpl extends BaseServerImpl<Paper> implements PaperService{
	
	
	@Override
	public List<Paper> findAll() {
		
		return (List<Paper>) getSession().createQuery("from Paper p order by p.createDate").list();
	}
}	
