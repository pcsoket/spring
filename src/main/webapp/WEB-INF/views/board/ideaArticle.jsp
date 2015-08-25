<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">

 function commCreated() {
	
	f=document.replyInsert;
	f.action="<%=cp%>/comm/created.action";
	f.submit();
}

function gnoInsert() {
	
	f=document.group;
	f.action="<%=cp%>/gnoInsert.action";
	f.submit();
	
}

function gnoDelete() {
	
	f=document.group;
	f.action="<%=cp%>/gnoDelete.action";
	f.submit();
	
} 

	$(function(){
		listPage(1);//1페이지 호출
		
	});

	$(document).ready(function(){
		
		$("#sendButton").click(function(){
			
			var params = "cmId=" + $("#name").val() +"&gNum="+"${dto.gNum}"+ "&cmContent=" + $("#content").val();
			
			$.ajax({
				
				type:"POST",
				url:"<%=cp%>/comm/created.action",
				data:params,
				success:function(args){
					
					$("#commList").html(args);
					
					//데이터 삭제
					$("#name").val("");
					$("#content").val("");
					
				},
				//beforeSend:showRequest,
				error:function(e){
					alert(e.responseText);
				}
				
			});
			
			
		});
	});
	
 	function showRequest(){//유효성 검사
		
		var name = $.trim($("#name").val());
		var content = $.trim($("#content").val());
		
		if(!name){
			alert("\n이름을 입력하세요!");
			$("#name").focus();
			return false;
		}
		
		if(!content){
			alert("\n내용을 입력하세요!");
			$("#content").focus();
			return false;
		}
		
		if(content.length>200){
			
			alert("\n내용은 200자 까지만 가능합니다.");
			$("#content").focus();
			
			return false;
			
		}
		
		return true;
		
		
	} 
	

	function listPage(page){
		
		var url ="<%=cp%>/comm/list.action";
		
		$.post(url,{pageNO:page , gNum:"${dto.gNum}"}, function(args){
			
			$("#commList").html(args);
			
		});
		
		$("#commList").show();
		
		
	}
	
 	function fimg(csrc){
		
		window.document.images["img01"].src = csrc;		
	}
	
	function imgResize(){  //이미지 크기조절 안됨.
		
		 var myImg = document.getElementById("img01");

		  myImg.width = 350;
		  myImg.height = 350;     
	} 


</script>
<title> 아이디어 상세 보기</title>
</head>
<body>

<!-- 전체 묶음 -->
<div align="center" style="width: 1000px; margin-left: 200px;">
	<form action="" name="myForm" method="post">
	<div style="margin-top: 2px; width: 1000px; ">
	 	<!-- 아이디어 이미지 -->
		
		<div style="float: left;">
			<div> <img alt="" src="${listimgnum }" style="width: 250px; height: 250px;" name="img01"/></div> <!-- 큰사진 -->
			<c:forEach var="dto" items="${ilists }">
			
			<div> <img src="${dto.originalFileName }" style="width: 60px; height: 60px; cursor: hand;" onmouseover="fimg(this.src)" /> </div>
			</c:forEach>
		</div>
		<!-- 주제 --> 
		<div style="margin-left: 25px;">
			<font style="size: 2px; font-family: 나눔바른펜;">${dto.gSubject}</font>
			<br/>
			<div style="border: 1px solid ; color: #4374D9; width: 200px;">
			</div>
			<br/>
			<textarea rows="10" cols="50">${dto.gContent}</textarea>
		</div>
		<br/>
		<div style="margin-left: 580px;  margin-top: 190px;">
		<c:if test="${logInfo.gno=='0'}">
			<input type="button" value="그룹참여" onclick="gnoInsert();"/>
			</c:if>
		<c:if test="${logInfo.gno=='1'}">
			<input type="button" value="그룹탈퇴" onclick="gnoDelete();"/>
			</c:if>
		</div>
	
	</div>

	<!-- 댓글 등록 -->
	<div style="margin-top: 40px; width: 1000px;">
		<div align="center" style="width: 900px; float: left;">
		
			<div align="left" style="width: 800px; padding-left: 20px; padding-bottom: 20px;">
			<font style="font-family: 나눔손글씨 붓; color: #2F9D27; font-size: 15pt;"> <b> 댓 글 </b> </font>
			</div>
			<div>
				<div style="float: left;">작성자</div>
				<div id="name" style="float: left;">${logInfo.userId } </div>
			</div>
			<div style="border-top: solid 1px #ddd ; padding-top: 10px;" >
				<div style="float: left;"><textarea rows="5" cols="100" id="content"></textarea></div>
				<div><input type="button" value="등록" id="sendButton" style="margin-left:5px; float:left; width: 80px; height: 80px;"/></div>
			</div>
			
		</div>
		<br/>
		
		<div style="border-top: solid 1px #ddd ; padding-top: 5px; width: 1000px;">
			<span id="commList" style="display: none"></span>
		</div>
	</div>
	</form>
</div>


</body>
</html>