package com.zhaopin.admin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhaopin.admin.server.ProblemService;
import com.zhaopin.po.Problem;
import com.zhaopin.utils.PaperCart;

/**
 * 
 * 试题篮控制器
 * @author 广路
 *
 */
@Controller
@RequestMapping("/admin")
public class PaperCartController {
	
	@Resource(name= "problemServiceImpl")
	private ProblemService problemService;
	
	/**
	 * 跳转到试卷篮页面
	 * @return
	 */
	@RequestMapping("/paperCart")
	public String paperCart(HttpSession session,Model model){
		
		PaperCart cart = (PaperCart) session.getAttribute("paperCart");
		if(cart==null){		//	如果试卷篮为空，创建 添加到session
			cart = new PaperCart();
			session.setAttribute("paperCart", cart);
		}
		List<Problem> singles = problemService.getByIds(  cart.toArray(cart.getSingles()) );
		List<Problem> multChoices = problemService.getByIds(  cart.toArray(cart.getMultChoices()) );
		List<Problem> judges = problemService.getByIds( cart.toArray(cart.getJudges()) );
		List<Problem> questions = problemService.getByIds( cart.toArray(cart.getQuestions()));
		
		model.addAttribute("singles", singles);
		model.addAttribute("multChoices", multChoices);
		model.addAttribute("judges", judges);
		model.addAttribute("questions", questions);
		
		return "admin/paperCart";
	}
	
	/**
	 * 试卷篮操作	基于ajax
	 * @param action
	 * @param id
	 * @param session
	 */
	@RequestMapping("/paperCart/action/{action}")
	public void opera(@PathVariable String action , Integer id ,HttpSession session){
		PaperCart cart = (PaperCart) session.getAttribute("paperCart");
		if(cart==null){		//	如果试卷篮为空，创建 添加到session
			cart = new PaperCart();
			session.setAttribute("paperCart", cart);
		}
		Problem problem = problemService.getById(id);
		if(problem == null){	//	如果试题为空，返回
			return ;
		}
		if("add".equals(action)){	//	如果为添加试卷
			cart.add(problem);
		} 
		if("remove".equals(action)){
			cart.remove(problem);
		}
		session.setAttribute("paperCart", cart);
		return ;
	}
	
	
	
	
	
	
	
	
}
