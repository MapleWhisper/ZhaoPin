<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="header.jspf" %>
  </head>
	
	 <body  style="background: url(image/bg.jpg) repeat;">  
    	<div class="container">
    		<%@ include file="head.jsp" %>
    		<div class="row" style="margin-top: 70px ;margin-bottom: 100px">
					<div class="col-sm-9">
					<div class="panel panel-info" >
					  <div class="panel-heading">
					    <h3 class="panel-title">
					    	<div class="row">
					    		<div class="col-sm-8">
					    			${position.name }
					    		</div>
					    		<div class="col-sm-4">
					    			招聘截止日期:<fm:formatDate value="${position.endDate }"/>
					    		</div>
					    	</div>
					     </h3>
					   </div>
					  </div>
			
					 
				
					<div class="panel panel-info" style="margin-top: 20px">
					  <div class="panel-body">
						  		<table class="table table-striped table-hover table-bordered">
						  			<tr>
						  				<td class="info">职位类型</td>
						  				<td>${position.position }</td>
						  				
						  				<td class="info">职位性质</td>
						  				<td>${position.type}</td>
						  				
						  				<td class="info">工作经验</td>
						  				<td>${position.workExper }</td>
						  			</tr>
						  			
						  			<tr>
						  				<td class="info">最低学历：</td>
						  				<td>${position.educationNeed}</td>
						  				<td class="info">薪资待遇:</td>
						  				<td>${position.salary }</td>
						  				
						  				<td class="info">语言要求:</td>
						  				<td>${position.languageNeed }</td>
						  				
						  				
						  			</tr>
						  			<tr>
						  				<td class="info">工作地点</td>
						  				<td>${position.workPlace}</td>
						  				<td class="info">招聘人数</td>
						  				<td>${position.recruitNumber }</td>
						  				
						  				<td class="info"></td>
						  				<td></td>
						  			</tr>
						  			
						  				
						  		</table>
						  		<div class="panel panel-info">
								  <div class="panel-heading">
								  	岗位要求 
								  </div>
								  <div class="panel-body" style="padding-top: 50px;padding-bottom: 50px">
								   			${position.positionInfo }
								  </div>
								 
								</div>
								
							<div class="row">
									<center><a class="btn btn-lg btn-primary"  href="${pageContext.request.contextPath}/client/resume" >立即申请<br>Apply</a></center>
								
							</div>
					  </div>
					 </div>
					 
					</div>
					  		
							
				
					<div class="col-sm-3">
						<div class="panel panel-info">
							<div class="panel-heading">
								<h3 class="panel-title">最近岗位</h3>
							</div>
							<div class="panel-body" >
								<ul style="margin-left: -25">
									<li >（集团安全）资深Andr前安全...</li>
									<li >前安全测试工程师/安...</li>
									<li >前阿里巴巴无线事业部招聘...</li>
									<li >前安全开发工程师（北京）...</li>
									<li >前资深网络安全测试开发...</li>
								</ul > 
							</div>
						</div>
					</div>	
					</div>
				</div>

    		
    	</div>
    	<%@ include file="buttom.jsp" %>
  </body>
</html>
