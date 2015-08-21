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

function idChk() {
	
	var f=document.idchk;
	
	 str = f.userId.value;
	 if(!str){
		 alert("\n아이디를 입력하세요..");
		 f.userId.focus();
		 return;
	 }
	 
	f.action="<%=cp%>/idchk_chk.action";
	f.submit();
	
}

function endChk(str) {
	
	opener.document.getElementById("userId").value=str;
	self.close();
	
}

</script>
<title>중복 아이디 체크</title>
</head>
<body>
<form name="idchk" method="post">
<div align="center">
아이디 : <input type="text" name="userId" value="${userId}"/>
	</div>
	<br/>
	<div align="left" style="float: left; overflow: hidden;">
	<input type="button" value="중복 확인" onclick="idChk();"/>
	</div>
	<c:if test="${!empty message1}">
	<div align="right" style="float: right; overflow: hidden;">
		<input type="submit" value="사용하기" onclick="endChk('${userId}');"/>
		</div>
		</c:if>
		<br/>
		<div align="center">
		<c:if test="${!empty message}">
		<font style="color: red;"><b>${message}</b></font>
		</c:if>
		<c:if test="${!empty message1}">
		<font style="color: red;"><b>${message1}</b></font>
		</c:if>
	</div>
</form>
</body>
</html>