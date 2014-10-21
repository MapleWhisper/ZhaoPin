<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="header.jspf"%>
<title>公司介绍</title>
<style type="text/css">
#nav {
	position: fixed;
	width: 250px
}
</style>
<script>
		$(function(){
			$(".pre").click(function(){
				//alert("ok");
				$(this).addClass("active");
				$(this).siblings().removeClass("active");
			});
		});
		
	</script>
</head>

<body
	style="background: url(${pageContext.request.contextPath}/image/index-bg.jpg) repeat;">
	<div class="container">
		<%@ include file="head.jsp"%>

		<div class="page-header">
			<h2 class=""></h2>
		</div>
		<div class="row">
			<!--左侧的导航条 -->
			<div class="col-xs-3">

				<ul class="nav nav-pills nav-stacked" role="tablist" id="nav">
					<li role="presentation" class="pre active"><a
						href="#companyIntroduction">我们的自我简介</a></li>
					<li role="presentation" class="pre"><a href="${pageContext.request.contextPath}/client/companyProfession">我们的主业务</a></li>
					<li role="presentation" class="pre"><a href="${pageContext.request.contextPath}/client/companyHistory">我们的里程碑</a></li>
				</ul>

			</div>
			<!--左侧的导航条 -->


			<div class="col-xs-8" style="background-color: repeat;">
				<!-- style="background-image: url(${pageContext.request.contextPath}/image/company.jpg);  -->
				<div class="row">
					<div class="page-header"
						style="margin-left: 30px;margin-top: 100px;"
						id="companyIntroduction">
						<h2 class="head-leader">公司介绍</h2>

					</div>

					<div   style="margin-top: 50px;">
						<div class="col-sm-10 col-sm-offset-1">
							<p>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;阿里巴巴集团经营多元化的互联网业务，致力为全球所有人创造便捷的网上交易渠道。自成立以来，发展了消费者电子商务、
							网上支付、B2B网上交易市场及云计算等领先业务。阿里巴巴集团现有25个事业部，
							其目标是促进一个开放、协同、繁荣的电子商务生态系统。
							阿里巴巴集团由本为英语教师的中国互联网先锋马云于1999年带领其他17人所创立，
							他希望将互联网发展成为普及使用、安全可靠的工具，让大众受惠。阿里巴巴集团由私人持股，
							现服务来自超过240个国家和地区的互联网用户。阿里巴巴集团及其关联公司在大中华地区、印度、日本、韩国、英国及美国70多个城市共有24,000多名员工
						</p>
						
						
						</div>
						
					</div>
				</div>


			</div>

		</div>
	</div>


	<%@ include file="buttom.jsp"%>
</body>
</html>
