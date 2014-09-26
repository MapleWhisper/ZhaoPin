<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="header.jspf" %>
	<script type="text/javascript">
		$(function(){
			$(".nav a").click(function(){
				//alert( $(this).attr('title') ) ;
				$(".data").remove();
				
				$.post("apply/json","state="+$(this).attr('title'),function(data){
					$.each(data,function(){
						var tr = $("<tr class='data'><td>"+this.user.name+"</td><td>"+this.position.name+"</td><td>"+
								this.applyDate+"</td><td>"+this.user.resume+"</td><td><a href='#' class='btn btn-info '>接受</a></td><td><a href='#' class='btn btn-danger '>拒绝</a></td></tr>");
						$("#table1").append(tr);
						
					});
				});
			});
		})
	
	</script>
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
							  <li class="active"><a title="待审核" data-toggle="tab">待审核<span class="badge" id="step1">0</span></a></li>
							  <li><a  title="待答题" data-toggle="tab">待答题<span class="badge" id="step2"></span></a></li>
							  <li><a  title="待批阅" data-toggle="tab">待批阅<span class="badge" id="step3"></span></a></li>
							  <li><a  title="已完成" data-toggle="tab">已完成<span class="badge" id="step4"></span></a></li>
							  <li><a  title="已拒绝" data-toggle="tab">已拒绝<span class="badge" id="step5"></span></a></li>
							</ul><!-- 申请头 -->
							
							<!-- 申请表格 Ajax -->
							<div class="tab-content" style="margin-top: 20px">
							 	<table class="table table-striped table-hover table-bordered" id="table1">
							 		<tr class="info">
							 			<td>申请人</td>
							 			<td>申请岗位</td>
							 			<td>申请时间</td>
							 			<td>查看简历</td>
							 			<td>操作</td>
							 			<td>操作</td>
							 		</tr>
							 		<tr class="data">
								 		<c:forEach items="${ applyList}" var="a">
								 			<td>${a.user.name}</td>
								 			<td>${a.position.name }</td>
								 			<td>${a.applyDate }</td>
								 			<td><a>简历<a></a></td>
								 			<td><a href='#' class='btn btn-info '>接受</a></td>
								 			<td><a href='#' class='btn btn-danger '>拒绝</a></td>
								 		</c:forEach>
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
