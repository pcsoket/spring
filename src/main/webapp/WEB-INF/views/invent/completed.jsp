<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>



<div align="center"> <!-- 전체틀 -->
<table width="1140px" align="center" class="box">
<tr>
	<td>
<div class="container" >
	<div class="jumbotron" align="center" style="background-image: url(/god/resources/image/banner2.png);">
		<h3 style="color: #ff4b46">Team up with top brands</h3>      
		<p style="color: #ff4b46"></p>
		
		
		
	</div>
</div>
	</td>
</tr>
</table>

	<div style="width: 1140px;">
		<div align="left" style="width: 1000px;">
			<div> <img src="/god/resources/image/bestidea.png" style="margin-left: 20px;"> </div> <!-- bestidea -->
			<div> 
				<c:forEach var="cdto" items="${clists }">
				<div align="center" >
					<div style="float:left; padding-left: 20px;"><a href="<%=cp %>/compl/article.action?gNum=${cdto.cpNum}"> <img alt="" src=" ${cdto.imgNum}" style="width:300px; height:250px;" ></a></div>
					<div>${cdto.cSubject }</div>
				</div>
				
				</c:forEach>
				
			</div>
		</div>
		
		<div style="border-bottom: solid 2px #ddd;"></div>
		
	
		<div style="width: 1000px;"> <!-- 이미지 틀 -->
			
			<div style="width: 1000px; border-bottom: solid 2px #ddd;">	
				<div align="right" style="width: 100px;">
					<div style="float: left;" onclick="">조회순</div> <div>추천순</div>
				</div> <!-- 조회순 추천순 -->
			
			<div> 
				<c:set var="c" value="0"/>
				<c:forEach var="dto" items="${lists }">
				
					<div>
					<a href="${articleUrl}&pNum=${dto.cpNum}"><img alt="" src="${dto.imgNum }" width="300" height="250" /></a><br/>
					<font color="#8b4513 " style="font-family: 나눔바른펜; font-size:13pt;">
					<a href ="${articleUrl}&pNum=${dto.cpNum}">
					${dto.cSubject}</a></font>
					<br/>${dto.mid}
					
					</div>
				<c:set var="c" value="${c+1 }"/>
				<c:if test="${c%3==0}">
					<div></div>
				</c:if>
				</c:forEach>
				
				
	
			</div>
		
		</div>
	</div>
</div>

</body>
</html>