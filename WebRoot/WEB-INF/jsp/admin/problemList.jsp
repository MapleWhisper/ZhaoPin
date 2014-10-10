<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="header.jspf" %>
	<title>试题列表</title>
	
  </head>
  
  <body>
    	<div class="container">
    		<%@ include file="head.jsp" %>
    		<div class="row" style="margin-top: 70px">
    			<div class="col-sm-3">
					<%@ include file="left.jsp" %>
    			</div>
    			<div class="col-sm-9">
					<!--  试题列表 -->
    				<div class="panel panel-primary">
					  <div class="panel-heading">
					    <h3 class="panel-title">试题列表</h3>
					  </div>
					  <div class="panel-body">
					    	<!-- 试卷导航栏 -->
					    <div class="row">
					    	<div class="col-sm-8">
					    		<ul class="pagination">
								  <li><a href="#">&laquo;</a></li>
								  <li><a href="#">1</a></li>
								  <li><a href="#">2</a></li>
								  <li><a href="#">3</a></li>
								  <li><a href="#">4</a></li>
								  <li><a href="#">5</a></li>
								  <li><a href="#">&raquo;</a></li>
								</ul>	<!-- 试卷导航栏 -->
					    	</div>
					    	<div class="col-sm-4">
					    		<a href='${pageContext.request.contextPath}/admin/paperCart' target="_blank" class="btn btn-lg btn-primary">进入试卷篮，生成试卷</a>
					    	</div>
					    </div>
    					
						
						
						<!--试题列表 -->
						<c:forEach items="${problemList}" var="pro">
						
    					<div style="background-color: gray;">
    						<div class="panel panel-default item">
							  <div class="panel-heading">
							  	<div class="row">
							  		<div class="col-sm-4">试题难度:${pro.difficulty}</div>
							  		<div class="col-sm-3">入库时间:${pro.createDate}</div>
							  		<div class="col-sm-3">试卷类型:${pro.type }</div>
							  		<div class="col-sm-2"><button class="btn btn-primary add" id="${pro.id}">添加到试卷篮</button></div>
							  	</div>
							  		
							  </div>
							  <div class="panel-body">
							  	<c:if test="${ pro.type == '单选题' || pro.type == '多选题' }">
								  	<span style="color: blue;">题目:${pro.title}</span><hr>
								    A:${pro.optA }<br>
								    B:${pro.optB }<br>
								    C:${pro.optC }<br>
								    D:${pro.optD }<hr>
							    </c:if>
							    <c:if test="${ pro.type == '判断题' || pro.type == '简答题'  }">
								  	题目:${pro.title}<hr>
																	    
							    </c:if>
							   
							    <button class="btn btn-sm btn-info" onClick="$(this).siblings('div').toggle();">答案</button>
							    <span style="float: right"></span>
							    <div style="color: red; ">
							    	${pro.answer}
							    </div>
							  </div>
							</div>
    					</div>	<!--试题列表 -->
    					</c:forEach>
    					
    					<!-- 试卷导航栏 -->
    					<ul class="pagination">
						  <li><a href="#">&laquo;</a></li>
						  <li><a href="#">1</a></li>
						  <li><a href="#">2</a></li>
						  <li><a href="#">3</a></li>
						  <li><a href="#">4</a></li>
						  <li><a href="#">5</a></li>
						  <li><a href="#">&raquo;</a></li>
						</ul>	<!-- 试卷导航栏 -->
					  </div> <!-- panel-body -->
					  
					</div><!--  试题列表 panel-->
					
						
    			</div><!-- class="col-sm-9" -->

    		</div>
    		
    	</div>
    	<%@ include file="buttom.jsp" %>
    	<script type="text/javascript">
    		$(function(){
    			$(".add").click(function(){
        			$(this).parents("div .item").toggleClass("well");
        			var id = $(this).attr('id');
        			if ( $(this).html()=='添加到试卷篮' ){
        				//想session中添加试题
        				$.post("/ZhaoPin/admin/paperCart/action/add",{"id":id});
        				$(this).html('已添加');
        			}else{
        				$.post("/ZhaoPin/admin/paperCart/action/remove",{"id":id});
        				$(this).html('添加到试卷篮');
        			}
        		});
    		});
    		
    	</script>
  </body>
</html>
