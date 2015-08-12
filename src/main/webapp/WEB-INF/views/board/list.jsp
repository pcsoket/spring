<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	function sendIt(){
		
		var f = document.searchForm;
		
		f.action = "<%=cp%>/group/list.action";
		f.submit();
		
	}

</script>

</head>
<body>
		
	<table width="1000" align="center" class="box">

	<tr height="100px">
	<td></td>
	</tr>
	<tr height="30px"> 
		<td class="line3" height="80px" colspan="5">
					&nbsp;&nbsp;&nbsp;&nbsp;<font color="#8b4513 " style="font-family: 나눔손글씨 붓;" font size="10px"><b>
					상품평</b></font></td>
		</tr>
	<tr height="30px">
	</tr>
	<tr height="30px">

		<td width="50px" align="left" margin-left="20px"  colspan="4">	
			<form name="searchForm" method="post" action="">		
			<select name="searchKey"  style="height: 40px;">
				<option value="gSubject">제목</option>
				<option value="mId">작성자</option>
				<option value="gContent">내용</option>
			</select>
			<input type="text" name="searchValue" style="height: 40px;"/>
			<input type="button" style="width: 50px; height: 40px;" value=" 검 색 " class="btn2" onclick="sendIt();"/>
			</form>	

		
		</td>
		<td>
		<input type="button" value=" 글쓰기 " margin-left="500px" 
		class="btn1" style="height: 40px;"
		onclick="javascript:location.href='/god/group/created.action';"/>

		 </td>
		 <tr height="10px"><td></td></tr>
		 

<tr height="40px" class="line4" bordercolor="#EAEAEA" align="center" style="font-size: 15px;">
	<td width="50px"><b>이름</b></td>
	<td width="300px"><b>제목</b></td>
	<td width="150px"><b>글쓴이</b></td>
	<td width="150px"><b>작성일</b></td>
	<td width="50px"><b>조회수</b></td>
</tr>
<c:forEach var="dto" items="${lists}">
<tr height="30px" align="center" style="font-size: 13px" class="line5">
	<td class="line" width="50px" class="gnum">${dto.gNum}</td>
	<td class="line" width="300px" class="gsubject">
	<a href ="${articleUrl}&gNum=${dto.gNum}">${dto.gSubject}</a></td>
	<td class="line" width="150px" class="mid">${dto.mId}</td>
	<td class="line" width="150px" class="gcreated">${dto.gCreated}</td>
	<td class="line" width="50px" class="ghitCount">${dto.gHitCount}</td>
</tr>
</c:forEach>


<tr height="50px"></tr>
<tr>
<td colspan="5" align="center">			
			<p>
				<c:if test="${dataCount!=0 }">
					${pageIndexList}
				</c:if>
				<c:if test="${dataCount==0 }">
					등록된게시물이 없습니다.
				</c:if>
			</p>
</td>
		</tr>
	

</table>

</body>
</html>