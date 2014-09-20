<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="header.jspf" %>
  </head>
  
  <body style="background: url(../image/register-bg.jpg);">
    	<div class="container">
    		<%@ include file="head.jsp" %>
    		<div class="row" style="margin-top: 100px">
			<div class="col-sm-6 col-sm-offset-3">
				<div class="panel panel-primary">
					<div class="panel-heading">注册信息</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-sm-4" >
								<button class="btn btn-primary btn-lg" style="border-top:1px">上传图片</button>
							</div>
							<div class="col-sm-8">
								<form class="form-horizontal" role="form" id="form">
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-3 control-label">账号</label>
										<div class="col-sm-9">
											<input type="text" class="form-control inputxt" id="username" 
												placeholder="账号">
										</div>
										
										
									</div>
									<div class="form-group">
										<label for="inputPassword3" class="col-sm-3 control-label">密码</label>
										<div class="col-sm-9">
											<input type="password" class="form-control" id="pwd1"
												placeholder="Password">
										</div>
									</div>

									<div class="form-group">
										<label for="inputPassword3" class="col-sm-3 control-label">确认密码</label>
										<div class="col-sm-9">
											<input type="password" class="form-control" id="pwd2"
												placeholder="Password">
										</div>
									</div>


									<div class="form-group">
										<label for="inputPassword3" class="col-sm-3 control-label"
											id="">邮箱</label>
										<div class="col-sm-9">
											<input type="email" class="form-control" id="email"
												placeholder="Email">
										</div>
									</div>


									<div class="form-group">
										<label for="inputPassword3" class="col-sm-3 control-label">手机号</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" id="phoneNumber"
												placeholder="Photo">
										</div>
									</div>




									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<button type="submit" class="btn btn-info">注册</button>
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
  </body>
</html>
