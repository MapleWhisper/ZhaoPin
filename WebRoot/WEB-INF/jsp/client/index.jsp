<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="header.jspf" %>
  </head>
  
  <body style="background: url(${pageContext.request.contextPath}/image/index-bg.jpg) repeat;">
    	<div  style="margin-top: 50px">
			<img width="100%" src="${pageContext.request.contextPath}/image/index-im1.jpg">
	</div>

	<!--container -->
	<div class="container">
		<%@ include file="head.jsp" %>
		
		<div class="row" style="margin-top: 20px">
			<div class="col-md-9">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">职位分类</h3>
					</div>
					<div class="panel-body">
						<!--  搜索框注释
							<form class="form-inline" role="form">
								<div class="form-group">
									<label class="sr-only" for="exampleInputEmail2">输入职位</label> 
									<input type="text" class="form-control" id="exampleInputEmail2" placeholder="Enter email">
								</div>
								<button type="submit" class="btn btn-default">搜索</button>
							</form>
						-->
						<div>
							<table>
								<tr>	
									<td>工作地点:</td>
									<td><a href="#" class="hre">哈尔滨</a></td>
									
								</tr>
								<tr>
									<td>职位类别：</td>
									<td><a href="#" style="margin-left: 10px;"> 综合类</a></td>
									<td><a href="#" style="margin-left: 10px;">技术类</a></td>
									<td><a href="#" style="margin-left: 10px;">产品类</a></td>
									<td><a href="#" style="margin-left: 10px;">运营类</a></td>
									<td><a href="#" style="margin-left: 10px;">设计类</a></td>
									<td><a href="#" style="margin-left: 10px;">客服类</a></td>
									<td><a href="#" style="margin-left: 10px;">设计类</a></td>
								</tr>
								
							</table>
						</div>
					</div>
				</div>

				<div class="panel panel-info" style="margin-top: 15px ">
					<div class="panel-body">
			<!-- 职业信息 -->
						<table class="table table-striped table-hover">
							<tr class="info">
								<td>职位名称</td>
								<td>职位类别</td>
								<td>工作地点</td>
								<td>招聘人数</td>
								<td>截止日期</td>
							</tr>	
							
							<c:forEach items="${positionList}" var="p">
								<tr>
									<td><a href="position/show/id/${p.id}">${p.name}</a></td>
									<td>${p.position }</td>
									<td>${p.workPlace }</td>
									<td>${p.recruitNumber }</td>
									<td><fm:formatDate value="${p.endDate}"></fm:formatDate></td>
									
								</tr>
							</c:forEach>
							
						</table>
				<!-- 导航条 
						<div class="row">
							<div class="col-md--4 col-md-offset-8">
								<ul class="pagination ">
									<li><a href="#">&laquo;</a></li>
									<li class="active"><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#">&raquo;</a></li>
								</ul>
							</div>
						</div>
					-->
					
					</div>
				</div>



			</div>
			<div class="col-md-3">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">最近岗位</h3>
					</div>
					<div class="panel-body" >
						<ul style="margin-left: -25">
							<li >（集团安全）资深Andr前安全...</li>
							<li >前安全测试工程师/安...</li>
							<li >前阿里巴巴无线事业部招聘...</li>
							<li >前安全开发工程师（北京）...</li>
							<li >前资深网络安全测试开发...</li>
						</ul > 
					</div>
				</div>
				
				<div class="panel panel-info " style="margin-top: 50px">
					<div class="panel-heading">
						<h3 class="panel-title">招聘须知</h3>
					</div>
					<div class="panel-body" >
						<ul style="margin-left: -25">
							<li >如何应聘公司的职位？...</li>
							<li >应届生如何应聘？...</li>
							<li >腾讯应聘流程是什么？...</li>
							<li >我注册了简历，但为什么没有人联系我？）...</li>
							<li >我忘记密码了，怎么办？..</li>
						</ul>
					</div>
				</div>
			</div>

		</div>


	</div>
	<!--container -->

    	<%@ include file="buttom.jsp" %>
  </body>
</html>
