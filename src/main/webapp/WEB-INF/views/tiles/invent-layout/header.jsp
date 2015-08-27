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
			    <li><a href="<%=cp %>/category.action">Shop</a></li>
			    <li class="active"><a href="<%=cp %>/ideaMain.action">Invent</a></li>
		  	</ul>
	<div align="right">
    	<ul id="nav navbar-nav navbar-right" style="width: 200px; padding-top: 20px; margin-bottom: 0px; margin-right: 100px;">
			<c:choose>
			<c:when test="${empty logInfo}">
			 	<div style="width: 100px; float: left;"><a href="<%=cp %>/write.action"><span class="glyphicon glyphicon-user"></span> Sign Up</a></div>
		        <div style="width: 100px;"><a href="<%=cp %>/login.action"><span class="glyphicon glyphicon-log-in"></span> Login</a></div>
			</c:when>
			<c:otherwise>
			<a href="<%=cp%>/logout.action"><span class="glyphicon glyphicon-log-out">Logout</span></a>&nbsp;&nbsp;
			<a href="/god/myPage.action"><span class="glyphicon glyphicon-list-alt">myPage</span></a>
			</c:otherwise>
			</c:choose>
		</ul>
   	 </div>
		</div>
	</div>
</div>

<nav class="navbar navbar-inverse" style="background-color: #ffffff; border-color: #ddd; margin-bottom: 5px;">
  <div class="container-fluid" style="padding-left: 10px; padding-right: 10px; width: 1000px;">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" style="font-size: 20pt; font-family: Helvetica Neue ;" href="<%=cp %>/ideaMain.action">GoodIdea</a>
    </div>
    <div>
      <ul class="nav nav-pills nav-justified" style="padding-top: 10px; padding-bottom: 10px;" >
	    <li ><a href="<%=cp %>/group/list.action">Invent</a></li>
	    <li><a href="<%=cp %>/memberList.action">Community</a></li>
	    <li><a href="#">Completed</a></li>
 	  </ul>
 	 </div>
  </div>
</nav>


</body>
</html>

<%-- 
<body>
<div style="width: 100% ;text-align: center;">
	<div class="container">
		<div style="padding-top: 5px; float: left;">
			<ul class="nav nav-tabs">
			    <li class="active"><a href="<%=cp %>/shop.action">Shop</a></li>
			    <li><a href="<%=cp %>/invent.action">Invent</a></li>
			  
		  	</ul>
		</div>
		
	</div>
</div>

<nav class="navbar navbar-inverse" style="padding-left: 100px; padding-right: 100px;">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="<%=cp %>/shopmain.action" style="">GodShop</a>
    </div>
    <div>
      <ul class="nav navbar-nav">
        <li class="active" style="padding-left: 50px;"><a href="<%=cp %>/category.action">카테고리</a></li>
        <li style="padding-left: 50px;"><a href="#">베스트</a></li>
        <li style="padding-left: 50px;"><a href="#">고객의 소리</a></li> 
      </ul>
    </div>
    <div align="right">
    	<ul id="nav navbar-nav navbar-right" >
			<c:choose>
			<c:when test="${empty userId}">
			 	<li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
		        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
			</c:when>
			<c:otherwise>
			<a href="<%=cp%>/logout.action">Logout</a><a href="/god/myPage.action">myPage</a>
			</c:otherwise>
			</c:choose>
		</ul>
    </div>
  </div>
</nav>
 --%>
