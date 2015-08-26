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
<script type="text/javascript">

 function inventsendIt() {
	 
	 f = document.groupimg;
	 
	 f.action ="<%=cp%>/group/idea.action?pageNum="+'${pageNum}' +"&gNo="+ '${gNo}';
	 alert('${gNo}');
	 <%-- f.action ="<%=cp%>/group/article.action?pageNum="+'${pageNum}' + "&gNum=" +'${gNum}'; --%>
	 f.submit();
	
}
function modelsendIt() {
	 
	 f = document.groupimg;
	 
	 
	 //
	 f.action ="<%=cp%>/group/3D.action?pageNum="+'${pageNum}' + "&gNo=" +'${gNo}';
	 <%-- f.action ="<%=cp%>/group/article.action?pageNum="+'${pageNum}' + "&gNum=" +'${gNum}'; --%>
	 f.submit();
	
}
function sketchsendIt() {
	 
	 f = document.groupimg;
	 
	 f.action ="<%=cp%>/group/3D.action?pageNum="+'${pageNum}' + "&gNo=" +'${gNo}';
	 
	 <%-- f.action ="<%=cp%>/group/article.action?pageNum="+'${pageNum}' + "&gNum=" +'${gNum}'; --%>
	 f.submit();
	
}

</script>
<title>Invent</title>
</head>
<body>
<div>
	<div class="container">
	  <div class="jumbotron" align="center">
	    <h3>Good Idea</h3>      
	    <p>당신의 아이디어가 현실이 됩니다.</p>      
	    <a href="/wInvent.action" class="btn btn-info btn-lg">Write</a>
	  </div>
	</div>
	
	<div align="center">
		<div class="border" style="width:1170px; border: solid 1px; border-color: #D5D5D5;"></div>
	</div>
	<form name="groupimg" method="post">
	<div class="container" style="padding-top:5px;">	
		<!-- invent -->
		<div align="center" style="border: solid 1px; float:left; margin-right: 10px; border-color: #D5D5D5; width: 300px; height: 300px;">
			<img src="${ImageoriginalFile1}" onclick="inventsendIt();" style="width:200px; height:200px; border-radius: 50%;"/>
			<div> <a href="javascript:inventsendIt();"> Idea </a></div>
		</div>
		<!-- 3d -->
		<div align="center" style="border: solid 1px; float:left; margin-right: 10px; border-color: #D5D5D5; width: 300px; height: 300px;">
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