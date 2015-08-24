<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>


<c:if test="${c_totalDataCount!=0 }">

<<<<<<< HEAD
<div style="width: 600px; border: none; align="center"> <!-- 전체틀 -->
=======
<div style="width: 600px; border: none; padding-top: 10px;" align="center"> <!-- 전체틀 -->
>>>>>>> fbe5d628579013cf51378d102d92103ccd0bfc78


<c:forEach var="dto" items="${c_lists }">

<div>
	<div style="background-color: #999999; height: 1px;"></div>
</div>

<div style="height: 30px;">
	<div style="padding-left: 10px; width: 300px;">
<<<<<<< HEAD
	No ${dto.listNum}.${logInfo }
=======
	No ${dto.listNum}.${logInfo.userId }
>>>>>>> fbe5d628579013cf51378d102d92103ccd0bfc78
	</div>
	<div><a href="javascript:addcmRecomm()">추천</a></div>
	
	<div align="right" style="padding-right: 10px; width: 300px;">
	${dto.cmCreated }&nbsp;
	<a href="javascript:deleteData('${dto.cmNum }','${c_gNum }')">삭제</a>
	</div>
</div>

<div>
	<div style="padding-left: 10px; height: 30px;">
	${dto.cmContent }
	</div>
</div>

</c:forEach>

<div>
<<<<<<< HEAD
	<div style="background-color: #dbdbdb; height: 2px;"></div>
=======
	<div style="border-bottom: solid 1px #ddd;"></div>
>>>>>>> fbe5d628579013cf51378d102d92103ccd0bfc78
</div>



<div style="height: 30px;">
	<div align="center">${c_pageIndexList }</div>
</div>



</div>
</c:if>