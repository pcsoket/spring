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

	function fimg(csrc){
		window.document.images["img01"].src = csrc;		
	}
	
	function imgResize(){  //이미지 크기조절 안됨.
		
		 var myImg = document.getElementById("img01");

		  myImg.width = 350;
		  myImg.height = 350;     
	}

	
	function sendIt() {
		
		f = document.myForm;
		
		f.action = "<%=cp%>/toBasket.action";
		f.submit();
		
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
	
	

</style>
</head>
<body>
<form name="myForm">
<table width="1000px" height="700px" align="center">
	<tr>
		<td>
		<table class="box" height="700px">
			<tr>
				<td width="350px" height="400px" class="box" colspan="2">
				<!--이미지 갤러리  -->
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
		    			
				</td>
        	</tr>
			<tr>
				<td width="330px" height="150px" class="line2" colspan="2">


				<table>
				<tr>


 					</tr>
   				</table>
				</td>
			</tr>

			<tr>
				<td class="line4" width="150px" height="50px" align="center">
					<font color="#8b4513 " style="font-family: 나눔바른펜;"><b>수량</b></font></td>
				<td class="line5" width="200px" height="50px">
					&nbsp;&nbsp;2</td>
			</tr>
			<tr>
				<td class="line4" width="150px" height="80px" align="center">
					<font color="#8b4513 " style="font-family: 나눔바른펜;"><b>구매예정금액</b></font></td>
				<td class="line5" width="200px" height="80px">
					&nbsp;&nbsp;${2*dto.pPrice}</td>
			</tr>
		</table>
		</td>
		<td>
		<table width="500px" height="700px" class="box">
		
		
			<tr>
				<td class="line3" height="80px" colspan="2">
					&nbsp;&nbsp;&nbsp;&nbsp;<font color="#8b4513 " style="font-family: 나눔손글씨 붓;" font size="5px"><b>
					${dto.pName}</b></font></td></tr>
			
			<tr>
				<td class="line4" width="100px" height="50px" align="center">
					<font color="#8b4513 " style="font-family: 나눔바른펜;"><b>판매가</b></font></td>
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
				<td class="line4" width="100px" height="50px" align="center">
					<font color="#8b4513 " style="font-family: 나눔바른펜;"><b>재고</b></font></td>
				<td class="line5" width="400px" height="50px">
					&nbsp;&nbsp;${dto.pStock}</td>
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
				</td>
			</tr>
			
		</table>
		</td>
	</tr>
</table>
</form>

</body>
</html>