<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="header.jspf"%>
</head>
<body>
	<div class="container">
		<%@ include file="head.jsp"%>
		<!-- 弹出按钮 -->
		<div class="container" style="margin-top: 70px">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseOne" aria-expanded="true"
							aria-controls="collapseOne">
							<button type="button" class="btn btn-info btn-lg">我的简介</button>
						</a> </br>
					</h4>
				</div>
				<div id="collapseOne" class="panel-collapse collapse "
					role="tabpanel">
					<div class="panel-body">
						<!-- 我的简介 表单 -->
						<!-- 我的简介 表单 -->
						<!-- 我的简介 表单 -->
						<!-- 我的简介 表单 -->
						<!-- 栅格 -->
						<div calss="row">
							<div class="col-md-8">

								<table class="table table-striped table-hover">
									<tr>
										<td>姓名</td>
										<td>${sessionScope.user.name}</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>邮箱</td>
										<td>${sessionScope.user.email}</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>手机号</td>
										<td>${sessionScope.user.phoneNumber}</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>
											<button class="btn btn-info btn-lg" style="border-top:1px">修改密码</button>
										</td>
										<td></td>
										<td>
											<a href="/client/"><button class="btn btn-info btn-lg" 
														style="border-top:1px">个人简历完善</button></a>	
										</td>
										<td></td>
									</tr>
								</table>

							</div>

							<div class="col-md-4">照片</div>
						</div>

					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseTwo" aria-expanded="true"
							aria-controls="collapseTwo">
							<button type="button" class="btn btn-warning btn-lg">我的申请</button>
						</a>
					</h4>
				</div>
				<div id="collapseTwo" class="panel-collapse collapse in"
					role="tabpanel">
					<div class="panel-body">
						<!-- 我的申请 -->
						<!-- 我的申请 -->
						<div class="table-responsive">
							<table class="table table-striped table-hover">
								<tr>
									<td>职位名称</td>
									<td>工作地点</td>
									<td>申请日期</td>
									<td>申请状态</td>

								</tr>
								<c:forEach items="${appalyList}" var="al">
								<tr class="data">									 
									<td>${al.position.name }</td>
									<td>${al.position.workPlace }</td>
									<td>${al.position.createdate }</td>
								
									<td><fm:formatDate value="${as.position.createdate}"
											pattern="yyyy-MM-dd"></fm:formatDate></td>
									<td>${al.state }</td>
								</tr>
									
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<%@ include file="buttom.jsp"%>
</body>
</html>
