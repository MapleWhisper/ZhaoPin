<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="header.jspf"%>
<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
<title>${sessionScope.user.name}</title>
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
							<button type="button" class="btn btn-info btn-lg">${sessionScope.user.name}的简介</button>
						</a> </br>
					</h4>
				</div>
				<div id="collapseOne" class="panel-collapse collapse in "
					role="tabpanel">
					<div class="panel-body">
						<!-- 我的简介 表单 -->
						<!-- 我的简介 表单 -->
						<!-- 我的简介 表单 -->
						<!-- 我的简介 表单 -->
						<!-- 栅格 -->
						<div calss="row">
							<div class="col-md-9">

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
										
											<a data-toggle="collapse" data-parent="#accordion"
											href="#collapseThree" aria-expanded="true"
											aria-controls="collapseThree">
											<button class="btn btn-info btn-lg" style="border-top:1px">修改用户密码</button>
											</a>
										 
										</td>
										<td>
									<c:if test="${sessionScope.user.resume.id!=null}">
											<a target="_blank" class="btn btn-info btn-lg" href="${pageContext.request.contextPath}/client/resume/show/${sessionScope.user.resume.id}">查看我的简历</a>
					
										<td>
											<a href="${pageContext.request.contextPath}/client/resume/edit/${sessionScope.user.resume.id}" class="btn btn-info btn-lg"  style="border-top:1px">个人简历完善</a>	
										</td>
										
									</c:if>
									</td>
									<td>
									<c:if test="${sessionScope.user.resume.id==null}">
											<a target="_blank" class="btn btn-info btn-lg" href="${pageContext.request.contextPath}/client/resume">提交我的简历</a>
					
									</c:if>
									</td>
									<td></td>
										
									</tr>
								</table>
										<c:if test="${error!=null }">
											<div id="collapseThree" class="panel-collapse collapse in">
										</c:if>
										<c:if test="${error==null }">
											<div id="collapseThree" class="panel-collapse collapse">
										</c:if>
										<form action="${pageContext.request.contextPath}/client/updatePwd" name="form1" id="form1" method="post" >
											<table class="table table-striped table-hover">
												<tr>
													<td>原密码</td>
												
													<td><input type="password" name="oldPwd" id="oldPwd"><br></td>
													<td></td>	<td></td>
													
													</tr>
													<tr>
														<td>新密码</td>
														<td>	<input type="password" name="newPwd" id="newPwd"><br></td>
														<td></td>	<td></td>
														
														
														</tr>
														<tr>
														<td>确认密码</td>
														<td><input type="password" name="newPwd1" id="newPwd1" ></td>
														<td></td>
															<td></td>
														
														</tr>
														<tr>
														<td><button type="submit" class="btn btn-primary">提交修改</button></td>
														<td></td>
														<td></td>
															<td></td>
														
														
														</tr>
												
												
												
												</table>
											
										
											
											
											<div class="col-sm-6" id="e2">
												<div class="alert alert-danger alert-dismissible" role="alert">
  													<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
 												 	<div id="e1">${error}</div>
												</div>
											</div>
											</form>
										</div>

							</div>
							
							<c:if test="${sessionScope.user.resume.userPicPath !=null}">
							<div class="col-sm-3" style="mamargin-right:100px">
								<img height="200px" width="200px" src="${pageContext.request.contextPath}/${sessionScope.user.resume.userPicPath}" style="mamargin-right:100px"/>
							</div>
							</c:if>
							<c:if test="${sessionScope.user.resume.userPicPath ==null}">
							<div class="col-sm-3" style="mamargin-right:100px">
								<img height="200px" width="200px" src="${pageContext.request.contextPath}/image/User_default_pic.jpg" style="mamargin-right:100px"/>
							</div>
							</c:if>
				
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseTwo" aria-expanded="true"
							aria-controls="collapseTwo">
							<button type="button" class="btn btn-warning btn-lg">${sessionScope.user.name}的申请</button>
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
									<td>申请进度</td>

								</tr>
								<c:forEach items="${appalyList}" var="al">
								<tr class="data">									 
									<td><a href="position/show/id/${al.position.id}">${al.position.name }</a></td>
									<td>${al.position.workPlace }</td>
									<td><fm:formatDate value="${al.applyDate}" pattern="yyyy-MM-dd HH:mm"></fm:formatDate></td>
									<td>${al.state}</td>
									<td>
										<c:if test="${al.state =='待审核' }">
											<div class="progress">
												  <div id="" id="progress-bar" class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" 
										  			style="width: 25%">25%
										 		 </div>
											</div>
										</c:if>
										<c:if test="${al.state =='待答题' }">
											<div class="progress">
												  <div id="" id="progress-bar" class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" 
										  			style="width: 50%">50%
										 		 </div>
											</div>
										</c:if>
										<c:if test="${al.state =='待批阅' }">
											<div class="progress">
												  <div id="" id="progress-bar" class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" 
										  			style="width: 75%">75%
										 		 </div>
											</div>
										</c:if>
										<c:if test="${al.state =='已完成' }">
											<div class="progress">
												  <div id="" id="progress-bar" class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" 
										  			style="width: 100%">恭喜
										 		 </div>
											</div>
										</c:if>
										<c:if test="${al.state =='已拒绝' }">
											<div class="progress">
												  <div id="" id="progress-bar" class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar" 
										  			style="width: 100%">很遗憾
										 		 </div>
											</div>
										</c:if>
										
									</td>
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
	<script type="text/javascript">
    	$(function() {  
			$("#form1").validate({
				rules:{
					oldPwd: {
						required:true
					},
					newPwd: {
						required:true,
						minlength:4
					},
					newPwd1: {
						required:true,
						equalTo:"#newPwd"
					}
					
				},
				messages:{
					oldPwd: {
						required:"请输入原密码"
					},
					newPwd: {
						required:"请输入密码",
							minlength:"请输入至少4位密码"
					},
					newPwd1: {
						required:"请输入确认密码",
						equalTo:"两次密码必须相同"
					}
				}
			});  
		});
    	$(function(){
			var p = $("#e1").text();
			if( p.length==0){
				$("#e2").remove();
			}
		});
    	</script>
</body>
</html>
