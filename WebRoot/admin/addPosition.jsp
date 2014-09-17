<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="header.jspf"%>
</head>


<body>
	<!--container -->
	<div class="container">
		<%@ include file="head.jsp"%>
		<div class="row" style="margin-top: 70px ">
			<div class="col-sm-3">
				<%@ include file="left.jsp"%>
			</div>
			<div class="col-sm-9">
				<div class="panel panel-warning">
					<div class="panel-heading">
						<h3 class="panel-title">
							<div class="row">
								<div class="col-sm-3">
									职位名称
									<div class="input-group input-group-sm">
										<input type="text" class="form-control">
									</div>
								</div>
								<div class="col-sm-3 col-sm-offset-6">
									截止日期
									<div class="input-group input-group-sm">
										<input type="text" class="form-control">
									</div>
								</div>
							</div>
						</h3>
					</div>
				</div>



				<div class="panel panel-info" style="margin-top: 20px;margin-bottom: 100px">
					<div class="panel-body">
						<table class="table table-striped table-hover table-bordered ">
							<tr>
								<td class="info">职位性质</td>
								<td>
									<div class="input-group input-group-sm">
										<input type="text" class="form-control">
									</div>
								</td>

								<td class="info">工作经验</td>
								<td>
									<div class="input-group input-group-sm">
										<input type="text" class="form-control">
									</div>
								</td>

								<td class="info">招聘人数</td>
								<td>
									<div class="input-group input-group-sm">
										<input type="text" class="form-control">
									</div>
								</td>
							</tr>

							<tr>
								<td class="info">最低学历</td>
								<td>
									<div class="input-group input-group-sm">
										<input type="text" class="form-control">
									</div>
								</td>
								<td class="info">薪资待遇</td>
								<td>
									<div class="input-group input-group-sm">
										<input type="text" class="form-control">
									</div>
								</td>

								<td class="info">语言要求</td>
								<td>
									<div class="input-group input-group-sm">
										<input type="text" class="form-control">
									</div>
								</td>
							</tr>
						</table>
						<div class="panel panel-warning">
							<div class="panel-heading">岗位要求</div>
							<div class="panel-body"
								style="padding-top:10px;padding-bottom: 10px">
								<div class="questArea">
									<textarea class="form-control" rows="5"></textarea>
								</div>
							</div>
							<div class="panel-footer">
								<center>
									<a href="" class="btn btn-primary btn-lg">上传职位</a>
								</center>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!--container -->
	<%@ include file="buttom.jsp"%>
</body>
</html>
