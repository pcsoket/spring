<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	

%>

<c:if test="${c_totalDataCount!=0 }">



<div style="width: 800px; border: none; padding-top: 10px;" align="center"> <!-- 전체틀 -->


<c:forEach var="dto" items="${c_lists }">

<div style="height: 30px; border-top: solid 1px #999999;">
	<div style="padding-left: 10px; width: 400px; float: left;">

	No ${dto.listNum}.${dto.cmId }
	</div>
	<div style="float: left; width: 100px;">
	<div  style="float: left;"><a href="javascript:updateRecomm('${dto.cmNum }')" id="addRecomm">추천</a></div><div id="cmRecomm">${dto.cmRecomm }</div>
	</div>

	<div align="right" style="padding-right: 10px; width: 300px;">
	${dto.cmCreated }&nbsp;
	<a href="javascript:deleteData('${dto.cmNum }','${dto.gNum }')">삭제</a>
	</div>
</div>

<div>
	<div style="padding-left: 10px; height: 30px;">
	${dto.cmContent } ${dto.gNum }
	</div>
</div>

</c:forEach>

<div>

	<div style="border-bottom: solid 1px #ddd;"></div>

</div>



<div style="height: 30px;">
	<div align="center">${c_pageIndexList }</div>
</div>



</div>
</c:if>


