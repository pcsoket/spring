<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
  <title>GodShop</title>
  <meta charset="utf-8"> 
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

  
</head>
<body>

<div style="width: 100% ;text-align: center;">
	<div class="container">
		<div style="padding-top: 5px; float: left; width: 1000px;">
			<ul class="nav nav-tabs" style="float: left;">
			    <li class="active"><a href="<%=cp %>/category.action">Shop</a></li>
			    <li><a href="<%=cp %>/ideaMain.action">Invent</a></li>
		  	</ul>
	<div align="right">
    	<ul id="nav navbar-nav navbar-right" style="width: 240px; padding-top: 20px; margin-bottom: 0px; margin-right: 0px;">
			<c:choose>
			<c:when test="${empty logInfo}">
				<a href="<%=cp %>/basket.action"><span class="glyphicon glyphicon-shopping-cart"></span> basket</a>
			 	<a href="<%=cp %>/write.action"><span class="glyphicon glyphicon-user"></span> Sign Up</a>
		        <a href="<%=cp %>/login.action"><span class="glyphicon glyphicon-log-in"></span> Login</a>		        
			</c:when>
			<c:otherwise>			
				<a href="/god/myPage.action"><span class="glyphicon glyphicon-list-alt">myPage</span></a>
				<a href="<%=cp %>/basket.action"><span class="glyphicon glyphicon-shopping-cart"></span> basket</a>
				<a href="<%=cp%>/logout.action"><span class="glyphicon glyphicon-log-out">Logout</span></a>
			</c:otherwise>
			</c:choose>
		</ul>
   	 </div>
		</div>
	</div>
</div>

<nav class="navbar navbar-inverse" style="background-color: #ffffff; border-color: #ddd;">
  <div class="container-fluid" style="padding-left: 10px; padding-right: 10px; width: 1020px; margin-left: 370px; margin-right: 150px;">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="<%=cp %>/category.action">GodShop</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="<%=cp %>/category.action">아이디어상품  <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="<%=cp %>/idea_category.action">생활/건강</a></li>
            <li><a href="#">디지털/가전</a></li>
            <li><a href="#">가구/인테리어</a></li>
            <li><a href="#">패션잡화</a></li>
            <li><a href="#">스포츠/레저</a></li>
          </ul>
        </li>
        <li><a href="<%=cp %>/category.action">베스트상품</a></li>
        <li><a href="#">고객의 소리</a></li>
      </ul>
    </div>
  
  </div>
</nav>

</body>
</html>

