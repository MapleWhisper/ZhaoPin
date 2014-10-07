package com.zhaopin.client.controller;



import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.CopyOption;
import java.nio.file.Files;
import java.nio.file.Paths;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.zhaopin.client.server.ResumeService;
import com.zhaopin.client.server.UserServer;
import com.zhaopin.po.Resume;
import com.zhaopin.po.User;
import com.zhaopin.utils.ZhaoPinUtils;

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
			resume.setGraduateSchool(es[0]);	//毕业学校
			resume.setEducatinBackground(es[1] );	//学历
			resume.setMajor(es[2]);				//专业名称
			
			resume.setCompany(ws[0]);			//公司名称
			resume.setWorkTime(ws[1] );			//工作时间
			resume.setWorkDescribe(ws[2]);		//工作描述
			
			resume.setUserPicPath(fileName[0]);
			resume.setResumePath(fileName[1]);

			if(user!=null){		//如果用户不为null
				System.out.println(user.getId());
				User u = userSever.getById(user.getId());
				resume.setUser(u);
				u.setResume(resume);

				userSever.updata(u);;
				session.setAttribute("user", u);
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
		String path = "E:/GitHub/ZhaoPin/WebRoot/image/user/"+user.getId()+"/";
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
					String p1= path+"Pic"+user.getId()+file.getOriginalFilename().substring(file.getOriginalFilename().indexOf("."));
					File f = new File(p1);	//如果文件存在，那么删除文件
					if(f.exists()){
						f.delete();
					}
					Files.copy(file.getInputStream(), Paths.get( p1 )  );
					fileName[0] = "image/user/"+user.getId()+"/Pic"+user.getId()+file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
					System.out.println("上传头像成功"+fileName[0]);
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
					String p1= path+user.getName()+"的简历"+file1.getOriginalFilename().substring(file1.getOriginalFilename().indexOf("."));
					File f = new File(p1);
					if(f.exists()){
						f.delete();
					}
					Files.copy(file1.getInputStream(), Paths.get( p1 )  );
					fileName[1] = "image/user/"+user.getId()+"/"+user.getName()+"的简历"+file1.getOriginalFilename().substring(file1.getOriginalFilename().lastIndexOf("."));
					System.out.println("上传简历成功"+fileName[1]);
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
	@RequestMapping("/resume/show/{id}")
	public String showResume(@PathVariable int id,Model model){
		
		Resume resume = resumeService.getById(id);
		if(resume==null){
			return "redirect:/client/index";
		}
		model.addAttribute("resume", resume);
		
		model.addAttribute("graduateSchool",ZhaoPinUtils.spiltString(resume.getGraduateSchool().substring(4)));
		//model.addAttribute("educatinBackground",ZhaoPinUtils.spiltString(resume.getEducatinBackground().substring(4)));
		model.addAttribute("major",ZhaoPinUtils.spiltString(resume.getMajor().substring(4)));
		
		model.addAttribute("company", ZhaoPinUtils.spiltString(resume.getCompany().substring(4)));
		model.addAttribute("workTime",ZhaoPinUtils.spiltString(resume.getWorkTime().substring(4)));
		model.addAttribute("workDescribe",ZhaoPinUtils.spiltString(resume.getWorkDescribe().substring(4)));
		
		return "client/showResume";
	}
	
	/**
	 * 
	 * 简历下载
	 * @param id
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/resume/download/{id}")
	public void resumeDownload(@PathVariable int id,HttpServletResponse response,HttpServletRequest request) throws Exception{
		Resume resume = resumeService.getById(id);
		String resumePath = resume.getResumePath();
		if(resumePath==null){
			return ;
		}
		String fileName = resumePath.substring(resumePath.lastIndexOf("/")+1);
		System.out.println(fileName);
		response.setCharacterEncoding("utf-8");
		response.addHeader("Content-Disposition", "attachment;filename="+new String(fileName.getBytes("gbk"),"8859_1"));
		String path = request.getServletContext().getRealPath("/");
		System.out.println(path+resumePath);
		
		BufferedInputStream bis = null;  
        BufferedOutputStream bos = null;  
        bis = new BufferedInputStream(new FileInputStream(path+resumePath) );  
        bos = new BufferedOutputStream(response.getOutputStream());  
        byte[] buff = new byte[1024];  
        int bytesRead;  
        while (-1 != (bytesRead = bis.read(buff))) {  
            bos.write(buff, 0, bytesRead);  
        }  
        bis.close();  
        bos.close();  
	}
	
	/**
	 * 
	 * 根据Id 显示修改页面
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/resume/edit/{id}")
	public String editResume(@PathVariable int id,Model model){
		Resume resume  = resumeService.getById(id);
		if(resume==null){
			return "redirect:/client/index";
		}
		model.addAttribute("resume", resume);
		return "client/editResume";
	}
	
	/**
	 * 更新用户信息
	 * @param resume
	 * @param model
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/resume/update")
	public String update(@ModelAttribute Resume resume,Model model,HttpServletRequest request, HttpSession session){
		Resume r = resumeService.getById(resume.getId());
		r.setName(resume.getName());
		r.setBirthday(resume.getBirthday());
		r.setSex(resume.getSex());
		r.setMarry(resume.getMarry());
		r.setPhoneNumber(resume.getPhoneNumber());
		r.setIdType(resume.getIdType());
		r.setIdNumber(resume.getIdNumber());
		r.setWorkAge(resume.getWorkAge());
		r.setEmail(resume.getEmail());
		r.setLivePlace(resume.getLivePlace());
		r.setSchoolName(resume.getSchoolName());
		r.setTeach(resume.getTeach());
		r.setExceptClass(resume.getExceptClass());
		r.setExceptSalary(resume.getExceptSalary());
		r.setReward(resume.getReward());
		
		String fileName [] = this.saveFile(request, (User) session.getAttribute("user"));
		
		if(fileName[0]!=null && !"".equals(fileName[0])){
			r.setUserPicPath(fileName[0]);
		}
		if(fileName[1]!=null && !"".equals(fileName[1])){
			r.setResumePath(fileName[1]);
		}
		
		resumeService.updata(r);
		session.setAttribute("user", r.getUser());
		return "redirect:/client/personalCenter";
	}
}