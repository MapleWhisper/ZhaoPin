package com.zhaopin.client.controller;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhaopin.client.server.ResumeService;
import com.zhaopin.client.server.ResumeServiceImpl;
import com.zhaopin.po.Resume;

@Controller()
@RequestMapping("/client")
public class ResumeController  {
		@Resource(name="resumeServiceImpl")
		private ResumeService  resumeService;
		
		@RequestMapping("/resume")
 		public String resume(){
 			 			
 			
 			return "client/resume";
 		}
		
		
		@RequestMapping("/resume/save")
		public String save( HttpServletRequest req , @ModelAttribute Resume resume){
			
			  
			 
			
			String e1[] = req.getParameterValues("e1");
			String e2[] = req.getParameterValues("e2");
			String e3[] = req.getParameterValues("e3");
			String e4[]=req.getParameterValues("e4");
			
			String w1[]=req.getParameterValues("w1");
			String w2[]=req.getParameterValues("w2");
			String w3[]=req.getParameterValues("w3");
			String w4[]=req.getParameterValues("w4");
			

		
				
			resume .setGraduateSchool(e1[0] + " "+e2[0]+" "+e3[0] +" "+e4[0]);
			resume .setEducatinBackground(e1[1]+" "+e2[1]+" "+e3[1]+" "+e4[0]  );
			resume .setMajor(e1[2]+" "+e2[2]+" "+e3[2] +" "+e4[0]);
			

			resume .setCompany(w1[0] + " "+w2[0]+" "+w3[0] +" "+w4[0]);
			resume .setWorkTime(w1[1]+" "+w2[1]+" "+w3[1]+" "+w4[0] );
			resume .setMajor(w1[2]+" "+w2[2]+" "+w3[2] +" "+w4[0]);
				 
			resumeService.save(resume);
			 
				return "client/index";
				
		}
}