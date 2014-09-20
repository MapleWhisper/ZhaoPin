<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="header.jspf" %>
  </head>
  
  <body>
    	<div class="container">
    		<%@ include file="head.jsp" %>
    		<div class="row" style="margin-top: 100px;margin-top:150px">
		 <div class="col-sm-10 col-sm-offset-1">	 
			<div class="panel panel-default">
				<div class="panel-heading">个人信息简介</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-sm-2">
							<div class="col-sm-4">
							
								<button class="btn btn-primary btn-lg" style="border-top:1px">上传图片</button>
							</div>
						</div>
						<div class="col-sm-10 ">
							<form class="form-horizontal" role="form" id="form">
								<div class="page-header">
									<h3>
										个人信息基础
									</h3>
								</div>
								<div class="row">

									<div class="col-sm-6">
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-3 control-label">姓名</label>
											<div class="col-sm-6">
												<input type="text" class="form-control inputxt"
													id="username" placeholder="姓名">
											</div>
										</div>

										<div class="form-group">
											<label for="inputEmail3" class="col-sm-3 control-label">出生日期</label>
											<div class="col-sm-3">
												<input type="text" class="form-control inputxt"
													id="dataTime" placeholder="年">
											</div>
											<div class="col-sm-3">
												<input type="text" class="form-control inputxt"
													id="dataTime" placeholder="月">
											</div>
											<div class="col-sm-3">
												<input type="text" class="form-control inputxt"
													id="dataTime" placeholder="日">
											</div>
										</div>
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-3 control-label">证件号码</label>
											<div class="col-sm-9">
												<input type="text" class="form-control inputxt" id="email"
													placeholder="371321******">
											</div>
										</div>
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-3 control-label">工作年限</label>
											<div class="col-sm-9">
												<input type="text" class="form-control inputxt"
													id="workTime" placeholder="xxx">
											</div>
										</div>
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-3 control-label">电子邮箱</label>
											<div class="col-sm-9">
												<input type="text" class="form-control inputxt" id="email"
													placeholder="xxx@163.com">
											</div>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="row">

											<label for="inputEmail3" class="col-sm-3 control-label">性别</label>


											<label class="radio-inline"> <input type="radio"
												name="inlineRadioOptions" id="inlineRadio1" value="option1">
												男
											</label> <label class="radio-inline"> <input type="radio"
												name="inlineRadioOptions" id="inlineRadio1" value="option1">
												女
											</label>
										</div>
										<br />
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-3 control-label">证件类型</label>
											<div class="col-sm-9">
												<input type="text" class="form-control inputxt" id="email"
													placeholder="第二代居民身份证">
											</div>
										</div>
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-3 control-label">婚姻状况</label>
											<div class="col-sm-9">
												<input type="text" class="form-control inputxt" id="email"
													placeholder="未婚">
											</div>
										</div>
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-3 control-label">电话</label>
											<div class="col-sm-9">
												<input type="text" class="form-control inputxt" id="email"
													placeholder="150******">
											</div>
										</div>
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-3 control-label">邮编</label>
											<div class="col-sm-9">
												<input type="text" class="form-control inputxt" id="email"
													placeholder="5019">
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-2 control-label">现居住地点</label>
									<div class="col-sm-8">
										<input type="text" class="form-control inputxt" id="email"
											placeholder="省市区">
									</div>
								</div>

								<form class="form-horizontal" role="form" id="form">
								<div class="page-header">
									<h3>
										求职倾向
									</h3>
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-2 control-label">现任学校名称</label>
									<div class="col-sm-8">
										<input type="text" class="form-control inputxt" id="email"
											placeholder="清华大学">
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-2 control-label">现在所教课程</label>
									<div class="col-sm-8">
										<input type="text" class="form-control inputxt" id="email"
											placeholder="数学">
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-2 control-label">期望所教课程</label>
									<div class="col-sm-8">
										<input type="text" class="form-control inputxt" id="email"
											placeholder="物理">
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-2 control-label">期望薪资待遇</label>
									<div class="col-sm-8">
										<input type="text" class="form-control inputxt" id="email"
											placeholder="2000">
									</div>
								</div>
								<h3>教育经历</h3>
								<table class="table table-bordered" border="3">
									<tr>
										<td>毕业学校</td>
										<td>学历</td>
										<td>专业名称</td>
										<td> </td>
									</tr>
									<tr>
										<td><input type="text"></td>
										<td><input type="text"></td>
										<td><input type="text"></td>
										<td><button type="button" class="btn btn-info">删除</button>											 
										</td>
									</tr>
									<tr>
										<td><input type="text"></td>
										<td><input type="text"></td>
										<td><input type="text"></td>
										<td><button type="button" class="btn btn-info">删除</button>											 
										</td>
									</tr>
									<tr>
										<td><input type="text"></td>
										<td><input type="text"></td>
										<td><input type="text"></td>
										<td><button type="button" class="btn btn-info">删除</button>											 
										</td>
									</tr>
									<tr>
										<td><input type="text"></td>
										<td><input type="text"></td>
										<td><input type="text"></td>
										<td><button type="button" class="btn btn-info">删除</button>											 
										</td>
									</tr>
								</table>
								<h3>工作经历</h3>
								<table class="table table-bordered" border="3">
									<tr>
										<td>工作单位名称</td>
										<td>任职时间</td>
										<td>职位描述</td>
										<td></td>
									</tr>
									<tr>
										<td><input class="form-control input-sm" type="text"
											placeholder=" "></td>
										<td><input class="form-control input-sm" type="text"
											placeholder=" "></td>
										<td><input class="form-control input-sm" type="text"
											placeholder=" "></td>
											<td><button type="button" class="btn btn-info">删除</button>											 
										</td>
									</tr>
									<tr>
										<td><input class="form-control input-sm" type="text"
											placeholder=" "></td>
										<td><input class="form-control input-sm" type="text"
											placeholder=" "></td>
										<td><input class="form-control input-sm" type="text"
											placeholder=" "></td>
											<td><button type="button" class="btn btn-info">删除</button>											 
										</td>
									</tr>
									<tr>
										<td><input class="form-control input-sm" type="text"
											placeholder=" "></td>
										<td><input class="form-control input-sm" type="text"
											placeholder=" "></td>
										<td><input class="form-control input-sm" type="text"
											placeholder=" "></td>
											<td><button type="button" class="btn btn-info">删除</button>											 
										</td>
									</tr>
									<tr>
										<td><input class="form-control input-sm" type="text"
											placeholder=" "></td>
										<td><input class="form-control input-sm" type="text"
											placeholder=" "></td>
										<td><input class="form-control input-sm" type="text"
											placeholder=" "></td>
											<td><button type="button" class="btn btn-info">删除</button>											 
										</td>
									</tr>
								</table>
								<strong><h5>
										获取奖励
										</h5></strong>
								<textarea class="form-control" row="5"></textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-6 col-sm-4">									
<!-- 							<input   type="submit" onClick="location.href='personalCenter.jsp' " class="btn btn-primary btn-lg " value="提交简历"> </input> -->
							<a   href='personalCenter.jsp'  class="btn btn-primary btn-lg " > 提交简历</a>
						</div>										
					</div>
					</form>
				</div>
			</div>
		</div>
    		
    	</div>
    	<%@ include file="buttom.jsp" %>
  </body>
</html>
