<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">


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

<form action="" method="post" name="myForm">

<table width=800" height="150" border="0" align="center" background="#F6F6F6">
	<tr height="50px"></tr>	
	
	<tr>
		<td class="line5"><b>아이디</b></td>
		<td>
		<textarea rows="7" cols="80" name="accontent" class="line5"></textarea>
		</td></tr>
		
	<tr>
		<td height="30px" colspan="4" align="right">
		<input type="button" value="등록" class="btn1"
		 style="height:30px; width: 50px" 
		onclick="sendIt();"/>
		</td>
	</tr>	

</table>

<table width="1000" height="100px" align="center" class="line5">
	<tr height="30px"> 
		<td colspan="5" class="font1"><b>댓글</b></font></td>
	</tr>
</table>

<table width="1000" height="100px" align="center" class="line5">

	<tr>
		<td width="100px" height="50px" align="center">이름</td>
		<td width="400px" align="right">날짜</td>
		
		<td></td>		
		
		<td width="100px" align="center">
			<input type="hidden" name="acnum">
			<input type="button" class="btn1" style="height: 30px" value=" 수정 " onclick="ac_sendIt('${cdto.acnum}');"/>			
		</td>

		<td></td>
		
	</tr>
	<tr>
		<td></td>
		<td class="font2" width="600px">내용</td>
		
		
		<td></td>
	
		<td align="center" align="top"><input type="button" value=" 삭제 " class="btn1" style="height: 30px"onclick=""/></td>
		<td></td>
			
	</tr>
	
</table>

</body>
</html>