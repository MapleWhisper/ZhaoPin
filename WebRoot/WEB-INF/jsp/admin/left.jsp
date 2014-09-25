<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<div class="tree well" style="position: fixed;">
	<div style="margin-left: 15px">
		今天是:<br>
		<p>
			<code><%=DateFormat.getDateInstance(DateFormat.FULL).format(new Date())%><br></code>
		</p>

	</div>
	<ul style="margin-left: -40px">
		<!-- 主菜单 -->
		<li><span class="glyphicon glyphicon-folder-open">主菜单</span>
			<ul>
				<!-- 				岗位管理 -->
				<li><span><i class="glyphicon glyphicon-minus-sign"></i>岗位管理</span>
					<ul>
						<li><span><i class="glyphicon glyphicon-leaf"></i><a
								href="${pageContext.request.contextPath}/admin/position">岗位列表</a></span></li>
						
					</ul></li>

				<!-- 				简历管理 -->
				<li><span><i class="glyphicon glyphicon-minus-sign"></i>简历管理</span>
					<ul>
						<li><span><i class="glyphicon glyphicon-leaf"></i><a href="${pageContext.request.contextPath}/admin/apply
						">申请审核</a></span>
						</li>

					</ul></li>

				<!-- 				试卷管理 -->
				<li><span><i class="glyphicon glyphicon-minus-sign"></i>试卷管理</span>
					<ul>
						<li><span><i class="glyphicon glyphicon-leaf"></i><a>试卷管理</a></span></li>
						<li><span><i class="glyphicon glyphicon-leaf"></i><a href="${pageContext.request.contextPath}/admin/problem">试题管理</a></span></li>

					</ul></li>

				<!-- 				系统管理 -->
				<li><span><i class="glyphicon glyphicon-minus-sign"></i>系统管理</span>
					<ul>
						<li><span><i class="glyphicon glyphicon-leaf"></i><a
								href="${pageContext.request.contextPath}/admin/admin">管理员列表</a></span></li>
						

					</ul></li>
			</ul></li>
	</ul>
	<!-- 主菜单 -->

</div>

