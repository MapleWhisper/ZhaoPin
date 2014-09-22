package com.zhaopin.client.server;


import java.util.HashMap;
import java.util.List;

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
	/**
	 * 根据查询条件返回对象列表
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Position> getByKey(HashMap<String,String> map) {
		String hql = "from Position p ";
		int index = 0;
		for(String key : map.keySet()){
			if( map.get(key)!=null && !map.get(key).equals("") && !map.get(key).equals("不限") ){
				if(index==0){
					hql+=" where p."+key+" = '"+map.get(key)+"' ";
					index++;
				}else{
					hql+=" and  p."+key+" = '"+map.get(key)+"' ";
				}
				
			}
		}
		System.out.println(hql);
		
		return (List<Position>) getSession().createQuery(hql).list();
	}
}
