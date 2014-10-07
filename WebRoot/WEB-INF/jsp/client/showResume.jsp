<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="header.jspf"%>
<title>${resume.name }的简历</title>
</head>

<body>
	<div class="container">

		<%@ include file="head.jsp"%>
		<div class="row" style="margin-top: 100px;margin-top:150px">
			<div class="col-sm-10 col-sm-offset-1">
				<div class="panel panel-default">
					<div class="panel-heading">个人信息简介</div>
					<div class="panel-body">
						<form
							action="${pageContext.request.contextPath}/client/resume/save"
							class="form-horizontal" role="form" id="form" method="post">
							<div class="row">

								<div class="col-sm-8 ">
									<div class="page-header">
										<h3>个人信息基础</h3>
									</div>
									<div class="row">
										<div class="col-sm-12">
											<div class="form-group">
												<label class="col-sm-2 control-label">姓名</label>
												<div class="col-sm-10">
													<p class="form-control-static">${resume.name }</p>
												</div>

											</div>
											<div class="form-group">

												<label class="col-sm-2 control-label">性别</label>
												<div class="col-sm-10">
													<p class="form-control-static">${resume.sex }</p>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label">出生日期</label>
												<div class="col-sm-10">
													<p class="form-control-static">
														<fm:formatDate value="${resume.birthday}"></fm:formatDate>
													</p>
												</div>



											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label">婚姻状况</label>
												<div class="col-sm-10">
													<p class="form-control-static">${resume.marry}</p>
												</div>


											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">电话</label>
												<div class="col-sm-10">
													<p class="form-control-static">${resume.phoneNumber}</p>
												</div>


											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">证件类型</label>
												<div class="col-sm-10">
													<p class="form-control-static">${resume.idType}</p>
												</div>


											</div>


											<div class="form-group">
												<label class="col-sm-2 control-label">证件号码</label>
												<div class="col-sm-10">
													<p class="form-control-static">${resume.idNumber}</p>
												</div>

											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">工作年限</label>
												<div class="col-sm-10">
													<p class="form-control-static">${resume.workAge}</p>
												</div>


											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">电子邮箱</label>
												<div class="col-sm-10">
													<p class="form-control-static">${resume.email}</p>
												</div>
											</div>




											<div class="form-group">
												<label class="col-sm-2 control-label">现居住地</label>
												<div class="col-sm-10">
													<p class="form-control-static">${resume.livePlace}</p>
												</div>

											</div>
										</div>
									</div>
									<!-- uhgbjhb -->

									<div class="page-header">
										<h3>求职倾向</h3>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">现任学校名称</label>
										<div class="col-sm-9">
											<p class="form-control-static">${resume.schoolName}</p>
										</div>


									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">现在所教课程</label>
										<div class="col-sm-9">
											<p class="form-control-static">${resume.teach}</p>
										</div>

									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">期望所教课程</label>
										<div class="col-sm-9">
											<p class="form-control-static">${resume.exceptClass}</p>
										</div>

									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">期望薪资待遇</label>
										<div class="col-sm-9">
											<p class="form-control-static">${resume.exceptSalary}</p>
										</div>
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

									<h3>
										 获取奖励 
									</h3>
									
									 
									
								 
									<table class="table table-bordered table-striped table-hover ">
										<tr>
											<td><p class="form-control-static">${resume.reward}</p></td>
										
										</tr>
									
									</table>
												 
									 		
									 
								</div>
								 

							<div class="col-sm-4" style="margin-top: 100px">
								<div class="panel panel-primary">
									<div class="panel-heading">头像</div>
									<div class="panel-body">

										<img alt="我的头像" height="200px" width="200px"
											src="${pageContext.request.contextPath}/${resume.userPicPath}" />
									</div>

								</div>
								<div class="panel panel-primary">
									<div class="panel-heading">简历下载</div>
									<div class="panel-body">
										<a
											href="${pageContext.request.contextPath}/client/resume/download/${resume.id}">用户简历</a>
									</div>
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
</body>
</html>
