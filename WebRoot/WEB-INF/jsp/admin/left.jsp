<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
						<li>
							<span><i class="glyphicon glyphicon-leaf"></i>
							<a href="${pageContext.request.contextPath}/admin/position">岗位列表</a></span>
						</li>
					</ul>
				</li>
						<!-- 				简历管理 -->
						<c:forEach items="${sessionScope.admin.privileges}" var="p">
							
							<c:if test="${p.name == '申请管理' }">
								<li><span><i class="glyphicon glyphicon-minus-sign"></i>申请管理</span>
									<ul>
										<li><span><i class="glyphicon glyphicon-leaf"></i>
										<a href="${pageContext.request.contextPath}/admin/apply">申请审核</a></span>
										</li>
									</ul>
								</li>
							</c:if>
							
						</c:forEach>
						
				<!-- 				试卷管理 -->
				<li><span><i class="glyphicon glyphicon-minus-sign"></i>试卷试题</span>
					<ul>
						<c:forEach items="${sessionScope.admin.privileges}" var="p">
							
							<c:if test="${p.name == '试卷管理' }">
								<li><span><i class="glyphicon glyphicon-leaf"></i><a>试卷管理</a></span></li>
							</c:if>
							<c:if test="${p.name == '试题管理' }">
								<li><span><i class="glyphicon glyphicon-leaf"></i><a href="${pageContext.request.contextPath}/admin/problem">试题管理</a></span></li>
							</c:if>
						</c:forEach>
						
						
					</ul>
				</li>
				
				<!-- 如果是系统管理员，才显示页面 -->
				<c:if test="${ sessionScope.admin.username == 'admin' }">
				
					<li><span><i class="glyphicon glyphicon-minus-sign"></i>系统管理</span>
						<ul>
							<li><span><i class="glyphicon glyphicon-leaf"></i>
							<a href="${pageContext.request.contextPath}/admin/admin">管理员列表</a></span>
							</li>
						</ul>
					</li>
				</c:if>
				<!-- 				系统管理 -->
				
			</ul></li>
	</ul>
	<!-- 主菜单 -->

</div>

