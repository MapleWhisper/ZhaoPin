<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="header.jspf" %>
	<title>答题页面|${paper.title}</title>
	<style type="text/css">
		.quest {font-size: medium;margin-top: 20px}
		.questArea {margin-top: 10px;padding-left: 50px}
		.nav-left {position: fixed;width: 150px;height: 100px}
		.error {color: red}
		.block {display: block;}
	}
	</style>

  </head>
  
  <body>
    	<div class="container">
    		<%@ include file="head.jsp" %>
    		<div class="page-header " style="text-align: center;margin-top: 100px">
				<h2 >${paper.title }</h2>
			</div>
		<div class="row">
			<!--左侧的导航条 -->
		  <div class="col-sm-2">
	  			<ul class="nav nav-pills nav-stacked nav-left" role="tablist" id="nav" >
  					  <li role="presentation" class="pre active"><a href="#part1" >单选题</a></li>
					  <li role="presentation" class="pre"><a href="#part2" >多选题</a></li>
					  <li role="presentation" class="pre"><a href="#part3" >判断题</a></li>
					  <li role="presentation" class="pre"><a href="#part4" >问答题</a></li>
					  <li role="presentation" class="alert alert-danger">剩余时间: <span id="time">${timeLeft}</span></li>
				</ul>
		  </div><!--左侧的导航条 -->
		  <div class="col-sm-10">
		  
		   <form action="${pageContext.request.contextPath}/client/paper/answer" method="post" id="form1">
					   		<input type="hidden" name="id" value="${paper.id}">
					   		<input type="hidden" name="applyId" value="${applyId}">
						<!--单选题 -->
						<div class="panel panel-primary" id="part1">
						  <div class="panel-heading">
						    <h3 class="panel-title">第一部分 单选题      共${paper.singleNumber}题</h3>
						  </div>
						  <div class="panel-body">
						  		<c:forEach items="${paper.singleList}" var="pro" varStatus="s">
							  		<div style="margin-left: 50px">
								  		<div class="quest"><code>第${s.count}题</code> ${pro.title }</div>
										<div class="radio"><label><input type="radio"  value="A" name="${pro.id}" required>A:${pro.optA }</label></div>
										<div class="radio"><label><input type="radio" value="B" name="${pro.id}">B:${pro.optB }</label></div>
										<div class="radio"><label><input type="radio" value="C" name="${pro.id}">C:${pro.optC }</label></div>
										<div class="radio"><label><input type="radio" value="D" name="${pro.id}">D:${pro.optD }</label></div>
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
									<div class="radio"><label><input type="radio" value="对" name="${pro.id}" required>A:对</label></div>
									<div class="radio"><label><input type="radio" value="错" name="${pro.id}">B:错</label></div>
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
						 		 	<c:set var="id" value="${pro.id}"/>
							    	<div class="quest"><code>第${s.count}题</code> ${pro.title } </div>
							    	<div class="questArea">
							    		<textarea class="form-control" required   rows="6" id="${pro.id}" name="${pro.id}">${ pro.userAns }</textarea>
							    	</div>
						    	</c:forEach>
						  </div>
						</div>
						<center>
							<input type="submit" value="提交试卷" onClick="return confirm('确定要提交吗？试卷一旦提交，不可再修改')" class="btn btn-primary btn-lg"/>
						</center>
					   </form>
		   </div>
		</div> <!-- 第一行结束 -->
    		
    	</div>
    	<script type="text/javascript">
			$(function(){
				$(".pre").click(function(){
					//alert("ok");
					$(this).addClass("active");
					$(this).siblings().removeClass("active");
				});
			});
			
			//禁止复制粘贴
			$(function(){
				$(document).bind("contextmenu",function(){return false;});  
			    $(document).bind("selectstart",function(){return false;}); 
			    $(document).bind("selectstart",function(){return false;}); 
			    $(document).bind("paste",function(){return false;}); 
			    $(document).bind("copy",function(){return false;}); 
			    $(document).bind("cut",function(){return false;}); 
			});
			
			//倒计时
			var cnt = setInterval("count()", 1000);
			function count(){
				var time = $("#time").html();
				var min = parseInt( time.split(':')[0]);
				var sec = parseInt( time.split(':')[1]);
				if(min<=0 && sec<= 1){
					$("#form1").submit();
					clearInterval(cnt);
				}
				if(sec==0){
					sec=59;
					min--;
				}else{
					sec--;
				}
				$("#time").html(min+":"+sec);
			};
			
		</script>
    	<%@ include file="buttom.jsp" %>
  </body>
</html>
