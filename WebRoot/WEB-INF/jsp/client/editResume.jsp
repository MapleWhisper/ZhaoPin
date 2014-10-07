<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="header.jspf"%>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js">
</script>
</head>

<body>
	<div class="container">
		<%@ include file="head.jsp"%>
		<div class="row" style="margin-top: 100px;margin-top:150px">
			<div class="col-sm-10 col-sm-offset-1">
				<div class="panel panel-default">
					<div class="panel-heading">个人信息简介</div>
					<div class="panel-body">
						<form action="${pageContext.request.contextPath}/client/resume/update" class="form-horizontal" role="form"
								 enctype="multipart/form-data" id="form" method="post">
							<div class="row">

								<div class="col-sm-8 ">
									<div class="page-header">
										<h3>个人信息基础</h3>
									</div>
									<div class="row">
										<div class="col-sm-12">
											<div class="form-group">
												<label for="inputEmail3" class="col-sm-2 control-label">姓名</label>
												<div class="col-sm-6">
													<f:input type="text" class="form-control inputxt" path="resume.name"/>
													<input type="hidden"  name="id" value="${resume.id}" />
												</div>
											</div>
											<div class="row">

												<label for="inputEmail3" class="col-sm-2 control-label">性别</label>
												<label class="radio-inline"> 
													<f:checkbox path="resume.sex" name="sex" value="男"/> 男
													<f:checkbox path="resume.sex"  name="sex" value="女"/> 女
												</label> 
											</div>
											<br />

											<div class="form-group">
												<label for="inputEmail3" class="col-sm-2 control-label">出生日期</label>
												<div class="col-sm-6">
													<f:input type="text" class="form-control inputxt"
														path="resume.birthday"  id="dataTime" onClick="WdatePicker()"/>
												</div>
											</div>

											<div class="form-group">
												<label for="inputEmail3" class="col-sm-2 control-label">婚姻状况</label>
												<div class="col-sm-9">
													<f:input type="text" class="form-control inputxt" id="email"
														path="resume.marry" />
												</div>
											</div>
											<div class="form-group">
												<label for="inputEmail3" class="col-sm-2 control-label">电话</label>
												<div class="col-sm-9">
													<f:input type="text" class="form-control inputxt" id="email"
														path="resume.phoneNumber" />
												</div>
											</div>
											<div class="form-group">
												<label for="inputEmail3" class="col-sm-2 control-label">证件类型</label>
												<div class="col-sm-9">
													<f:input type="text" class="form-control inputxt" id="email"
														path="resume.idType" />
												</div>
											</div>


											<div class="form-group">
												<label for="inputEmail3" class="col-sm-2 control-label">证件号码</label>
												<div class="col-sm-9">
													<f:input type="text" class="form-control inputxt" id="email"
														path="resume.idNumber"/>
												</div>
											</div>
											<div class="form-group">
												<label for="inputEmail3" class="col-sm-2 control-label">工作年限</label>
												<div class="col-sm-9">
													<f:input type="text" class="form-control inputxt"
														path="resume.workAge" id="workAge" />
												</div>
											</div>
											<div class="form-group">
												<label for="inputEmail3" class="col-sm-2 control-label">电子邮箱</label>
												<div class="col-sm-9">
													<f:input type="text" class="form-control inputxt" id="email"
														path="resume.email" />
												</div>
											</div>



											<div class="form-group">
												<label for="inputEmail3" class="col-sm-2 control-label">现居住地</label>
												<div class="col-sm-9">
													<f:input type="text" class="form-control inputxt"
														id="livePlace" path="resume.livePlace" />
												</div>
											</div>
										</div>
									</div>
									<!-- uhgbjhb -->

									<div class="page-header">
										<h3>求职倾向</h3>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-3 control-label">现任学校名称</label>
										<div class="col-sm-6">
											<f:input type="text" class="form-control inputxt" id="email"
												path="resume.schoolName" />
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-3 control-label">现在所教课程</label>
										<div class="col-sm-6">
											<f:input type="text" class="form-control inputxt" id="email"
												path="resume.teach" />
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-3 control-label">期望所教课程</label>
										<div class="col-sm-6">
											<f:input type="text" class="form-control inputxt" id="email"
												path="resume.exceptClass" />
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-3 control-label">期望薪资待遇</label>
										<div class="col-sm-6">
											<f:input type="text" class="form-control inputxt" id="email"
												path="resume.exceptSalary" />
										</div>
									</div>
									
									<h5>
										<strong>获取奖励</strong>
									</h5>
									<f:textarea path="resume.reward" class="form-control" rows="10"></f:textarea>
								</div>


								<div class="col-sm-4" style="margin-top: 100px">
									<div class="panel panel-primary">
									  <div class="panel-heading">简历上传</div>
									  <div class="panel-body">
									    <div class="form-group">
											<label for="exampleInputFile"></label> 
											<input type="file"	id="resumeFile" name="resumeFile">
										</div>
										<li style="color: red;">上传格式为:doc ,docx , pdf , jpg</li>
										<li style="color: red;">上传大小为:5MB</li>
									  </div>
									</div>
										
									<div class="panel panel-primary">
									  <div class="panel-heading">头像上传</div>
									  <div class="panel-body">
									    <img alt="我的头像" height="200px" width="200px" src="${pageContext.request.contextPath}/${resume.userPicPath}"/> 
										<div class="form-group">
											<label for="exampleInputFile"></label> 
											<input type="file"	id="pic" name="pic">
										</div>
										<li style="color: red;">上传格式为:bmp , jpg , gif ,png</li>
										<li style="color: red;">上传大小为:1MB</li>
									</div>
									

								</div>
								
							</div>
							<div class="form-group">
									<div class="col-sm-offset-3 col-sm-4">
										<input type="submit" class="btn btn-primary btn-lg "
											value="提交简历" />

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

						</form>
					</div>
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
