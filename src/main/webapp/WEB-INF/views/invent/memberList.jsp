<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp = request.getContextPath();
	int i=1;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- fotorama.css & fotorama.js. -->
<link  href="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet"> <!-- 3 KB -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script> <!-- 16 KB -->

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<style type="text/css">

.banner-inner{

	left: 0;
	position: absolute;
	top: 0;
	width: 100%;
	z-index: 400;	
}

.banner-heading-tape {
    background-color: #ff4b46;
    color: #fff;
    display: inline-block;
    line-height: 1.5;
    margin: 0 0.25em;
    padding: 0.5em;
    text-shadow: 0 1px 0 rgba(0,0,0,0.15);
}

.hidden{
	display: none !important;
}

.banner-rwd-heading {
    padding-top: 2rem;
    font-size: 2.25rem;
    line-height: 1.5;
    margin: 0;
    padding: 1rem 0 0;
    width: 100%;
}

.text-light {
    color: #fff;
}

.u-grid-bottom-margin, .u-grid-margin-bottom {
    margin-bottom: 32px !important;
}

.block-center {
    margin-left: auto !important;
    margin-right: auto !important;
}

.block-md {
    max-width: 768px;
}

</style>

<script type="text/javascript">

function searchId() {	
		
		var f = document.search;
		
		f.action = "<%=cp%>/memberList.action";
		f.submit();		
	
}

</script>
<title> 회 원 리 스 트 </title>
</head>
<body>
<!-- 전체 회원 리스트  -->
<div style="width: 100%;">
	<form action="" name="search" method="post">

		
<!--이미지 갤러리  -->

<div style="position: relative;">
	<div class="banner-inner">
		<div style="width: 100%; max-width: 1536;">
		<h1 style="padding-top: 2rem;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="banner-heading-tape">Tap into</span>
			<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="banner-heading-tape">the community</span>
		</h1>			
		</div>
	</div>
	
	<div class="banner-inner hidden">
		<div style="width: 100%; max-width: 1536px;">
		<h1 class="banner-rwd-heading u-grid-bottom-margin u-mt0 text-light">
			Tap into the community</h1>
			<div class="block-md block-center"></div>			
		</div>		
	</div>		
</div>


	<div class="fotorama" data-autoplay="3000" data-loop="true" data-width="100%"> 
	  <img src="/god/resources/image/slide1.png">
	  <img src="/god/resources/image/slide2.png">
	  <img src="/god/resources/image/slide3.png">
	  <img src="/god/resources/image/slide4.png">
	  <img src="/god/resources/image/slide5.png">
	</div>

<!-- 검색 -->
<div align="left">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="searchKey" style="height: 30px; width: 60px;">
	<option value="mid"> I D </option>
	<option value="mSelf"> mySelf </option>
</select>
<input type="text" name="searchValue" style="height: 30px; width: 176px;"/>
<button style="margin-left:5px; height: 30px; width: 45px; padding: 0px; margin-bottom: 3px;" class="btn btn-danger btn-lg" onclick="searchId();">
	<span class="glyphicon glyphicon-search"></span><!-- 검색 -->
</button>

</div>
</form>

<br/>

	<div style="border:1px solid; border-color: #ff4b46; margin-top: 1px;">
	</div>
		<div>	
			<div align="center" style="width: 800px; height: 800px; margin-left:30%;">
				<dl>
				<c:forEach var="dto" items="${lists}">
					<dd style="float:left; margin-top: 2px;">
						<img style="border-radius:50%; width: 200px; height: 200px;"
						 src="/god/resources/testimg/${dto.userPimg}"/><br/>
						ID : ${dto.userId}
						<br/>
						MySelf : ${dto.userSelf}
					<%if(i%3==0){
					out.print("</dd><dd style='margin-top: 2px;'>");
					}i++; %>
				</dd>
				</c:forEach>
				</dl>
			</div>
		</div>
		
		<div style="border:1px solid; border-color: #ffffff;">
		</div>
		<div style="border:1px solid; border-color: #8C8C8C;">
		</div>
		<div align="center">
			<p>
				<c:if test="${dataCount!=0 }">
					${pageIndexList }
				</c:if>
				<c:if test="${dataCount==0 }">
					등록된게시물이 없습니다.
				</c:if>
			</p>
		</div>
	</div>
</body>
</html>