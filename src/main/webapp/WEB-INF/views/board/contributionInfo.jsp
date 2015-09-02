<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>



<div style="width: 1300px;height: 900px;padding-top: 50px;padding-left: 200px;">

	<div style="margin: 0 auto;width: 800px;"><font style="font-size: 14pt;"><b>그룹통계</b></font></br>
		<img src="/god/resources/image/culine.jpg" style="width: 800px;"></div></br></br>
		
		
	<div style="margin: 0 auto;height: 600px;width: 800px;background-color: #f9f9f9;">
		<div style="width: 700px;padding-top: 50px;padding-left: 70px;">
		<ul class="list-group">
		  <li class="list-group-item">Idea   &nbsp; ${Idea}</li>
		  <li class="list-group-item">Sketch &nbsp; ${Sketch}</li>
		  <li class="list-group-item">3D &nbsp; ${d3d}</li>
		</ul>
		</div>
		<br/>
		<br/>
			<div style="height: 200px;width: 250px; border: solid 2px; border-color: red;float: left;margin-left: 70px;">			
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
		

	</div>
</div>
