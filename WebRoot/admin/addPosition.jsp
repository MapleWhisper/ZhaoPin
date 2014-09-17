<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>增加职位</title>
    <meta  charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  </head>
  
  
  <body style="background: url(image/bg.jpg) repeat;"> 
   <!--container -->
		<div class="container">
				<div class="row" style="margin-top: 15px ;margin-bottom: 100px">
					<div class="col-sm-9">
					<div class="panel panel-info" >
					  <div class="panel-heading">
					    <h3 class="panel-title">
					    	<div class="row">
					    		<div class="col-sm-3">
					    		职位名称
					    			 <div class="input-group input-group-sm">
					    			<input type="text" class="form-control" >
					    			</div>
					    		</div>
					    		<div class="col-sm-3 col-sm-offset-6">
					    			截止日期 <div class="input-group input-group-sm">
					    			<input type="text" class="form-control" >
					    			</div>
					    		</div>
					    	</div>
					     </h3>
					   </div>
					  </div>
			
					 
				
					<div class="panel panel-info" style="margin-top: 20px;margin-bottom: 100px">
					  <div class="panel-body">
						  		<table class="table table-striped table-hover table-bordered">
						  			<tr>
						  				<td class="info">职位性质</td>
						  				<td>
						  					 <div class="input-group input-group-sm">
					    						<input type="text" class="form-control" >
					    					</div>
						  				</td>
						  				
						  				<td class="info">工作经验</td>
						  				<td>
						  					<div class="input-group input-group-sm">
					    						<input type="text" class="form-control" >
					    					</div>
						  				</td>
						  				
						  				<td class="info">招聘人数</td>
						  				<td>
						  					<div class="input-group input-group-sm">
					    						<input type="text" class="form-control" >
					    					</div>
						  				</td>
						  			</tr>
						  			
						  			<tr>
						  				<td class="info">最低学历</td>
						  				<td>
						  					<div class="input-group input-group-sm">
					    						<input type="text" class="form-control" >
					    					</div>
						  				</td>
						  				<td class="info">薪资待遇</td>
						  				<td>
						  					<div class="input-group input-group-sm">
					    						<input type="text" class="form-control" >
					    					</div>
						  				</td>
						  				
						  				<td class="info">语言要求</td>
						  				<td>
						  						<div class="input-group input-group-sm">
					    						<input type="text" class="form-control" >
					    					</div>
						  				</td>
						  				
						  				
						  			</tr>
						  			<tr>
						  				
						  			</tr>
						  			
						  				
						  		</table>
						  		<div class="panel panel-warning">
								  <div class="panel-heading">
								  	岗位要求 
								  </div>
								  <div class="panel-body" style="padding-top:10px;padding-bottom: 10px">
								   			<div class="questArea">
			    								<textarea class="form-control" rows="5"></textarea>
			    							</div>
								  </div>
								  <div class="panel-footer" >
								  		<center><a href="" class="btn btn-primary btn-lg">上传职位</a></center>
								  </div>
								</div>
					  </div>
					 </div>
					</div>
					</div>
				</div>

				
		</div><!--container -->	 
  </body>
</html>
