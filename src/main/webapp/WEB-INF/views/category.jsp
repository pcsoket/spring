<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
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
.category3{
	border: 1px solid #EAEAEA;
	height: 100px;
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
				<tr><td class="category2"><a href='/god/shop_article.action'>
						<img alt="" src="/god/resources/image/aa.PNG"/><br/></a></td>
					<td class="category2">
						<img alt="" src="/god/resources/image/tt.PNG"/><br/></td>
					<td class="category2">
						<img alt="" src="/god/resources/image/ss.PNG"/><br/></td>
					<td class="category2">
						<img alt="" src="/god/resources/image/aa.PNG"/><br/></td>
					<td class="category2">
						<img alt="" src="/god/resources/image/dd.PNG"/><br/></td>
				</tr>
				
				<tr><td class="category3" align="center">
			
				<a href='/god/shop_article.action'>
						<font color="#8b4513 "; style="font-family: 나눔바른펜; font-size:13pt;">
							자두<br/>7,000원</font></a></td>
					<td class="category3" align="center">
						<font color="#8b4513 "; style="font-family: 나눔바른펜; font-size:13pt;">
							${dto.pName}<br/>11,800원</font></td>
					<td class="category3" align="center">
						<font color="#8b4513 "; style="font-family: 나눔바른펜; font-size:13pt;">
							호주산 등심 100g<br/>10,000원</font></td>
					<td class="category3" align="center">
						<font color="#8b4513 "; style="font-family: 나눔바른펜; font-size:13pt;">
							자두 100g<br/>7000원</font></td>					
					<td class="category3" align="center">
						<font color="#8b4513 "; style="font-family: 나눔바른펜; font-size:13pt;">
							진라면 5개<br/>2,350원</font>
							
							</td>
				</tr>
				
			
				<tr><td class="category2">
						<img alt="" src="/god/resources/image/ff.PNG"/><br/></td>
					<td class="category2">
						<img alt="" src="/god/resources/image/dd.PNG"/><br/></td>
						<td class="category2">
						<img alt="" src="/god/resources/image/zz.PNG"/><br/></td>
						<td class="category2">
						<img alt="" src="/god/resources/image/xx.PNG"/><br/></td>
						<td class="category2">
						<img alt="" src="/god/resources/image/tt.PNG"/><br/></td>
				</tr>
				
				<tr><td class="category3" align="center">
						<font color="#8b4513 "; style="font-family: 나눔바른펜; font-size:13pt;">
							종갓집 김장김치 <br/>13,000원</font></td>
					<td class="category3" align="center">
						<font color="#8b4513 "; style="font-family: 나눔바른펜; font-size:13pt;">
							진라면<br/>2,350원</font></td>
					<td class="category3" align="center">
						<font color="#8b4513 "; style="font-family: 나눔바른펜; font-size:13pt;">
							햇반 5개<br/>12,700원</font></td>
					<td class="category3" align="center">
						<font color="#8b4513 "; style="font-family: 나눔바른펜; font-size:13pt;">
							냉동 망고 1,3kg<br/>9,980원</font></td>					
					<td class="category3" align="center">
						<font color="#8b4513 "; style="font-family: 나눔바른펜; font-size:13pt;">
							활 랍스터<br/>11,800원</font></td>
				</tr>
				
					
				
				<tr><td>
				
				
				
				


			</table>
	</td></tr>









</table>



</body>
</html>