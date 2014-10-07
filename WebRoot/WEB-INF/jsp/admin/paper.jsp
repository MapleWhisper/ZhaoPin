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
    			
    					<div class="panel panel-default">
						  <div class="panel-heading">
						    <h3 class="panel-title">浏览所有试卷</h3>
						  </div>
						  <div class="panel-body">
						    	<a class="btn btn-primary btn-lg">浏览试卷</a>
						  </div>
						</div>
						
						<div class="panel panel-default">
						  <div class="panel-heading">
						    <h3 class="panel-title">生成试卷</h3>
						  </div>
						  <div class="panel-body">
						   	 <a class="btn btn-primary btn-lg">生成试卷</a>
						  </div>
						</div>
    			</div>
    		</div>
    		
    	</div>
    	<%@ include file="buttom.jsp" %>
  </body>
</html>
