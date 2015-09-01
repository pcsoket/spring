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
function chk(str) {
	alert("한글안되냐? : /r/n되냐?");
	var popOption = "width=300, height=200,resizable=no,scrollbars=no, status=no, top=300,left=700;";
	win = window.open("<%=cp %>/chkRcontent.action?str=" + str,"popup",popOption);
	
}
</script>
<title> 신 고 게 시 판 </title>
</head>
<body>
	<div align="center" style=" margin-left:250px; width: 800px;">
		<font size="9pt;" style="font-family: 나눔손글씨 붓;">신 고 접 수 현 황</font>
	</div>
		
		<div align="center" style="width: 1200px;">
		<table style="border:1px; border-color:#EAEAEA; width: 800px;">
		<tr><td colspan="4"><div style="border: 1px solid; border-top-color: #EAEAEA;"></div></td>
		</tr>
			<tr>
				<td style="width: 30px;">
				주소
				</td>
				<td style="width: 230px;">
				신고된 내용
				</td>
				<td style="width: 100px;">
				신고 ID
				</td>
				<td style="width: 30px;">
				게시판
				</td>
			</tr>
			<tr><td colspan="4"><div style="border: 1px solid; border-top-color: #EAEAEA;"></div></td>
			<c:forEach var="dto" items="${lists}">
				<tr>
				<td>
				<a href="${dto.raddress}">Link</a>
				</td>
				<td style="width: 30px;">
				${dto.rContent}
				</td>
				<td>
				${dto.mid}
				</td>
				<td>
				${dto.boardName}
				</td>
				</tr>
				<tr><td colspan="4"><div style="border: 1px solid; border-top-color: #EAEAEA;"></div></td>
			</tr>
			</c:forEach>
			</table>
			<div style="height: 30px;">
			<div align="center">${pageIndexList}</div>
			</div>
		</div>	
	</body>
</html>

