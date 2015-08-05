<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=cp %>/resources/css/searchAddr.css" type="text/css"/>
<script type="text/javascript">
function searchAddr() {
	

	f = document.house;
	str = f.juso.value;
	str = str.trim();
	if(!f.juso.value){
		
		alert("찾으실 동을 입력하세요!!");
		f.juso.focus;
		return;
	}
	
	f.juso.value=str;
	
	f.action = "<%=cp%>/zipcode.action";
	f.submit();
	
}

</script>
<title> 주 소 검 색 </title>
</head>
<body>
<div>
<form name="house" method="post">
	<div align="center">
	<div>
		<font style="size: 1pt; color: #0054FF; font-family: 나눔손글씨 붓;"> 거주지 동으로 검색해주세요<br/>
		ex)명동,반포1동.....</font>
		</div>
		<input type="text" name="juso"/>
		<input type="submit" value=" 동 검색" onclick="searchAddr();">
	</div>
	</form>
</div>
<br/>
<div>
	<div style="border: 1px solid; border-color: #bdbdbd;"></div>
</div>
<div>
	<div align="center" id="addrList">
		<div align="center" id="addrList_title">
			<dl>
				<dt> 우 편 번 호 &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; </dt>
				<dt> 주 &nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;
						 소 </dt>
			</dl>
		</div>
	</div>
</div>
<div>
	<div style="border: 1px solid; border-color: #bdbdbd;"></div>
</div>
<div id="addrlist">
	<c:forEach var="dto" items="${lists }">
	<dl>
		<dd>${zipcode}</dd>
		<dd>${sido} ${gugun} ${dong} ${bunji}</dd>
	</dl>
	</c:forEach>
</div>
<div>
	<div style="border: 1px solid; border-color: #bdbdbd;"></div>
</div>
	<div>
	</div>
<div>
	<div style="border: 1px solid; border-color: #bdbdbd;"></div>
</div>
</body>
</html>