package com.zhaopin.admin.controller;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

import com.zhaopin.client.server.PositionServer;
import com.zhaopin.po.Position;

/**
 * 
 * 后台岗位管理页面
 * 
 * @author 于广路
 *
 */
@Controller
@RequestMapping("/admin")
public class APositionController {
	
	@Resource(name="positionServerImpl")
	private PositionServer positionServer;	//注入position服务
	
	/**
	 * 
	 * 显示职位列表页面
	 * @param model	放入职业列表数据
	 * @return		返回职业列表页面
	 */
	@RequestMapping("/position")
	public String position(Model model){
		model.addAttribute("positionList",positionServer.findAll());
		return "admin/position";
	}
	
	/**
	 * 
	 * 添加职业页面
	 * 
	 * @return 返回添加职业页面
	 */
	@RequestMapping("/position/add")
	public String addUI(){
		return "admin/addPosition";
	}
	
	/**
	 * 增加新的岗位
	 * @param position	需要保存的岗位
	 * @return		返回到岗位列表页面
	 */
	@RequestMapping("/position/save")
	public String save(@ModelAttribute Position position){
		
		System.out.println("要保存position");
		//保存岗位，
		position.setCreatedate(new Date()); 		//设置 岗位信息生成日期
		position.setApplyNumber(0);
		position.setSuccessNumber(0);
		position.setScanNumber(0);
		if(position.getRecruitNumber()==null || position.getRecruitNumber().equals("")){	//如果招聘人数null 或者为空 
			position.setRecruitNumber(1);													//设置招聘人数为1
		}
		
		positionServer.save(position);				//保存岗位
		
		return "redirect:/admin/position";
	} 
	
	/**
	 * 根据Id号删除岗位
	 * 
	 * @param id	需要删除的Id号
	 * @return		返回到职业列表页面
	 */
	@RequestMapping("/position/delete/id/{id}")
	public String delete(@PathVariable int id){
		System.out.println("删除id为"+id+"的职位");
		positionServer.delete(id);
		return "redirect:/admin/position";
	} 
	
	/**
	 * 根据Id显示职位详情页面
	 * 
	 * @param id	需要删除的Id号
	 * @return		返回到职业列表页面
	 */
	@RequestMapping("/position/show/id/{id}")
	public String show(@PathVariable int id,Model model){
		System.out.println("显示职位"+id);
		Position p = positionServer.getById(id);
		model.addAttribute("position", p);			//获得职位详情，加入model中
		
		return "admin/showPosition";
	} 
	
}
