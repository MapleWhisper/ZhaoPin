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
    					<div class="panel panel-info" >
    				<div class="panel panel-primary">
    					<div class="panel-heading">
    						职位列表
    					</div>
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
									<td><a href="position/show/id/${p.id}">${p.name}</a></td>
									<td>${p.position }</td>
									<td>${p.workPlace }</td>
									<td>${p.recruitNumber }</td>
									<td><fm:formatDate value="${p.endDate}"></fm:formatDate></td>
									<td>
										<a href="position/edit/id/${p.id}" class="btn btn-info btn-sm">修改</a>
										<a href="position/delete/id/${p.id}" class="btn btn-danger btn-sm" onclick="return confirm('确认要删除这个岗位吗？')">删除</a>
									</td>
								</tr>
							</c:forEach>
							
						</table>
						<div class="row">
							
								  	<center><a href="position/add" class="btn btn-info btn-lg">增加职位</a></center>
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
