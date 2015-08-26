<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>
<%-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">

/* $(function(){
	listPage(1);//1페이지 호출
	
}); */

$(document).ready(function(){
	alert("cmlist"+1);
	$("#addRecomm").click(function(){
		alert("cmlist"+ 2);
		var params ="cmNum=" + "${dto.cmNum}";

		$.ajax({
			
			type:"POST",
			url:"<%=cp%>/comm/updated_Recomm.action",
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

function listPage(page){
	
	var url ="<%=cp%>/comm/list.action";
	

	$.post(url,{pageNO:page , gNum:"${dto.gNum}"}, function(args){
	
		$("#cmRecomm").html(args);
		
	});
	
	$("#cmRecomm").show();
	
	
}

</script>
</head>

<body> --%>

<c:if test="${c_totalDataCount!=0 }">


<div style="width: 800px; border: none; padding-top: 10px;" align="center"> <!-- 전체틀 -->

<div align="left" style="width: 600px; margin-bottom: 30px;">
	
	<div>
		<div style="border-bottom: solid 2px #6f5f63; width: 200px; margin-bottom: 10px; padding-left: 20px;">
			<font style="font-weight: bold; font-size: 20px;">베스트 의견</font>
		</div>
	</div>
	<div>
		<div style="width: 600px; padding-left: 20px;">
		<div style="float: left; padding-right: 300px;">${cdto.cmId }</div> <div>추천 ${cdto.cmRecomm }</div>
		</div>
		<div style="padding-left: 20px; padding-right: 20px;">${cdto.cmContent }</div>
	
	</div>

</div>


<div>
<c:forEach var="dto" items="${c_lists }">

	<div style="border-top: solid 2px #999999; width: 700px;">
		<div style="padding-left: 10px; width: 200px; float: left;">
	
		No ${dto.listNum}.${dto.cmId }
	
		</div>
		<div style="float: left; width: 100px;">
			<div  style="float: left;"><a href="javascript:updateRecomm('${dto.cmNum }')" id="addRecomm">추천</a></div>
			<div id="cmRecomm">${dto.cmRecomm }</div>
		</div>
		<div align="right" style="padding-right: 10px; width: 400px; padding-bottom: 10px">
		${dto.cmCreated }&nbsp;
		<a href="javascript:deleteData('${dto.cmNum }','${dto.gNum }')">삭제</a>
		</div>
	</div>
	
	
	<div style="width: 700px;">
		<div style="padding-left: 10px; height: 50px;  padding-top: 10px; padding-bottom: 10px;">
		${dto.cmContent }
		</div>
	</div>



</c:forEach>

</div>

<div>

	<div style="border-bottom: solid 1px #ddd;"></div>

</div>



<div style="height: 30px;">
	<div align="center">${c_pageIndexList }</div>
</div>



</div>
</c:if>

