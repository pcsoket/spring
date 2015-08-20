<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp = request.getContextPath();
	int i=1;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

function searchId() {
	
		
		var f = document.search;
		
		f.action = "<%=cp%>/memberList.action";
		f.submit();
		
	
}

</script>
<title> 회 원 리 스 트 </title>
</head>
<body>
<!-- 전체 회원 리스트  -->
<div style="width: 100%;">
	<form action="" name="search" method="post">
		<!-- 검색 -->
		<div align="left">
		<select name="searchKey">
			<option value="mid"> I D </option>
		</select>
		<input type="text" name="searchValue"/>
		<input type="button" value="검색" onclick="searchId();"/>
		</div>
		</form>
		<div align="center">
		<font size="100pt;" style="font-family: 나눔손글씨 붓; color : #FF85FF;"> Member List</font>
	</div>
	<div style="border:1px solid; border-color: #8C8C8C; margin-top: 1px;">
	</div>
		<div>	
			<div align="center" style="width: 800px; height: 800px; margin-left:30%;">
				<dl>
				<c:forEach var="dto" items="${lists}">
					<dd style="float:left; margin-top: 2px;">
						<img style="border-radius:50%; width: 200px; height: 200px;"
						 src="/god/resources/testimg/${dto.userPimg}"/><br/>
						${dto.userId}
						<br/>
						${dto.userSelf}
					<%if(i%3==0){
					out.print("</dd><dd style='margin-top: 2px;'>");
					}i++; %>
				</dd>
				</c:forEach>
				</dl>
			</div>
		</div>
		
		<div style="border:1px solid; border-color: #ffffff;">
		</div>
		<div style="border:1px solid; border-color: #8C8C8C;">
		</div>
		<div align="center">
			<p>
				<c:if test="${dataCount!=0 }">
					${pageIndexList }
				</c:if>
				<c:if test="${dataCount==0 }">
					등록된게시물이 없습니다.
				</c:if>
			</p>
		</div>
	</div>
</body>
</html>