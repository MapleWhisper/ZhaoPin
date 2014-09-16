<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="header.jspf" %>
  </head>
  
  <body style="background: url('../image/admin-login-bg.jpg');">
    	<div class="container">
    		<!--登陆表单 -->
		<div class="row" style="margin-top: 250px; ">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-4" >
					<div class="panel panel-primary" style="background:white" data-toggle="tooltip" data-placement="top" title="不是管理员?请立即返回" onmouseover="$(this).tooltip('show')">
						<div class="panel-heading">
							<h2 class="panel-title">管理员登录</h2>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" role="form"
								style="margin-top: 20px">
								<div class="form-group" align="center">
									<label for="inputEmail3" class="col-sm-3 control-label">用户名:</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="inputEmail3"
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
									<div class="col-sm-offset-3 col-sm-10">
									<!--  
										<button type="submit" class="btn btn-warning">登录</button>
									-->
									<a href="admin.jsp" class="btn btn-primary" >管理员登陆</a>
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
		
    	
  </body>
</html>
