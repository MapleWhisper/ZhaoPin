package com.zhaopin.admin.server;

import java.util.List;

import com.zhaopin.base.BaseServer;
import com.zhaopin.po.Problem;
import com.zhaopin.utils.Page;

public interface ProblemService extends BaseServer<Problem>{
	
	/**
	 * 得到最大的页数
	 * @param page	分页信息
	 * @return
	 */
	public int getMaxPageNum(Page page);
	
	/**
	 * 分页显示
	 * @param page 分页信息
	 * @return
	 */
	public List<Problem> findAll(Page page);

	public List<Problem> search(String key); 
}
