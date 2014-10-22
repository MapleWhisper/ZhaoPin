
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="header.jspf"%>
<link rel="stylesheet"  href="${pageContext.request.contextPath}/js/kindeditor/themes/simple/simple.css" />
<script charset="utf-8" src="${pageContext.request.contextPath}/js/kindeditor/kindeditor-min.js"></script>
<script charset="utf-8" src="${pageContext.request.contextPath}/js/kindeditor/lang/zh_CN.js"></script>
</head>

<body>
	<div class="container">
		<%@ include file="head.jsp" %>
		<div class="row " style="margin-top: 70px">
			<div class="col-xs-3">
				<%@ include file="left.jsp"%>
			</div>
			<div class="col-xs-9 ">
				   <div class="panel panel-primary">
					<div class="panel-heading">文章增加</div>

					<div class="panel-body">
							<form action="${pageContext.request.contextPath }/admin/article/update" class="form-horizontal" role="form" id="form" method="post">
								<div class="form-group">
									<label  class="col-xs-2 control-label">文章标题</label>
									<div class="col-xs-9">
										<input type="text" class="form-control inputxt" required name="title" id="title" value="${article.title }">
										<input type="hidden" name="id"  value="${article.id }">
									</div>
								</div>
								
								
								<div class="form-group">
									<label  class="col-xs-2 control-label">文章内容：</label>
									<div class="col-xs-9">
										<textarea id="editor" class="form-control" name="context"  required rows="25">${article.context}</textarea>
									</div>
								</div>
								
								
								
								<div class="form-group">
									<center><input type="submit" value="修改文章" id="submit"  class="btn btn-primary btn-lg"/></center>
								</div>
								
						</form>
					</div>
						
					</div><!-- panel -->
				</div>
			</div>
		</div><!-- 	container -->
		
		
		<script type="text/javascript">
		//Html editor
		KindEditor.ready(function(K) {
			editor = K.create('#editor', {
				resizeType : 1,
				allowPreviewEmoticons : false,
				allowImageUpload : false,
				items : [
					'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
					'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
					'insertunorderedlist', '|', 'emoticons', 'image', 'link']
			});

		});
		
		$(function(){
			$("#submit").click(function(){
				var type = $("radio").attr("selected").val();
				alert(type);
			});
		})
		</script>

	<%@ include file="buttom.jsp" %>
</body>
</html>

