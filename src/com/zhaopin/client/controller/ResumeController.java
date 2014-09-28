package com.zhaopin.client.controller;



import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhaopin.client.server.ResumeService;

import com.zhaopin.client.server.UserServer;
import com.zhaopin.po.Resume;
import com.zhaopin.po.User;

@Controller()
@RequestMapping("/client")
public class ResumeController  {
		@Resource(name="resumeServiceImpl")
		private ResumeService  resumeService;
		
		@Resource(name="userServerImpl")
		private UserServer userSever;
	 
		
		@RequestMapping("/resume")
 		public String resume(){
 			 			
 			
 			return "client/resume";
 		}
		
		
		@RequestMapping("/resume/save")
		public String save( HttpServletRequest req , @ModelAttribute Resume resume,HttpSession session){
			String e1[] = req.getParameterValues("e1");
			String e2[] = req.getParameterValues("e2");
			String e3[] = req.getParameterValues("e3");
			String w1[]=req.getParameterValues("w1");
			String w2[]=req.getParameterValues("w2");
			String w3[]=req.getParameterValues("w3");
			 
			
			String es[]=new String[3];
			String ws[]=new String [3];
			for(int i=0;i<4;i++){
				 	es[0]=es[0]+e1[i]+"&";
					es[1]=es[1]+e2[i]+"&";
					es[2]=es[2]+e3[i]+"&";
					ws[0]=ws[0]+w1[i]+"&";
					ws[1]=ws[1]+w2[i]+"&";
					ws[2]=ws[2]+w3[i]+"&";
			}
			resume .setGraduateSchool(es[0]);
			resume .setEducatinBackground(es[1] );
			resume .setMajor(es[2]);
			resume .setCompany(ws[0]);
			resume .setWorkTime(ws[1] );
			resume .setMajor(ws[2]);
		 
				 
			User user=(User)session.getAttribute("user");

			if(user!=null){
				System.out.println(user.getId());
				User u = userSever.getById(user.getId());
				resume.setUser(u);
				u.setResume(resume);
				
				userSever.updata(u);;
				return "redirect:/client/personalCenter";
			}else{
				return "redirect:/client/resume";
				
			}
			
			 
				
		}
}