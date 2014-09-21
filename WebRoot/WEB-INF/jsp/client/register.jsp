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
							
								<form action="register/save" class="form-horizontal" role="form" id="form" method="post">
									
									<div class="form-group">
										<label for="inputPassword3" class="col-sm-3 control-label"
											id="">邮箱</label>
										<div class="col-sm-8">
											<input type="email"  name="email" class="form-control" id="email"
												>
										</div>
									</div>
									
									<div class="form-group">
										<label for="inputPassword3" class="col-sm-3 control-label">密码</label>
										<div class="col-sm-8">
											<input type="password" name="password" class="form-control" id="pwd1"
												>
										</div>
									</div>

									<div class="form-group">
										<label for="inputPassword3" class="col-sm-3 control-label">确认密码</label>
										<div class="col-sm-8">
											<input type="password" class="form-control" id="pwd2"
												>
										</div>
									</div>

									
									<div class="form-group">
										<label for="inputPassword3" class="col-sm-3 control-label"
											id="">真实姓名</label>
										<div class="col-sm-8">
											<input type="text" name="name" class="form-control" id="name" >
										</div>
									</div>
									
									


									<div class="form-group">
										<label for="inputPassword3" class="col-sm-3 control-label">手机号</label>
										<div class="col-sm-8">
											<input type="text" name="phoneNumber" class="form-control" id="phoneNumber"
												>
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
