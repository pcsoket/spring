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

function name() {
	alert("1");
	
	var f = document.findId;
	
	f.action="<%=cp%>/findId_ok.action";
	
	f.submit();
}

function sendIt() {
	alert("!");
	
	var f = document.findId;
	
	f.action="/god/findId_ok.action";
	
	f.submit();
	
}
</script>
<title>아이디 / 비밀번호 찾기</title>
</head>
<body>
<form name="findId" method="post">
<!-- 전체 묶음 시작-->
<div>
<div>
	<div>
		<font style="font-family: 나눔손글씨 붓; size: 2pt;">아이디 / 비밀번호 찾기</font>
	</div>
	<div style="border-top-color: #EAEAEA; width:100%; height: 2px;"></div>
	<div style="">
		<div>
			<font size="2pt;">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름 : <input type="text" name="userName" size="6"/></font>
			<font size="2pt;">이 메 일 : <input style="margin-top: 2px;" type="text" name="userEmail" size="20"/></font>
		</div>
	</div>
	<div align="center" style="">
		<c:if test="${!empty message }">
		<font color="red">${message}</font>
		</c:if>
		<br/>
		<c:if test="${!empty message1 }">
		<font color="red">${message1}</font>
		</c:if>
		<br/>
		<div>
		<button type="submit" onclick="sendIt();"> 찾 기 </button>
		</div>
	</div>
	
</div>
<!-- 전체 묶음 종료-->
</div>
</form>
</body>
</html>