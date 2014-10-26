
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
    			<div class="col-xs-3">
					<%@ include file="left.jsp" %>
    			</div>
    			<div class="col-xs-9">
					<!--  试题列表 -->
    				<div class="panel panel-primary">
					  <div class="panel-heading">
					    <h3 class="panel-title">试题列表</h3>
					  </div>
					  <div class="panel-body">
					    	<!-- 试卷导航栏 -->
					    <div class="row">
					    	<div class="col-xs-8">
							  <!--分页 -->
					    		<%@ include file="page.jsp"%>
					    	  <!--分页 -->
					    	</div>
					    	<div class="col-xs-4">
					    		<a href='${pageContext.request.contextPath}/admin/paperCart' target="_blank" class="btn btn-lg btn-primary">进入试卷篮，生成试卷</a>
					    	</div>
					    </div>
    					
						
						
						<!--试题列表 -->
						<c:forEach items="${problemList}" var="pro" varStatus="s">
						
    					<div style="background-color: gray;">
    						<div class="panel panel-default item">
							  <div class="panel-heading">
							  	<div class="row">
							  		<div class="col-xs-2">第  <code>${s.count }</code> 题</div>
							  		<div class="col-xs-2 dif">试题难度:${pro.difficulty}</div>
							  		<div class="col-xs-3 create">入库日期:<fm:formatDate pattern="yyyy-MM-dd" value="${pro.createDate}" /></div>
							  		<div class="col-xs-2 type">试卷类型:${pro.type }</div>
							  		<div class="col-xs-3"><button class="btn btn-primary btn-lg add" id="${pro.id}">添加到试卷篮</button></div>
							  	</div>
							  		
							  </div>
							  <div class="panel-body">
							  	<c:if test="${ pro.type == '单选题' || pro.type == '多选题' }">
								  	题目:<span id="${pro.id}title" style="color: blue;">${pro.title}</span><hr>
								    A:<span id="${pro.id}A">${pro.optA }</span><br>
								    B:<span id="${pro.id}B">${pro.optB }</span><br>
								    C:<span id="${pro.id}C">${pro.optC }</span><br>
								    D:<span id="${pro.id}D">${pro.optD }</span><hr>
							    </c:if>
							    <c:if test="${ pro.type == '判断题' || pro.type == '简答题'  }">
								  	题目:<span id="${pro.id}title" style="color: blue;">${pro.title}</span><hr>
							    </c:if>
							   
							    <button class="btn btn-sm btn-info" onClick="$(this).siblings('div').toggle();">答案</button>
							    
							    <span style="float: right">
							    	<!-- 删除试卷
							    		<button name="${pro.id}" class="btn btn-sm btn-warning delete" onClick="return confirm('你确定要删除吗？？')">删除试题</button>
							    	 -->
							    	<button name="${pro.id}" class="btn btn-sm btn-info edit" >修改试题</button>
							    </span>
							    <div style="color: red; ">
							    	<span id="${pro.id}ans">${pro.answer}</span>
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
					
						
    			</div><!-- class="col-xs-9" -->

    		</div>
    		
		     <!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-lg">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				        <h3 class="modal-title" id="myModalLabel">在此修改试题信息</h4>
				      </div>
				      
				      <!-- 模态表单体 -->
				      <div class="modal-body">
				        	<form class="form-horizontal" role="form" id="form2" method="post" >
								  <div class="form-group">
								    <label   class="col-xs-2 control-label">题目</label>
								    <div class="col-xs-10">
								      <textarea id="title" type="text" class="form-control"  rows="3" name="title" required></textarea>
								      <input id="id" type="hidden"   name="id" >
								    </div>
								  </div>
								  <div class="form-group">
								    <label   class="col-xs-2 control-label">选项A</label>
								    <div class="col-xs-10">
								      <input id="A" type="text" class="form-control"  name="optA" >
								     
								    </div>
								  </div>
								  <div class="form-group">
								    <label   class="col-xs-2 control-label">选项B</label>
								    <div class="col-xs-10">
								      <input id="B" type="text" class="form-control" name="optB" >
								    </div>
								  </div>
								  <div class="form-group">
								    <label   class="col-xs-2 control-label">选项C</label>
								    <div class="col-xs-10">
								      <input id="C" type="text" class="form-control"  name="optC" >
								    </div>
								  </div>
								  <div class="form-group">
								    <label   class="col-xs-2 control-label">选项D</label>
								    <div class="col-xs-10">
								      <input id="D" type="text" class="form-control" name="optD" >
								    </div>
								  </div>
								  <div class="form-group">
								    <label   class="col-xs-2 control-label">答案</label>
								    <div class="col-xs-10">
								      <textarea id="ans" type="text" class="form-control"  rows="3" name="answer" placeholder="参考答案"></textarea>
								    </div>
								  </div>
								   <div class="form-group">
								    <div class="col-xs-3 col-xs-offset-4">
								      <button type="button" class="btn btn-primary" id="sub" >修改题目</button>
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
    			//添加试题到 试题篮
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
    			//显示修改模态框
    			$("button.edit").click(function(){
    				//var title = $(this).parent().siblings("span.title").html();
    				var id = $(this).attr("name");
    				var title = $("#"+id+"title").html();
    				var a = $("#"+id+"A").html();
    				var b = $("#"+id+"B").html();
    				var c = $("#"+id+"C").html();
    				var d = $("#"+id+"D").html();
    				var ans = $("#"+id+"ans").html();;
    				$("#title").val(title);
    				$("#A").val(a);
    				$("#B").val(b);
    				$("#C").val(c);
    				$("#D").val(d);
    				$("#ans").val(ans);
    				$("#id").val(id);
    				$("#myModal").modal('toggle');
    			});
    		});
    		$(function(){
    			
    			//提交表单修改
    			$("#sub").click(function(){
     				$.post("../../problem/update/json",$("#form2").serialize(),function(date){
         				var mes = date.mes;
         				if(mes== 'success'){
         					alert("修改成功！");
         				}else{
         					alert("修改失败！");
         				}
         				$("#myModal").modal('hide');
         				window.location.reload();
     				});
     				
    			});
    			
    			/*	删除试卷
    			$(".delete").click(function(){
     				$.post("../../problem/delete/json",{"id":$(this).attr("name")},function(date){
         				alert("删除成功！");
     				});
     				$(this).parents("div .item").fadeOut(2000);
    			});
    			*/
    		});
    	</script>
  </body>
</html>
