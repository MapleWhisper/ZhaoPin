<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="header.jspf" %>
	  <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
  </head>
  
  <body style="background: url(${pageContext.request.contextPath}/image/register-bg.jpg);">

    	<div class="container">
    		<%@ include file="head.jsp" %>
    		<div class="row" style="margin-top: 100px">
			<div class="col-sm-6 col-sm-offset-3">
				<div class="panel panel-primary">
					<div class="panel-heading">注册信息</div>
					<div class="panel-body">
						<div class="row">
							
								<form action="${pageContext.request.contextPath}/client/register/save" class="form-horizontal" role="form" id="form1" method="post">
									
									<div class="form-group">
										<label for="email" class="col-sm-3 control-label"
											id="">邮箱</label>
										<div class="col-sm-8">
											<input type="email"  name="email" class="form-control" id="email"
												>
										</div>
									</div>
									
									<div class="form-group">
										<label for="password" class="col-sm-3 control-label">密码</label>
										<div class="col-sm-8">
											<input type="password" name="password" class="form-control" id="password">
										</div>
									</div>

									<div class="form-group">
										<label for="inputPassword3" class="col-sm-3 control-label">确认密码</label>
										<div class="col-sm-8">
											<input type="password" class="form-control" name="password2" id="password2">
										</div>
									</div>

									
									<div class="form-group">
										<label for="inputPassword3" class="col-sm-3 control-label"
											id="">真实姓名</label>
										<div class="col-sm-8">
											<input type="text"  class="form-control" name="name" id="name" >
										</div>
									</div>
									
									


									<div class="form-group">
										<label for="inputPassword3" class="col-sm-3 control-label">手机号</label>
										<div class="col-sm-8">
											<input type="text" name="phoneNumber" class="form-control" id="phoneNumber">
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
										<div class="col-sm-offset-2 col-sm-3">
											<button type="submit" class="btn btn-info">注册</button>
										</div>
										<div class="col-sm-6" id="e2">
											<div class="alert alert-danger alert-dismissible" role="alert">
  												<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
 												 <div id="e1">${error}</div>
											</div>
										</div>
									</div>
								</form>

							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
    		
    	</div>
    	<%@ include file="buttom.jsp" %>
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
					},
					password2: {
						required:true,
						minlength:2,
						equalTo:"#password"
					},
					name: {
						required:true,
						minlength:2
					},
					phoneNumber: {
						required:true,
					}
					
				},
				messages:{
					email: {
						required:"请输入邮箱",
						email:"请输入邮箱正确格式"
					},
					password: {
						required:"请输入密码",
						minlength:"密码长度需要大于2"
					},
					password2: {
						required:"请输入确认密码",
						minlength:"密码长度需要大于2",
						equalTo:"两次密码必须相同"
					},
					name: {
						required:"请输入姓名",
						minlength:"姓名长度不可以小于2"
					},
					phoneNumber: {
						required:"请输入手机号"
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
