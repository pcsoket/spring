<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이미지 업로드</title>
<link rel="stylesheet" href="<%=cp%>/resources/data/style.css" type="text/css">
<script type="text/javascript">

	String.prototype.trim = function() {
		var TRIM_PATTERN = /(^\s*)|(\s*$)/g;
		return this.replace(TRIM_PATTERN, "");

	}

	function sendIt() {
		
		f = document.myForm;

		str = f.userId.value;
		str = str.trim();
		if (!str) {
			alert("제목을 입력하세요 !!!");
			f.userId.focus();
			return;
		}
		f.userId.value = str;
		
		str = f.upload.value;
		if (!str) {
			alert("이미지 파일을 선택 하세요 !!!");
			f.upload.focus();
			return;
		}
		
		f.action = "<%=cp%>/img/created.action";
		f.submit();
		
	}
</script>
</head>

<body onload="document.myForm.userId.focus();">

<br/>&nbsp;<br/>

<table width="560" border="2" cellspacing="0" cellpadding="0" bordercolor="#D6D4A6" align="center">
<tr height="40"> 
<td style="padding-left:25px;">
<b>이미지 게시판(Spring)</b>
</td>
</tr>
</table>
<br/>&nbsp;<br/>

<form name="myForm" method="post" action="" enctype="multipart/form-data">
  <table width="560" border="0" cellspacing="0" cellpadding="3" align="center">

  <tr><td colspan="2" height="3" bgcolor="#DBDBDB" align="center"></td></tr>

  <tr> 
      <td width="80" height="30" bgcolor="#EEEEEE" style="padding-left:20px;">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
      <td width="480" style="padding-left:10px;"> 
        <input type="text" name="userId" size="74" maxlength="100" class="boxTF"/>
      </td>
  </tr>

  <tr><td colspan="2" bgcolor="#DBDBDB" height="1"></td></tr>

  <tr> 
      <td width="80" height="30" bgcolor="#EEEEEE" style="padding-left:20px;">파&nbsp;&nbsp;&nbsp;&nbsp;일</td>
      <td width="480" style="padding-left:10px;"> 
        <input type="file" name="upload" size="58" maxlength="100" class="boxTF"/>
      </td>
  </tr>

  <tr><td colspan="2" height="3" bgcolor="#DBDBDB" align="center"></td></tr>

  </table>
<br/>
  <table width="560" border="0" cellspacing="0" cellpadding="3" align="center">
     <tr align="center"  height="30"> 
      <td>
      	<input type="hidden" name="tableName" value="test"/>
        <input type="button" value=" 등록하기 " onclick="sendIt();" class="btn1"/>
        <input type="reset"  value=" 다시입력 " onclick="document.myForm.subject.focus();" class="btn1"/>
        <input type="button" value=" 작성취소 " onclick="javascript:location.href='<%=cp%>/img/list.action';" class="btn1"/>
      </td>
    </tr>
  </table>
</form>

</body>
</html>