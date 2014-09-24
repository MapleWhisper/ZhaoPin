<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="header.jspf" %>
  </head>
  
  <body>
    	<div class="container">
    		<%@ include file="head.jsp" %>
    		<div class="row" style="margin-top: 70px">
    			<div class="col-sm-3">
					<%@ include file="left.jsp" %>
    			</div>
    			<div class="col-sm-9">
				  <!--搜索提示栏 -->
				  	<div class="panel panel-primary">
						 <div class="panel-heading">
							    <h3 class="panel-title">搜索试题</h3>
					      </div>
						 <div class="panel-body">
    						 <div class="form-group">
    						 	<div class=row>
    						 		<div class="col-sm-8">
    						 			<input type="text" class="form-control" placeholder="输入试题标签">
    						 		</div>
    						 		<div class="col-sm-4">
    						 			 <button type="submit" class="btn btn-default">搜索试题</button>
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
									<ul class="nav nav-pills" role="tablist">
									  <li class="active"><a href="#single" role="tab" data-toggle="tab">单选题</a></li>
									  <li><a href="#Multiple" role="tab" data-toggle="tab">多选题</a></li>
									  <li><a href="#juedge" role="tab" data-toggle="tab">判断题</a></li>
									  <li><a href="#question" role="tab" data-toggle="tab">问答题</a></li>
									</ul>
									
									<!-- 添加试题 -->
									<div class="tab-content " style="margin-top: 50px">
										<!--单选题 -->
									  <div class="tab-pane active" id="single">
									  		
									  		
									  		<form class="form-horizontal" role="form" action="problem/save" method="post" >
											  <div class="form-group">
											    <label for="inputEmail3" class="col-sm-2 control-label">题目</label>
											    <div class="col-sm-10">
											      <textarea type="text" class="form-control"  rows="3" name="title"></textarea>
											      <input type="hidden" name="type" value="单选题">
											    </div>
											  </div>
											  <div class="form-group">
											    <label for="inputPassword3" class="col-sm-2 control-label">选项A</label>
											    <div class="col-sm-10">
											      <input type="text" class="form-control"  name="optA">
											     
											    </div>
											  </div>
											  <div class="form-group">
											    <label for="inputPassword3" class="col-sm-2 control-label">选项B</label>
											    <div class="col-sm-10">
											      <input type="text" class="form-control" name="optB" >
											    </div>
											  </div>
											  <div class="form-group">
											    <label for="inputPassword3" class="col-sm-2 control-label">选项C</label>
											    <div class="col-sm-10">
											      <input type="text" class="form-control"  name="optC">
											    </div>
											  </div>
											  <div class="form-group">
											    <label for="inputPassword3" class="col-sm-2 control-label">选项D</label>
											    <div class="col-sm-10">
											      <input type="text" class="form-control" name="optD" >
											    </div>
											  </div>
											  <div class="form-group">
											    <label for="inputPassword3" class="col-sm-2 control-label">答案</label>
											    <div class="col-sm-2">
											      	<select class="form-control" name="answer">
											      		<option value="A" selected="selected">A</option>
											      		<option value="B">B</option>
											      		<option value="C">C</option>
											      		<option value="D">D</option>
											      	</select>
											    </div>
											  </div>
											  <div class="form-group">
											    <label for="inputPassword3" class="col-sm-2 control-label">标签</label>
											    <div class="col-sm-10">
											      <input type="text" class="form-control" name="tabel" placeholder="请输入标签，便于搜索题目，例如: <高中数学>,<初中英语>" >
											    </div>
											  </div>
											  <div class="form-group">
											    <label for="inputPassword3" class="col-sm-2 control-label">难易</label>
											    <div class="col-sm-2">
											      	<select class="form-control" multiple name="difficulty">
											      		<option value="简单" selected="selected">简单</option>
											      		<option value="中等">中等</option>
											      		<option value="困难">困难</option>
											      	</select>
											    </div>
											  </div>
											   <div class="form-group">
											    <div class="col-sm-3 col-sm-offset-4">
											      <input type="submit" class="btn btn-primary btn-lg"  value="提交题目">
											    </div>
											  </div>
											</form>
									  </div><!--单选题 -->
									  
									  
									  <!--多选题 -->
									  <div class="tab-pane" id="Multiple">
									  		<form class="form-horizontal" role="form" action="problem/save" method="post"  >
											  <div class="form-group">
											    <label for="inputEmail3" class="col-sm-2 control-label">题目</label>
											    <div class="col-sm-10">
											      <textarea type="text" class="form-control"  rows="3" name="title"></textarea>
											      <input type="hidden" name="type" value="多选题">
											    </div>
											  </div>
											  <div class="form-group">
											    <label for="inputPassword3" class="col-sm-2 control-label">选项A</label>
											    <div class="col-sm-10">
											      <input type="text" class="form-control"  name="optA">
											     
											    </div>
											  </div>
											  <div class="form-group">
											    <label for="inputPassword3" class="col-sm-2 control-label">选项B</label>
											    <div class="col-sm-10">
											      <input type="text" class="form-control" name="optB" >
											    </div>
											  </div>
											  <div class="form-group">
											    <label for="inputPassword3" class="col-sm-2 control-label">选项C</label>
											    <div class="col-sm-10">
											      <input type="text" class="form-control"  name="optC">
											    </div>
											  </div>
											  <div class="form-group">
											    <label for="inputPassword3" class="col-sm-2 control-label">选项D</label>
											    <div class="col-sm-10">
											      <input type="text" class="form-control" name="optD" >
											    </div>
											  </div>
											  <div class="form-group" >
											    <label for="inputPassword3" class="col-sm-2 control-label">答案</label>
											    <div class="col-sm-2" data-toggle="tooltip" data-placement="top" title="按住 Control (Ctrl) 键多选" onmouseover="$(this).tooltip('show')">
											      	<select class="form-control" multiple name="answer">
											      		<option value="A" selected="selected">A</option>
											      		<option value="B">B</option>
											      		<option value="C">C</option>
											      		<option value="D">D</option>
											      	</select>
											    </div>
											  </div>
											  <div class="form-group">
											    <label for="inputPassword3" class="col-sm-2 control-label">标签</label>
											    <div class="col-sm-10">
											      <input type="text" class="form-control" name="tabel" placeholder="请输入标签，便于搜索题目，例如: <高中数学>,<初中英语>" >
											    </div>
											  </div>
											  <div class="form-group">
											    <label for="inputPassword3" class="col-sm-2 control-label">难易</label>
											    <div class="col-sm-2">
											      	<select class="form-control" multiple name="difficulty">
											      		<option value="简单" selected="selected">简单</option>
											      		<option value="中等">中等</option>
											      		<option value="困难">困难</option>
											      	</select>
											    </div>
											  </div>
											   <div class="form-group">
											    <div class="col-sm-3 col-sm-offset-4">
											      <input type="submit" class="btn btn-primary btn-lg"  value="添加多选题">
											    </div>
											  </div>
											</form>
									  
									  </div><!--多选题 -->
									  
									  <!--判断题 -->
									  <div class="tab-pane" id="juedge">
									  		<form class="form-horizontal" role="form" action="problem/save" method="post" >
											  <div class="form-group">
											    <label for="inputEmail3" class="col-sm-2 control-label">题目</label>
											    <div class="col-sm-10">
											      <textarea type="text" class="form-control"  rows="3" name="title"></textarea>
											      <input type="hidden" name="type" value="多选题">
											    </div>
											  </div>
											
											 
											  <div class="form-group" >
											    <label for="inputPassword3" class="col-sm-2 control-label">答案</label>
											    <div class="col-sm-2" >
											      	<select class="form-control"  name="answer">
											      		<option value="对" selected="selected">对</option>
											      		<option value="错">错</option>
											      	</select>
											    </div>
											  </div>
											  <div class="form-group">
											    <label for="inputPassword3" class="col-sm-2 control-label">标签</label>
											    <div class="col-sm-10">
											      <input type="text" class="form-control" name="tabel" placeholder="请输入标签，便于搜索题目，例如: <高中数学>,<初中英语>" >
											    </div>
											  </div>
											  <div class="form-group">
											    <label for="inputPassword3" class="col-sm-2 control-label">难易</label>
											    <div class="col-sm-2">
											      	<select class="form-control" multiple name="difficulty">
											      		<option value="简单" selected="selected">简单</option>
											      		<option value="中等">中等</option>
											      		<option value="困难">困难</option>
											      	</select>
											    </div>
											  </div>
											   <div class="form-group">
											    <div class="col-sm-3 col-sm-offset-4">
											      <input type="submit" class="btn btn-primary btn-lg"  value="添加判断题">
											    </div>
											  </div>
											</form>
									  </div><!--判断题 -->
									  
									  
									  <!--简答题 -->
									  <div class="tab-pane" id="question">
									  			<form class="form-horizontal" role="form" action="problem/save" method="post" >
												  <div class="form-group">
												    <label for="inputEmail3" class="col-sm-2 control-label">题目</label>
												    <div class="col-sm-10">
												      <textarea type="text" class="form-control"  rows="3" name="title"></textarea>
												      <input type="hidden" name="type" value="简答题">
												    </div>
												  </div>
												
												 
												  <div class="form-group" >
												    <label for="inputPassword3" class="col-sm-2 control-label">参考答案</label>
												    <div class="col-sm-10" >
												      	<textarea type="text" class="form-control"  rows="3" name="answer" placeholder="参考答案"></textarea>
												    </div>
												  </div>
												  <div class="form-group">
												    <label for="inputPassword3" class="col-sm-2 control-label">标签</label>
												    <div class="col-sm-10">
												      <input type="text" class="form-control" name="tabel" placeholder="请输入标签，便于搜索题目，例如: <高中数学>,<初中英语>" >
												    </div>
												  </div>
												  <div class="form-group">
												    <label for="inputPassword3" class="col-sm-2 control-label">难易</label>
												    <div class="col-sm-2">
												      	<select class="form-control" multiple name="difficulty">
												      		<option value="简单" selected="selected">简单</option>
												      		<option value="中等">中等</option>
												      		<option value="困难">困难</option>
												      	</select>
												    </div>
												  </div>
												   <div class="form-group">
												    <div class="col-sm-3 col-sm-offset-4">
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
    	
    	<%@ include file="buttom.jsp" %>
  </body>
</html>
