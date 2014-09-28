<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="header.jspf" %>
	<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
	<title>登陆后台</title>
  </head>
  
  <body style="background: url('${pageContext.request.contextPath}/image/adm-login-bg.jpg');">
    	<div class="container">
    		<!--登陆表单 -->
    		<%@ include file="head.jsp" %>
		<div class="row" style="margin-top: 250px; ">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-4" >
					<div class="panel panel-primary" style="background:white" data-toggle="tooltip" data-placement="top" title="不是管理员?请立即返回" onmouseover="$(this).tooltip('show')">
						<div class="panel-heading">
							<h2 class="panel-title">管理员登录</h2>
						</div>
						<div class="panel-body">
					<!--表单 -->
							<form action="${pageContext.request.contextPath}/client/loginAdmin/login" class="form-horizontal" role="form" id="form1" name="form1" style="margin-top: 20px" method="post">
								<div class="form-group" align="center">
									<label for="inputEmail3" class="col-sm-3 control-label">用户名:</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="username" name="username" >
									</div>
								</div>
								<div class="form-group" align="center">
									<label for="inputPassword3" class="col-sm-3 control-label">密码:</label>
									<div class="col-sm-9">
										<input type="password" class="form-control" name="password" id="password" >
									</div>
								</div>
								<div class="form-group" align="center">
									<label for="" class="col-sm-3 control-label">验证码</label>
									<div class="col-sm-5">
										<input type="text" class="form-control" name="valifCode" id="valifCode" >
									</div>
									<div class="col-sm-3">
										<img alt="验证码" class="control-label" src="${pageContext.request.contextPath}/client/valifImage">
									</div>
								</div>
								
								<div class="form-group">
									<div class="col-sm-offset-3 col-sm-10">
										<button type="submit" class="btn btn-warning">管理员登录</button>
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
<!--     	container -->
		<script type="text/javascript">
		$(function() {  
			$("#form1").validate({
				rules:{
					username: {
						required:true
					},
					password: {
						required:true,
						minlength:2
					}
					
				},
				messages:{
					username:"请输入用户名",
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
    	
  </body>
</html>
