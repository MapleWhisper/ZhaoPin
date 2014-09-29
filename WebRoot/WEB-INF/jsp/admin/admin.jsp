<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="header.jspf"%>
<style type="text/css">
.no1 {
	margin-top: 30px;
}
</style>
</head>

<body>
	<div class="container">
		<%@ include file="head.jsp"%>
		<div class="row " style="margin-top: 70px">
			<div class="col-sm-3">
				<%@ include file="left.jsp"%>
			</div>
			<div class="col-sm-9 ">
				<div class="panel panel-primary">
					<div class="panel-heading">管理员列表</div>

					<div class="panel-body">
						<table class="table table-hover table-striped table-bordered">
							<tr>
								<td>管理员账号</td>
								<td>管理员姓名</td>
								<td>管理员职位</td>
								<td>操作</td>
								<td>操作</td>
							</tr>
						 <c:forEach items="${adminList}" var="admin">
						 	<tr>
								
								<td>${admin.username }</td>
								<td>${admin.name }</td>
								<td>${admin.position }</td>
								<td><a href="admin/edit/id/${admin.id }" class="btn btn-info"><span class=" glyphicon glyphicon-edit"></span>&nbsp;&nbsp;修改</a></td>
								<td><a href="admin/delete/id/${admin.id}" class="btn btn-danger" onclick="return confirm('确认要删除吗？')"><span class=" glyphicon  glyphicon-trash"></span>&nbsp;&nbsp;删除</a></td>
							</tr>																								
						 </c:forEach>
							
							
						</table>
						<div class="row">
							<div class="col-sm-6 col-sm-offset-5">
								<div class="no1">				 
									<a class="btn btn-primary " href="admin/add">添加管理员</a>
								</div>

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

