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
	<div style="width: 1140px;">
		<div align="left">
			<div> <img src="/god/resources/image/bestidea.png" style="margin-left: 20px;"> </div> <!-- bestidea -->
			<div> 
				<c:forEach var="dto" items="${clists }">
				<div>
					<img alt="" src="  ">
				</div>
				
				</c:forEach>
				
			</div>
		</div>
		
		<div> 선 긋기</div>
		
	
		<div> <!-- 이미지 틀 -->
		
			<div>조회순  추천순</div> <!-- 조회순 추천순 -->
			
			<div> 
				
				<c:forEach var="dto" items="${lists }">
				
					
				
				</c:forEach>
	
			</div>
		
		</div>
	</div>
</div>

</body>
</html>