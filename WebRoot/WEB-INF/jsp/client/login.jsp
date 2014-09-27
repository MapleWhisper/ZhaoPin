<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="header.jspf" %>
	
	<title >用户登录</title>
	<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
	
  </head>
  
  <body style="background:url(${pageContext.request.contextPath}/image/login-bg.jpg);">
    	<div class="container">
    		<%@ include file="head.jsp" %>
    		
    				<!--登陆表单 -->
		<div class="row" style="margin-top: 220px; ">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-4" >
					<div class="panel panel-warning" style="background:white">
						<div class="panel-heading">
							<h3 class="panel-title">登录</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/client/login/login" method="post" style="margin-top: 20px" id="form1">
								<div class="form-group" align="center">
									<label  class="col-sm-3 control-label">邮箱:</label>
									<div class="col-sm-9">
										<input type="email" id="email" class="form-control" name="email">
									</div>
								</div>
								<div class="form-group" align="center">
									<label for="inputPassword3" class="col-sm-3 control-label">密码:</label>
									<div class="col-sm-9">
										<input type="password" class="form-control" name="password" id="password" >
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-6">
										<div class="checkbox">
											<label> <input type="checkbox">记住密码</label>
										</div>
									</div>
									<div class="col-sm-4">
										<div style="margin-top: 7px">
											<a href="#" class="form-control-static">忘记密码？ </a>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-6">
										<button type="submit" class="btn btn-warning"><span
										class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;登陆</button>
									</div>
									<div class=" col-sm-4">
										<a href="${pageContext.request.contextPath}/client/register" class="btn btn-primary btn-sm"><span
										class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;立即注册</a>
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
							<!--登陆表单 -->
						</div>
					</div>

				</div>
			</div>
		</div>
    		
    	</div>
    	<%@ include file="buttom.jsp" %>
  </body>
  <script type="text/javascript">
		$(function() {  
			$("#form1").validate({
				rules:{
					email: {
						required:true,
						email:true
					},
					password: {
						required:true,
						minlength:2
					}
					
				},
				messages:{
					email:"请输入正确邮箱地址",
					password:{
						required:"请输入密码",
						minlength:"长度需要大于3"
					}
				}
			});  
		});
		$(function(){
			var p = $("#e1").text();
			if( p.length==11){
				$("#e2").remove();
			}
		});
	
	</script>
</html>
