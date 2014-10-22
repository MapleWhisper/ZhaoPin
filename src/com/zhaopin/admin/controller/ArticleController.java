package com.zhaopin.admin.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zhaopin.client.server.ArticleService;
import com.zhaopin.po.Article;


@Controller("articleControl")
@RequestMapping("/admin")
public class ArticleController {
	@Resource(name = "articleSerivceImpl")
	private ArticleService articleService;
	
	
	@RequestMapping("/article")
	public String company(Model model){
		List<Article> list = articleService.findAll();
		model.addAttribute("companyList", list);
		return "admin/article";
		
	}
	
	@RequestMapping("/article/help")
	public String help(Model model){
		
		List<Article> list = articleService.findHelpAll();
		model.addAttribute("helpList", list);
		return "admin/help";
		
	}
	
	@RequestMapping("/article/add")
	public String add(Model model){
		
		return "admin/addArticle";
	}
	
	@RequestMapping("/article/save")
	public String save(Model model,@ModelAttribute Article article){
		article.setCreateDate(new Date());
		if(article.getType()==null || article.getType().equals("")){
			article.setType("1");
		}
		articleService.save(article);
		return "redirect:/admin/article";
	}
	
	@RequestMapping("/article/edit/id/{id}")
	public String edit(Model model,@PathVariable int id){
		
		Article a = articleService.getById(id);
		model.addAttribute("article", a);
		return "admin/editArticle";
	}
	
	@RequestMapping("/article/update")
	public String update(@ModelAttribute Article article,@RequestParam int id){
		
		Article a = articleService.getById(id);
		a.setTitle(article.getTitle());
		a.setContext(article.getContext());
		articleService.updata(a);
		return "redirect:/admin/article";
	}
	
}
