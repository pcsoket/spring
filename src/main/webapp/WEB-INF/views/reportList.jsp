<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

</script>
<title> 신 고 게 시 판 </title>
</head>
<body>
	<div align="center" style="width: 800px">
		<font size="9pt;" style="font-family: 나눔손글씨 붓;">신 고 접 수 현 황</font>
	</div>
	<div style=" width: 800px; border: 1px solid; border-top-color: #EAEAEA;">
	</div>
	<div align="center" style=" width: 800px; height: 20px;">
		<div align="center" style="width: 750px;">
			<div style="width: 250px; float: left;">
			 신고된 주소
			</div>
			<div style="width: 200px; float: left;">
			신고된 내용
			</div>
			<div style="width: 120px; float: left; ">
			신고한 ID
			</div>
			<div style="width: 150px; float: left;">
			 신고된 게시판
			</div>
		</div>
	</div>		
	<div style=" width: 800px; border: 1px solid; border-bottom-color: #EAEAEA;">
	</div>	
		<div align="center" style=" border:1px solid; width: 800px; height: 500px;">
			<c:forEach var="dto" items="${lists}">
				<div><a href="${dto.raddress}">${dto.raddress}</a></div>
				<div>${dto.rContent}</div>
				<div>${dto.mid}</div>
				<div>${dto.boardName}</div>
			</c:forEach>
		</div>	
	</body>
</html>