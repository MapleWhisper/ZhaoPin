<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>


<html>
<head>
<%@ include file="header.jspf"%>

<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet"  href="${pageContext.request.contextPath}/js/kindeditor/themes/simple/simple.css" />
<script charset="utf-8" src="${pageContext.request.contextPath}/js/kindeditor/kindeditor-min.js"></script>
<script charset="utf-8" src="${pageContext.request.contextPath}/js/kindeditor/lang/zh_CN.js"></script>
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
										<f:select class="form-control" path="position.position">								
											<f:option value="教育">教育&nbsp;&nbsp;&nbsp;</f:option>
											<f:option value="管理">管理</f:option>
											<f:option value="技术">技术</f:option>
										</f:select>	
									</div>
									
										
								</td>
								<td class="info">职位性质</td>
								<td>
									<div class="input-group input-group-sm">
										
										<f:select class="form-control" path="position.type">
											<f:option value="不限">不限</f:option>
											<f:option value="全职" >全职</f:option>
											<f:option value="专职">专职</f:option>
											<f:option value="兼职">兼职</f:option>
											<f:option value="实习">实习</f:option>
										</f:select>
									</div>
								</td>
								

								<td class="info">工作经验</td>
								<td>
									<div class="input-group input-group-sm">
										<f:select class="form-control" path="position.workExper">
											<f:option value="不限" >不限</f:option>
											<f:option value="应届毕业生">应届毕业生</f:option>
											<f:option value="一年以下">一年以下</f:option>
											<f:option value="1-3年">1-3年</f:option>
											<f:option value="3-5年">3-5年</f:option>
											<f:option value="5-10年">5-10年</f:option>
											<f:option value="10年以上">10年以上</f:option>
										</f:select>
										
									</div>
								</td>

								
							</tr>

							<tr>
								<td class="info">最低学历</td>
								<td>
									<div class="input-group input-group-sm">
										<f:select class="form-control" path="position.educationNeed">
											
											<f:option value="不限" >不限</f:option>
											<f:option value="高中">高中</f:option>
											<f:option value="专科">专科</f:option>
											<f:option value="本科">本科</f:option>
											<f:option value="研究生">研究生</f:option>
											<f:option value="博士">博士</f:option>
										</f:select>
									</div>
								</td>
								<td class="info">薪资待遇</td>
								<td>
									<div class="input-group input-group-sm">
										
										<f:select class="form-control" path="position.salary">
											<f:option value="">空</f:option>
											<f:option value="面谈">面谈</f:option>
										</f:select>
									</div>
								</td>

								<td class="info">语言要求</td>
								<td>
									<div class="input-group input-group-sm">
										<f:select class="form-control" path="position.languageNeed">
											<f:option value="不限">不限</f:option>
											<f:option value="普通话">普通话</f:option>
											<f:option value="普通话 英语">普通话   英语</f:option>
										</f:select>
									</div>
								</td>
							</tr>
							<tr>
								<td class="info">工作地点</td>
								<td>
									<div class="input-group input-group-sm">
										<f:select class="form-control" path="position.workPlace">
											<f:option value="哈尔滨">哈尔滨</f:option>
											
										</f:select>
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
									<textarea class="form-control" id="editor" name="positionInfo" rows="15" >${position.positionInfo }</textarea>
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
	<script type="text/javascript">
		//Html editor
		KindEditor.ready(function(K) {
			editor = K.create('#editor', {
				resizeType : 1,
				allowPreviewEmoticons : false,
				allowImageUpload : false,
				items : [
					'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
					'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
					'insertunorderedlist', '|', 'emoticons', 'image', 'link']
			});

		});
	</script>
</body>
</html>
