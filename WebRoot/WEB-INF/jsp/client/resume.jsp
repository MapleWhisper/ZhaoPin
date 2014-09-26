<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="header.jspf"%>
</head>

<body>
	<div class="container">
		<%@ include file="head.jsp"%>
		<div class="row" style="margin-top: 100px;margin-top:150px">
			<div class="col-sm-10 col-sm-offset-1">
				<div class="panel panel-default">
					<div class="panel-heading">个人信息简介</div>
					<div class="panel-body">
						<form action="resume/save" class="form-horizontal" role="form" id="form" method="post">
						<div class="row">
							<div class="col-sm-2">
								<div class="col-sm-4">
									<button class="btn btn-primary btn-lg" style="border-top:1px">上传图片</button>
								</div>
							</div>
							<div class="col-sm-10 ">
									<div class="page-header">
										<h3>个人信息基础</h3>
									</div>
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label for="inputEmail3" class="col-sm-3 control-label">姓名</label>
												<div class="col-sm-6">
													<input type="text" class="form-control inputxt" name="name"
														id="username" placeholder="姓名">
												</div>
											</div>
											<div class="form-group">
												<label for="inputEmail3" class="col-sm-3 control-label">出生日期</label>
												<div class="col-sm-6">
													<input type="text" class="form-control inputxt"
														name="birthday" id="dataTime" placeholder="年">
												</div>
											</div>
											<div class="form-group">
												<label for="inputEmail3" class="col-sm-3 control-label">证件号码</label>
												<div class="col-sm-9">
													<input type="text" class="form-control inputxt" id="email"
														name="idNumber" placeholder="371321******">
												</div>
											</div>
											<div class="form-group">
												<label for="inputEmail3" class="col-sm-3 control-label">工作年限</label>
												<div class="col-sm-9">
													<input type="text" class="form-control inputxt"
														name="workAge" id="workTime" placeholder="xxx">
												</div>
											</div>
											<div class="form-group">
												<label for="inputEmail3" class="col-sm-3 control-label">电子邮箱</label>
												<div class="col-sm-9">
													<input type="text" class="form-control inputxt" id="email"
														name="email" placeholder="xxx@163.com">
												</div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="row">

												<label for="inputEmail3" class="col-sm-3 control-label">性别</label>


												<label class="radio-inline"> <input type="radio"
													name="sex" id="inlineRadio1" value="男"> 男
												</label> <label class="radio-inline"> <input type="radio"
													name="sex" id="inlineRadio1" value="女"> 女
												</label>
											</div>
											<br />
											<div class="form-group">
												<label for="inputEmail3" class="col-sm-3 control-label">证件类型</label>
												<div class="col-sm-9">
													<input type="text" class="form-control inputxt" id="email"
														name="idType" placeholder="第二代居民身份证">
												</div>
											</div>
											<div class="form-group">
												<label for="inputEmail3" class="col-sm-3 control-label">婚姻状况</label>
												<div class="col-sm-9">
													<input type="text" class="form-control inputxt" id="email"
														name="marry" placeholder="未婚">
												</div>
											</div>
											<div class="form-group">
												<label for="inputEmail3" class="col-sm-3 control-label">电话</label>
												<div class="col-sm-9">
													<input type="text" class="form-control inputxt" id="email"
														name="phoneNumber" placeholder="150******">
												</div>
											</div>

										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-2 control-label">现居住地点</label>
										<div class="col-sm-8">
											<input type="text" class="form-control inputxt" id="email"
												name="livePlace" placeholder="省市区">
										</div>
									</div>
									<!-- uhgbjhb -->
									
										<div class="page-header">
											<h3>求职倾向</h3>
										</div>
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-2 control-label">现任学校名称</label>
											<div class="col-sm-8">
												<input type="text" class="form-control inputxt" id="email"
													name="schoolName" placeholder="清华大学">
											</div>
										</div>
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-2 control-label">现在所教课程</label>
											<div class="col-sm-8">
												<input type="text" class="form-control inputxt" id="email"
													name="teach" placeholder="数学">
											</div>
										</div>
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-2 control-label">期望所教课程</label>
											<div class="col-sm-8">
												<input type="text" class="form-control inputxt" id="email"
													name="expectClass" placeholder="物理">
											</div>
										</div>
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-2 control-label">期望薪资待遇</label>
											<div class="col-sm-8">
												<input type="text" class="form-control inputxt" id="email"
													name="exceptSalary" placeholder="2000">
											</div>
										</div>
										<h3>教育经历</h3>
										<table class="table table-bordered" >
											<tr>
												<td>毕业学校</td>
												<td>学历</td>
												<td>专业名称</td>
												<td></td>
											</tr>
											<tr>
												<td><input type="text" name="e1"></td>
												<td><input type="text" name="e2"></td>
												<td><input type="text" name="e3"></td>
												<td><button type="button" class="btn btn-info">删除</button>
												</td>
											</tr>
											<tr>
												<td><input type="text" name="e1"></td>
												<td><input type="text" name="e2"></td>
												<td><input type="text" name="e3"></td>
												<td><button type="button" class="btn btn-info">删除</button>
												</td>
											</tr>
											<tr>
												<td><input type="text" name="e1"></td>
												<td><input type="text" name="e2"></td>
												<td><input type="text" name="e3"></td>
												<td><button type="button" class="btn btn-info">删除</button>
												</td>
											</tr>
											<tr>
												<td><input type="text" name="e1"></td>
												<td><input type="text" name="e2"></td>
												<td><input type="text" name="e3"></td>
												<td><button type="button" class="btn btn-info">删除</button>
												</td>
											</tr>
										</table>
										<h3>工作经历</h3>
										<table class="table table-bordered" >
											<tr>
												<td>工作单位名称</td>
												<td>任职时间</td>
												<td>职位描述</td>
												<td></td>
											</tr>
											<tr>
												<td><input class="form-control input-sm" type="text"  name="w1"
													placeholder=" "></td>
												<td><input class="form-control input-sm" type="text"  name="w2"
													placeholder=" "></td>
												<td><input class="form-control input-sm" type="text" name="w3"
													placeholder=" "></td>
												<td><button type="button" class="btn btn-info">删除</button>
												</td>
											</tr>
											<tr>
												<td><input class="form-control input-sm" type="text" name="w1"
													placeholder=" "></td>
												<td><input class="form-control input-sm" type="text"name="w2"
													placeholder=" "></td>
												<td><input class="form-control input-sm" type="text"name="w3"
													placeholder=" "></td>
												<td><button type="button" class="btn btn-info">删除</button>
												</td>
											</tr>
											<tr>
												<td><input class="form-control input-sm" type="text"name="w1"
													placeholder=" "></td>
												<td><input class="form-control input-sm" type="text"name="w2"
													placeholder=" "></td>
												<td><input class="form-control input-sm" type="text"name="w3"
													placeholder=" "></td>
												<td><button type="button" class="btn btn-info">删除</button>
												</td>
											</tr>
											<tr>
												<td><input class="form-control input-sm" type="text" name="w1"
													placeholder=" "></td>
												<td><input class="form-control input-sm" type="text"name="w2"
													placeholder=" "></td>
												<td><input class="form-control input-sm" type="text"name="w3"
													placeholder=" "></td>
												<td><button type="button" class="btn btn-info">删除</button>
												</td>
											</tr>
										</table>
										<h5><strong>获取奖励</strong></h5>
										<textarea class="form-control" rows="5"></textarea>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-6 col-sm-4">
									<input  type="submit"  class="btn btn-primary btn-lg " value="提交简历"> </input> 
									
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
</body>
</html>
