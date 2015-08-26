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
<div >

	<div align="center" style=" margin:0 auto; width: 100%; padding-top: 15px; "> <!-- 전체 감싸기 -->
		<div class="container" style="text-align: left;">
			<div class="jumbotron" align="center" style="height: 400px;"> <!-- 참여중인 프로젝트 -->
			
			<font size="3pt;" style="margin:0 auto; margin-top:1px; float:left; text-align: left; font-family: 나눔손글씨 붓;"><b>참여중인 프로젝트</b></font>
			<br/>
			<div>
			<c:choose>
					<c:when test="${logInfo.gno==1}">
			<img src="${ImageoriginalFile1}" style="width:200px; height:200px; border-radius:30%"/>
			${dto1.gsubject}
			<img src="${ImageoriginalFile2}" style="width:200px; height:200px; border-radius:30%" />
			${dto2.gsubject}
			<img src="${ImageoriginalFile3}" style="width:200px; height:200px; border-radius:30%" />
			${dto3.gsubject}
			
			</c:when>
			<c:otherwise>
			<div class="container" >
	 		 <div class="jumbotron" align="center">
	 		   <h3>Good Idea</h3>      
	 		   <p>당신의 아이디어가 현실이 됩니다.</p>
	 		 
					 	<a href="<%=cp %>/group/created.action" class="btn btn-info btn-lg">Start Invent</a>
				 
			 </div>
			</div>
			</c:otherwise>
		</c:choose>      		  
			</div>
			</div>
		</div>
	</div>
			
	<div align="center" style="margin: 0 auto; width: 1150px; padding-top: 15px; padding-left: 5px;">
		<div>
			<div style=" border: solid 1px ; width: 560px; height: 400px; float: left;"> <!-- 인기idea -->
				인기 Idea
				<br/>
				<div style="float: left;">
					<c:forEach var="dto" items="${idealists}">
						<div> <img align="left" src="${dto.imageoriginalFile}" style="width:100px; height:100px; border-radius:30%" />
							<textarea style="padding-left: 20px;" rows="5" cols="50">${dto.gcontent}</textarea>
						</div>
						<br/>
						</c:forEach>
					</div>
			</div>
				
			<div style="margin-left:20px; border: solid 1px ; width: 560px; height: 400px; float: left;"> <!-- complete 순위 -->
				complete 순위
				<br/>
				<div style="float: left;">
						<div> <img align="left" alt="complete1" src="/god/resources/testimg/asdf.jpg" style="width:100px; height:100px; border-radius:30%" />
							<textarea style="padding-left: 20px;" rows="5" cols="50"></textarea>
						</div>
						<br/>
						<div style=" margin-top:5px;">
						 <img align="left" alt="complete2" src="/god/resources/testimg/asdf.jpg" style=" width:100px; height:100px; border-radius:30%" />
						<textarea style="padding-left: 20px;" rows="5" cols="50"></textarea>
						</div>
						<br/>
						<div style=" margin-top:5px;">
						 <img align="left" alt="complete3" src="/god/resources/testimg/asdf.jpg" style=" width:100px; height:100px; border-radius:30%" />
						<textarea style="padding-left: 20px;" rows="5" cols="50"></textarea>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>