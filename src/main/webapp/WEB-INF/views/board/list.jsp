<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	int i=1;
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댓글 게시판</title>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
<style type="text/css">

.box{
	border-collapse: collapse;
	}

.line2{
		border-bottom: 2px solid #ffd2d7;
		
		}

.line3{border-top: 5px solid  #A6A6A6;
	

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
	
.category2{
	border: 1px solid #EAEAEA;
	height: 300px;
	width: 300px;
	padding-right: 30px;
	}

/* 하이퍼링크 밑줄 지우기 */
A:link {text-decoration:none}
A:visited {text-decoration:none}
A:hover {text-decoration:none}

.glyphicon-search {
	font-size: 15pt;
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
<form name="searchForm" method="post" action="">
<table width="1140px" align="center" class="box">
<tr><td>
	<div class="container" >
	  <div class="jumbotron" align="center" style="background-image: url(/god/resources/image/banner.png);">
	    <h3 style="color: #ff4b46">Good Idea</h3>      
	    <p style="color: #ff4b46">당신의 아이디어가 현실이 됩니다.</p>
	    <c:choose>
			<c:when test="${logInfo.gno == 0}">
			 	<a href="<%=cp %>/group/created.action?boardName=${boardName}" class="btn btn-danger btn-lg">Start Invent</a>
			</c:when>
			<c:when test="${boardName=='group'}">
			 	
			</c:when>
			<c:when test="${logInfo.gno == gNo }">
				<a href="<%=cp %>/group/created.action?boardName=${boardName}" class="btn btn-danger btn-lg">Write</a>
			</c:when>
			<c:otherwise>
			
			</c:otherwise>
		</c:choose>      
	  </div>
	</div>
</td></tr>
	<tr height="30px"> 
		<td class="line3" height="40px" colspan="5" style="border-color: #ff4b46">
		<input type="text" name="boardName" value="${boardName }"><input type="text" name="gno1" value="'${ logInfo.gno}' +' ${gNo}'">
	</tr>
	
	<tr height="30px">

		<td width="50px" align="left" margin-left="20px"  colspan="4" >	
				
			<div style="float: left">
			<select name="searchKey"  style="height: 40px; width: 81px;"  class="form-control">
				<option value="gSubject">제목</option>
				<option value="mId">작성자</option>
				<option value="gContent">내용</option>
			</select>
			</div>	
			<div style="float: left">
				<input type="text" name="searchValue" style="margin-left:5px; height: 40px;  width: 176px;"  class="form-control">
			</div>
			<div style="float: left">
				<button style="margin-left:5px; height: 40px; " class="btn btn-danger btn-lg">
				<span class="glyphicon glyphicon-search"></span><!-- 검색 -->
				</button>
			</div>
			
		</td></tr>
	<tr>
	<td height="50px"></td></tr>
		
</table>

<table width="1000" align="center" class="box">

	<tr height="10px"><td></td></tr>


	<tr>
	
		<c:forEach var="dto" items="${lists}">	
			<td width="200px" height="300px" align="center" class="category2">
			
					<img alt="" src="${dto.imgNum }" width="300" height="250" />	
					<font color="#8b4513 " style="font-family: 나눔바른펜; font-size:13pt;">
					<a href ="${articleUrl}&gNum=${dto.gNum}&boardName=${boardName}">
					${dto.gSubject}</a></font>
					<br>${dto.mId}&nbsp;&nbsp;&nbsp;&nbsp;★★☆☆☆별점
					</td>
						
						<%
							if(i%3==0){
							out.print("</tr><tr>");
							}
							i++;
							%>						
						
						</c:forEach>

						<tr height="50px"></tr>
	
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
</form>
</body>
</html>