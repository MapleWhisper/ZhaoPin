
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="header.jspf"%>
</head>

<body>
	<div class="container">
		<%@ include file="head.jsp" %>
		<div class="row " style="margin-top: 70px">
			<div class="col-sm-3">
				<%@ include file="left.jsp"%>
			</div>
			<div class="col-sm-9 ">
				<div class="panel panel-primary">
					<div class="panel-heading">修改管理员信息</div>

					<div class="panel-body">
					<div class="row">
						<div class="col-sm-8 col-sm-offset-2">
							<form action="${pageContext.request.contextPath}/admin/admin/update" class="form-horizontal" role="form" id="form" method="post">
								<div class="form-group">
									
									<label for="inputEmail3" class="col-sm-3 control-label">管理员账号</label>
									<div class="col-sm-9">
										<input type="text" class="form-control inputxt" id="username" value="${admin.username }">
										<input type="hidden" name="id" value="${admin.id }">
									</div>
								</div>
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">输入新密码</label>
									<div class="col-sm-9">
										<input type="text" class="form-control inputxt" id="username" placeholder="password" value="${admin.password }">
									</div>
								</div>
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">姓名</label>
									<div class="col-sm-9">
										<input type="text" class="form-control inputxt" id="username" value="${admin.name }">
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">职位</label>
									<div class="col-sm-9">
										<input type="text" class="form-control inputxt" name="position" id="username"value="${admin.position }">
									</div>
								</div>
								<div class="form-group" data-toggle="tooltip" data-placement="top" title="可多选" onmouseover="$(this).tooltip('show')">
									<label for="inputEmail3" class="col-sm-3 control-label">权限</label>
									<div class="col-sm-9">
										<label class="checkbox-inline">
										  <input type="checkbox" id="inlineCheckbox1" value="option1"> 岗位管理
										</label>
										<label class="checkbox-inline">
										  <input type="checkbox" id="inlineCheckbox2" value="option2"> 试卷管理
										</label>
										<label class="checkbox-inline">
										  <input type="checkbox" id="inlineCheckbox3" value="option3"> 试卷管理
										</label>
									</div>
								</div>
								<div>
									
									<div class="form-group">    
										 <div class="col-sm-6 col-sm-offset-4">
											<button type="submit" class="btn btn-primary  btn-lg ">确认修改管理员信息</button>																			 
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
<!-- 	container -->
	<%@ include file="buttom.jsp" %>
</body>
</html>

