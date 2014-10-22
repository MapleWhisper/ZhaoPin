<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="header.jspf" %>
  </head>
  
  <body>
    	<div class="container">
    		<%@ include file="head.jsp" %>
    		<div class="row" style="margin-top: 70px">
    			<div class="col-xs-3">
					<%@ include file="left.jsp" %>
    			</div>
    			<div class="col-xs-9">
    			 <div class="panel panel-primary">
					<div class="panel-heading">公司介绍/帮助中心</div>

					<div class="panel-body">
						<table class="table table-hover table-striped table-bordered">
							<tr>
								<td>标题</td>
								<td>分类</td>
								<td>创建日期</td>
								<td>操作</td>
								<td>操作</td>
							</tr>
						 <c:forEach items="${companyList}" var="com">
						 	<tr>
								
								<td>${com.title }</td>
								<td>
									<c:if test="${com.type==1}">
										公司介绍
									</c:if>	
									<c:if test="${com.type==2}">
										帮助中心
									</c:if>								
								</td>
								<td><fm:formatDate pattern="yyyy-MM-dd HH:mm" value="${com.createDate}"/></td>
								<td><a href="edit/id/${com.id }" class="btn btn-info"><span class=" glyphicon glyphicon-edit"></span>&nbsp;&nbsp;修改</a></td>
								<td><a href="delete/id/${com.id}" class="btn btn-danger" onclick="return confirm('确认要删除吗？')"><span class=" glyphicon  glyphicon-trash"></span>&nbsp;&nbsp;删除</a></td>
							</tr>																								
						 </c:forEach>
							
						</table>
						<div class="row">
							<div class="col-xs-6 col-xs-offset-5">
								<div class="no1">				 
									<a class="btn btn-primary " href="${pageContext.request.contextPath}/admin/article/add">添加文章</a>
								</div>

							</div>
						</div>

					</div>
				 </div>	
				 
				 
    			</div><!-- col-xs-9 -->
    		</div>
    		
    	</div>
    	<%@ include file="buttom.jsp" %>
  </body>
</html>
