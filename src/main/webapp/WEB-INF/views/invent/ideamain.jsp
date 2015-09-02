<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Idea Main</title>
</head>
<body>
<div>
	<form action="" method="post" name="myForm">
	<div align="center" style=" margin:0 auto; width: 100%; padding-top: 15px; "> <!-- 전체 감싸기 -->
		<div class="container" style="text-align: left;">
			<div class="jumbotron" align="center" style="height: 400px;"> <!-- 참여중인 프로젝트 -->
				<div align="left"><img alt="" src="<%=cp %>/resources/image/project1.png"></div>
			<br/>
				<div style="width: 800px;">
				
				
					<c:choose>
					<c:when test="${!empty sessionScope.logInfo}">
					
						<div style="float: left; padding-right: 15px;">
						<div><a href="<%=cp %>/group/article.action?gNum=${dto1.gNum}" ><img src="${ImageoriginalFile1}" style="width:200px; height:200px; border-radius:30%"/></a></div>
						<div>${dto1.gsubject}</div>
						
						</div>
						<div style="float: left; padding-right: 15px;">
						<div><a href="<%=cp %>/group/article.action?gNum=${dto2.gNum}"> <img src="${ImageoriginalFile2}" style="width:200px; height:200px; border-radius:30%" /></a></div>
						<div>${dto2.gsubject}</div>
						</div>
						<div>
						<div><a href="<%=cp %>/group/article.action?gNum=${dto3.gNum}"><img src="${ImageoriginalFile3}" style="width:200px; height:200px; border-radius:30%" /></a></div>
						<div>${dto3.gsubject}</div>
						</div>
					</c:when>
<%--				<c:when test="${sessionScope.logInfo.gno==0 }">
						<div class="container" >
					 		<div class="jumbotron" align="center">
								<h3>Good Idea</h3>      
								<p>당신의 아이디어가 현실이 됩니다.</p>
								<a href="<%=cp %>/group/created.action?boardName=group" class="btn btn-info btn-lg">register group</a>
							</div>
						</div>
					</c:when> --%>
					<c:otherwise>                                            <!-- 로그인을 안했거나 그룹참여를 안했을때 -->
						<div class="container" >
					 		<div class="jumbotron" align="center">
								<h3>Good Idea</h3>      
								<p>당신의 아이디어가 현실이 됩니다.</p>
								<a href="<%=cp %>/group/created.action?boardName=group" class="btn btn-info btn-lg">register group</a>
							</div>
						</div>
					</c:otherwise>
					</c:choose>      		  
				</div>
			</div>
		</div>
	</div>	
	</form>
		
	<div align="center" style="margin: 0 auto; width: 1150px; padding-top: 15px; padding-left: 5px;">
		<div class="container" style="text-align: left;">
		
			<div class="jumbotron" style=" width: 560px; height:500px; float: left;"> <!-- 인기idea -->
				인기 Idea
				<br/>
					<div style="float: left;">
						<c:forEach var="dto" items="${idealists}">
							<div style="width:250px; height:120px;"> 
								<img align="left" src="${dto.imageoriginalFile}" style=" float:left; width:90px; height:90px; border-radius:30%" />
								<div style="float: left; width: 90px; height: 90px;">${dto.gcontent}</div>
							</div>
							<br/>
						</c:forEach>
					</div>
				</div>
			<div class="jumbotron" style="margin-left:20px; width: 560px; height: 500px; float: left;"> <!-- complete 순위 -->
				complete 순위
				<br/>
					<div style="float: left;">
						<c:forEach var="dto" items="#">
							<div style="width:250px; height:120px;"> 
								<img align="left" src="#" style=" float:left; width:90px; height:90px; border-radius:30%" />
								<div style="float: left; width: 90px; height: 90px;">#</div>
							</div>
							<br/>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>