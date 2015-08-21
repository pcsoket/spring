<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

.box{
	border-collapse: collapse;
	}

.line2{
		border-bottom: 2px solid #ffd2d7;
		
		}

.line3{border-top: 5px solid  #A6A6A6;
	border-bottom: 1px solid #ffd2d7;

}
.line4{	
	border-bottom: 1px solid  #EAEAEA;
	background-color:  #ffd2d7;
	}
.line5{
	border-bottom: 1px solid  #EAEAEA;
	}
	
.btn1{
	background-color: #ffd2d7;
	border:1px solid #ffd2d7;
	font :"#8b4513";
	font-family : 나눔바른펜";

	}


</style>

<script type="text/javascript">
	function a_sendIt() {
		 f = document.myForm;
	    	str = f.cmContent.value;
		    str = str.trim();
	        if(!str) {
	            alert("내용을 입력하세요. ");
	            f.cmContent.focus();
	            return;
	        }
	    	f.cmContent.value = str;
	
	 	
	        f.action = "<%=cp%>/comm/created.action";
	        f.submit();
	}
        
</script>
</head>
<body>
	
<table width="1000" align="center" class="box">
		
<tr height="50px">
</tr>
<tr height="40px"> 


<td class="line3" colspan="5"><font color="#8b4513 " style="font-family: 나눔손글씨 붓;" font size="10px"><b>${dto.gSubject}</b></font></td>


</tr>
<tr height="20px">
</tr>

<tr align="center" height="30px" class="line5">
	<td width="200px"><font color="#8b4513 " style="font-family: 나눔바른펜;"><b>${dto.mId}</b></font></td>
	<td width="300px"></td>
	<td width="200px"><font color="#8b4513 " style="font-family: 나눔바른펜;"><b>${dto.gCreated}</b></font></td>
	<td width="100px"><font color="#8b4513 " style="font-family: 나눔바른펜;"><b>${dto.gHitCount}</b></font></td>
</tr>
<tr class="line5"><td colspan="4" style="padding: 20px 80px 20px 62px;" valign="top" height="400" class="font2">
		${dto.gContent}
	</td></tr>
	
<tr height="40px">
	<td	class="line5" colspan="4">
	 <input type="button" value=" 수정 "  class="btn1" style="height:30px; color: #8b4513; font-family: 나눔바른펜;"" 
	 onclick="javascript:location.href='<%=cp%>/group/updated.action?gNum=${dto.gNum}&${params}';"/>
     <input type="button" value=" 삭제 "  class="btn1" style="height:30px; color: #8b4513; font-family: 나눔바른펜;"" 
     onclick="javascript:location.href='<%=cp%>/group/deleted.action?gNum=${dto.gNum}&${params}';"/>
	 <input type="button" value=" 목록 "  class="btn1" style="height:30px; color: #8b4513; font-family: 나눔바른펜;"" 
	 onclick="javascript:location.href='<%=cp%>/group/list.action?${params}';"/>
</td>
</tr>

</table> 

<form action="" method="post" name="myForm">

<%-- <input type="hidden" name="cid" value="${sessionScope.loginInfo.mid}"> --%>
<input type="hidden" name="gNum" value="${dto.gNum}">
<%-- <input type="hidden" name="name" value="${sessionScope.loginInfo.name}"> --%>
<input type="hidden" name="pageNum" value="${pageNum}">
<input type="hidden" name="boardName" value="test">
<input type="hidden" name="gNo" value="${dto.gNo}">
<input type="hidden" name="cmId" value="1">
<input type="hidden" name="params" value="${params}">
<!-- 파람스 받아놓아야함 세션아이디 -->


<table width=800" height="150" border="0" align="center" background="#F6F6F6">
	<tr height="50px"></tr>

	<tr>
		<td class="line5"><b>${dto.mId}</b></td>
		<td>
		<textarea rows="7" cols="80" name="cmContent" class="line5"></textarea>
		</td>
		<td height="30px" colspan="4" align="right">
		<input type="button" value="등록" class="btn1" style="height:100px; width: 100px; font-size: 30px; color: #8b4513; font-family: 나눔바른펜;"
		onclick="a_sendIt();"/>
		</td>
	</tr>	

</table>

<table width="1000" height="100px" align="center" class="line5">
	<tr height="30px"> 
		<td colspan="5" class="font1"><b>댓글</b></font></td>
	</tr>
</table>

<c:forEach var="cdto" items="${lists}">	
<table width="1000" height="100px" align="center" class="line5">

	<tr>
	
		<td width="100px" height="50px" align="center" class="font1">${cdto.cmId}</td>		
		<td class="font2" width="600px">${cdto.cmContent}</td>
		<td width="400px" align="right">${cdto.cmCreated}</td>		
				
		<td width="100px" align="center">
			<input type="button" class="btn1" style="height: 30px; color: #8b4513; font-family: 나눔바른펜"; value=" 수정 "
			 onclick="javascript:location.href='<%=cp%>/comm/updated.action?${params}&gNum=${cdto.gNum}&cmNum=${cdto.cmNum}';"/></td>
			 
		<td align="center" align="top"><input type="button" value=" 삭제 " class="btn1" style="height: 30px; color: #8b4513; font-family: 나눔바른펜";
		onclick="javascript:location.href='<%=cp%>/comm/deleted.action?params=${params}&gNum=${cdto.gNum}&cmNum=${cdto.cmNum}';"/></td>
		</td>		
	</tr>

	<tr>		
		
	<c:choose>
		<c:when test="${empty sessionScope.loginInfo.cmId}">
			<td></td>
		</c:when>
		<c:when test="${sessionScope.loginInfo.cmId == cdto.cmId}">	
			<td width="100px" align="center">
				<input type="hidden" name="cmNum">
				<input type="button" class="btn1" style="height: 30px" value=" 수정 " onclick="b_sendIt('${cdto.cmNum}');"/>			
			</td>
		</c:when>
		<c:when test="${sessionScope.loginInfo.cmId == 'admin'}">	
			<td width="100px" align="center">
				<input type="hidden" name="cmNum">
				<input type="button" class="btn1" style="height: 30px" value=" 수정 " onclick="b_sendIt('${cdto.cmNum}');"/>			
			</td>
		</c:when>		
	</c:choose>		
	</tr>
	
	<tr>				
		<c:choose>
			<c:when test="${empty sessionScope.loginInfo.cmId}">
				<td></td>
			</c:when>
			<c:when test="${sessionScope.loginInfo.cmId == cdto.cmId}">
				<td align="center" align="top">
				
				<input type="button" value=" 삭제 " class="btn1" style="height: 30px" 
				onclick="javascript:location.href='<%=cp%>/comm/deleted.action?gNum=${dto.gNum}&pageNum=${pageNum}&cmNum=${cdto.cmNum}';"/></td>
			</c:when>
			
			<c:when test="${sessionScope.loginInfo.cmId == 'admin'}">
				<td align="center" align="top"><input type="button" value=" 삭제 " class="btn1" 
				onclick="javascript:location.href='<%=cp%>/comm/deleted.action?gNum=${dto.gNum}&pageNum=${pageNum}&cmNum=${cdto.cmNum}';"/></td>
			</c:when>
			<c:when test="${sessionScope.loginInfo.cmId != cdto.cmId}">
				<td></td>
			</c:when>
		</c:choose>		
		
	</tr>
	
</table>
</c:forEach>

	<!-- pageIndex -->
<table align="center">
	<!-- <tr height="50px"></tr> -->
<tr>
<td colspan="5" align="center">			
			<p>
				<c:if test="${totalDataCount!=0 }">
					${pageIndexList}
				</c:if>
				<c:if test="${totalDataCount==0 }">
					등록된게시물이 없습니다.
				</c:if>
			</p>
</td>
		</tr>
</table>
		<!-- pageIndex -->
</body>
</html>