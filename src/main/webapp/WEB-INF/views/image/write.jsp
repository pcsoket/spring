<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
		
	String[] as = {"1","2","3"};
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이미지 업로드</title>
<script src="<%=cp%>/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/js/jquery/jquery-1.7.2.min.js"></script>
<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction('1', '<%=cp%>/resources/image/', '전송완료 메시지')</script>
<script type="text/javascript">

	String.prototype.trim = function() {
		var TRIM_PATTERN = /(^\s*)|(\s*$)/g;
		return this.replace(TRIM_PATTERN, "");

	}
	
	var i = 0;
	var str = "";
	
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
	
	
	function fileUpload(){
		
		
		f = document.myForm;
		
		alert(str);
		
		

		document.getElementById('fileList').innerHTML= "<div id=file"+i+">"+f.upup.value+"</div>";
		//document.getElementById('fileList').append= "<div id=file"+i+">"+f.upup.value+"</div>";
		
		str+="<div id=file"+i+">"+f.upup.value+"</div>";
		alert(str+"1");
		i++;
	}
	
	function fileDelete(){
		f = document.myForm;
		document.getElementById('fileList').innerHTML= f.upup.value;
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
        <input type="text" name="userId" size="74" maxlength="100" class="boxTF" id="123"/>
      </td>
  </tr>

  <tr><td colspan="2" bgcolor="#DBDBDB" height="1"></td></tr>

  <tr> 
      <td width="80" height="30" bgcolor="#EEEEEE" style="padding-left:20px;">파&nbsp;&nbsp;&nbsp;&nbsp;일</td>
      <td width="480" style="padding-left:10px;"> 
      <!--  file upload input-->
      
        <input type="file" id="upup" name="upload" size="58" maxlength="100" class="boxTF" onchange="fileUpload();"/>
      <div id="fileList">
      </div>
      </td>
      
  </tr>

  <tr><td colspan="2" height="3" bgcolor="#DBDBDB" align="center"></td></tr>

  </table>
<br/>
  <table width="560" border="0" cellspacing="0" cellpadding="3" align="center">
    <tr align="center"  height="30"> 
      <td>
        <textarea name="description" cols="20" rows="20"></textarea>
        <script>CKEDITOR.replace('description' ,
        		
        		 {width : '620px', // 입력창의 넓이
        	      height : '200px',  // 입력창의 높이
        	      startupFocus : false});</script>
        <img alt="" src="${img}"><br/>
      	<input type="hidden" name="tableName" value="test"/>
        <input type="button" value=" 등록하기 " onclick="sendIt();" class="btn1"/>
        <input type="reset"  value=" 다시입력 " onclick="document.myForm.subject.focus();" class="btn1"/>
        <input type="button" value=" 작성취소 " onclick="javascript:location.href='<%=cp%>/img/list.action';" class="btn1"/>
      </td>
    </tr>
  </table>
</form>

<div style="display: none;">
<table>
  <tr> 
      <td width="80" height="30" bgcolor="#EEEEEE" style="padding-left:20px;">파&nbsp;&nbsp;&nbsp;&nbsp;일</td>
      <td width="480" style="padding-left:10px;"> 
        <input type="file" id="up" name="upload" size="58" maxlength="100" class="boxTF"/>
      </td>
  </tr>
</table>
</div>
</body>
</html>