package com.zhaopin.client.controller;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.zhaopin.client.server.ArticleService;
import com.zhaopin.po.Article;


@Controller()
@RequestMapping("/client")
public class ArticleController {
	@Resource(name = "articleSerivceImpl")
	private ArticleService articleService;
	
	
	@RequestMapping("/article/company")
	public String company(Model model){
		List<Article> list = articleService.findCompanyAll();
		model.addAttribute("article",articleService.getById( list.get(0).getId() )  );
		model.addAttribute("companyList", list);
		return "client/company";
	}
	
	@RequestMapping("/article/help")
	public String help(Model model){
		List<Article> list = articleService.findHelpAll();
		model.addAttribute("article",articleService.getById( list.get(0).getId() )  );
		model.addAttribute("helpList", list);
		return "client/help";
	}
	
	@RequestMapping("/article/show/id/{id}")
	public String showById(Model model,@PathVariable int id){
		
		Article a= articleService.getById( id );
		model.addAttribute("article",  a);
		if(a.getType().equals("1")){
			model.addAttribute("companyList", articleService.findCompanyAll());
			return "client/company";
		}else {
			model.addAttribute("helpList", articleService.findHelpAll());
			return "client/help";
		}
		
	}
}
