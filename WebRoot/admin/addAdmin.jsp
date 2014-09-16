
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="header.jspf"%>
</head>

<body>
	<div class="container">
		<%@ include file="head.jsp" %>
		<div class="row " style="margin-top: 60px">
			<div class="col-sm-4">
				<%@ include file="left.jsp"%>
			</div>
			<div class="col-sm-8 ">
				<div class="panel panel-primary">
					<div class="panel-heading">管理员信息填写</div>

					<div class="panel-body">
					<div class="row">
						<div class="col-sm-8 col-sm-offset-2">
							<form class="form-horizontal" role="form" id="form">
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">教师编号</label>
								<div class="col-sm-9">
									<input type="text" class="form-control inputxt" id="username"
										placeholder="1205">
								</div>

								<label for="inputEmail3" class="col-sm-3 control-label">姓名</label>
								<div class="col-sm-9">
									<input type="text" class="form-control inputxt" id="username"
										placeholder="张三">
								</div>
								<label for="inputEmail3" class="col-sm-3 control-label">账号</label>
								<div class="col-sm-9">
									<input type="text" class="form-control inputxt" id="username"
										placeholder="123****">
								</div>


								<label for="inputEmail3" class="col-sm-3 control-label">职位</label>
								<div class="col-sm-9">
									<input type="text" class="form-control inputxt" id="username"
										placeholder="语文老师">
								</div>
								<br/>
								
								<div class="form-group">    
									 <div class="col-sm-6 col-sm-offset-4">
										<button type="submit" class="btn btn-info  btn-lg ">确定设置管理员</button>																			 
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

</body>
</html>

