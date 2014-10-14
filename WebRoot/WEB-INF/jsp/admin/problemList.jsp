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
							  <!--分页 -->
					    		<%@ include file="page.jsp"%>
					    	  <!--分页 -->
					    	</div>
					    	<div class="col-sm-4">
					    		<a href='${pageContext.request.contextPath}/admin/paperCart' target="_blank" class="btn btn-lg btn-primary">进入试卷篮，生成试卷</a>
					    	</div>
					    </div>
    					
						
						
						<!--试题列表 -->
						<c:forEach items="${problemList}" var="pro" varStatus="s">
						
    					<div style="background-color: gray;">
    						<div class="panel panel-default item">
							  <div class="panel-heading">
							  	<div class="row">
							  		<div class="col-sm-2">第  <code>${s.count }</code> 题</div>
							  		<div class="col-sm-3 dif">试题难度:${pro.difficulty}</div>
							  		<div class="col-sm-3 create">入库日期:<fm:formatDate pattern="yyyy-MM-dd" value="${pro.createDate}" /></div>
							  		<div class="col-sm-2 type">试卷类型:${pro.type }</div>
							  		<div class="col-sm-2"><button class="btn btn-primary add" id="${pro.id}">添加到试卷篮</button></div>
							  	</div>
							  		
							  </div>
							  <div class="panel-body">
							  	<c:if test="${ pro.type == '单选题' || pro.type == '多选题' }">
								  	题目:<span class="title" style="color: blue;">${pro.title}</span><hr>
								    A:<span class="A">${pro.optA }</span><br>
								    B:<span class="B">${pro.optB }</span><br>
								    C:<span class="C">${pro.optC }</span><br>
								    D:<span class="D">${pro.optD }</span><hr>
							    </c:if>
							    <c:if test="${ pro.type == '判断题' || pro.type == '简答题'  }">
								  	<span class="title" style="color: blue;">题目:${pro.title}</span><hr>
							    </c:if>
							   
							    <button class="btn btn-sm btn-info" onClick="$(this).siblings('div').toggle();">答案</button>
							    <span style="float: right"><button class="btn btn-sm btn-info edit" >修改试题</button></span>
							    <div style="color: red; ">
							    	<span class="ans">${pro.answer}</span>
							    </div>
							  </div>
							</div>
    					</div>	<!--试题列表 -->
    					</c:forEach>
    					
    					 <!--分页 -->
					    	<%@ include file="page.jsp"%>
					     <!--分页 -->
					     
					  </div> <!-- panel-body -->
					  
					</div><!--  试题列表 panel-->
					
						
    			</div><!-- class="col-sm-9" -->

    		</div>
    		
		     <!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				        <h3 class="modal-title" id="myModalLabel">在此修改试题信息</h4>
				      </div>
				      
				      <!-- 模态表单体 -->
				      <div class="modal-body">
				        	<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/admin/problem/save" method="post" >
								  <div class="form-group">
								    <label   class="col-sm-2 control-label">题目</label>
								    <div class="col-sm-10">
								      <textarea id="title" type="text" class="form-control"  rows="3" name="title" required></textarea>
								      <input type="hidden" name="type" value="单选题">
								    </div>
								  </div>
								  <div class="form-group">
								    <label   class="col-sm-2 control-label">选项A</label>
								    <div class="col-sm-10">
								      <input id="A" type="text" class="form-control"  name="optA" >
								     
								    </div>
								  </div>
								  <div class="form-group">
								    <label   class="col-sm-2 control-label">选项B</label>
								    <div class="col-sm-10">
								      <input id="B" type="text" class="form-control" name="optB" >
								    </div>
								  </div>
								  <div class="form-group">
								    <label   class="col-sm-2 control-label">选项C</label>
								    <div class="col-sm-10">
								      <input id="C" type="text" class="form-control"  name="optC" >
								    </div>
								  </div>
								  <div class="form-group">
								    <label   class="col-sm-2 control-label">选项D</label>
								    <div class="col-sm-10">
								      <input id="D" type="text" class="form-control" name="optD" >
								    </div>
								  </div>
								  <div class="form-group">
								    <label   class="col-sm-2 control-label">答案</label>
								    <div class="col-sm-10">
								      <textarea id="ans" type="text" class="form-control"  rows="3" name="answer" placeholder="参考答案"></textarea>
								    </div>
								  </div>
								  <div class="form-group">
								    <label   class="col-sm-2 control-label">标签</label>
								    <div class="col-sm-10">
								      <input id="label" type="text" class="form-control" name="tabel" placeholder="请输入标签，便于搜索题目，例如: <高中数学>,<初中英语>" >
								    </div>
								  </div>
								   <div class="form-group">
								    <div class="col-sm-3 col-sm-offset-4">
								      <input type="submit" class="btn btn-primary"  value="修改题目">
								    </div>
								  </div>
							</form>
							
				      </div><!-- 模态表单体 -->
				       <div class="modal-footer">
				        <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
				      </div>
				    </div>
				  </div>
				</div><!-- Modal -->
    		
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
    		$(function(){
    			$("button.edit").click(function(){
    				var title = $(this).parent().siblings("span.title").html();
    				var a = $(this).parent().siblings("span.A").html();
    				var b = $(this).parent().siblings("span.B").html();
    				var c = $(this).parent().siblings("span.C").html();
    				var d = $(this).parent().siblings("span.D").html();
    				$("#title").val(title);
    				$("#A").val(a);
    				$("#B").val(b);
    				$("#C").val(c);
    				$("#D").val(d);
    				$("#myModal").modal('toggle');
    			});
    		});
    	</script>
  </body>
</html>
