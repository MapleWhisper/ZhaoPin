<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<html>
  <head>
	<%@ include file="header.jspf" %>
  </head>
  <body >
  	<div class="container">
  			<%@ include file="head.jsp" %>
    		<div class="row" style="margin-top: 70px">
    			<div class="col-sm-3">
					<%@ include file="left.jsp" %>
    			</div>
    			<div class="col-sm-9">
    					<div class="panel panel-info" style="margin-top: 15px ; margin-bottom: 50px">
					<div class="panel-body">
						<table class="table table-striped table-hover table-bordered table-condensed">
							<tr class="info">
								<td>职位名称</td>
								<td>职位类别</td>
								<td>工作地点</td>
								<td>招聘人数</td>
								<td>截止日期</td>
								<td>职位操作</td>
							</tr>
							<c:forEach items="${ positionList}" var="p">
								<tr>
									<td>${p.name }</td>
									<td>${p.position }</td>
									<td>${p.workPlace }</td>
									<td>${p.recruitNumber }</td>
									<td><fm:formatDate value="${p.endDate}"></fm:formatDate></td>
									<td>
										<a href="position/edit/id/${p.id}" class="btn btn-info btn-sm"">修改</a>
										<a href="position/deleteid/${p.id}" class="btn btn-danger btn-sm"">删除</a>
									</td>
								</tr>
							</c:forEach>
							<tr>
								<td>（集团安全）资深Android开发工程师-</td>
								<td>开发类</td>
								<td>杭州市</td>
								<td>若干</td>
								<td>2014-09-13</td>
								<td>
									<a href="" class="btn btn-info btn-sm"">修改</a>
									<a href="" class="btn btn-danger btn-sm"">删除</a>
								</td>
							</tr>
							<tr>
								<td>（集团安全）资深Android开发工程师-Nokia</td>
								<td>开发类</td>
								<td>杭州市</td>
								<td>若干</td>
								<td>2014-09-13</td>
								<td>
									<a href="" class="btn btn-info btn-sm"">修改</a>
									<a href="" class="btn btn-danger btn-sm"">删除</a>
								</td>
							</tr>
							<tr>
								<td>（集团安全）资深Android开发工程师-Nokia</td>
								<td>开发类</td>
								<td>杭州市</td>
								<td>若干</td>
								<td>2014-09-13</td>
								<td>
									<a href="" class="btn btn-info btn-sm"">修改</a>
									<a href="" class="btn btn-danger btn-sm"">删除</a>
								</td>
							</tr>
							<tr>
								<td>（集团安全）资深Android开发工程师-Nokia</td>
								<td>开发类</td>
								<td>杭州市</td>
								<td>若干</td>
								<td>2014-09-13</td>
								<td>
									<a href="" class="btn btn-info btn-sm"">修改</a>
									<a href="" class="btn btn-danger btn-sm"">删除</a>
								</td>
							</tr>
							<tr>
								<td>（集团安全）资深Android开发工程师-Nokia</td>
								<td>开发类</td>
								<td>杭州市</td>
								<td>若干</td>
								<td>2014-09-13</td>
								<td>
									<a href="" class="btn btn-info btn-sm"">修改</a>
									<a href="" class="btn btn-danger btn-sm"">删除</a>
								</td>
							</tr>
						</table>
						<div class="row">
							
								  	<center><a href="position/add" class="btn btn-info btn-lg">增加职位</a></center>
						</div>
					</div>
				</div>
    			</div>
    		</div>
   					
   	</div>
   	<%@ include file="buttom.jsp" %>
  </body>
</html>
