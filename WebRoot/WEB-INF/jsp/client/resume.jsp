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
						<form action="${pageContext.request.contextPath}/client/resume/save" class="form-horizontal" role="form"
						 enctype="multipart/form-data"id="form" method="post">
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
													<input type="text" class="form-control inputxt" name="name"
														id="username" placeholder="姓名">
												</div>
											</div>
											<div class="row">

												<label for="inputEmail3" class="col-sm-2 control-label">性别</label>


												<label class="radio-inline"> 
													<input type="radio" name="sex" id="inlineRadio1" value="男"> 男
												</label> 
												<label class="radio-inline">
													 <input type="radio"  name="sex" id="inlineRadio1" value="女"> 女
												</label>
											</div>
											<br />

											<div class="form-group">
												<label for="inputEmail3" class="col-sm-2 control-label">出生日期</label>
												<div class="col-sm-6">
													<input type="text" class="form-control inputxt"
														name="birthday" id="dataTime" onClick="WdatePicker()">
												</div>
											</div>

											<div class="form-group">
												<label for="inputEmail3" class="col-sm-2 control-label">婚姻状况</label>
												<div class="col-sm-9">
													<input type="text" class="form-control inputxt" id="email"
														name="marry" placeholder="未婚">
												</div>
											</div>
											<div class="form-group">
												<label for="inputEmail3" class="col-sm-2 control-label">电话</label>
												<div class="col-sm-9">
													<input type="text" class="form-control inputxt" id="email"
														name="phoneNumber" placeholder="150******">
												</div>
											</div>
											<div class="form-group">
												<label for="inputEmail3" class="col-sm-2 control-label">证件类型</label>
												<div class="col-sm-9">
													<input type="text" class="form-control inputxt" id="email"
														name="idType" placeholder="第二代居民身份证">
												</div>
											</div>


											<div class="form-group">
												<label for="inputEmail3" class="col-sm-2 control-label">证件号码</label>
												<div class="col-sm-9">
													<input type="text" class="form-control inputxt" id="email"
														name="idNumber" placeholder="371321******">
												</div>
											</div>
											<div class="form-group">
												<label for="inputEmail3" class="col-sm-2 control-label">工作年限</label>
												<div class="col-sm-9">
													<input type="text" class="form-control inputxt"
														name="workAge" id="workTime" placeholder="xxx">
												</div>
											</div>
											<div class="form-group">
												<label for="inputEmail3" class="col-sm-2 control-label">电子邮箱</label>
												<div class="col-sm-9">
													<input type="text" class="form-control inputxt" id="email"
														name="email" placeholder="xxx@163.com">
												</div>
											</div>



											<div class="form-group">
												<label for="inputEmail3" class="col-sm-2 control-label">现居住地</label>
												<div class="col-sm-9">
													<input type="text" class="form-control inputxt"
														id="livePlace" name="livePlace" placeholder="省市区">
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
											<input type="text" class="form-control inputxt" id="email"
												name="schoolName" placeholder="清华大学">
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-3 control-label">现在所教课程</label>
										<div class="col-sm-6">
											<input type="text" class="form-control inputxt" id="email"
												name="teach" placeholder="数学">
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-3 control-label">期望所教课程</label>
										<div class="col-sm-6">
											<input type="text" class="form-control inputxt" id="email"
												name="expectClass" placeholder="物理">
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-3 control-label">期望薪资待遇</label>
										<div class="col-sm-6">
											<input type="text" class="form-control inputxt" id="email"
												name="exceptSalary" placeholder="2000">
										</div>
									</div>
									<h3>教育经历</h3>
									<table class="table table-bordered">
										<tr>
											<td>毕业学校</td>
											<td>学历</td>
											<td>专业名称</td>
											<td></td>
										</tr>
										<tr>
											<td><input class="form-control input-sm" type="text"
												name="e1" placeholder=" "></td>
											<td><input class="form-control input-sm" type="text"
												name="e2" placeholder=" "></td>
											<td><input class="form-control input-sm" type="text"
												name="e3" placeholder=" "></td>
											<td><button type="button" class="btn btn-info">删除</button>
											</td>
										</tr>
										<tr>
											<td><input class="form-control input-sm" type="text"
												name="e1" placeholder=" "></td>
											<td><input class="form-control input-sm" type="text"
												name="e2" placeholder=" "></td>
											<td><input class="form-control input-sm" type="text"
												name="e3" placeholder=" "></td>
											<td><button type="button" class="btn btn-info">删除</button>
											</td>
										</tr>
										<tr>
											<td><input class="form-control input-sm" type="text"
												name="e1" placeholder=" "></td>
											<td><input class="form-control input-sm" type="text"
												name="e2" placeholder=" "></td>
											<td><input class="form-control input-sm" type="text"
												name="e3" placeholder=" "></td>
											<td><button type="button" class="btn btn-info">删除</button>
											</td>
										</tr>
										<tr>
											<td><input class="form-control input-sm" type="text"
												name="e1" placeholder=" "></td>
											<td><input class="form-control input-sm" type="text"
												name="e2" placeholder=" "></td>
											<td><input class="form-control input-sm" type="text"
												name="e3" placeholder=" "></td>
											<td><button type="button" class="btn btn-info">删除</button>
											</td>
										</tr>
									</table>
									<h3>工作经历</h3>
									<table class="table table-bordered">
										<tr>
											<td>工作单位名称</td>
											<td>任职时间</td>
											<td>职位描述</td>
											<td></td>
										</tr>
										<tr>
											<td><input class="form-control input-sm" type="text"
												name="w1" placeholder=" "></td>
											<td><input class="form-control input-sm" type="text"
												name="w2" placeholder=" "></td>
											<td><input class="form-control input-sm" type="text"
												name="w3" placeholder=" "></td>
											<td><button type="button" class="btn btn-info">删除</button>
											</td>
										</tr>
										<tr>
											<td><input class="form-control input-sm" type="text"
												name="w1" placeholder=" "></td>
											<td><input class="form-control input-sm" type="text"
												name="w2" placeholder=" "></td>
											<td><input class="form-control input-sm" type="text"
												name="w3" placeholder=" "></td>
											<td><button type="button" class="btn btn-info">删除</button>
											</td>
										</tr>
										<tr>
											<td><input class="form-control input-sm" type="text"
												name="w1" placeholder=" "></td>
											<td><input class="form-control input-sm" type="text"
												name="w2" placeholder=" "></td>
											<td><input class="form-control input-sm" type="text"
												name="w3" placeholder=" "></td>
											<td><button type="button" class="btn btn-info">删除</button>
											</td>
										</tr>
										<tr>
											<td><input class="form-control input-sm" type="text"
												name="w1" placeholder=" "></td>
											<td><input class="form-control input-sm" type="text"
												name="w2" placeholder=" "></td>
											<td><input class="form-control input-sm" type="text"
												name="w3" placeholder=" "></td>
											<td><button type="button" class="btn btn-info">删除</button>
											</td>
										</tr>
									</table>
									<h5>
										<strong>获取奖励</strong>
									</h5>
									<textarea class="form-control" rows="5"></textarea>
								</div>


								<div class="col-sm-4" style="margin-top: 100px">
									<div class="panel panel-primary">
									  <div class="panel-heading">简历上传</div>
									  <div class="panel-body">
									    <div class="form-group">
											<label for="exampleInputFile"></label> 
											<input type="file"	id="resumeFile" name="resumeFile">
										</div>
										<li style="color: red;">上传格式为：doc ,docx , pdf , jpg</li>
									  </div>
									</div>
										
									<div class="panel panel-primary">
									  <div class="panel-heading">头像上传</div>
									  <div class="panel-body">
									    <img height="120px" width="120px"
											src="${pageContext.request.contextPath}/image/User_default_pic.jpg" style="margin-top: 50px">
										<div class="form-group">
											<label for="exampleInputFile"></label> 
											<input type="file"	id="pic" name="pic">
										</div>
										<li style="color: red;">上传格式为：bmp , jpg , gif ,png</li>
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
