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
							  <li class="active"><a href="#list1" title="待审核" role="tab" data-toggle="tab">待审核<span class="badge" id="step1">${count.待审核}</span></a></li>
							  <li><a href="#list2" title="待答题" role="tab" data-toggle="tab">待答题<span class="badge" id="step2">${count.待答题}</span></a></li>
							  <li><a href="#list3" title="待批阅" role="tab" data-toggle="tab">待批阅<span class="badge" id="step3">${count.待批阅}</span></a></li>
							  <li><a href="#list4" title="已完成" role="tab" data-toggle="tab">已完成</a></li>
							  <li><a href="#list5" title="已拒绝" role="tab" data-toggle="tab">已拒绝</a></li>
							</ul><!-- 申请头 -->
							
							<!-- 申请表格 Ajax -->
							 	<div class="tab-content" style="margin-top: 20px">
							 		<div class="tab-pane active" id="list1" >
									 			<table class="table table-striped table-hover table-bordered" id="table1">
										 			<tr class="info">
										 			<td>申请人</td>
										 			<td>申请岗位</td>
										 			<td>申请时间</td>
										 			<td>查看简历</td>
										 			<td>操作</td>
										 			<td>操作</td>
										 			</tr>
										 		<c:forEach items="${ list1}" var="a">
										 			<tr class="data">
											 			<td><a  title="用户信息" data-content="邮箱:${a.user.email}  电话:${a.user.phoneNumber} " 
											 				onmouseover="$(this).popover('show')" onmouseout="$(this).popover('hide')">${a.user.name}</a></td>
											 			
											 			<td><a target="_blank" href="position/show/id/${a.position.id}">${a.position.name }</a></td>
											 			
											 			<td>${a.applyDate }</td>
											 			<td><a>简历<a></a></td>
											 			<td><a href='#' class='btn btn-info '>接受</a></td>
											 			<td><a href='apply/refuse/${a.id}' class='btn btn-danger '>拒绝</a></td>
										 			</tr>
										 					
										 		</c:forEach>
												</table>
								   </div>
								   <div class="tab-pane" id="list2" >
								 		<table class="table table-striped table-hover table-bordered" id="table1">
										 			<tr class="info">
										 			<td>申请人</td>
										 			<td>申请岗位</td>
										 			<td>申请时间</td>
										 			<td>查看简历</td>
										 			<td>操作</td>
										 			</tr>
										 		<c:forEach items="${ list2}" var="a">
										 			<tr class="data">
										 			<td><a  title="用户信息" data-content="邮箱:${a.user.email}  电话:${a.user.phoneNumber} " 
											 				onmouseover="$(this).popover('show')" onmouseout="$(this).popover('hide')">${a.user.name}</a></td>
										 			<td><a target="_blank" href="position/show/id/${a.position.id}">${a.position.name }</a></td>
										 			<td>${a.applyDate }</td>
										 			<td><a>简历<a></a></td>
										 			<td><a href='#' class='btn btn-info '>提醒用户答题</a></td>
										 			</tr>
										 		</c:forEach>
												</table>
									</div>
									<div class="tab-pane" id="list3" >
								 		<table class="table table-striped table-hover table-bordered" id="table1">
										 			<tr class="info">
										 			<td>申请人</td>
										 			<td>申请岗位</td>
										 			<td>申请时间</td>
										 			<td>查看简历</td>
										 			<td>操作</td>
										 			<td>操作</td>
										 			</tr>
										 		<c:forEach items="${ list3}" var="a">
										 			<tr class="data">
										 			<td><a  title="用户信息" data-content="邮箱:${a.user.email}  电话:${a.user.phoneNumber} " 
											 				onmouseover="$(this).popover('show')" onmouseout="$(this).popover('hide')">${a.user.name}</a></td>
										 			<td><a target="_blank" href="position/show/id/${a.position.id}">${a.position.name }</a></td>
										 			<td>${a.applyDate }</td>
										 			<td><a>简历<a></a></td>
										 			<td><a href='#' class='btn btn-info '>最终接受并完成招聘</a></td>
										 			<td><a href='apply/refuse/${a.id}' class='btn btn-danger '>拒绝</a></td>
										 			</tr>
										 		</c:forEach>
											</table>
									</div>
									<div class="tab-pane" id="list4" >
								 		<table class="table table-striped table-hover table-bordered" id="table1">
										 			<tr class="info">
										 			<td>申请人</td>
										 			<td>申请岗位</td>
										 			<td>申请时间</td>
										 			<td>查看简历</td>
										 			</tr>
										 		<c:forEach items="${ list4}" var="a">
										 			<tr class="data">
										 			<td><a  title="用户信息" data-content="邮箱:${a.user.email}  电话:${a.user.phoneNumber} " 
											 				onmouseover="$(this).popover('show')" onmouseout="$(this).popover('hide')">${a.user.name}</a></td>
										 			<td><a target="_blank" href="position/show/id/${a.position.id}">${a.position.name }</a></td>
										 			<td>${a.applyDate }</td>
										 			<td><a>简历<a></a></td>
										 			</tr>
										 		</c:forEach>
												</table>
									</div>
									<div class="tab-pane " id="list5" >
								 		<table class="table table-striped table-hover table-bordered" id="table1">
										 			<tr class="info">
										 			<td>申请人</td>
										 			<td>申请岗位</td>
										 			<td>申请时间</td>
										 			<td>查看简历</td>
										 			</tr>
										 		<c:forEach items="${ list5}" var="a">
										 			<tr class="data">
										 			<td><a  title="用户信息" data-content="邮箱:${a.user.email}  电话:${a.user.phoneNumber} " 
											 				onmouseover="$(this).popover('show')" onmouseout="$(this).popover('hide')">${a.user.name}</a></td>
										 			<td><a target="_blank" href="position/show/id/${a.position.id}">${a.position.name }</a></td>
										 			<td>${a.applyDate }</td>
										 			<td><a>简历<a></a></td>
										 			</tr>
										 		</c:forEach>
												</table>
									</div>
							  </div>
							 	
						</div><!-- 申请列表 -->
    					
    				</div><!-- 面板 -->
    					
    			</div>
    		</div>
    			
    		
    	</div>
    	<%@ include file="buttom.jsp" %>
  </body>
</html>
