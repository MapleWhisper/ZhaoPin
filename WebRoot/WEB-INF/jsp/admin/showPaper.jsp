<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="header.jspf" %>
	<style type="text/css">
		.quest {font-size: medium;margin-top: 20px}
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
    					<div class="page-header " style="text-align: center;margin-top: 100px">
							<h1 >招聘问卷试题</h1>
						</div>
					<div class="row">
						<!--左侧的导航条 -->
					  <div class="col-sm-1">
				  			<ul class="nav nav-pills nav-stacked nav-left" role="tablist" id="nav" >
			  					  <li role="presentation" class="pre active"><a href="#part1" >单选</a></li>
								  <li role="presentation" class="pre"><a href="#part2" >多选</a></li>
								  <li role="presentation" class="pre"><a href="#part3" >判断</a></li>
								  <li role="presentation" class="pre"><a href="#part4" >问答</a></li>
							</ul>
					  </div><!--左侧的导航条 -->
					  <div class="col-sm-10">
					  
					   <form action="" method="post">
						<!--单选题 -->
						<div class="panel panel-primary" id="part1">
						  <div class="panel-heading">
						    <h3 class="panel-title">第一部分 单选题      共${paper.singleNumber}题</h3>
						  </div>
						  <div class="panel-body">
						  		<c:forEach items="${paper.singleList}" var="pro" varStatus="s">
							  		<div style="margin-left: 50px">
								  		<div class="quest"><code>第${s.count}题</code> ${pro.title }</div>
										<div class="radio"><label><input type="radio" value="1" name="s${pro.id}">A:${pro.optA }</label></div>
										<div class="radio"><label><input type="radio" value="2" name="s${pro.id}">B:${pro.optB }</label></div>
										<div class="radio"><label><input type="radio" value="3" name="s${pro.id}">C:${pro.optC }</label></div>
										<div class="radio"><label><input type="radio" value="4" name="s${pro.id}">D:${pro.optD }</label></div>
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
										<div class="checkBox"><label><input type="checkBox" value="1" name="m${pro.id}">A:${pro.optA }</label></div>
										<div class="checkBox"><label><input type="checkBox" value="2" name="m${pro.id}">B:${pro.optB }</label></div>
										<div class="checkBox"><label><input type="checkBox" value="3" name="m${pro.id}">C:${pro.optC }</label></div>
										<div class="checkBox"><label><input type="checkBox" value="4" name="m${pro.id}">D:${pro.optD }</label></div>
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
									<div class="radio"><label><input type="radio" value="对" name="j${pro.id}">A:对</label></div>
									<div class="radio"><label><input type="radio" value="错" name="j${pro.id}">B:错</label></div>
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
							    		<textarea class="form-control" rows="6" name="q${pro.id}"></textarea>
							    	</div>
						    	</c:forEach>
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
