<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="header.jspf" %>
	<title>试卷显示|${paper.title}</title>
	<style type="text/css">
		.quest {font-size: medium;margin-top: 50px}
		.questArea {margin-top: 10px;padding-left: 50px}
		.nav-left {position: fixed;width: 60px;height: 60px}
	</style>
  </head>
  
  <body>
    	<div class="container">
    		<%@ include file="head.jsp" %>
    		<div class="row" style="margin-top: 70px">
    			<div class="col-sm-3">
					<%@ include file="left.jsp" %>
    			</div>
    			<div class="col-sm-9">
    					<div  style="text-align: center;margin-top: 100px">
    						<div class="col-sm-6">
    							<h2 >${paper.title }</h2>
    						</div>
    						<div class="col-sm-6">
    							<!-- 	用户信息 -->
								<table class="table table-striped table-hover table-bordered">
									<tr>
										<td>用户姓名</td>
										<td>邮箱</td>
										<td>电话</td>
									</tr>
									<tr>
										<td>${apply.user.name}</td>
										<td>${apply.user.email}</td>
										<td>${apply.user.phoneNumber}</td>
									</tr>
								</table><!-- 	用户信息 -->
    						</div>
						</div>
					<div class="row">
						<!--左侧的导航条 -->
					  <div class="col-sm-1">
				  			<ul class="nav nav-pills nav-stacked nav-left" role="tablist" id="nav" >
			  					  <li role="presentation" class="pre active"><a href="#part1" >单选</a></li>
								  <li role="presentation" class="pre"><a href="#part2" >多选</a></li>
								  <li role="presentation" class="pre"><a href="#part3" >判断</a></li>
								  <li role="presentation" class="pre"><a href="#part4" >简答</a></li>
								  <li role="presentation" class="pre"><a href="#part5" >审核</a></li>
							</ul>
					  </div><!--左侧的导航条 -->
					  <div class="col-sm-11">
					  
					   <form action="${pageContext.request.contextPath}/admin/paper/answer" method="post">
					   		<input type="hidden" name="id" value="${paper.id}">
						<!--单选题 -->
						<div class="panel panel-primary" id="part1">
						  <div class="panel-heading">
						    <h3 class="panel-title">第一部分 单选题      共${paper.singleNumber}题</h3>
						  </div>
						  <div class="panel-body">
						  		<c:forEach items="${paper.singleList}" var="pro" varStatus="s">
							  		<div style="margin-left: 50px">
								  		<div class="quest"><code>第${s.count}题</code> ${pro.title }</div>
										<div class="radio"><label><input type="radio" value="A" name="${pro.id}">A:${pro.optA }</label></div>
										<div class="radio"><label><input type="radio" value="B" name="${pro.id}">B:${pro.optB }</label></div>
										<div class="radio"><label><input type="radio" value="C" name="${pro.id}">C:${pro.optC }</label></div>
										<div class="radio"><label><input type="radio" value="D" name="${pro.id}">D:${pro.optD }</label></div>
										<table  class="table table-striped table-hover table-bordered">
											<tr>
												<td>用户答案</td>
												<td>参考答案</td>
												<td>对错</td>
											</tr>
											<tr>
												<td>${pro.userAns}</td>
												<td>${pro.answer}</td>
												<c:if test="${ pro.userAns == pro.answer}">
													<td ><button class='btn btn-success'  disabled="disabled">正确</button></td>
												</c:if>
												<c:if test="${ pro.userAns != pro.answer}">
													<td ><button class='btn btn-danger' disabled="disabled">错误</button></td>
												</c:if>
												
											</tr>
										</table>
									</div>
									
								</c:forEach>
						  </div>
						</div>
						
						<!-- 多选题 -->
						<div class="panel panel-primary" id="part2">
						  <div class="panel-heading">
						    <h3 class="panel-title">第二部分 多选题  共${paper.multChoiceNumber}题</h3>
						  </div>
						  <div class="panel-body">
						  		<c:forEach items="${paper.multChoiceList}" var="pro" varStatus="s">
						    	<div style="margin-left: 50px">
								  		<div class="quest"><code>第${s.count}题</code> ${pro.title }</div>
										<div class="checkBox"><label><input type="checkBox" value="A" name="${pro.id}">A:${pro.optA }</label></div>
										<div class="checkBox"><label><input type="checkBox" value="B" name="${pro.id}">B:${pro.optB }</label></div>
										<div class="checkBox"><label><input type="checkBox" value="C" name="${pro.id}">C:${pro.optC }</label></div>
										<div class="checkBox"><label><input type="checkBox" value="D" name="${pro.id}">D:${pro.optD }</label></div>
										<table  class="table table-striped table-hover table-bordered">
											<tr>
												<td>用户答案</td>
												<td>参考答案</td>
											</tr>
											<tr>
												<td>${pro.userAns}</td>
												<td>${pro.answer}</td>
											</tr>
										</table>
								</div>
								
								</c:forEach>
						  </div>
						</div>
						
						<!--判断题 -->
						<div class="panel panel-primary" id="part3">
						  <div class="panel-heading">
						    <h3 class="panel-title">第三部分 判断题 共${paper.judgeNumber}题</h3>
						  </div>
						  <div class="panel-body">
						  		<c:forEach items="${paper.judegeList}" var="pro" varStatus="s">
						    	<div style="margin-left: 50px">
							  		<div class="quest"><code>第${s.count}题</code> ${pro.title }</div>
									<div class="radio"><label><input type="radio" value="对" name="${pro.id}">A:对</label></div>
									<div class="radio"><label><input type="radio" value="错" name="${pro.id}">B:错</label></div>
									<table  class="table table-striped table-hover table-bordered">
											<tr>
												<td>用户答案</td>
												<td>参考答案</td>
											</tr>
											<tr>
												<td>${pro.userAns}</td>
												<td>${pro.answer}</td>
											</tr>
										</table>
								</div>
								
								</c:forEach>
						  </div>
						</div>
						
						<!-- 问答题 -->
						<div class="panel panel-primary" id="part4">
						  <div class="panel-heading">
						    <h3 class="panel-title">第四部分 问答题 共${paper.questionNumber}题</h3>
						  </div>
						  <div class="panel-body">
						 		 <c:forEach items="${paper.questionList}" var="pro" varStatus="s">
						 		 	
							    	<div class="quest"><code>第${s.count}题</code> ${pro.title } </div>
							    	<div class="questArea">
							    		<div class="alert alert-info" role="alert">用户答案：${ pro.userAns }</div>
							    		<div class="well" role="alert">参考答案：${pro.answer }</div>
									</div>
							    	
							    	
						    	</c:forEach>
						    	<center id="part5" style="margin-top: 100px">
						    		<!-- 	用户信息 -->	
									<table class="table table-striped table-hover table-bordered">
										<tr>
											<td>用户姓名</td>
											<td>邮箱</td>
											<td>电话</td>
										</tr>
										<tr>
											<td>${apply.user.name}</td>
											<td>${apply.user.email}</td>
											<td>${apply.user.phoneNumber}</td>
										</tr>
									</table><!-- 	用户信息 -->	 			
									<a href='${pageContext.request.contextPath}/admin/apply/finish/${apply.id }'  onclick="return confirm('确认要录用此人吗？')"
										class='btn btn-primary btn-lg'>最终接受并完成招聘</a>
									<a href='${pageContext.request.contextPath}/admin/apply/refuse/${apply.id}' onclick="return confirm('确认要拒绝吗？')" 
											class='btn btn-danger btn-lg'>拒绝</a>
								</center>
						  </div>
						 	 
						</div>
						
					   </form>
					   </div>
					</div> <!-- 第一行结束 -->
    			</div>
    		</div>
    		
    	</div>
    	<script type="text/javascript">
			$(function(){
				$(".pre").click(function(){
					//alert("ok");
					$(this).addClass("active");
					$(this).siblings().removeClass("active");
				});
			});
			
		</script>
    	<%@ include file="buttom.jsp" %>
  </body>
</html>
