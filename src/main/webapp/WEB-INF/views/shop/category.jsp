<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	int i=1;
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>카테고리</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">   <!-- 이거 뭐지? -->

<!-- fotorama.css & fotorama.js. -->
<link  href="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet"> <!-- 3 KB -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script> <!-- 16 KB -->
 
<script>
	$(document).ready(function(){
   		$(".menu1").click(function(){
       		$(".category1").toggle(200);
   		});
	});
	
	$(document).ready(function(){
   		$(".menu2").click(function(){
       		$(".category3").toggle(200);
   		});
	});
	
	   $(function() {                                //메인이미지슬라이드
		    $('ul#slideeffect').innerfade({
		     speed : 1000,
		     timeout : 3000,
		     type : 'sequence',
		     containerheight : '220px'
		  });
		});
	
	
	function sendIt() {            //장바구니로 이동
		
		f = document.myForm;

		f.action = "<%=cp%>/toBasket.action";
		f.submit();
	}
	


</script>

	
<style type="text/css">

#bodyWrap{
width: 1000px;
margin: 0 auto;
}

#menu_ex{
width: 350px;
margin: 0;
height: 397px;
float: left;
}

.fotorama{
width: 650px;
margin: 0;
float: left;
}


.box{
	border-collapse: collapse;

	}
.menu1{
	border: 1px solid #EAEAEA;
	background-color:  #ffd2d7;	
	width: 200px;
	height: 50px;
	}
	
.menu2{
	border: 1px solid #EAEAEA;
	background-color:  #ffd2d7;	
	width: 200px;
	height: 50px;
	}
	
.menu3{
	border: 1px solid #EAEAEA;
	background-color:  #ffd2d7;	
	width: 200px;
	height: 50px;
	}


.category1{
	border-bottom: 1px solid #EAEAEA;
	width: 200px;
	height: 30px;
	display: none;
	}
.category2{
	border-bottom: 1px solid #EAEAEA;
	height: 200px;
	width: 200px;
	}
	
.category3{
	border-bottom: 1px solid #EAEAEA;
	width: 200px;
	height: 30px;
	display: none;
	}
.categorySpace{
width: 50px;
padding: 0;
}


</style>


</head>
<body>
<form action="" name="myForm">
<%-- <table width="1020px" class="box" align="center">
	<tr><td rowspan="3" valign="top" bgcolor="#ffd2d7">
			<table class="box" width="200px">
			
			<tr><td class="menu1">

			<font color="#8b4513"; style="font-family: 나눔바른펜; font-size:13pt;"><b>					
    					&nbsp;&nbsp;&nbsp;&nbsp;아이디어상품</b></font>
    					
    					<a href="/god/idea_category.action">▼</a>
    					<c:forEach var="dto" items="${categorylists}">
								<div class="category1">
								
									<font color="#8b4513 "; style="font-family: 나눔바른펜; font-size:13pt;">
									<a href="${articleUrl}&pNum=${dto.pNum}">
									&nbsp;&nbsp;&nbsp;&nbsp;${dto.pName}</a></font>
									</div>
							     </c:forEach>  

				</td></tr>
				
			<tr><td class="menu2">
				
			<font color="#8b4513"; style="font-family: 나눔바른펜; font-size:13pt;"><b>					
    					&nbsp;&nbsp;&nbsp;&nbsp;과일</b></font>
    					
    					<c:forEach var="dto" items="${categorylists}">
								<div class="category3">
									<font color="#8b4513 "; style="font-family: 나눔바른펜; font-size:13pt;">
									<a href="${articleUrl}&pNum=${dto.pNum}">
									&nbsp;&nbsp;&nbsp;&nbsp;${dto.pName}</a></font>
									</div>
							     </c:forEach>  

				</td></tr>
				
			<tr><td class="menu3">
				
			<font color="#8b4513"; style="font-family: 나눔바른펜; font-size:13pt;"><b>					
    					&nbsp;&nbsp;&nbsp;&nbsp;티켓/공연</b></font>

				</td></tr>
				
				
			<tr><td class="menu3">
				
			<font color="#8b4513"; style="font-family: 나눔바른펜; font-size:13pt;"><b>					
    					&nbsp;&nbsp;&nbsp;&nbsp;배달음식</b></font>

				</td></tr>
				
			<tr><td class="menu3">
				
			<font color="#8b4513"; style="font-family: 나눔바른펜; font-size:13pt;"><b>					
    					&nbsp;&nbsp;&nbsp;&nbsp;e쿠폰</b></font>


				</td></tr>
				
				
			<tr><td class="menu3">
				
			<font color="#8b4513"; style="font-family: 나눔바른펜; font-size:13pt;"><b>					
    					&nbsp;&nbsp;&nbsp;&nbsp;의류</b></font>

				</td></tr>

				
			</table>		
	</td>
	
	
	
	
	<td> --%>
	
	
	
<div id="bodyWrap">
	


	<div id="top_box">
		<div id="menu_ex">
			<table height="397" width="380" >
				<tr>
					<td height="247">
					<img src="<%=cp%>/resources/image/kko.png">
					</td>
				
				</tr>
				<tr>
					<td height="150"><img src="<%=cp%>/resources/image/8888.png"></td>
				</tr>
			</table>
		</div>
		<div class="fotorama" data-autoplay="3000"
			 data-width="617"
			 data-high="397"
		     data-maxwidth="100%"
		     data-allowfullscreen="false"
		     data-nav="false">
	
		<img src="<%=cp%>/resources/image/2000_1.PNG">
		<img src="<%=cp%>/resources/image/2000_2.PNG">
		<img src="<%=cp%>/resources/image/2000_3.PNG">
		<img src="<%=cp%>/resources/image/2000_4.PNG">
		</div>
	</div>
	
	<div id="list_table">
	
	<table width="800px" class="category2">
	<tr><td height="50px" colspan="4"><img src="<%=cp%>/resources/image/pm.png"></td></tr>
	<tr>
	
		<c:forEach var="dto" items="${hitcountlists}">	
			<td width="200px" height="300px" align="center" class="category2">
			
				<img src="${dto.pImg}" width="240" height="200" style="padding-left: 20px;padding-right: 25px;"/><br>
					
					<font color="#8b4513 "; style="font-family: 나눔바른펜; font-size:13pt;">
					
					<a href="${articleUrl}&pNum=${dto.pNum}">
						${dto.pName}<br>${dto.pPrice}원</a></font></td>
			
						
						
		</c:forEach>
		
							
	</tr>
	
	<%-- <tr><td height="50px" colspan="4"><font color="#8b4513 " style="font-family: 나눔바른펜;" size="4pt"><b>
	&nbsp;&nbsp;&nbsp;아이디어 인기순</b></font></td></tr>
	<tr>
		<c:forEach var="dto" items="${ideahitcountlists}">	
			<td width="200px" height="100px" align="center" class="category2">
			
					<img alt="" src="${dto.pImg}" width="200" height="200" />	
					<font color="#8b4513 "; style="font-family: 나눔바른펜; font-size:13pt;">
					<a href="${articleUrl}&pNum=${dto.pNum}">
						${dto.pName}<br>${dto.pPrice}원</a></font></td>
						
						
						</c:forEach>						
	</tr> --%>
	
	
	<tr><td height="50px" colspan="4">
	<img src="<%=cp%>/resources/image/cu.png"></td></tr>
	<tr>
	
		<c:forEach var="dto" items="${recommandlists}">	
			<td width="250px" height="100px" align="center" class="category2"  style="padding-left: 25px;padding-right: 25px;">
			
					<img alt="" src="${dto.pImg}" width="200" height="200" />	
					<font color="#8b4513 "; style="font-family: 나눔바른펜; font-size:13pt;">
					<a href="${articleUrl}&pNum=${dto.pNum}">
						${dto.pName}<br>${dto.pPrice}원</a></font></td>
						
						
						</c:forEach>					
	</tr>
	
	
	<tr><td height="50px" colspan="4">
	<img src="<%=cp%>/resources/image/hitcount.png"></td></tr>
	<tr>
	
		<c:forEach var="dto" items="${hitcountlists}">	
			<td width="250px" height="100px" align="center" class="category2" style="padding-left: 25px;padding-right: 25px;">

					<img alt="" src="${dto.pImg}" width="200" height="200" />	
					<font color="#8b4513 "; style="font-family: 나눔바른펜; font-size:13pt;">
					<a href="${articleUrl}&pNum=${dto.pNum}">
						${dto.pName}<br>${dto.pPrice}원</a></font></td>
												
						</c:forEach>					
	</tr>
	<tr height="30"></tr>

	</table>
	
	</div>
	
</div>
	
<!-- 	</td></tr></table> -->


</form>
</body>
</html>
