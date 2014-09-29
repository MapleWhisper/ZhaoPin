package com.zhaopin.client.controller;



import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.zhaopin.client.server.ResumeService;
import com.zhaopin.client.server.UserServer;
import com.zhaopin.po.Resume;
import com.zhaopin.po.User;
import com.zhaopin.utils.FilePath;

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
	/**
	 * 保存个人简历
	 * @param req
	 * @param resume
	 * @param request
	 * @param session
	 * @return
	 * @throws IOException
	 */

	@RequestMapping("/resume/save")
	public String save( HttpServletRequest req , @ModelAttribute Resume resume,HttpServletRequest request,HttpSession session,Model model) throws IOException{
		User user=(User)session.getAttribute("user");

		String fileName []=saveFile(request, user);
		
		if(fileName!=null){
			System.out.println("文件上传成功");
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
			resume.setUserPicPath(fileName[0]);
			resume.setResumePath(fileName[1]);

			if(user!=null){		//如果用户不为null
				System.out.println(user.getId());
				User u = userSever.getById(user.getId());
				resume.setUser(u);
				u.setResume(resume);

				userSever.updata(u);;
				return "redirect:/client/personalCenter";
			}else{		//如果用户为 null
				return "redirect:/client/login";
			}
		}else {
			model.addAttribute("error","提交简历失败,文件格式不正确");
			return "client/resume";
		}
	}

	/**
	 * 保存简历文件和保存头像
	 * @param request
	 * @param user
	 * @return
	 */
	private String[] saveFile(HttpServletRequest request, User user) {
		String fileName [] = new String[2];
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;	
		MultipartFile file = multipartRequest.getFile("pic");
		MultipartFile file1 = multipartRequest.getFile("resumeFile");
		String path = FilePath.userFilePath+user.getId()+"/";
		new File(path).mkdirs();
		
		if(file!=null && !"".equals(file.getOriginalFilename() )){		//图片上传部分
			String  a=file.getOriginalFilename();
			String [] s=new String[]{"bmp","jpg","gif","png"};
			boolean flag = false;
			for(int i=0;i<s.length;i++){
				if(a.endsWith(s[i])){
					flag=true;
					break;
				}
			}
			if(flag){	//文件后缀正确
				try {
					Files.copy(file.getInputStream(), Paths.get( path+file.getOriginalFilename() )  );
					fileName[0] = path+file.getOriginalFilename();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else{
				return null;
			}
			
		}
		if(file1!=null && !"".equals(file1.getOriginalFilename() )){	//简历上传部分

			String  a=file1.getOriginalFilename();		
			String [] s=new String[]{"doc","docx","pdf","jpg"}; 
			boolean flag = false;
			for(int i=0;i<s.length;i++){
				if(a.endsWith(s[i])){
					flag=true;
					break;
				}
			}
			if(flag){
				try {
					Files.copy(file1.getInputStream(), Paths.get( path+file1.getOriginalFilename() )  );
					fileName[1] = path+file1.getOriginalFilename();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else{
				return null;
			}
			
		}
		return fileName;
	}
	
	
	/**
	 * 根据Url Id 来加载 用户建立数据，显示到 showResume.jsp页面上
	 * 并实现Jsp页面上下载简历
	 * @return
	 */
	@RequestMapping("/resume/show/id/{id}")
	public String showResume(@PathVariable int id){
		return "client/showResume";
	}
}