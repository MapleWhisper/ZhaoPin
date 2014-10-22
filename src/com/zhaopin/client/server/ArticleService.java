package com.zhaopin.client.server;

import java.util.List;

import com.zhaopin.base.BaseServer;
import com.zhaopin.po.Article;

public interface ArticleService extends BaseServer<Article> {
	public List<Article> findHelpAll();
	public List<Article> findCompanyAll();
}
