<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="header.jspf" %>
  </head>
  
  <body style="background:url(../image/login-bg.jpg);">
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
							<form class="form-horizontal" role="form"
								style="margin-top: 20px">
								<div class="form-group" align="center">
									<label for="inputEmail3" class="col-sm-3 control-label">邮箱:</label>
									<div class="col-sm-9">
										<input type="email" class="form-control" id="inputEmail3"
											placeholder="username">
									</div>
								</div>
								<div class="form-group" align="center">
									<label for="inputPassword3" class="col-sm-3 control-label">密码:</label>
									<div class="col-sm-9">
										<input type="password" class="form-control"
											id="inputPassword3" placeholder="password">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-6">
										<div class="checkbox">
											<label> <input type="checkbox">记住密码
											</label>
										</div>
									</div>
									<div class="col-sm-4">
										<div style="margin-top: 7px">
											
											<a href="#" class="form-control-static">忘记密码？ </a>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<button type="submit" class="btn btn-warning"><span
									class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;登陆</button>
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
</html>
