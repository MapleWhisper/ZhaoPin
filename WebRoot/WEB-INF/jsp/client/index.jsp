<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>

  <head>
  <title>博弈教育招聘</title>
  
	<%@ include file="header.jspf" %>
	
	
  </head>
  
  
  <!-- <body style="background: url(${pageContext.request.contextPath}/image/index-bg.jpg) repeat;"> -->
  
  <body style="background: url(${pageContext.request.contextPath}/image/index-bg.jpg) repeat;">
    	<div  style="margin-top: 50px">
			<img width="100%" src="${pageContext.request.contextPath}/image/index-im1.jpg">
	</div>

	<!--container -->
	<div class="container">
		<%@ include file="head.jsp" %>
		<div class="row" style="margin-top: 20px">
			<div class="col-xs-9">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">职位分类</h3>
					</div>
					<div class="panel-body">
						<!--  搜索框注释
							<form class="form-inline" role="form">
								<div class="form-group">
									<label class="sr-only" for="exampleInputEmail2">输入职位</label> 
									<input type="text" class="form-control" id="exampleInputEmail2" placeholder="Enter email">
								</div>
								<button type="submit" class="btn btn-default">搜索</button>
							</form>
						-->
						<div>
							<table class="table"  >
								<tr >	
									<td>工作地点:</td>
									<td>
										<div class="btn-group">
										  <button type="button" class="btn btn-default" name="workPlace" >不限</button>
										  <button type="button" class="btn btn-default " name="workPlace">哈尔滨</button>
										  <button type="button" class="btn btn-default " name="workPlace">北京</button>
										  <button type="button" class="btn btn-default" name="workPlace">上海</button>
										</div>
									</td>
									
								</tr>
								
									<tr >
										<td>职位类别：</td>
										<td>
											<div class="btn-group" >
											  <button type="button" class="btn btn-default" name="position">不限</button>
											  <button type="button" class="btn btn-default" name="position">教师</button>
											  <button type="button" class="btn btn-default" name="position">技术</button>
											  <button type="button" class="btn btn-default" name="position">管理</button>
											</div>
										</td>
										
									</tr>
									<tr style="margin-top: 30px">
										<td>职位类型：</td>
										<td><div class="btn-group">
											  <button type="button" class="btn btn-default" name="type">不限</button>
											  <button type="button" class="btn btn-default" name="type">全职</button>
											  <button type="button" class="btn btn-default" name="type">专职</button>
											  <button type="button" class="btn btn-default" name="type">兼职</button>
											  <button type="button" class="btn btn-default" name="type">实习</button>
											</div> 
										</td>
										
									</tr>
								
									
									
								
							</table>
						</div>
					</div>
				</div>

				<div class="panel panel-info" style="margin-top: 15px ">
					<div class="panel-body">
			<!-- 职业信息 -->
						<table class="table table-striped table-hover" id="table">
							<tr class="info" style="font-weight: bold;">
								<td>职位名称</td>
								<td>职位类别</td>
								<td>职位类型</td>
								<td>工作地点</td>
								<td>招聘人数</td>
								<td>截止日期</td>
							</tr>	
							<c:forEach items="${positionList}" var="p">
								<tr class="data">
									<td><a href="position/show/id/${p.id}">${p.name}</a></td>
									<td>${p.position }</td>
									<td>${p.type }</td>
									<td>${p.workPlace }</td>
									<td>${p.recruitNumber }</td>
									<td><fm:formatDate value="${p.endDate}" pattern="yyyy/MM/dd"></fm:formatDate></td>
									
								</tr>
							</c:forEach>
							
						</table>
				<!-- 导航条 
						<div class="row">
							<div class="col-xs--4 col-xs-offset-8">
								<ul class="pagination ">
									<li><a href="#">&laquo;</a></li>
									<li class="active"><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#">&raquo;</a></li>
								</ul>
							</div>
						</div>
					-->
					
					</div>
				</div>



			</div>
			<div class="col-xs-3">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">最近岗位</h3>
					</div>
						<div class="panel-body" >
								<c:forEach items="${positionName }" var="pn">
								<ul style="margin-left: -25">
								<li ><a href="position/show/id/${pn.id}">${pn.name}</a>
								<span style="float: right;">${pn.day }天前</span>
								</li>
								</ul > 
								</c:forEach>
							</div>
				</div>
				
				<div class="panel panel-info " style="margin-top: 50px">
					<div class="panel-heading">
						<h3 class="panel-title">招聘须知</h3>
					</div>
					<div class="panel-body" >
						<ul style="margin-left: -25">
							<li >如何应聘公司的职位？...</li>
							<li >应届生如何应聘？...</li>
							<li >腾讯应聘流程是什么？...</li>
							<li >我注册了简历，但为什么没有人联系我？）...</li>
							<li >我忘记密码了，怎么办？..</li>
						</ul>
					</div>
				</div>
			</div>

		</div>


	</div>
	<!--container -->
	<script type="text/javascript">
		$(function(){
			var workPlace = "";
			var position = "";
			var type = "";
			$("button").click(function(){
				//alert("ok");
				//按钮点击时，添加active class效果
				var btn = $(this);
				var classString = $(this).attr("class");
				if(classString.indexOf("active")!=-1){
					$(this).removeClass("active");
				}else{
					$(this).addClass("active");
					$(this).siblings().removeClass("active");
				}
				
				var name = btn.attr("name");
				if(name=="workPlace"){
					workPlace = btn.text();
				}
				if(name=="position" ){
					position = btn.text();
				}
				if(name=="type"){
					type = btn.text();
				}
				//ajax 向后台传送数据
				$.ajax({
					type:"POST",
					 url: "position/select/json",
					 data:{"workPlace":workPlace,"position":position,"type":type},
					 dataType:"json",
					 success:function(data){
						//alert(data);
						var str;
						$(".data").remove();
						$(data).each(function(i,p){
							//alert(p.name);
							var data = $("<tr class='data'><td><a href='position/show/id/"+p.id+"'>"+
										p.name+"</a></td><td>"+p.position+"</td><td>"+p.type+"</td><td>"+p.workPlace+"</td><td>"+
										p.recruitNumber+"</td><td>"+new Date(p.endDate).toLocaleDateString()+"</td></tr>");
							$("#table").append(data);
							
						});
						//alert(str);
					 }
				});
			});
		});
		$(function(){
			$("td a").attr("target","_blank");
			$(".panel-body a").attr("target","_blank");
		})
	</script>
    	<%@ include file="buttom.jsp" %>
  </body>
</html>
