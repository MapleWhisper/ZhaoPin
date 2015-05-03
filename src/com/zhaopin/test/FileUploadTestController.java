package com.zhaopin.test;

import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping
public class FileUploadTestController {
	@RequestMapping("/fileUp")
	public String upload(HttpServletRequest request,String name){
		
		//http://amcucn.iteye.com/blog/264457
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;	
		MultipartFile file = multipartRequest.getFile("pic");
		
		if(file!=null && !"".equals(file.getName() )	){
			System.out.println("文件准备上传");
			try {
				Files.copy(file.getInputStream(), Paths.get( "d:/"+file.getOriginalFilename())  );
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		return "redirect:/client/index";
	}
}
