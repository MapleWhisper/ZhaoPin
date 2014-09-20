
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
					<div class="panel-heading">管理员信息填写</div>

					<div class="panel-body">
					<div class="row">
						<div class="col-sm-8 col-sm-offset-2">
							<form class="form-horizontal" role="form" id="form">
								<div class="form-group">
									
									<label for="inputEmail3" class="col-sm-3 control-label">管理员账号</label>
									<div class="col-sm-9">
										<input type="text" class="form-control inputxt" id="username"
											placeholder="1205">
									</div>
								</div>
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">输入密码</label>
									<div class="col-sm-9">
										<input type="text" class="form-control inputxt" id="username"
											placeholder="123****">
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">确认输入密码</label>
									<div class="col-sm-9">
										<input type="text" class="form-control inputxt" id="username"
											placeholder="123****">
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">姓名</label>
									<div class="col-sm-9">
										<input type="text" class="form-control inputxt" id="username"
											placeholder="张三">
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
											<button type="submit" class="btn btn-info  btn-lg ">提交管理员</button>																			 
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

