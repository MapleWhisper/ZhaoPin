package com.zhaopin.admin.server;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.springframework.stereotype.Service;

import com.zhaopin.base.BaseServerImpl;
import com.zhaopin.po.Problem;
import com.zhaopin.utils.Page;

@Transactional
@Service
public class ProblemServiceImpl extends BaseServerImpl<Problem> implements ProblemService {
	
	
	/**
	 * 分页显示
	 * @param page 分页信息
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Problem> findAll(Page page) {
		Query query= getSession().createQuery("from Problem p order by p.id desc");
		query.setMaxResults(page.getAmount());							//取几条记录
		query.setFirstResult( (page.getCur()-1)*page.getAmount() );		//从哪个记录开始取
		
		return query.list();
	}
	
	/**
	 * 得到最大的页数
	 */
	public int getMaxPageNum(Page page){
		int sum = ((Number)(getSession().createQuery("select count(*) from Problem p ").iterate().next())).intValue() ;
		sum = (sum+page.getAmount()-1)/page.getAmount(); 
		return sum;
	}
	
	/**
	 * 根据关键字查找试题
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Problem> search(String key) {
		return	getSession().createQuery("from Problem p  where p.title like ? or p.label like ? order by p.id desc")
				.setParameter(0, "%"+key+"%")
				.setParameter(1, "%"+key+"%").list();
		 
	}
}	
