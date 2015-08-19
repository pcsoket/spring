<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>

<head>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


</head>
<body>
<div style="width: 100%;text-align: center;">
	<div class="container">
		<div style="padding-top: 5px; float: left;">
			<ul class="nav nav-tabs">
			    <li class="active"><a href="/god/shop.action">Shop</a></li>
			    <li><a href="/god/invent.action">Invent</a></li>
			  
		  	</ul>
		</div>
		
	</div>
</div>

<div align="center" style="width: 100%;">

	<div class="topShortcut" style="float: right;">
		<div id="loginfoBox">
		<c:choose>
		<c:when test="${empty logInfo}">
		<a href="<%=cp%>/login.action">Login</a>
		</c:when>
		<c:otherwise>
		${logInfo.userId}//<a href="<%=cp%>/logout.action">Logout</a>//<a href="/god/myPage.action">myPage</a>
		</c:otherwise>
		</c:choose>
		</div>
	</div>
	<div class="nav nav-pills" style="">
		<li><a href="/god/login.action">login</a></li>
		<li><a href="/god/shopmain.action">/god/shopmain.action</a></li>
		<li><a href="/god/basket.action">basket</a></li>
		<li><a href="/god/cancel.action">cancel</a></li>
		<li><a href="/god/orderList.action">구매목록</a></li>
		<li><a href="/god/card.action">card</a></li>
		<li><a href="/god/category.action">category</a></li>
		<li><a href="/god/shop_created.action">/shop_created</a></li>
	</div>
	
</div>


