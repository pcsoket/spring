<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

%>

<c:if test="${c_totalDataCount!=0 }">



<div style="width: 800px; border: none; padding-top: 10px; font-family: 나눔바른펜; font-weight: bold;" align="center">
 <!-- 전체틀 -->
<div align="left" style="width: 780px; margin-bottom: 30px; padding:15px; background-color: #ddd; border-radius : 10px; ">
	
	<div>
		<div style=" width: 200px; margin-bottom: 10px; padding-left: 20px; ">
			<div> <img alt="" src="<%=cp%>/resources/image/bestopinion.png"> </div>
		</div>
	</div>
	<div>
		<div style="width: 600px; padding-left: 20px;">
		<div style="float: left; padding-right: 300px;"> userId.${cdto.cmId }</div> <div>추천 ${cdto.cmRecomm }</div>
		</div>
		<div style="padding-left: 20px; padding-right: 20px;">${cdto.cmContent }</div>
	
	</div>

</div>



<div>

<div style="font-family: 나눔바른펜;">
<c:forEach var="dto" items="${c_lists }">

	<div style="border-top: solid 2px #999999; width: 780px; padding-top: 20px;">

		<div style="padding-left: 10px; width: 200px; float: left;">
	
		userId.${dto.cmId }
	
		</div>
		<div style="float: left; width: 100px;">
			<div  style="float: left;"><a href="javascript:updateRecomm('${dto.cmNum }')" id="addRecomm">추천</a></div>
			<div id="cmRecomm">${dto.cmRecomm }</div>
		</div>
		<div align="right" style="padding-right: 10px; width: 400px; padding-bottom: 10px">
		${dto.cmCreated }&nbsp;
		<a href="javascript:deleteData('${dto.cmNum }','${dto.gNum }')">삭제</a>
		<a href="javascript:reportData('${dto.cmContent}','comment','${dto.gNum }')">신고</a>
		</div>
	</div>
	
	
	<div style="width: 700px;">
		<div style="padding-left: 10px; height: 50px;  padding-top: 10px; padding-bottom: 10px;">
		${dto.cmContent }
		</div>
	</div>
<form name="report" method="post">
</form>
</c:forEach>

</div>

<div>

	<div style="border-bottom: solid 1px #ddd;"></div>

</div>



<div style="height: 30px;">
	<div align="center">${c_pageIndexList}</div>
</div>

</div>

</div>
</c:if>


