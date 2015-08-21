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

function commCreated() {
	
	f=document.replyInsert;
	f.action="<%=cp%>/comm/created.action";
	f.submit();
}

function gnoInsert() {
	
	f=document.group;
	f.action="<%=cp%>/gnoInsert.action";
	f.submit();
	
}

function gnoDelete() {
	
	f=document.group;
	f.action="<%=cp%>/gnoDelete.action";
	f.submit();
	
}


</script>
<title> 아이디어 상세 보기</title>
</head>
<body>
<!-- 전체 묶음 -->
<div>
	<div style="margin-top: 2px;">
		<!-- 아이디어 이미지 -->
		<form name="group" method="post">
		<div style="float: left;">
			<img alt="아이디어 이미지" src="" style="width: 250px; height: 250px;"/>
		</div>
		<!-- 주제 -->
		<div style="float: left; margin-left: 25px;">
			<font style="size: 2px; font-family: 나눔바른펜;">aaaaaaaaaaaaaaaa</font>
			<br/>
			<div style="border: 1px solid; color: #4374D9; width: 200px;">
			</div>
			<br/>
			<textarea rows="10" cols="50">aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</textarea>
		</div>
		<br/>
		<div style="margin-left: 580px;  margin-top: 190px;">
		<c:if test="${logInfo.gno=='0'}">
			<input type="button" value="그룹참여" onclick="gnoInsert();"/>
			</c:if>
		<c:if test="${logInfo.gno=='1'}">
			<input type="button" value="그룹탈퇴" onclick="gnoDelete();"/>
			</c:if>
		</div>
		${logInfo.userId}
		${logInfo.gno}
		<%-- <input type="hidden" name="gno" value="${gno}"/> --%>
		</form>
	</div>
	<!-- 댓글 등록 -->
	<div style="margin-top: 40px;">
	<form name="replyInsert" method="post">
		<div>
		<font style="font-family: 나눔손글씨 붓; color: #2F9D27;"> <b> 댓 글 </b> </font>
		</div>
		<div>
			<textarea style="float: left;" rows="5" cols="78" name="reply"></textarea>
			<input type="button" value="등록" style="margin-left:5px; float:left; width: 80px; height: 80px;" onclick="commCreated();"/>
		</div>
		</form>
	</div>
	<!-- 댓글 게시판 -->
	<div>
		<div style=" margin-top:100px; border: 1px solid; color: #EAEAEA; width: 650px;">
		</div>
		<div style="margin-top:1px; border: 1px solid; color: #EAEAEA; width: 650px;">
		</div>
		<div>
			<a href="<%=cp %>/group/article.action"></a>
		</div>
	</div>
</div>
</body>
</html>