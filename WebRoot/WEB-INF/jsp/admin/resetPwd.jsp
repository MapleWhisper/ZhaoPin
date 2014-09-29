<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="header.jspf" %>
	<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
  </head>
  
  <body>
    	<div class="container">
    		<%@ include file="head.jsp" %>
    		<div class="row" style="margin-top: 70px">
    			<div class="col-sm-3">
					<%@ include file="left.jsp" %>
    			</div>
    			<div class="col-sm-9">
    				<div class="panel panel-primary">
					  <div class="panel-heading">修改密码</div>
					  <div class="panel-body">
					  
<!-- 					  	修改密码 -->
					    <form action="${pageContext.request.contextPath}/admin/position/resetPwd" 
					    	class="form-horizontal" role="form" id="form1">
						  <div class="form-group">
						    <label  class="col-sm-2 control-label">原密码</label>
						    <div class="col-sm-6">
						      <input type="password" name="oldPwd" id="oldPwd" class="form-control"  >
						      <input type="hidden" name="id" value="${sessionScope.admin.id }"   >
						      
						    </div>
						  </div>
						  <div class="form-group">
						    <label  class="col-sm-2 control-label">新密码</label>
						    <div class="col-sm-6">
						      <input type="text" name="pwd"  id="pwd" class="form-control" >
						    </div>
						  </div>
						  <div class="form-group">
						    <label  class="col-sm-2 control-label">确认新密码</label>
						    <div class="col-sm-6">
						      <input type="text" name="pwd2" id="pwd2" class="form-control" >
						    </div>
						  </div>
						 
						  <div class="form-group">
						    <div class="col-sm-offset-2 col-sm-10">
						      <button type="submit" class="btn btn-primary">提交修改</button>
						    </div>
						  </div>
						</form>
<!-- 						修改密码 -->
						
					  </div>
					</div>
    					
    					
    			</div>
    		</div>
    		
    	</div>
    	<%@ include file="buttom.jsp" %>
    	<script type="text/javascript">
    	$(function() {  
			$("#form1").validate({
				rules:{
					oldPwd: {
						required:true,
					},
					pwd: {
						required:true,
						minlength:2
					},
					pwd2: {
						required:true,
						equalTo:"#pwd"
					}
					
				},
				messages:{
					oldPwd: {
						required:"请输入原密码"
					},
					pwd: {
						required:"请输入密码"
					},
					pwd2: {
						required:"请输入确认密码",
						equalTo:"两次密码必须相同"
					}
				
				}
			});  
		});
    	</script>
  </body>
</html>
