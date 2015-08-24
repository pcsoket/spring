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
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
 
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
		

	</script>
	
<style type="text/css">

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
	border: 1px solid #EAEAEA;
	height: 200px;
	width: 200px;
	}
	
.category3{
	border-bottom: 1px solid #EAEAEA;
	width: 200px;
	height: 30px;
	display: none;
	}



</style>


</head>
<body>

<table width="1020px" class="box" align="center">
	<tr><td rowspan="3" valign="top" bgcolor="#ffd2d7">
			<table class="box" width="200px">
			
			<tr><td class="menu1">
				
			<font color="#8b4513"; style="font-family: 나눔바른펜; font-size:13pt;"><b>
										
    					&nbsp;&nbsp;&nbsp;&nbsp;생활/건강</b></font>  					
 

				</td></tr>
				
			<tr><td class="menu2">
				
			<font color="#8b4513"; style="font-family: 나눔바른펜; font-size:13pt;">				
    					&nbsp;&nbsp;&nbsp;&nbsp;욕실용품</font>
    					
    					

				</td></tr>
				
			<tr><td class="menu3">
				
			<font color="#8b4513"; style="font-family: 나눔바른펜; font-size:13pt;">					
    					&nbsp;&nbsp;&nbsp;&nbsp;공구</font>

				</td></tr>
				
				
			<tr><td class="menu3">
				
			<font color="#8b4513"; style="font-family: 나눔바른펜; font-size:13pt;">				
    					&nbsp;&nbsp;&nbsp;&nbsp;청소용품</font>

				</td></tr>
				
			

				
			</table>		
	</td>
	
	
	
	
	<td>
	<table width="800px" class="category2">
	<tr><td height="50px" colspan="4"><font color="#8b4513 " style="font-family: 나눔바른펜;" size="4pt"><b>
	&nbsp;&nbsp;&nbsp;욕실용품</b></font></td></tr>
	<tr>
	
		<c:forEach var="dto" items="${idea_hitcountlists}">	
			<td width="200px" height="300px" align="center" class="category2">
					<img alt="" src="/god/resources/image/aa.PNG" width="200" height="200" />	
					<font color="#8b4513 "; style="font-family: 나눔바른펜; font-size:13pt;">
					<a href="${articleUrl}&pNum=${dto.pNum}">
						${dto.pName}<br>${dto.pPrice}원</a></font></td>
						
						<%
							if(i%4==0){
							out.print("</tr><tr>");
							}
							i++;
							%>
						
						
						</c:forEach>
		
							
	</tr>


	</table>
	</td></tr></table>



</body>
</html>