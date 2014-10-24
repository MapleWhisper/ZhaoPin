<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<ul class="pagination">
 		  <li><a href="${pageContext.request.contextPath}/admin/paper/item/1">首页</a></li>
 		  <c:forEach begin="${page.cur-5>=1?page.cur-5:1 }" end="${page.cur+5<=page.sum ? page.cur+5 : page.sum}" var="p" varStatus="s">
 		  	 
 		     <c:if test="${p == page.cur }">
 		     	<li class="active"><a href="${pageContext.request.contextPath}/admin/problem/problemAction!list?cur=${p}">${p}</a></li>
 		     </c:if>
 		     <c:if test="${p != page.cur }">
 		     	<li><a href="${pageContext.request.contextPath}/admin/problem/problemAction!list?cur=${p}">${p}</a></li>
 		     </c:if>
 		  </c:forEach>
 		  <li ><a href="${pageContext.request.contextPath}/admin/problem/problemAction!list?cur=${page.sum}">末页</a></li>
</ul>	<!-- 试卷导航栏 -->