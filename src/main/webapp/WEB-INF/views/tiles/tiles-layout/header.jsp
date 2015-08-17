<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<body>
<div style="width: 100%;text-align: center;">
	<div class="topShortcut" style="float: right;">
		<div id="loginfoBox">
		<c:choose>
		<c:when test="${empty userId}">
		<a href="<%=cp%>/login.action">Login</a>
		</c:when>
		<c:otherwise>
		<a href="<%=cp%>/logout.action">Logout</a>  <a href="/god/myPage.action">myPage</a>
		</c:otherwise>
		</c:choose>
		</div>
	</div>
	<div style="">
		<a href="/god/login.action">login</a>//
		<a href="/god/shopmain.action">/god/shopmain.action</a>//
		<a href="/god/basket.action">basket</a>//
		<a href="/god/cancel.action">cancel</a>//
		<a href="/god/purchase.action">purchase</a>//
		<a href="/god/card.action">card</a>//
		<a href="/god/category.action">category</a>//
		<a href="/god/shop_created.action">/shop_created</a>//
	</div>
</div>
