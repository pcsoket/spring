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
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<style type="text/css">

.box{
	border-collapse: collapse;

	}
.dropdown{
	border: 1px solid #EAEAEA;
	background-color:  #ffd2d7;	
	width: 200px;
	height: 50px;
	}
.category1{
	border-bottom: 1px solid #EAEAEA;
	width: 200px;
	height: 30px;
	}
.category2{
	border: 1px solid #EAEAEA;
	height: 200px;
	width: 200px;
	}


</style>


</head>
<body>

<table width="1020px" class="box" align="center">
	<tr><td>
			<table class="box">

				<tr><td class="dropdown">
						&nbsp;&nbsp;&nbsp;<font color="#8b4513"; style="font-family: 나눔바른펜; font-size:13pt;"><b>	
    					<a class="dropdown-toggle" data-toggle="dropdown" href="#">아이디어 상품<span class="caret"></span></a>
      						<ul class="dropdown-menu">
        						<li class="category1"><a href='/god/shop_article.action'>수박ㅎ_ㅎㅎㅎ</a></li>
       							<li class="category1"><a href="#">아이디어 상품2</a></li>
        						<li class="category1"><a href="#">아이디어 상품3</a></li>
        						<li class="category1"><a href="#">아이디어 상품4</a></li>  
        						<li class="category1"><a href="#">아이디어 상품5</a></li>  
        						<li class="category1"><a href="#">아이디어 상품6</a></li>                        
     						 </ul>

    					</b></font>
					</td>
					
					
					<td rowspan="6" align="center"><img alt="" src="/god/resources/image/yy.PNG"/><br/></td>
				</tr>
				
				<tr><td class="dropdown">
						&nbsp;&nbsp;&nbsp;<font color="#8b4513"; style="font-family: 나눔바른펜; font-size:13pt;"><b>	
    					<a class="dropdown-toggle" data-toggle="dropdown" href="#">패션/뷰티<span class="caret"></span></a>
      						<ul class="dropdown-menu">
        						<li class="category1"><a href="#">아이디어 상품1</a></li>
       							<li class="category1"><a href="#">아이디어 상품2</a></li>
        						<li class="category1"><a href="#">아이디어 상품3</a></li>
        						<li class="category1"><a href="#">아이디어 상품4</a></li>  
        						<li class="category1"><a href="#">아이디어 상품5</a></li>  
        						<li class="category1"><a href="#">아이디어 상품6</a></li>                        
     						 </ul>

    					</b></font>
					</td></tr>
					
				<tr><td class="dropdown">
						&nbsp;&nbsp;&nbsp;<font color="#8b4513"; style="font-family: 나눔바른펜; font-size:13pt;"><b>	
    					<a class="dropdown-toggle" data-toggle="dropdown" href="#">유아동/식품<span class="caret"></span></a>
      						<ul class="dropdown-menu">
        						<li class="category1"><a href="#">아이디어 상품1</a></li>
       							<li class="category1"><a href="#">아이디어 상품2</a></li>
        						<li class="category1"><a href="#">아이디어 상품3</a></li>
        						<li class="category1"><a href="#">아이디어 상품4</a></li>  
        						<li class="category1"><a href="#">아이디어 상품5</a></li>  
        						<li class="category1"><a href="#">아이디어 상품6</a></li>                        
     						 </ul>

    					</b></font>
					</td>
					
				<tr><td class="dropdown">
						&nbsp;&nbsp;&nbsp;<font color="#8b4513"; style="font-family: 나눔바른펜; font-size:13pt;"><b>	
    					<a class="dropdown-toggle" data-toggle="dropdown" href="#">가구/리빙/건강<span class="caret"></span></a>
      						<ul class="dropdown-menu">
        						<li class="category1"><a href="#">아이디어 상품1</a></li>
       							<li class="category1"><a href="#">아이디어 상품2</a></li>
        						<li class="category1"><a href="#">아이디어 상품3</a></li>
        						<li class="category1"><a href="#">아이디어 상품4</a></li>  
        						<li class="category1"><a href="#">아이디어 상품5</a></li>  
        						<li class="category1"><a href="#">아이디어 상품6</a></li>                        
     						 </ul>

    					</b></font>
					</td>
					
				<tr><td class="dropdown">
						&nbsp;&nbsp;&nbsp;<font color="#8b4513"; style="font-family: 나눔바른펜; font-size:13pt;"><b>	
    					<a class="dropdown-toggle" data-toggle="dropdown" href="#">컴퓨터/디지털/가전<span class="caret"></span></a>
      						<ul class="dropdown-menu">
        						<li class="category1"><a href="#">컴퓨터/디지털/가전 상품1</a></li>
       							<li class="category1"><a href="#">컴퓨터/디지털/가전 상품2</a></li>
        						<li class="category1"><a href="#">컴퓨터/디지털/가전 상품3</a></li>
        						<li class="category1"><a href="#">컴퓨터/디지털/가전 상품4</a></li>  
        						<li class="category1"><a href="#">컴퓨터/디지털/가전 상품5</a></li>  
        						<li class="category1"><a href="#">컴퓨터/디지털/가전 상품6</a></li>                        
     						 </ul>

    					</b></font>
					</td>
					
				<tr><td class="dropdown">
						&nbsp;&nbsp;&nbsp;<font color="#8b4513"; style="font-family: 나눔바른펜; font-size:13pt;"><b>	
    					<a class="dropdown-toggle" data-toggle="dropdown" href="#">아이디어 상품<span class="caret"></span></a>
      						<ul class="dropdown-menu">
        						<li class="category1"><a href="#">아이디어 상품1</a></li>
       							<li class="category1"><a href="#">아이디어 상품2</a></li>
        						<li class="category1"><a href="#">아이디어 상품3</a></li>
        						<li class="category1"><a href="#">아이디어 상품4</a></li>  
        						<li class="category1"><a href="#">아이디어 상품5</a></li>  
        						<li class="category1"><a href="#">아이디어 상품6</a></li>                        
     						 </ul>

    					</b></font>
					</td>
				
			</table>
			<table class="box">
				<tr>
				
				<c:forEach var="dto" items="${lists}">
				<td width="200px" height="100px" align="center" class="category2">
					<img alt="" src="/god/resources/image/aa.PNG" width="200" height="200" />	
					<font color="#8b4513 "; style="font-family: 나눔바른펜; font-size:13pt;">
						${dto.pName}<br>${dto.pPrice}원</font><img alt="" src="">
				</td>
							<%
							if(i%5==0){
							out.print("</tr><tr>");
							}
							i++;
							%>
					</c:forEach>
						
				</tr>
				<tr>
					<td align="center" height="30" colspan="5">
					<font>
						<c:if test="${totalDataCount!=0}">
							${pageIndexList}				
						</c:if> 
						<c:if test="${totalDataCount==0}">
							등록된 게시물이 없습니다.
						</c:if>
					</font>
					</td>
				</tr>

			</table>
	</td></tr>









</table>



</body>
</html>