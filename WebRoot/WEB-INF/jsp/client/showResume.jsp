<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="header.jspf"%>
<title> ${resume.name }的简历</title>
</head>

<body>
	<div class="container">
	
		<%@ include file="head.jsp"%>
		<div class="row" style="margin-top: 100px;margin-top:150px">
			<div class="col-sm-10 col-sm-offset-1">
				<div class="panel panel-default">
					<div class="panel-heading">个人信息简介</div>
					<div class="panel-body">
						<form action="${pageContext.request.contextPath}/client/resume/save" class="form-horizontal" role="form"
								 id="form" method="post">
							<div class="row">

								<div class="col-sm-8 ">
									<div class="page-header">
										<h3>个人信息基础</h3>
									</div>
									<div class="row">
										<div class="col-sm-12">
											<div class="form-group">
												<label  class="col-sm-2 control-label">姓名</label>
												<label  class="col-sm-2 control-label">${resume.name }</label>
											</div>
											<div class="form-group">

												<label  class="col-sm-2 control-label">性别</label>
												<label  class="col-sm-2 control-label">${resume.sex }</label>
											</div>

											<div class="form-group">
												<label   class="col-sm-2 control-label">出生日期</label>
												<label   class="col-sm-2 control-label"><fm:formatDate value="${resume.birthday}"></fm:formatDate></label>
												
											</div>

											<div class="form-group">
												<label   class="col-sm-2 control-label">婚姻状况</label>
												<label   class="col-sm-2 control-label">${resume.marry}</label>
												
											</div>
											<div class="form-group">
												<label   class="col-sm-2 control-label">电话</label>
												<label   class="col-sm-2 control-label">${resume.phoneNumber}</label>
												
											</div>
											<div class="form-group">
												<label   class="col-sm-2 control-label">证件类型</label>
												<label   class="col-sm-2 control-label">${resume.idType}</label>
												
											</div>


											<div class="form-group">
												<label   class="col-sm-2 control-label">证件号码</label>
												<label   class="col-sm-2 control-label">${resume.idNumber}</label>
												
											</div>
											<div class="form-group">
												<label   class="col-sm-2 control-label">工作年限</label>
												<label   class="col-sm-2 control-label">${resume.workAge}</label>
												
											</div>
											<div class="form-group">
												<label   class="col-sm-2 control-label">电子邮箱</label>
												<label   class="col-sm-2 control-label">${resume.email}</label>
											</div>



											<div class="form-group">
												<label   class="col-sm-2 control-label">现居住地</label>
												<label   class="col-sm-2 control-label">${resume.livePlace}</label>
												
											</div>
										</div>
									</div>
									<!-- uhgbjhb -->

									<div class="page-header">
										<h3>求职倾向</h3>
									</div>
									<div class="form-group">
										<label   class="col-sm-3 control-label">现任学校名称</label>
										<label   class="col-sm-2 control-label">${resume.schoolName}</label>
										
									</div>
									<div class="form-group">
										<label   class="col-sm-3 control-label">现在所教课程</label>
										<label   class="col-sm-2 control-label">${resume.teach}</label>
									</div>
									<div class="form-group">
										<label   class="col-sm-3 control-label">期望所教课程</label>
										<label   class="col-sm-2 control-label">${resume.exceptClass}</label>
									</div>
									<div class="form-group">
										<label   class="col-sm-3 control-label">期望薪资待遇</label>
										<label   class="col-sm-2 control-label">${resume.exceptSalary}</label>
									</div>
									<h3>教育经历</h3>
									<table class="table table-bordered table-striped table-hover">
										<tr>
											<td>毕业学校</td>
											<td>学历</td>
											<td>专业名称</td>
										</tr>
										 	<tr>
												<td>${graduateSchool[0] }</td>
												<td>${educatinBackground[0] }</td>
												<td>${major[0] }</td>
											</tr>
										 	<tr>
												<td>${graduateSchool[1] }</td>
												<td>${educatinBackground[1] }</td>
												<td>${major[1] }</td>
											</tr>
											 <tr>
												<td>${graduateSchool[2] }</td>
												<td>${educatinBackground[2] }</td>
												<td>${major[2] }</td>
											 </tr>
										 	<tr>
												<td>${graduateSchool[3] }</td>
												<td>${educatinBackground[3] }</td>
												<td>${major[3] }</td>
											</tr>
									</table>
									
									<h3>工作经历</h3>
									<table class="table table-bordered table-striped table-hover">
										<tr>
											<td>工作单位名称</td>
											<td>任职时间</td>
											<td>职位描述</td>
										</tr>
										<tr>
											<td>${company[0] }</td>
											<td>${workTime[0] }</td>
											<td>${workDescribe[0] }</td>
										</tr>
										<tr>
											<td>${company[1] }</td>
											<td>${workTime[1] }</td>
											<td>${workDescribe[1] }</td>						
										<tr>
											<td>${company[2] }</td>
											<td>${workTime[2] }</td>
											<td>${workDescribe[2] }</td>
										</tr>
										<tr>
											<td>${company[3] }</td>
											<td>${workTime[3] }</td>
											<td>${workDescribe[3] }</td>
										</tr>
									</table>
									
									<h5>
										<strong>获取奖励</strong>
									</h5>
									<textarea class="form-control" rows="5" >${resume.reward}</textarea>
								</div>

								
							   
								<div class="col-sm-4" style="margin-top: 100px">
									<div class="panel panel-primary">
										 <div class="panel-heading">头像</div>
									  <div class="panel-body">
									   
											<img alt="我的头像" height="200px" width="200px" src="${pageContext.request.contextPath}/${resume.userPicPath}"/> 
										</div>
										
							 		  </div>
									<div class="panel panel-primary">
									  <div class="panel-heading">简历下载</div>
									  <div class="panel-body">
									    	<a href="${pageContext.request.contextPath}/client/resume/download/${resume.id}">用户简历</a>
									  </div>
									</div>

								</div>
								
							</div>
							
							<div class="form-group" id="e2">
									<div class="col-sm-8 col-sm-offset-2">
										<div class="alert alert-danger alert-dismissible" role="alert">
  												<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
 												 <span id="e1">${error}<span>
										</div>
									</div>
							</div>
							</div>
							
						</form>
					</div>
					
				</div>
			</div>

		</div>


	<%@ include file="buttom.jsp"%>
	<script type="text/javascript">
		$(function(){
			var p = $("#e1").text();
			if( p.length==11){
				$("#e2").remove();
			}
		});
	</script>
</body>
</html>
