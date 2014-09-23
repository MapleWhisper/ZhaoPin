package com.zhaopin.client.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhaopin.client.server.ResumeService;
import com.zhaopin.po.Resume;

@Controller()
@RequestMapping("/client")

public class ResumeController  {
		@Resource(name="resumeServiceImpl")
		private ResumeService  resume;
		
		@RequestMapping("/resume")
 		public String resume(){
 			 			
 			
 			return "client/resume";
 		}
		
		
		@RequestMapping("/resume/save")
		public String save( HttpServletRequest req , @ModelAttribute Resume resume){
			
			System.out.println(resume.getEmail());
			System.out.println(resume.getIdNumber());
			
			String e1[] = req.getParameterValues("e1");
			String e2[] = req.getParameterValues("e1");
			String e3[] = req.getParameterValues("e1");
			
			for(int i=0;i<3;i++){
				System.out.println("e1"+e1[i]);
				System.out.println("e2"+e2[i]);
				System.out.println("e3"+e3[i]);
			}
			
			return "client/index";
		}
}