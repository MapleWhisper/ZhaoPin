<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="client/header.jspf" %>
  </head>
  
  <body>
    	<div class="container">
    		<%@ include file="client/head.jsp" %>
    		<div class="row" style="margin-top: 70px ">
    				<div class="jumbotron">
					  <h2>${meg}</h2>
					  <br>
					  <center ><p id="cnt" style="color: red">3秒后返回主页...</p> <p><a class="btn btn-primary" href="/ZhaoPin/client/index">点我立即返回</a></p></center>
					 
					</div>
    		</div>
    		
    	</div>
    	<script type="text/javascript">
    		var cnt = 3;
	    	function count(){
				cnt--;
				if(cnt>0){
					$("#cnt").html(cnt+"秒后返回主页...");
				}else{
					location.href='/ZhaoPin/client/index';
				}
			
				
			};
			$(function(){
				//setTimeout("'", 3000);
	    		
	    		setInterval('count()', 1000);
			});
    		
    		
    	</script>
    	<%@ include file="client/buttom.jsp" %>
  </body>
</html>
