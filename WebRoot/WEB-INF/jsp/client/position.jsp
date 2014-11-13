<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="header.jspf" %>
	<title>职位详情|${position.name }</title>
	<style type="text/css">
		td.info {text-align: right;}
	</style>
  </head>
	
	 <body  >  
    	<div class="container">
    		<%@ include file="head.jsp" %>
    		<div class="row" style="margin-top: 70px ;margin-bottom: 100px">
					<div class="col-xs-9">
					<div class="panel panel-info" >
					  <div class="panel-heading">
					    <h3 class="panel-title">
					    	<div class="row">
					    		<div class="col-xs-7">
					    			${position.name }
					    		</div>
					    		<div class="col-xs-2">
					    			浏览次数:${position.scanNumber }
					    		</div>
					    		<div class="col-xs-3">
					    			截止日期:<fm:formatDate value="${position.endDate }"/>
					    		</div>
					    	</div>
					     </h3>
					   </div>
					  </div>
			
					 
				
					<div class="panel panel-info" style="margin-top: 20px">
					  <div class="panel-body">
						  		<table class="table table-striped table-hover table-bordered">
						  			<tr>
						  				<td class="info">职位类型：</td>
						  				<td>${position.position }</td>
						  				
						  				<td class="info">职位性质：</td>
						  				<td>${position.type}</td>
						  				
						  				<td class="info">工作经验：</td>
						  				<td>${position.workExper }</td>
						  			</tr>
						  			
						  			<tr>
						  				<td class="info">最低学历：</td>
						  				<td>${position.educationNeed}</td>
						  				<td class="info">薪资待遇：</td>
						  				<td>${position.salary }</td>
						  				
						  				<td class="info">语言要求：</td>
						  				<td>${position.languageNeed }</td>
						  				
						  				
						  			</tr>
						  			<tr>
						  				<td class="info">工作地点：</td>
						  				<td>${position.workPlace}</td>
						  				<td class="info">招聘人数：</td>
						  				<td>${position.recruitNumber }</td>
						  				
						  				<td class="info"></td>
						  				<td></td>
						  			</tr>
						  			
						  				
						  		</table>
						  		<div class="panel panel-info">
								  <div class="panel-heading">
								  		岗位要求
								  		<span style="float: right;">申请人数:${position.applyNumber }</span>
								  </div>
								  <div class="panel-body" style="padding-top: 50px;padding-bottom: 50px">
								   			${position.positionInfo }
								  </div>
								 
								</div>
								
							<div class="row">
									<center><a class="btn btn-lg btn-primary"  href="${pageContext.request.contextPath}/client/apply/${position.id}" >立即申请<br>Apply</a></center>
									<div class="form-group">
						    			 <div class="col-xs-7 col-xs-offset-1">
											<c:if test="${meg !=null && meg!='' }">
												<div class="alert alert-danger alert-dismissible" role="alert">
		  												<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		 												 <span id="e1">${meg }<span>
												</div>
											</c:if>						      	
						  			   	 </div>
						   			 </div>
							</div>
							
					  </div>
					 </div>
					 
					</div>
					  		
							
				
					<div class="col-xs-3">
						<div class="panel panel-info">
							<div class="panel-heading">
								<h3 class="panel-title">最近岗位</h3>
							</div>
							<div class="panel-body" >
								<c:forEach items="${positionName}" var="pn">
								<ul style="margin-left: -25">
								<li ><a href="${pn.id}">${pn.name}</a>
								<span style="float: right;">${pn.day }天前</span>
								</li>
								</ul > 
								</c:forEach>
							</div>
						</div>
					</div>	
					
					<div class="col-xs-3">
						<div class="panel panel-info">
							<div class="panel-heading">
								<h3 class="panel-title">联系我们</h3>
							</div>
							<div class="panel-body" >
								<h3>学校位置</h3>
								<h5>南岗区邮政街321号博弈教育学校</h5>
								<h3>电话</h3>
								<h5>53627549  13206552833 </h5>
							</div>
						</div>
					</div>	
					
				</div>
    	</div>
    	
    	<%@ include file="buttom.jsp" %>
  </body>
</html>
