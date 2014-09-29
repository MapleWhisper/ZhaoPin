<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
	<!--导航条 -->
		<nav class="navbar navbar-default navbar-fixed-top navbar-inverse" role="navigation">
			
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#"><strong>教育公司图标</strong></a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">				
						<li class="active"><a href="${pageContext.request.contextPath}/admin/admin">后台管理</a></li>
						<li ><a href="${pageContext.request.contextPath}/client/index"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;前台页面</a></li>
					</ul>
					<form class="navbar-form navbar-left" role="search">
						
					</form>
					<ul class="nav navbar-nav navbar-right">
						<li ><p class="navbar-text" >你好，超级管理员</p></li>
						
						<li ><a href="${pageContext.request.contextPath}/admin/position/resetPwdUI">修改密码</a></li>
						<li class="active"><a href="${pageContext.request.contextPath}/admin/position/logout"><span class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;退出登陆</a></li>
						
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
		<!--导航条 -->
		
		