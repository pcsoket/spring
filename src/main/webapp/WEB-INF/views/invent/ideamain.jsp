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
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
<div>
	<form action="" method="post" name="myForm">
	<div align="center" style=" margin:0 auto; width: 100%; padding-top: 15px; "> <!-- 전체 감싸기 -->
		<div class="container" style="text-align: left; ">
		
		<div><font style="font-size: 14pt;"><b>참여중인 프로젝트</b></font></br>
		<img src="/god/resources/image/culine.jpg" style="width: 1140px;"></div></br></br>
		
			<div class="jumbotron" align="center" style="height: 400px;padding-left: 100px; padding-right: 100px;padding-top:100px; "> <!-- 참여중인 프로젝트 -->
			
		
				
					<c:choose>
					<c:when test="${!empty sessionScope.logInfo && logInfo.gno!=0}">

						<c:if test="${dto1.gNum!=null}">
						<div style="float: left; padding-right: 15px;">
						<div><a href="<%=cp %>/group/article.action?gNum=${dto1.gNum}" ><img src="${ImageoriginalFile1}" style="width:190px; height:190px; border-radius:30%"/></a></div>
						<div>${dto1.gsubject}</div>
						</div>
						</c:if>
						
						<c:if test="${dto1.gNum==null}">
						<div style="float: left; padding-right: 15px;">
						<div> <img src="<%=cp %>/resources/image/noIMG.png" style="width:190px; height:190px; border-radius:30%" /></div>
						<div>등록된 글이 없습니다.</div>
						</div>
						</c:if>
						
						<c:if test="${dto2.gNum!=null}">
						<div style="float: left; padding-right: 15px;">
						<div><a href="<%=cp %>/group/article.action?gNum=${dto2.gNum}"> <img src="${ImageoriginalFile2}" style="width:190px; height:190px; border-radius:30%" /></a></div>
						<div>${dto2.gsubject}</div>
						</div>
						</c:if>
						
						<c:if test="${dto2.gNum==null}">
						<div style="float: left; padding-right: 15px;">
						<div> <img src="<%=cp %>/resources/image/noIMG.png" style="width:190px; height:190px; border-radius:30%" /></div>
						<div>등록된 글이 없습니다.</div>
						</div>
						</c:if>
						
						<c:if test="${dto3.gNum!=null}">
						<div style="float: left; padding-right: 15px;">
						<div><a href="<%=cp %>/group/article.action?gNum=${dto3.gNum}"><img src="${ImageoriginalFile3}" style="width:190px; height:190px; border-radius:30%" /></a></div>
						<div>${dto3.gsubject}</div>
						</div>
						</c:if>
						
						<c:if test="${dto3.gNum==null}">
						<div style="float: left; padding-right: 15px;">
						<div> <img src="<%=cp %>/resources/image/noIMG.png" style="width:190px; height:190px; border-radius:30%" /></div>
						<div>등록된 글이 없습니다.</div>
						</div>
						</c:if>
						
						<div style="height: 200px;width: 250px; border: solid 2px; border-color: red;float: right;">
							
						  <p>Contribution Rank</p>            
						  <table class="table table-striped">
						    <thead>
						      <tr>
						        <th>Rank</th>
						        <th>UserId</th>
						        <th>Contribution</th>
						      </tr>
						    </thead>
						    <tbody>
						    <c:forEach var="dto" items="${contributionList}">
						      <tr>
						        <td>John</td>
						        <td>${dto.userId}</td>
						        <td>${dto.grecomm}</td>
						      </tr>
							</c:forEach>
						    </tbody>
						  </table><br/>
						  
						    <table class="table table-striped">
						    <thead>
						      <tr>
						        <th></th>
						        <th>MyId:${logInfo.userId}</th>
						        <th>Point:${myContribution}</th>
						      </tr>
						    </thead>
						    </table>
						    
						</div>
						
					</c:when>
					
					<c:when test="${sessionScope.logInfo.gno==0}">         <!-- 로그인을 안했거나 그룹참여를 안했을때 -->
						<div >
					 		<div align="center" style="color: #ffffff;">
								<b></b><h3>Good Idea</h3>      
								<p>당신의 아이디어가 현실이 됩니다.</p></b>
								<a href="<%=cp %>/group/created.action?boardName=group" class="btn btn-info btn-lg">register group</a>
							</div>
						</div>
					</c:when>
					
					
					<c:otherwise>                                            <!-- 로그인을 안했거나 그룹참여를 안했을때 -->
						<div >
					 		<div align="center" style="color: #ffffff;">
								<b></b><h3>Good Idea</h3>      
								<p>당신의 아이디어가 현실이 됩니다.</p></b>
								<a href="<%=cp %>/group/created.action?boardName=group" class="btn btn-info btn-lg">register group</a>
							</div>
						</div>
					</c:otherwise>


					</c:choose>
			</div>
		</div>
	</div>	
	</form>
		
	<div align="center" style="margin: 0 auto; width: 1150px; padding-top: 15px;">
		<div class="container" style="text-align: left;">
		
		<div style="width: 1140px;">
		
		<div style="float: left;width: 560px;"><font style="font-size: 14pt;"><b>인기 아이디어</b></font><br/>
		<img src="/god/resources/image/culine.jpg" style="width: 560px;"></div>
		
		<div style="float: left;width: 560px;margin-left: 20px;"><font style="font-size: 14pt;"><b>Complete 순위</b></font><br/>
		<img src="/god/resources/image/culine.jpg" style="width: 560px;"></div>
		</div>
		<br/>
		<br/>
		<br/>
		
		
			<div class="jumbotron" style=" width: 560px; height:500px; float: left;"> <!-- 인기idea -->
				<br/>
					<div style="float: left;">
						<c:forEach var="dto" items="${idealists}">
							<div style="width:350px; height:120px;"> 
								<img align="left" src="${dto.imgNum}" style=" float:left; width:90px; height:90px; border-radius:30%" />
							<div style="float: left; width: 250px;">
							<table class="table table-striped">
						    <thead>
						      <tr>
						        <th>${dto.gsubject}</th>
						      </tr>
						      <tr>
						        <td>${dto.gcontent}</td>
						      </tr>
						    </thead>
						    </table>
						    </div>
							</div>
							<br/>
						</c:forEach>
					</div>
				</div>
			<div class="jumbotron" style="margin-left:20px; width: 560px; height: 500px; float: left;"> <!-- complete 순위 -->
				<br/>
					<div style="float: left;">
						<c:forEach var="dto" items="${completeLists}">
							<div style="width:350px; height:120px;"> 
								<img align="left" src="${dto.cpNum}" style=" float:left; width:90px; height:90px; border-radius:30%" />
							<div style="float: left; width: 250px;">
							<table class="table table-striped">
						    <thead>
						      <tr>
						        <th>${dto.cSubject}</th>
						      </tr>
						      <tr>
						        <td>${dto.cContent}</td>
						      </tr>
						    </thead>
						    </table>
						    </div>
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