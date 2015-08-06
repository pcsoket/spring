<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	int i=1;
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이미지 게시판</title>
<link rel="stylesheet" href="<%=cp%>/resources/data/style.css" type="text/css">

</head>

<body>

<br/>&nbsp;<br/>

<table width="600" border="2" cellspacing="0" cellpadding="0" bordercolor="#D6D4A6" align="center">
<tr height="40"> 
<td style="padding-left:25px;">
<b>이미지 게시판(Spring)</b>
</td>
</tr>
</table>
<br/>

<table width="600" border="0" cellpadding="0" cellspacing="0" align="center">
   <tr height="30">
      <td align="left" width="50%">
        Total ${totalDataCount} articles, ${totalPage} pages / Now page is ${currentPage}
      </td>
      <td align="right">
        <input type="button" value=" 게시물 등록 " onclick="javascript:location.href='<%=cp%>/img/created.action';" class="btn1"/>
      </td>
    </tr>
</table>

<table width="600" border="0" cellpadding="0" cellspacing="0" align="center">
  <tr><td height="3" bgcolor="#DBDBDB" align="center"></td></tr>
</table>

<table width="600" border="0" cellspacing="1" cellpadding="3"
   bgColor="#FFFFFF" align="center">



<tr bgcolor="#FFFFFF" >	

<c:forEach var="dto" items="${lists}">
		<td width="200" align="center">
			<%-- <a href="<%=cp%>/imageTest/down.action?saveFileName=${dto.saveFileName}&originalFileName=${dto.originalFileName}"> --%>
   		 		<img src="${imageUrl}/${dto.originalFileName}" width="180" height="180" border="0" />
  			<!-- </a> -->
 			<br/>${dto.subject} &nbsp;<a href="<%=cp%>/img/deleted.action?num=${dto.imgNum}">삭제</a>
		</td>
<%
if(i%3==0){
out.print("</tr><tr>");
}
i++;
%>
		
</c:forEach>

</tr>	


<tr bgcolor="#FFFFFF">
	<td align="center" height="30" colspan="3">
	<font color="Fuchsia">
		<c:if test="${totalDataCount!=0}">
			${pageIndexList}				
		</c:if> 
		<c:if test="${totalDataCount==0}">
			등록된 게시물이 없습니다.
		</c:if>
	</font>
	</td>
</tr>

</table>

<table width="600" border="0" cellpadding="0" cellspacing="0" align="center">
  <tr><td height="3" bgcolor="#DBDBDB" align="center"></td></tr>
</table>
</body>
</html>

