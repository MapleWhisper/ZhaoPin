<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="header.jspf" %>
  </head>
  
  <body >
    	<div class="container">
    		<%@ include file="head.jsp" %>
    		<div class="row" style="margin-top: 60px">
    			<div class="col-sm-3">
					<%@ include file="left.jsp" %>
    			</div>
    			<div class="col-sm-9">
				<div class="panel panel-success">
					<div class="panel-heading">管理员列表</div>
				
				<div class="panel-body">
					<table class="table table-hover table-striped table-bordered">
						<tr>
							<td>管理员姓名</td>
							<td>管理员账号 </td>
							<td>管理员职位</td>
							<td>操作</td>
							<td>操作</td>	
						</tr>
						<tr>
							<td>武玉密</td>
							<td>admin  </td>
							<td> 超级管理员 </td>	
							<td><button type="submit" class="btn btn-info">修改</button></td>
							<td><button type="submit" class="btn btn-danger">删除</button></td>
						</tr>						 
					</table>
				
				</div>
					 
			</div>
		</div>
    		</div>
    		
    	</div>
    	
  </body>
</html>

