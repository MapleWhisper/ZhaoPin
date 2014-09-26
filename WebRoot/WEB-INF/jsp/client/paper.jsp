<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="header.jspf" %>
	<title>答题页面</title>
	<style type="text/css">
		.quest {font-size: medium;margin-top: 20px}
		.questArea {margin-top: 10px;padding-left: 50px}
		.nav-left {position: fixed;width: 150px;height: 100px}
	</style>
	<script>
			$(function(){
				$(".pre").click(function(){
					//alert("ok");
					$(this).addClass("active");
					$(this).siblings().removeClass("active");
				});
			});
			
	</script>
  </head>
  
  <body>
    	<div class="container">
    		<%@ include file="head.jsp" %>
    		<div class="page-header " style="text-align: center;margin-top: 100px">
			<h1 >招聘问卷试题</h1>
		</div>
		<div class="row">
			<!--左侧的导航条 -->
		  <div class="col-sm-2">
	  			<ul class="nav nav-pills nav-stacked nav-left" role="tablist" id="nav" >
  					  <li role="presentation" class="pre active"><a href="#part1" >单选题</a></li>
					  <li role="presentation" class="pre"><a href="#part2" >多选题</a></li>
					  <li role="presentation" class="pre"><a href="#part3" >判断题</a></li>
					  <li role="presentation" class="pre"><a href="#part4" >问答题</a></li>
				</ul>
		  </div><!--左侧的导航条 -->
		  <div class="col-sm-10">
		  
		   <form action="" method="post">
<!-- 		   	单选题 -->
			<div class="panel panel-primary" id="part1">
			  <div class="panel-heading">
			    <h3 class="panel-title">第一部分 单选题</h3>
			  </div>
			  <div class="panel-body">
			  		<div style="margin-left: 50px">
				  		<div class="quest"><code>第1题</code> 位于祖国正北方内蒙古自治区中部，简称为二连的是哪个市 </div>
						<div class="radio"><label><input type="radio" value="1">A:二连浩特</label></div>
						<div class="radio"><label><input type="radio" value="2">B:二连浩特</label></div>
						<div class="radio"><label><input type="radio" value="3">C:二连浩特</label></div>
						<div class="radio"><label><input type="radio" value="4">D:二连浩特</label></div>
					</div>
					
					<div style="margin-left: 50px">
				  		<div class="quest"><code>第2题</code> 位于祖国正北方内蒙古自治区中部，简称为二连的是哪个市 </div>
						<div class="radio"><label><input type="radio" value="1">A:二连浩特</label></div>
						<div class="radio"><label><input type="radio" value="2">B:二连浩特</label></div>
						<div class="radio"><label><input type="radio" value="3">C:二连浩特</label></div>
						<div class="radio"><label><input type="radio" value="4">D:二连浩特</label></div>
					</div>
			  </div>
			</div>
			
<!-- 			多选题 -->
			<div class="panel panel-primary" id="part2">
			  <div class="panel-heading">
			    <h3 class="panel-title">第二部分 多选题</h3>
			  </div>
			  <div class="panel-body">
			    	<div style="margin-left: 50px">
				  		<div class="quest"><code>第1题</code> 位于祖国正北方内蒙古自治区中部，简称为二连的是哪个市 </div>
						<div class="checkbox"><label><input type="checkbox" value="1">A:二连浩特</label></div>
						<div class="checkbox"><label><input type="checkbox" value="2">B:二连浩特</label></div>
						<div class="checkbox"><label><input type="checkbox" value="3">C:二连浩特</label></div>
						<div class="checkbox"><label><input type="checkbox" value="4">D:二连浩特</label></div>
					</div>
			  </div>
			</div>
			
<!-- 			判断题 -->
			<div class="panel panel-primary" id="part3">
			  <div class="panel-heading">
			    <h3 class="panel-title">第三部分 判断题</h3>
			  </div>
			  <div class="panel-body">
			    	<div style="margin-left: 50px">
				  		<div class="quest"><code>第1题</code> 位于祖国正北方内蒙古自治区中部，简称为二连的是哪个市 </div>
						<div class="radio"><label><input type="radio" value="1">A:对</label></div>
						<div class="radio"><label><input type="radio" value="2">B:错</label></div>
					</div>
					<div style="margin-left: 50px">
				  		<div class="quest"><code>第2题</code> 位于祖国正北方内蒙古自治区中部，简称为二连的是哪个市 </div>
						<div class="radio"><label><input type="radio" value="1">A:对</label></div>
						<div class="radio"><label><input type="radio" value="2">B:错</label></div>
					</div>
			  </div>
			</div>
			
<!-- 			 问答题 -->
			<div class="panel panel-primary" id="part4">
			  <div class="panel-heading">
			    <h3 class="panel-title">第四部分 问答题</h3>
			  </div>
			  <div class="panel-body">
			    	<div class="quest"><code>第1题</code> 白居易的《暮江吟》中，“可怜九月初三夜”的下一句是什么？ </div>
			    	<div class="questArea">
			    		<textarea class="form-control" >露似珍珠月似弓</textarea>
			    	</div>
			    	
			    	<div class="quest"><code>第2题</code> 白居易的《暮江吟》中，“可怜九月初三夜”的下一句是什么？ </div>
			    	<div class="questArea">
			    		<textarea class="form-control" >露似珍珠月似弓</textarea>
			    	</div>
			  </div>
			</div>
			<div>
				<center><input type="submit" class="btn btn-primary btn-lg" value="提交问卷"></input></center>
			</div>
		   </form>
		   </div>
		</div> <!-- 第一行结束 -->
    		
    	</div>
    	<%@ include file="buttom.jsp" %>
  </body>
</html>
