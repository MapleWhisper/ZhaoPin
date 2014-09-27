<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<html>
<head>
<%@ include file="header.jspf"%>

<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js">
</script>

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
				<form action="${pageContext.request.contextPath}/admin/position/update" method="post">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">
							<div class="row">
								<div class="col-sm-8">
									职位名称
									<div class="form-group ">
										<input type="text" name="name" class="form-control" value="${position.name }">
										<input hidden="hidden" name="id" value="${position.id }"/>
									</div>
								</div>
								<div class="col-sm-4 ">
									截止日期  	
									<div class="form-group ">
										<input type="text" name="endDate" class="form-control" onClick="WdatePicker()" value="<fm:formatDate value="${position.endDate}"></fm:formatDate>">
									</div>
								</div>
							</div>
						</h3>
					</div>
				</div>



				<div class="panel panel-info" style="margin-top: 20px;">
					<div class="panel-body">
						<table class="table table-striped table-hover table-bordered ">
							<tr>
								<td class="info">职位类型</td>
								<td>
									<div class="input-group input-group-sm">
										<select class="form-control"  name="position">								
											<option value="教育" selected="selected">教育&nbsp;&nbsp;&nbsp;</option>
											<option value="管理" selected="selected">管理</option>
											<option value="技术">技术</option>
										</select>	
									</div>
									
										
								</td>
								<td class="info">职位性质</td>
								<td>
									<div class="input-group input-group-sm">
										
										<select class="form-control" name="type">
											<option value="不限" selected>不限</option>
											<option value="全职" >全职</option>
											<option value="专职">专职</option>
											<option value="兼职">兼职</option>
											<option value="实习">实习</option>
										</select>
									</div>
								</td>
								

								<td class="info">工作经验</td>
								<td>
									<div class="input-group input-group-sm">
										<select class="form-control" name="workExper">
											<option value="不限" selected>不限</option>
											<option value="应届毕业生">应届毕业生</option>
											<option value="一年以下">一年以下</option>
											<option value="1-3年">1-3年</option>
											<option value="3-5年">3-5年</option>
											<option value="5-10年">5-10年</option>
											<option value="10年以上">10年以上</option>
										</select>
										
									</div>
								</td>

								
							</tr>

							<tr>
								<td class="info">最低学历</td>
								<td>
									<div class="input-group input-group-sm">
										<select class="form-control" name="educationNeed">
											<option value="不限" selected>不限</option>
											<option value="高中">高中</option>
											<option value="专科">专科</option>
											<option value="本科">本科</option>
											<option value="研究生">研究生</option>
											<option value="博士">博士</option>
										</select>
									</div>
								</td>
								<td class="info">薪资待遇</td>
								<td>
									<div class="input-group input-group-sm">
										
										<select class="form-control" name="salary">
											<option value="" selected>空</option>
											<option value="面谈">面谈</option>
										</select>
									</div>
								</td>

								<td class="info">语言要求</td>
								<td>
									<div class="input-group input-group-sm">
										<select class="form-control" name="languageNeed">
											<option value="不限" selected>不限</option>
											<option value="普通话">普通话</option>
											<option value="普通话 英语">普通话   英语</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td class="info">工作地点</td>
								<td>
									<div class="input-group input-group-sm">
										<select class="form-control" name="workPlace">
											<option value="哈尔滨" selected>哈尔滨</option>
											
										</select>
									</div>
								</td>
								<td class="info">招聘人数</td>
								<td>
									<div class="input-group input-group-sm">
										<input type="text" name="recruitNumber" class="form-control" value="${position.recruitNumber }">
									</div>
								</td>
							</tr>
						</table>
						<div class="panel panel-info">
							<div class="panel-heading">岗位要求</div>
							<div class="panel-body"
								style="padding-top:10px;padding-bottom: 10px">
								<div class="questArea">
									<textarea class="form-control" name="positionInfo" rows="10" >${position.positionInfo }</textarea>
								</div>
							</div>
							<div class="panel-footer">
								<center>
									<input type="submit" class="btn btn-info btn-lg" value="确认修改职位信息">
								</center>
							</div>
						</div>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>


	<!--container -->
	<%@ include file="buttom.jsp"%>
</body>
</html>
