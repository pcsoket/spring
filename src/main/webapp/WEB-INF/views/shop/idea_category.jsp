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
<title>카테고리</title>
 
  <script>
		
		
		function p(a) {
			
			var f = document.myForm;
			f.pCategory.value = a;
			f.action = "<%=cp%>/idea_category.action";
			f.submit();
		}

	</script>
	
<style type="text/css">

.box{
	border-collapse: collapse;

	}
.menu1{
	border-bottom :1px solid #EAEAEA;
	border-top:1px solid #EAEAEA;	
	width: 200px;
	height: 50px;
	}
	
.menu2{
	border-bottom :1px solid #EAEAEA;
	border-top:1px solid #EAEAEA;
	width: 200px;
	height: 50px;
	}
	
.menu3{
	border-bottom :1px solid #EAEAEA;
	border-top:1px solid #EAEAEA;
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
<form name="myForm">
<input type="hidden" name="pCategory">
<table width="1020px" class="box" align="center">
	<tr><td rowspan="3" valign="top">
			<table class="box" width="200px">
			
			<tr><td class="menu1" style="background-color: #ebebe4;">&nbsp;&nbsp;&nbsp;&nbsp;
			<a onclick="p('life')"><font color="#8C8C8C"; style="font-family: 나눔바른펜; font-size:16pt; "><Strong>									
    					[생활/건강]</Strong></font></a>		
				</td></tr>
				
			<tr><td class="menu2">&nbsp;&nbsp;&nbsp;&nbsp;			
			<a onclick="p('bath')"><font color="#8C8C8C"; style="font-family: 나눔바른펜; font-size:13pt;">				
    					욕실용품</font></a>    					   	
				</td></tr>
			
				
			<tr><td class="menu3">&nbsp;&nbsp;&nbsp;&nbsp;			
			<a onclick="p('util')"><font color="#8C8C8C"; style="font-family: 나눔바른펜; font-size:13pt;">					
	   					공구</font></a>
				</td></tr>
				
				
			<tr><td class="menu3">&nbsp;&nbsp;&nbsp;&nbsp;
			<a onclick="p('cleaning')"><font color="#8C8C8C"; style="font-family: 나눔바른펜; font-size:13pt;">				
    					청소용품</font></a>
				</td></tr>
				
				
			<tr><td class="menu3">&nbsp;&nbsp;&nbsp;&nbsp;
			<a onclick="p('cleaning')"><font color="#8C8C8C"; style="font-family: 나눔바른펜; font-size:13pt;">				
    					주방용품</font></a>
				</td></tr>
				
			<tr><td class="menu3">	
			<a onclick="p('cleaning')"><font color="#8C8C8C"; style="font-family: 나눔바른펜; font-size:13pt;">				
    					&nbsp;&nbsp;&nbsp;&nbsp;문구/사무용품</font></a>
				</td></tr>
				
			

				
			</table>		
	</td>
	
	
	
	
	<td>
	<table width="800px" class="category2">
<%-- 	<tr><td height="50px" colspan="4"><font color="#ddd " style="font-family: 나눔바른펜;" size="4pt"><b>
	&nbsp;&nbsp;&nbsp;${dto.pCategory}카테고리</b></font></td></tr> --%>
	<tr>
	
		<c:forEach var="dto" items="${idea_categorylists}">	
			<td width="200px" height="300px" align="center" class="category2">
					<img alt="" src="${dto.pImg}" width="240" height="200"  style="padding-left: 20px;padding-right: 25px;"/>	
					<font color="#8b4513 "; style="font-family: 나눔바른펜; font-size:13pt;">
					<a href="${articleUrl}&pNum=${dto.pNum}">
						${dto.pName}<br>${dto.pPrice}원</a></font></td>
						
						<%
							if(i%3==0){
							out.print("</tr><tr>");
							}
							i++;
							%>
						
						
						</c:forEach>
		
							
	</tr>
	
	<tr height="50px"></tr>

	<tr>
		<td colspan="5" align="center">			
				<p>
					<c:if test="${dataCount!=0 }">
						${pageIndexList}
					</c:if>
					<c:if test="${dataCount==0 }">
						등록된게시물이 없습니다.
					</c:if>
				</p>
		</td>
	</tr>


	</table>
	</td></tr></table>

</form>

</body>
</html>