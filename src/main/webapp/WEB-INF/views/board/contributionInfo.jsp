<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>

<div style="width: 1300px;height: 900px;padding-top: 50px;padding-left: 200px;">
	<div style="margin: 0 auto;height: 700px;width: 800px;background-color: #f9f9f9;">
		나의 기여도<br/>
		${myContribution}<br/>
	
	
		그룹기여도 순위<br/>
		<c:forEach var="dto" items="${lists}">
		${dto.userId} : ${dto.grecomm} <br/>
		</c:forEach>
	</div>
</div>
