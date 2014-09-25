<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="header.jspf" %>
  </head>
  
  <body>
    	<div class="container">
    		<%@ include file="head.jsp" %>
    		<div class="row" style="margin-top: 70px">
    			<div class="col-sm-3">
					<%@ include file="left.jsp" %>
    			</div>
    			<div class="col-sm-9">
			<!-- 面板 -->
    				<div class="panel panel-primary">
    					<div class="panel-heading">
    						<h3 class="panel-title">申请审核</h3>
    					</div>
    					<div class="panel-body">
    						<!-- 申请头 -->
							<ul class="nav  nav-pills nav-justified" role="tablist">
							  <li class="active"><a href="#step1" >待审核<span class="badge">4</span></a></li>
							  <li><a href="#step2" >待答题</a></li>
							  <li><a href="#step3" >待批阅</a></li>
							  <li><a href="#finish" >已完成</a></li>
							  <li><a href="#refuse" >已拒绝</a></li>
							</ul><!-- 申请头 -->
							
							<!-- 申请表格 Ajax -->
							<div class="tab-content" style="margin-top: 20px">
							 	<table class="table table-striped table-hover table-bordered">
							 		<tr>
							 			<td>申请人</td>
							 			<td>申请岗位</td>
							 			<td>申请时间</td>
							 			<td>查看简历</td>
							 		</tr>
							 		<tr class="data">
							 			<td><a>武玉密</a></td>
							 			<td>老师</td>
							 			<td>2014-9-25</td>
							 			<td><a>查看简历</a></td>
							 			<td><a class="btn btn-info">接受</a></td>
							 			<td><a class="btn btn-danger">拒绝</a></td>
							 			
							 		</tr>
							 		
							 	</table>
							</div><!-- 申请列表 -->
    					</div>
    				</div><!-- 面板 -->
    					
    			</div>
    		</div>
    		
    	</div>
    	<%@ include file="buttom.jsp" %>
  </body>
</html>
