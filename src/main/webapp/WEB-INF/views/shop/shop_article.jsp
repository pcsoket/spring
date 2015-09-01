<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>shop_article</title>

<!-- fotorama.css & fotorama.js. -->
<link  href="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet"> <!-- 3 KB -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script> <!-- 16 KB -->

<script type="text/javascript">

	
	function sendIt() {
		
		f = document.myForm;
		
		f.action = "<%=cp%>/toBasket.action";
		f.submit();
		
	}
	
	$(function(){
		listPage(1);//1페이지 호출
		
	});

	$(document).ready(function(){
	
		$("#sendButton").click(function(){
			
			var params = "cmId=" + "${logInfo.userId }" +"&gNum="+"${dto.pNum}"+ "&cmContent=" + $("#content").val()+ "&boardName=" + document.myForm.boardName.val;

			$.ajax({
				
				type:"POST",
				url:"<%=cp%>/after/created.action",
				data:params,
				success:function(args){
					
					$("#commList").html(args);
					
					//데이터 삭제
					
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
		

		$.post(url,{pageNO:page , gNum:"${dto.pNum}"}, function(args){
		
			$("#commList").html(args);
			
		});
		
		$("#commList").show();
		
	}
	
	function updateRecomm(cmNum,page){
		
		var url = "<%=cp%>/comm/updated_Recomm.action";
		
		$.post(url,{cmNum:cmNum,gNum:"${dto.pNum}",pageNO:page}, function(args){
			
		
			$("#commList").html(args);
			
		});
		
		$("#commList").show();
		
	}
	
	function deleteData(cmNum,page){
		
		var url ="<%=cp%>/comm/deleted.action";
		
		$.post(url,{cmNum:cmNum,gNum:"${dto.pNum}",pageNO:page}, function(args){
			
			
			$("#commList").html(args);
			
		});
		
		$("#commList").show();
		
	}
	
	function plus() {
		
		f = document.getElementsByName("bAmount");
		f.value = Number(f.value)+1;
		
	}

</script>

<style type="text/css">

.box{
	border-collapse: collapse;
	}

.line1{
	border: 1px solid black;
	margin-left: 20px;
}


.line2{
		border-bottom: 2px solid #ffd2d7;
}

.line3{border-top: 5px solid  #A6A6A6;
	border-bottom: 1px solid #ffd2d7;
}
.line4{	
	border-bottom: 1px solid  #EAEAEA;
	background-color:  #ffd2d7;
	}
.line5{
	border-bottom: 1px solid  #EAEAEA;

	}
	
.btn1{
	background-color: #ffd2d7;
	border:1px solid #ffd2d7;
	font :"#8b4513";
	font-family : 나눔바른펜";
	}
#imageGallery{
	float: left;
}
#bodyWrap{
	width:1000px;
	margin: 0 auto;
}
	
	

</style>
</head>
<body>

<div  id="bodyWrap">
<form name="myForm">
	<div id="imageGallery">
		<div class="fotorama" data-autoplay="3000"             
						 data-width="350"
						 data-high="350"
					     data-maxwidth="100%"
					     data-allowfullscreen="false"
					     data-nav="thumbs">
	
				<c:forEach var="dto" items="${ilists}">	
				
		<img src="${dto.originalFileName}" style="cursor: hand" onmouseover="fimg(this.src)"/>

				</c:forEach>
		</div>
	</div>   			
		<div id="productInfo">
		<table width="500px" height="700px" class="box">
		
		
			<tr>
				<td class="line3" height="80px" colspan="2">
					&nbsp;&nbsp;&nbsp;&nbsp;<font color="#8b4513 " style="font-family: 나눔바른펜;" font size="5px"><b>
					${dto.pName}</b></font></td></tr>
			
			<tr>
				<td class="line4" width="100px" height="50px" align="center">
					<font color="#8b4513 " style="font-family: 나눔바른펜;"><b>판매가 한글</b></font></td>
				<td class="line5" width="400px" height="50px">
					&nbsp;&nbsp;${dto.pPrice}</td>
			</tr>
			<tr>
				<td class="line4" width="100px" height="50px" align="center">
					<font color="#8b4513 " style="font-family: 나눔바른펜;"><b>상품번호</b></font></td>
				<td class="line5" width="400px" height="50px">
					&nbsp;&nbsp;${dto.pNum}</td>
			</tr>
			<tr>
				<td class="line4" width="100px" height="50px" align="center">
					<font color="#8b4513 " style="font-family: 나눔바른펜;"><b>평점</b></font></td>
				<td class="line5" width="400px" height="50px">
					&nbsp;&nbsp;${dto.pGrade}</td>
			</tr>
			<tr>
				<td class="line4" width="100px" height="50px" align="center">
					<font color="#8b4513 " style="font-family: 나눔바른펜;"><b>조회수</b></font></td>
				<td class="line5" width="400px" height="50px">
					&nbsp;&nbsp;${dto.pHitcount}</td>
			</tr>
						<tr>
				<td class="line4" width="150px" height="50px" align="center">
					<font color="#8b4513 " style="font-family: 나눔바른펜;"><b>수량</b></font></td>
				<td class="line5" width="200px" height="50px">
					<a onclick="minus();">-</a><input type="text" name="bAmount" id="bAmount" size=2 value=1><a onclick="plus();">+</a>
					
					</td>
			</tr>
			<tr>
				<td class="line4" width="150px" height="80px" align="center">
					<font color="#8b4513 " style="font-family: 나눔바른펜;"><b>구매예정금액</b></font></td>
				<td class="line5" width="200px" height="80px">
					&nbsp;&nbsp;${2*dto.pPrice}</td>
			</tr>
			<tr>
				<td class="line4" width="100px" height="250px" align="center">
					<font color="#8b4513 " style="font-family: 나눔바른펜;"><b>설명</b></font></td>
				<td class="line5" width="400px" height="250px">
					&nbsp;&nbsp;${dto.pContent}</td>
			</tr>
			
			<tr>
				
				<td width="100px" height="70px" colspan="2">
				<table>
					<tr>
					<td width="250px" height="70px" align="right">
					<input type="button" style="width:100px; height:50px;" value="장바구니" class="btn1" onclick="sendIt();"></td>
					<td width="250px" height="70px" colspan="2">
				 	<input type="button" style="width:100px; height:50px;" value="바로 구매" class="btn1"></td>
				</table>
				 	<input type="hidden" name="bAmount" value=1><!-- 임시로. 고를수있게 해놓아야됨 -->
				 	<input type="hidden" name="bPName" value="${dto.pName}">
				 	<input type="hidden" name="bPrice" value="${dto.pPrice}">
				 	<input type="hidden" name="pNum" value="${dto.pNum}">
				 	<input type="hidden" name="imgNum" value="${dto.pImg}">
				 	<input type="hidden" name="boardName" value="product">
				</td>
			</tr>
			
		</table>
		</div>

</form>
</div>

<!-- 댓글 등록 -->
	<div style="margin-top: 40px; width: 1000px;" align="center">
		<div align="center" style="width: 900px; float: left; margin-bottom:10px; border-bottom: solid 2px #ddd">
		
			<div align="left" style="width: 800px; padding-left: 20px; padding-bottom: 20px;">
			<font style="font-family: 나눔손글씨 붓; color: #2F9D27; font-size: 15pt;"> <b> 댓 글 </b> </font>
			</div>
			
			<!-- 댓글 리스트 -->
			<div align="center" style="padding-top: 10px; width: 800px;">
				<span id="commList" style="display: none"></span>
			</div>
			
			
			<div style="width: 800px;">
				<div style="float: left;">작성자</div>
				<div id="name">${logInfo.userId } </div>
			</div>
			<div style="border-top: solid 1px #ddd ; padding-top: 10px; width: 900px;" >
				<div style="float: left;"><textarea rows="5" cols="100" id="content"></textarea></div>
				<div><input type="button" value="등록" id="sendButton" style="margin-left:5px; float:left; width: 80px; height: 80px;"/></div>
			</div>
		</div>	
	</div>

</body>
</html>