<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="header.jspf"%>
<title>帮助中心</title>
<style type="text/css">
#nav {
	position: fixed;
	width: 250px
}
</style>
</head>

<body style="background-color: #f5f5f5">
	<div class="container" >
		<%@ include file="head.jsp"%>

		<div class="page-header">
			<h2 class=""></h2>
		</div>
		<div class="row">
			<!--左侧的导航条 -->
			<div class="col-xs-3">
				<div class="list-group" role="tablist" id="nav">
					<c:forEach items="${helpList}" var="com">
							<c:if test="${com.id == article.id }">
							<a href="${pageContext.request.contextPath}/client/article/show/id/${com.id}" class="list-group-item active">
								${com.title}<span style="float: right;"><span class="glyphicon glyphicon-chevron-right"></span></span></a>
						</c:if>
						<c:if test="${com.id != article.id }">
							<a href="${pageContext.request.contextPath}/client/article/show/id/${com.id}" class="list-group-item">
								${com.title}<span style="float: right;"><span class="glyphicon glyphicon-chevron-right"></span></span></a>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<!--左侧的导航条 -->


			<div class="col-xs-9" style="background-color: repeat;">
				<!-- style="background-image: url(${pageContext.request.contextPath}/image/company.jpg);  -->
				<div class="row">
					<div class="panel panel-default">
					  <div class="panel-body">
						  <div class="page-header">
						 	 <h1><span class="glyphicon glyphicon-tags"></span>
						 	 ${article.title} <small>Support Center</small></h1>
						  </div>
								<div style="padding: 30px;">
								<p>
									${article.context }
								</p>
								</div>
					  </div>
					</div>
				</div>
			</div><!-- col-xs-8 -->
			
		</div><!-- row -->
		
	</div><!-- container -->


	<%@ include file="buttom.jsp"%>
</body>
</html>
