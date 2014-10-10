<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="header.jspf" %>
	<title>试卷篮</title>
	<style type="text/css">
		.num {margin-left: 20px}
		.quest {font-size: medium;margin-top: 10px}
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
    					<div class="panel panel-warning">
						  <div class="panel-heading">
						    <h3 class="panel-title">试卷篮</h3>
						  </div>
						  <div class="panel-body">
						  		<div class="row">
						  			<div class="col-sm-8">
						  				<div class="page-header">
										  <h1>  <a href="${pageContext.request.contextPath}/admin/paper/item/1"> << 返回试题列表</a>  
										  	 <small>继续添加试题</small></h1>
										</div>
						  			</div>
						  			<div class="col-sm-4">
						  				<ul class="list-group">
										  <li class="list-group-item">单选题：<span class="label label-danger num">${paperCart.singleNumber}个</span></li>
										  <li class="list-group-item">多选题：<span class="label label-danger num">${paperCart.multChoiceNumber}个</span></li>
										  <li class="list-group-item">判断题：<span class="label label-danger num">${paperCart.judgeNumber}个</span></li>
										  <li class="list-group-item">简答题：<span class="label label-danger num">${paperCart.questionNumber}个</span></li>
										</ul>
						  			</div>
						  		</div>
						  		<div class="panel panel-info">
								  <div class="panel-heading">
								    <h3 class="panel-title">已选试题列表</h3>
								  </div>
								  <div class="panel-body">
								    	
									  <div class="col-sm-11">
											<!--单选题 -->
											<div class="panel panel-primary" id="part1">
											  <div class="panel-heading">
											    <h3 class="panel-title">第一部分 单选题</h3>
											  </div>
											  
											  <c:forEach items="${ singles}" var="pro" varStatus="s">
												  <div style="background-color: gray;" class="pro">
						    						<div class="panel panel-default item">
													  <div class="panel-heading">
													  	<div class="row">
													  		<div class="col-sm-2 ">第${ s.count }题</div>
													  		<div class="col-sm-4">试题难度:${pro.difficulty}</div>
													  		<div class="col-sm-4">试题标签:${pro.label}</div>
													  		<div class="col-sm-2"><button class="btn btn-primary remove" id="${pro.id}">删除</button></div>
													  	</div>
													  </div>
													  <div class="panel-body">
														  	<span style="color: blue;">题目:${pro.title}</span><hr>
														    A:${pro.optA }<br>
														    B:${pro.optB }<br>
														    C:${pro.optC }<br>
														    D:${pro.optD }<br>
													  </div>
													</div>
						    					  </div>
					    					  </c:forEach>	
											</div><!--单选题 -->
											
											<!-- 多选题 -->
											<div class="panel panel-primary" id="part1">
											  <div class="panel-heading">
											    <h3 class="panel-title">第二部分 多选题</h3>
											  </div>
											  <c:forEach items="${multChoices}" var="pro" varStatus="s">
											  <div style="background-color: gray;" class="pro">
					    						<div class="panel panel-default item">
												  <div class="panel-heading">
												  	<div class="row">
												  		<div class="col-sm-2">第${ s.count }题</div>
												  		<div class="col-sm-4">试题难度:${pro.difficulty}</div>
												  		<div class="col-sm-4">试题标签:${pro.label}</div>
												  		<div class="col-sm-2"><button class="btn btn-primary remove" id="${pro.id}">删除</button></div>
												  	</div>
												  </div>
												  <div class="panel-body">
													  	<span style="color: blue;">题目:${pro.title}</span><hr>
													    A:${pro.optA }<br>
													    B:${pro.optB }<br>
													    C:${pro.optC }<br>
													    D:${pro.optD }<br>
												  </div>
												</div>
					    					  </div>	
					    					  </c:forEach>
											</div><!--多选题  -->
											
											<!-- 多选题 -->
											<div class="panel panel-primary" id="part1" >
											  <div class="panel-heading">
											    <h3 class="panel-title">第三部分 判断题</h3>
											  </div>
											  <c:forEach items="${judges}" var="pro" varStatus="s">
											  <div style="background-color: gray;" class="pro">
					    						<div class="panel panel-default item">
												  <div class="panel-heading">
												  	<div class="row">
												  		<div class="col-sm-2">第${ s.count }题</div>
												  		<div class="col-sm-4">试题难度:${pro.difficulty}</div>
												  		<div class="col-sm-4">试题标签:${pro.label}</div>
												  		<div class="col-sm-2"><button class="btn btn-primary remove" id="${pro.id}">删除</button></div>
												  	</div>
												  </div>
												  <div class="panel-body">
													  	<span style="color: blue;">题目:${pro.title}</span>
												  </div>
												</div>
					    					  </div>	
					    					  </c:forEach>
											</div><!--多选题  -->
											
											<!-- 简答题 -->
											<div class="panel panel-primary" id="part1" >
											  <div class="panel-heading">
											    <h3 class="panel-title">第四部分 简答题</h3>
											  </div>
											  <c:forEach items="${questions}" var="pro" varStatus="s">
											  <div style="background-color: gray;" class="pro">
					    						<div class="panel panel-default item">
												  <div class="panel-heading">
												  	<div class="row">
												  		<div class="col-sm-2">第${ s.count }题</div>
												  		<div class="col-sm-4">试题难度:${pro.difficulty}</div>
												  		<div class="col-sm-4">试题标签:${pro.label}</div>
												  		<div class="col-sm-2"><button class="btn btn-primary remove" id="${pro.id}">删除</button></div>
												  	</div>
												  </div>
												  <div class="panel-body">
													  	<span style="color: blue;">题目:${pro.title}</span>
												  </div>
												</div>
					    					  </div>	
					    					  </c:forEach>
											</div><!-- 简答题 -->
											<center><a href="#"  class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
													生成试卷</a></center>
											
											
										   </div><!-- col-sm-11 -->
										   <!--右侧的导航条 -->
									  		<div class="col-sm-1">
								  			<ul class="nav nav-pills nav-stacked nav-left" role="tablist" id="nav" >
							  					  <li role="presentation" class="pre active"><a href="#part1" >单选</a></li>
												  <li role="presentation" class="pre"><a href="#part2" >多选</a></li>
												  <li role="presentation" class="pre"><a href="#part3" >判断</a></li>
												  <li role="presentation" class="pre"><a href="#part4" >问答</a></li>
											</ul>
									 	 </div><!--左侧的导航条 -->
								  </div>
								</div>
						    	
						  </div>
						</div>
    			</div>
    		</div>
    		
    	</div>
    	
    	<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		        <h3 class="modal-title" id="myModalLabel">确定要生成试卷吗？试卷一旦生成，不可修改</h4>
		      </div>
		      
		      <!-- 模态表单体 -->
		      <div class="modal-body">
		        	<form class="form-horizontal" role="form" method="post">
					  <div class="form-group">
					    <label  class="col-sm-2 control-label">试卷标题</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="" name="title">
					    </div>
					  </div>
					  <div class="form-group">
					    <label  class="col-sm-2 control-label">作者</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="" name="auther">
					    </div>
					  </div>
					  
					 
					  <div class="form-group">
					    <div class="col-sm-6">
			  				<ul class="list-group">
							  <li class="list-group-item">单选题：<span class="label label-danger num">${paperCart.singleNumber}个</span></li>
							  <li class="list-group-item">多选题：<span class="label label-danger num">${paperCart.multChoiceNumber}个</span></li>
							  <li class="list-group-item">判断题：<span class="label label-danger num">${paperCart.judgeNumber}个</span></li>
							  <li class="list-group-item">简答题：<span class="label label-danger num">${paperCart.questionNumber}个</span></li>
							</ul>
						</div>
						<div class="col-sm-6">
							<button type="submit" class="btn btn-warning btn-lg">提交试卷</button>
						</div>
					  </div>
					  
					</form>
					
		      </div><!-- 模态表单体 -->
		       <div class="modal-footer">
		        <button type="button" class="btn btn-primary" data-dismiss="modal">关闭并返回修改</button>
		      </div>
		    </div>
		  </div>
		</div><!-- Modal -->
		
		
    	<%@ include file="buttom.jsp" %>
    	<script type="text/javascript">
    		//右侧 选择框控制
			$(function(){
				$(".pre").click(function(){
					//alert("ok");
					$(this).addClass("active");
					$(this).siblings().removeClass("active");
				});
			});
    		
			$(function(){
    			$(".remove").click(function(){
        			var id = $(this).attr('id');
        			$.post("/ZhaoPin/admin/paperCart/action/remove",{"id":id});
        			$(this).parents(".pro").remove();
        		});
    		});
	</script>
  </body>
</html>
