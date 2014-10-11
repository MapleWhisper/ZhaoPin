<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="header.jspf" %>
	<title>试卷管理</title>
  </head>
  
  <body>
    	<div class="container">
    		<%@ include file="head.jsp" %>
    		<div class="row" style="margin-top: 70px">
    			<div class="col-sm-3">
					<%@ include file="left.jsp" %>
    			</div>
    			<div class="col-sm-9">
    					<!-- 生成试卷 -->
    					<div class="panel panel-primary">
						  <div class="panel-heading">
						    <h3 class="panel-title">生成试卷</h3>
						  </div>
						  <div class="panel-body">
						   	 <center><a href="${pageContext.request.contextPath}/admin/paper/item/1" class="btn btn-info btn-lg">生成试卷</a></center>
						  </div>
						</div><!-- 生成试卷 -->
						
						
						<!-- 试卷列表 -->
    					<div class="panel panel-primary">
						  <div class="panel-heading">
						    <h3 class="panel-title">试卷列表</h3>
						  </div>
						  <div class="panel-body">
						    	<table class="table table-hover table-striped table-bordered">
						    		<tr>
						    			<td>试卷标题</td>
						    			<td>试卷作者</td>
						    			<td>试卷标签</td>
						    			<td>生成时间</td>
						    		</tr>
						    		<c:forEach items="${paperList }" var="p">
						    			<tr>
						    				<td><a target="_blank" href="${pageContext.request.contextPath}/admin/paper/show/${p.id}">${p.title }</a></td>
						    				<td>${p.auther }</td>
						    				<td>${p.label }</td>
						    				<td><fm:formatDate value="${p.createDate}" pattern="yyyy-MM-dd"/></td>
						    				<c:if test="${resumeId !=null }">
						    					<td><a href="${pageContext.request.contextPath}/admin/apply/accept/${resumeId}/${p.id}" 
						    							class='btn btn-danger ' onClick="return confirm('确定要要使用这个试卷并发给用户答题吗，一旦确定，不可修改试卷')">使用该试卷， 并通过用户简历审核</a></td>
						    				</c:if>
						    				
						    			</tr>
						    		</c:forEach>
						    	</table>
						  </div>
						</div><!-- 试卷列表 -->
						
						
    			</div>
    		</div>
    		
    	</div>
    	<%@ include file="buttom.jsp" %>
  </body>
</html>
