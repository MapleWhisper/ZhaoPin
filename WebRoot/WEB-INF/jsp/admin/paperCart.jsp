<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="header.jspf" %>
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
    	<%@ include file="buttom.jsp" %>
    	<script type="text/javascript">
			$(function(){
				$(".pre").click(function(){
					//alert("ok");
					$(this).addClass("active");
					$(this).siblings().removeClass("active");
				});
			});
			
	</script>
  </body>
</html>
