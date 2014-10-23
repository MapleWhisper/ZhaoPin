<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="header.jspf" %>
	<title>试题管理</title>
	<!-- 
	<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/messages_zh.min.js"></script>
	 -->
  </head>
  
  <body>
    	<div class="container">
    		<%@ include file="head.jsp" %>
    		<div class="row" style="margin-top: 70px">
    			<div class="col-xs-3">
					<%@ include file="left.jsp" %>
    			</div>
    			<div class="col-xs-9">
				  <!--搜索提示栏 -->
				  	<div class="panel panel-primary">
						 <div class="panel-heading">
							    <h3 class="panel-title" style="font-size: 25px">搜索试题</h3>
					      </div>
						 <div class="panel-body">
    						 <div class="form-group">
    						 	<div class=row>
    						 		<div class="col-xs-8">
    						 			<input type="text" id="key" class="form-control" placeholder="输入试卷标题 标签 关键字">
    						 		</div>
    						 		<div class="col-xs-2">
    						 			 <button  id="problemList" class="btn btn-default">搜索试题</button>
    						 		</div>
    						 		<div class="col-xs-2">
    						 			 <a  href="${pageContext.request.contextPath}/admin/paper/item/1" class="btn btn-default" >
    						 			 	浏览所有试题</a>
    						 		</div>
    						 	</div>
    						 	
						          
						         
						      </div>
						        
						</div>
					</div>
						       
				<!-- 添加试题栏 -->
    						<div class="panel panel-primary">
							  <div class="panel-heading">
							    <h3 class="panel-title">添加试题</h3>
							  </div>
							  <div class="panel-body">
									<!--添加试题框 -->
									<ul class="nav nav-pills nav-justified" role="tablist">
									  <li class="active"><a href="#single" role="tab" data-toggle="tab">单选题</a></li>
									  <li><a href="#Multiple" role="tab" data-toggle="tab">多选题</a></li>
									  <li><a href="#juedge" role="tab" data-toggle="tab">判断题</a></li>
									  <li><a href="#question" role="tab" data-toggle="tab">问答题</a></li>
									</ul>
									
									<!-- 添加试题 -->
									<div class="tab-content " style="margin-top: 50px">
										<!--单选题 -->
									  <div class="tab-pane active" id="single">
									  		
									  		
									  		<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/admin/problem/save" method="post" id="form1" >
											  <div class="form-group">
											    <label  class="col-xs-2 control-label">题目</label>
											    <div class="col-xs-10">
											      <textarea   rows="10" id="editor1" class="from-control" name="title" ></textarea>
											      <input  type="hidden" name="type" value="单选题">
											    </div>
											  </div>
											  <div class="form-group">
											    <label   class="col-xs-2 control-label">选项A</label>
											    <div class="col-xs-10">
											      <input type="text" class="form-control"  name="optA">
											     
											    </div>
											  </div>
											  <div class="form-group">
											    <label   class="col-xs-2 control-label">选项B</label>
											    <div class="col-xs-10">
											      <input type="text" class="form-control" name="optB" >
											    </div>
											  </div>
											  <div class="form-group">
											    <label   class="col-xs-2 control-label">选项C</label>
											    <div class="col-xs-10">
											      <input type="text" class="form-control"  name="optC">
											    </div>
											  </div>
											  <div class="form-group">
											    <label   class="col-xs-2 control-label">选项D</label>
											    <div class="col-xs-10">
											      <input type="text" class="form-control" name="optD" >
											    </div>
											  </div>
											  <div class="form-group">
											    <label   class="col-xs-2 control-label">答案</label>
											    <div class="col-xs-2">
											      	<select class="form-control" name="answer">
											      		<option value="A" selected="selected">A</option>
											      		<option value="B">B</option>
											      		<option value="C">C</option>
											      		<option value="D">D</option>
											      	</select>
											    </div>
											  </div>
											  <div class="form-group">
											    <label   class="col-xs-2 control-label">标签</label>
											    <div class="col-xs-10">
											      <input type="text" class="form-control" name="tabel" placeholder="请输入标签，便于搜索题目，例如: <高中数学>,<初中英语>" >
											    </div>
											  </div>
											  <div class="form-group">
											    <label   class="col-xs-2 control-label">难易</label>
											    <div class="col-xs-2">
											      	<select class="form-control" multiple name="difficulty">
											      		<option value="简单" selected="selected">简单</option>
											      		<option value="中等">中等</option>
											      		<option value="困难">困难</option>
											      	</select>
											    </div>
											  </div>
											   <div class="form-group">
											    <div class="col-xs-3 col-xs-offset-4">
											      <input type="submit" class="btn btn-primary btn-lg"  value="提交题目">
											    </div>
											  </div>
											</form>
									  </div><!--单选题 -->
									  
									  
									  <!--多选题 -->
									  <div class="tab-pane" id="Multiple">
									  		<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/admin/problem/save" method="post"  >
											  <div class="form-group">
											    <label   class="col-xs-2 control-label">题目</label>
											    <div class="col-xs-10">
											      <textarea type="text" id="editor2" class="form-control"  rows="3" name="title"></textarea>
											      <input type="hidden" name="type" value="多选题">
											    </div>
											  </div>
											  <div class="form-group">
											    <label   class="col-xs-2 control-label">选项A</label>
											    <div class="col-xs-10">
											      <input type="text" class="form-control"  name="optA">
											     
											    </div>
											  </div>
											  <div class="form-group">
											    <label   class="col-xs-2 control-label">选项B</label>
											    <div class="col-xs-10">
											      <input type="text" class="form-control" name="optB" >
											    </div>
											  </div>
											  <div class="form-group">
											    <label   class="col-xs-2 control-label">选项C</label>
											    <div class="col-xs-10">
											      <input type="text" class="form-control"  name="optC">
											    </div>
											  </div>
											  <div class="form-group">
											    <label   class="col-xs-2 control-label">选项D</label>
											    <div class="col-xs-10">
											      <input type="text" class="form-control" name="optD" >
											    </div>
											  </div>
											  <div class="form-group" >
											    <label   class="col-xs-2 control-label">答案</label>
											    <div class="col-xs-2" data-toggle="tooltip" data-placement="top" title="按住 Control (Ctrl) 键多选" onmouseover="$(this).tooltip('show')">
											      	<select class="form-control" multiple name="answer">
											      		<option value="A" selected="selected">A</option>
											      		<option value="B">B</option>
											      		<option value="C">C</option>
											      		<option value="D">D</option>
											      	</select>
											    </div>
											  </div>
											  <div class="form-group">
											    <label   class="col-xs-2 control-label">标签</label>
											    <div class="col-xs-10">
											      <input type="text" class="form-control" name="tabel" placeholder="请输入标签，便于搜索题目，例如: <高中数学>,<初中英语>" >
											    </div>
											  </div>
											  <div class="form-group">
											    <label   class="col-xs-2 control-label">难易</label>
											    <div class="col-xs-2">
											      	<select class="form-control" multiple name="difficulty">
											      		<option value="简单" selected="selected">简单</option>
											      		<option value="中等">中等</option>
											      		<option value="困难">困难</option>
											      	</select>
											    </div>
											  </div>
											   <div class="form-group">
											    <div class="col-xs-3 col-xs-offset-4">
											      <input type="submit" class="btn btn-primary btn-lg"  value="添加多选题">
											    </div>
											  </div>
											</form>
									  
									  </div><!--多选题 -->
									  
									  <!--判断题 -->
									  <div class="tab-pane" id="juedge">
									  		<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/admin/problem/save" method="post" >
											  <div class="form-group">
											    <label   class="col-xs-2  control-label">题目</label>
											    <div class="col-xs-10">
											      <textarea id="editor3" class="form-control"  rows="3" name="title"></textarea>
											      <input type="hidden" name="type" value="判断题">
											    </div>
											  </div>
											 
											  <div class="form-group" >
											    <label   class="col-xs-2 control-label">答案</label>
											    <div class="col-xs-2" >
											      	<select class="form-control"  name="answer">
											      		<option value="对" selected="selected">对</option>
											      		<option value="错">错</option>
											      	</select>
											    </div>
											  </div>
											  <div class="form-group">
											    <label   class="col-xs-2 control-label">标签</label>
											    <div class="col-xs-10">
											      <input type="text" class="form-control" name="tabel" placeholder="请输入标签，便于搜索题目，例如: <高中数学>,<初中英语>" >
											    </div>
											  </div>
											  <div class="form-group">
											    <label   class="col-xs-2 control-label">难易</label>
											    <div class="col-xs-2">
											      	<select class="form-control" multiple name="difficulty">
											      		<option value="简单" selected="selected">简单</option>
											      		<option value="中等">中等</option>
											      		<option value="困难">困难</option>
											      	</select>
											    </div>
											  </div>
											   <div class="form-group">
											    <div class="col-xs-3 col-xs-offset-4">
											      <input type="submit" class="btn btn-primary btn-lg"  value="添加判断题">
											    </div>
											  </div>
											</form>
									  </div><!--判断题 -->
									  
									  
									  <!--简答题 -->
									  <div class="tab-pane" id="question">
									  			<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/admin/problem/save" method="post" >
												  <div class="form-group">
												    <label   class="col-xs-2 control-label">题目</label>
												    <div class="col-xs-10">
												      <textarea type="text" id="editor4" class="form-control"  rows="3" name="title"></textarea>
												      <input type="hidden" name="type" value="简答题">
												    </div>
												  </div>
												  <div class="form-group" >
												    <label   class="col-xs-2 control-label">参考答案</label>
												    <div class="col-xs-10" >
												      	<textarea type="text" class="form-control"  rows="3" name="answer" placeholder="参考答案"></textarea>
												    </div>
												  </div>
												  <div class="form-group">
												    <label   class="col-xs-2 control-label">标签</label>
												    <div class="col-xs-10">
												      <input type="text" class="form-control" name="tabel" placeholder="请输入标签，便于搜索题目，例如: <高中数学>,<初中英语>" >
												    </div>
												  </div>
												  <div class="form-group">
												    <label   class="col-xs-2 control-label">难易</label>
												    <div class="col-xs-2">
												      	<select class="form-control" multiple name="difficulty">
												      		<option value="简单" selected="selected">简单</option>
												      		<option value="中等">中等</option>
												      		<option value="困难">困难</option>
												      	</select>
												    </div>
												  </div>
												   <div class="form-group">
												    <div class="col-xs-3 col-xs-offset-4">
												      <input type="submit" class="btn btn-primary btn-lg"  value="添加问答题">
												    </div>
												  </div>
											</form>
									  </div><!--简答题 -->
									</div>
							  </div>
							</div>
    					
    			</div>
    		</div>
    		
    	</div>
		<!--  模态框 -->
		<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		        <h4 class="modal-title" id="myModalLabel">试题列表</h4>
		      </div>
		      <div class="modal-body" >
		        	<table class="table table-hover table-striped" id="table1">
		        		<tr>
		        			<td>类型</td>
		        			<td>题目</td>
		        			<td>选项A</td>
		        			<td>选项B</td>
		        			<td>选项C</td>
		        			<td>选项D</td>
		        			<td>答案</td>
		        		</tr>
		        	</table>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div><!--  模态框 -->
    	
    	<%@ include file="buttom.jsp" %>
    	<script src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>
		<script src="${pageContext.request.contextPath}/js/ckeditor/jquery.js"></script>
    	<script type="text/javascript">
		$(function(){
			$("#problemList").click(function(){
				$(".data").remove();
				var key = $("#key").val();
				$.post("problem/search/json",{"key":key},function(data){
					$(data).each(function(){
						
						var tr = $("<tr class='data'><td>"+this.type+"</td><td>"+this.title+ "</td><td>"+this.optA+ "</td><td>"+this.optB+ "</td><td>"+this.optC+ "</td><td>"+this.optD+ "</td><td>"+this.answer+ "</td></tr>")
						$("#table1").append(tr);
						
					});
				});
				$('#myModal').modal('toggle');
				
			});
		});
		$(function() {
			$( 'textarea#editor1' ).ckeditor();
			$( 'textarea#editor2' ).ckeditor();
			$( 'textarea#editor3' ).ckeditor();
			$( 'textarea#editor4' ).ckeditor();
		} );
		</script>
  </body>
</html>
