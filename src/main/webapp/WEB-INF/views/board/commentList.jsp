<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	$("#sendButton").click(function(){
		
		var params = "gNum="+"${dto.gNum}"+ "&cmNum=" + "${dto.cmNum}";

		$.ajax({
			
			type:"POST",
			url:"<%=cp%>/comm/created.action",
			data:params,
			success:function(args){
				
				$("#cmRecomm").html(args);
				
			/* 	//데이터 삭제
				$("#name").val("");
				$("#content").val("") */;
				
			},
			//beforeSend:showRequest,
			error:function(e){
				alert(e.responseText);
			}
			
		});
		
		
	});
});

</script>
</head>

<body>

<c:if test="${c_totalDataCount!=0 }">


<div style="width: 600px; border: none; padding-top: 10px;" align="center"> <!-- 전체틀 -->



<c:forEach var="dto" items="${c_lists }">

<div>
	<div style="background-color: #999999; height: 1px;"></div>
</div>

<div style="height: 30px;">
	<div style="padding-left: 10px; width: 300px;">

	No ${dto.listNum}.${logInfo.userId }

	</div>
	<div><a href="" id="addRecomm">추천</a></div><div id="cmRecomm">${dto.cmRecomm }</div>
	
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

	<div style="border-bottom: solid 1px #ddd;"></div>

</div>



<div style="height: 30px;">
	<div align="center">${c_pageIndexList }</div>
</div>



</div>
</c:if>

</body>
</html>