<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

.box{
	border-collapse: collapse;
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

<table width="1000" align="center" class="box">
	<tr height="100px"></tr>
	
	<tr height="40px"> 
		<td class="line3" colspan="2"><font color="#8b4513 " style="font-family: 나눔손글씨 붓;" font size="10px"><b>글 쓰기</b></font></td>
	</tr>
	<tr height="20px"></tr>
	<form name="myForm" method="post" action="">
	<tr height="30px">
		<td colspan="2"><input type="text" style="height:25px;"
		name="subject" size="107" maxlength="100" 
		class="border1"/></td>
	</tr>
	<tr height="10px"></tr>
	<tr>
		<td colspan="2"><textarea name="acontent" cols="125" rows="12" 
		class="border1"></textarea></td>
	</tr>
	<tr height="20px">
	</tr>	
	<tr>
		<td>
		<input type="button" style="width:50px; height:50px;" value="목록" class="btn1"
        onclick=""/></td>
        <td align="center">
        <input type="button" style="width:50px; height:50px;" value=" 등록" class="btn1" 
        onclick="created_sendIt();"/>
        </td>
       
    </form>
    </tr>
    </table>

</body>
</html>