<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	int i=1;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 회 원 리 스 트 </title>
</head>
<body>
<!-- 전체 회원 리스트  -->
<div>
	<div align="center" >
		<font size="100pt;" style="font-family: 나눔손글씨 붓; color : #FF85FF;"> Member List</font>
	</div>
	<div style="border:1px solid; border-color: #8C8C8C;">
	</div>
	<div style="border:1px solid; border-color: #ffffff;">
	</div>
		<div align="center" style="width: 700px;">
			<dl>
			<c:forEach var="dto" items="${lists}">
				<dd >
					<img style="border-radius:50%; width: 200px; height: 200px;"
					 src="/god/resources/testimg/${dto.userPimg}"/><br/>
					${dto.userSelf}
				<%if(i%3==0){
				out.print("</dd><dd>");
				}i++; %>
			</dd>
			</c:forEach>
			</dl>
		</div>
	<div style="border:1px solid; border-color: #ffffff;">
	</div>
	<div style="border:1px solid; border-color: #8C8C8C;">
	</div>
</div>
</body>
</html>