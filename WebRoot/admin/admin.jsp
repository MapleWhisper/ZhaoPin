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
		<div class="row">
			<div class="col-sm-4">
				<%@ include file="left.jsp"%>
			</div>
			<div class="col-sm-8 ">
				<div class="panel panel-primary">
					<div class="panel-heading">管理员列表</div>

					<div class="panel-body">
						<table class="table table-hover table-striped table-bordered">
							<tr>
								<td>管理员姓名</td>
								<td>管理员账号</td>
								<td>管理员职位</td>
								<td>操作</td>
								<td>操作</td>
							</tr>
							<tr>
								<td>武玉密</td>
								<td>admin</td>
								<td>超级管理员</td>
								<td><button type="submit" class="btn btn-info">修改</button></td>
								<td><button type="submit" class="btn btn-danger">删除</button></td>
							</tr>
						</table>
						<div class="row">
							<div class="col-sm-6 col-sm-offset-5">
								<div class="no1">
									<a class="btn btn-success " href="#">添加管理员</a>
								</div>

							</div>
						</div>


					</div>



				</div>
			</div>

		</div>
</body>
</html>

