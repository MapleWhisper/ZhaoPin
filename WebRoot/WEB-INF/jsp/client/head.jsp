<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

	<!--导航条 -->
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
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
						<li class="active"><a href="${pageContext.request.contextPath}/client/index">社会招聘</a></li>
						<li><a href="${pageContext.request.contextPath}/client/company">公司介绍</a></li>
					</ul>
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="搜索岗位">
						</div>
						<button type="submit" class="btn btn-default">提交</button>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<li><p class="navbar-text">欢迎来到 集团招聘！</p></li>
						<li><a href="${pageContext.request.contextPath}/client/personalCenter">个人中心</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/admin">登陆后台</a></li>
						<li><a href="${pageContext.request.contextPath}/client/login"><span
								class="glyphicon glyphicon-log-in"></span>登陆</a></li>
						<li><a href="${pageContext.request.contextPath}/client/register"><span
								class="glyphicon glyphicon-registration-mark"></span>注册</a></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
		<!--导航条 -->
