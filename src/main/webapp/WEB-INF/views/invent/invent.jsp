<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  
  <!-- fotorama.css & fotorama.js. -->
<link  href="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet"> <!-- 3 KB -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script> <!-- 16 KB -->
  
<script type="text/javascript">

 function inventsendIt() {
	 
	 f = document.groupimg;
	 
	 f.action ="<%=cp%>/group/idea.action?pageNum="+'${pageNum}' +"&gNo="+ '${gNo}';
	 alert('${gNo}');
	 <%-- f.action ="<%=cp%>/group/article.action?pageNum="+'${pageNum}' + "&gNum=" +'${gNum}'; --%>
	 f.submit();
	
}
 function sketchsendIt() {
	 
	 f = document.groupimg;
	 
	 
	 //
	 f.action ="<%=cp%>/group/sketch.action?pageNum="+'${pageNum}' + "&gNo=" +'${gNo}';
	 <%-- f.action ="<%=cp%>/group/article.action?pageNum="+'${pageNum}' + "&gNum=" +'${gNum}'; --%>
	 f.submit();
	
}


function modelsendIt() {
	 
	 f = document.groupimg;
	 
	 f.action ="<%=cp%>/group/3D.action?pageNum="+'${pageNum}' + "&gNo=" +'${gNo}';
	 
	 <%-- f.action ="<%=cp%>/group/article.action?pageNum="+'${pageNum}' + "&gNum=" +'${gNum}'; --%>
	 f.submit();
	
}

</script>
<title>Invent</title>
</head>
<body>
<div align="center">
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
	  <img src="/god/resources/image/슬라이드1.png">
	  <img src="/god/resources/image/슬라이드2.png">
	  <img src="/god/resources/image/슬라이드3.png">
	  <img src="/god/resources/image/슬라이드4.png">
	  <img src="/god/resources/image/슬라이드5.png">
	</div>

	<div align="center">
		<div class="border" style="width:1170px; border: solid 1px; border-color: #D5D5D5; margin-bottom: 10px;"></div>
	</div>
	<form name="groupimg" method="post">
	<div align="center" class="container" style="padding-top:5px; width: 1000px; margin-bottom: 10px;" >	
		<!-- invent -->
		<div align="center" style="border: solid 1px; float:left; margin-right: 20px; border-color: #D5D5D5; width: 300px; height: 300px;">
			<img src="${ImageoriginalFile1}" onclick="inventsendIt();" style="width:200px; height:200px; border-radius: 50%;"/>
			<div> <a href="javascript:inventsendIt();"> Idea </a></div>
		</div>
		<!-- 3d -->
		<div align="center" style="border: solid 1px; float:left; margin-right: 20px; border-color: #D5D5D5; width: 300px; height: 300px;">
			<img src="${ImageoriginalFile2}" onclick="sketchsendIt();" style="width:200px; height:200px; border-radius: 50%;"/>
			<div> <a href="javascript:sketchsendIt();"> Sketch </a></div>
		</div>
		<!-- sketch -->
		<div align="center" style="border: solid 1px; float:left; border-color: #D5D5D5; width: 300px; height: 300px;">
			<img src="${ImageoriginalFile3}" onclick="modelsendIt();" style="width:200px; height:200px; border-radius: 50%;"/>
			<div> <a href="javascript:modelsendIt();"> 3D </a></div>
		</div>
	</div>
	<input type="hidden" name="pageNum" value="${pageNum}"/>
	<input type="hidden" name="gNum" value="${gNum}"/>
	</form>
	<div align="center" style="margin-top: 7px;">
		<div class="border" style="width:1170px; border: solid 1px; border-color: #D5D5D5;"></div>
	</div>
	
</div>


</body>
</html>