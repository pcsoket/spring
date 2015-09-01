<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 아이디어 상세 보기</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- fotorama.css & fotorama.js. -->
<link  href="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet"/> <!-- 3 KB -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script> <!-- 16 KB -->

<script type="text/javascript">

<%--  function commCreated() {
	
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
	
}  --%>


	
	$(function(){
		listPage(1);//1페이지 호출
		
	});

	$(document).ready(function(){
	
		$("#sendButton").click(function(){
			alert(${dto.gNum});
			var params = "cmId=" + "${logInfo.userId }" +"&gNum="+"${dto.gNum}"+ "&cmContent=" + $("#content").val();


			$.ajax({
				
				type:"POST",
				url:"<%=cp%>/comm/created.action",
				data:params,
				success:function(args){
					
					$("#commList").html(args);
					
					//데이터 삭제
					
					$("#content").val("");
					
				},
				//beforeSend:showRequest,
				error:function(e){
					alert("1111111111"+e.responseText);
				}
				
			});
			
			
		});
		
		
		
		/*  추천 버튼 */
		$("#con_button").click(function(){
			
			var params = "userId=" + "${logInfo.userId }" +"&gNum="+"${dto.gNum}"+"&gNo="+"${dto.gNo}"
						+"&boardName="+"${dto.boardName}" +"&writer="+"${dto.mId}";
			alert(params);
			$.ajax({
				
				type:"POST",
				url:"<%=cp%>/insertContribution.action",
				data:params,
				success:function(args){
					
					$("#message").html(args);
					
				},
				error:function(e){
					alert("2222222222"+e.responseText);
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
	
	function updateRecomm(cmNum,page){
		
		var url = "<%=cp%>/comm/updated_Recomm.action";
		
		$.post(url,{cmNum:cmNum,gNum:"${dto.gNum}",pageNO:page}, function(args){
			
		
			$("#commList").html(args);
			
		});
		
		$("#commList").show();
		
	}
	
	function deleteData(cmNum,page){
		
		var url ="<%=cp%>/comm/deleted.action";
		
		$.post(url,{cmNum:cmNum,gNum:"${dto.gNum}",pageNO:page}, function(args){
			
			$("#commList").html(args);
			
		});
		
		$("#commList").show();
		
		
	}
	
	/* completed로 넘기기 */
	
	function completed() {
		
		var f = document.myForm;
		
		f.action="<%=cp%>/compl/created.action";
		f.submit();
		
		
		
	}
	


</script>

</head>
<body>

<div align="center" >
<form action="" name="myForm" method="post">
<!-- 전체 묶음 -->
<div style="width: 1000px; ">
	
	<div style="margin-top: 2px; width: 1000px; ">
	 	<!-- 아이디어 이미지 -->
		
		<div align="center"  style="float: left;">
			<%-- <div> <img alt="" src="${listimgnum }" style="width: 250px; height: 250px;" name="img01"/></div> <!-- 큰사진 --> --%>
			
			<div class="fotorama" data-nav="thumbs" data-autoplay="3000" data-width="350" data-high="350"
					     data-maxwidth="100%"
					     data-allowfullscreen="false">
				<c:forEach var="dto" items="${ilists }">
				
				  <img src="${dto.originalFileName }">
			<%-- <img src="${dto.originalFileName }" style="width: 60px; height: 60px; cursor: hand;" onmouseover="fimg(this.src)" /> </div> --%>
			</c:forEach>
			</div>
		</div>
		<!-- 주제 --> 
		<div style="margin-left: 25px;">
			<div align="left" style="border-bottom: solid 2px #4374D9; width: 350px; margin-left: 100px; padding-bottom: 20px;">
			<font style="size: 12pt; font-family: 나눔바른펜; padding-left: 20px;">${dto.gSubject}</font>
			</div>
			<br/>
			<div style="width: 500px; height: 150px; padding-left: 15px; padding-right: 15px;">${dto.gContent}</div>
			<div align="right" style="margin-right: 20px; padding-top: 10px; width: 500px;">
		<div>
			<c:if test="${!empty logInfo}">
				<div><span id="message"></span></div><div><input type="button" id="con_button" value="추천"/>
							</div>
			
			<c:if test="${logInfo.gno=='0'}">
				<div><input type="button" value="그룹참여" onclick="gnoInsert();"/></div>
			</c:if>
			<c:if test="${logInfo.gno==gNo}">
				<div><input type="button" value="그룹탈퇴" onclick="gnoDelete();"/></div>
			</c:if>
			<c:if test="${dto.boardName=='3D' && logInfo.auth==3 }">
				<div><input type="button" name="completed" value="completed" onclick="completed();"></div>			
			</c:if>
				
			</c:if>

		</div>
			
		</div>
		</div>
		<br/>
		
	
	</div>
	
<div>	
	
	<!-- 댓글 등록 -->
	<div style="margin-top: 40px; width: 1000px;">
		<div align="center" style="width: 900px; float: left; margin-bottom:10px; border-bottom: solid 2px #ddd">
		
			<div align="left" style="width: 800px; padding-left: 20px; padding-top: 20px;">
			<font style="font-family: 나눔손글씨 붓; color: #2F9D27; font-size: 15pt;"> <b> 댓 글 </b> </font>
			</div>
			
			<!-- 댓글 리스트 -->
			<div align="center" style="width: 800px;">
				<span id="commList" style="display: none"></span>
			</div>
			
			
			<div style="width: 800px;">
				<div style="float: left;">작성자</div>
				<div id="name">${logInfo.userId } </div>
			</div>
			<div style="border-top: solid 1px #ddd ; padding-top: 10px; width: 900px; padding-left: 30px;" >
				<div style="float: left;"><textarea rows="5" cols="100" id="content"></textarea></div>
				<div><input type="button" value="등록" id="sendButton" style="margin-left:5px; float:left; width: 80px; height: 80px;"/></div>
			</div>
		</div>	
	</div>
	
	<!-- <div align="center" style="padding-top: 5px; width: 1000px;">
		<span id="commList" style="display: none"></span>
	</div> -->
</div>

</div>

	</form>
	
</div>
</body>
</html>