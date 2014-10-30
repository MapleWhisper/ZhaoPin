package com.zhaopin.client.server;

import java.util.List;

import org.springframework.stereotype.Service;

import com.zhaopin.base.BaseServerImpl;
import com.zhaopin.po.Article;

@Service
@SuppressWarnings("unchecked")
public class ArticleSerivceImpl extends BaseServerImpl<Article> implements ArticleService{
	
	@Override
	public List<Article> findCompanyAll() {
		String hql = " from Article a where a.type=1";
		
		List<Article> list = (List<Article>) getSession().createQuery(hql).list();
		return list;
	}
	
	@Override
	public List<Article> findHelpAll() {
		String hql = "from Article a where a.type=2";
		List<Article> list = (List<Article>) getSession().createQuery(hql).list();
		return list;
	}
}
