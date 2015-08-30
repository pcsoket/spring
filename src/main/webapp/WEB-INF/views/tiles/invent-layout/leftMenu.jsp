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

  
</head>
<style>
#.leftBox{
border-right: 1px;
}
</style>

<body>

<div id="leftMenu">

	<dl class="leftFirst">
  		<dt><strong>나의 정보</strong></dt>
		<dd>내기여도?</dd>
    </dl>

	<dl class="leftSecond">
	
		
		<ul class="lefBox">
			<li class=""><a href="<%=cp%>/group/idea.action">그룹소개</a></li>
			<li class=""><a href="<%=cp%>/group/idea.action">그룹통계</a></li>
		
		
			<li class=""><a href="<%=cp%>/group/idea.action">아이디어</a></li>
			<li class=""><a href="<%=cp%>/group/sketch.action">스케치게시판</a></li>
			<li class=""><a href="<%=cp%>/group/3D.action">3D모델링</a></li>
		
			<li class=""><a href="<%=cp%>/group/idea.action"></a></li>
			<li class=""><a href="<%=cp%>/group/idea.action"></a></li>
		</ul>
           
  	</dl>
  		
</div>


</body>
</html>

