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
<script src="<%=cp%>/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/js/jquery/jquery-1.7.2.min.js"></script>
<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction('1', '<%=cp%>/resources/image/', '전송완료 메시지')</script>
<script type="text/javascript">

	String.prototype.trim = function() {
		var TRIM_PATTERN = /(^\s*)|(\s*$)/g;
		return this.replace(TRIM_PATTERN, "");

	}

	
	function sendIt() {
		
		f = document.myForm;

		str = f.pName.value;
		str = str.trim();
		if (!str) {
			alert("제목을 입력하세요 !!!");
			f.pName.focus();
			return;
		}
		f.pName.value = str;
		
		f.action = "<%=cp%>/shop_created_ok.action";
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
      <td width="80" height="30" bgcolor="#EEEEEE" style="padding-left:20px;">상&nbsp;품&nbsp;이&nbsp;름</td>
      <td width="480" style="padding-left:10px;"> 
        <input type="text" name="pName" value="${dto.pName}" size="74" maxlength="100" class="boxTF"/>
      </td>
  </tr>
  
  <tr> 
      <td width="80" height="30" bgcolor="#EEEEEE" style="padding-left:20px;">카&nbsp;테&nbsp;고&nbsp;리</td>
      <td width="480" style="padding-left:10px;">
      	<select name="pCategory" class="boxTF" id="123">
      		<option value="11">11</option>
      		<option value="11">22</option>
      		<option value="11">33</option>
      		<option value="11">44</option>
      		<option value="11">55</option>
      		<option value="11">66</option>
      	</select>
      </td>
  </tr>
  
  <tr> 
      <td width="80" height="30" bgcolor="#EEEEEE" style="padding-left:20px;">가&nbsp;&nbsp;&nbsp;&nbsp;격</td>
      <td width="480" style="padding-left:10px;"> 
        <input type="text" name="pPrice" size="74" maxlength="100" class="boxTF" />
      </td>
  </tr>
  
  <tr> 
      <td width="80" height="30" bgcolor="#EEEEEE" style="padding-left:20px;">재&nbsp;&nbsp;&nbsp;&nbsp;고</td>
      <td width="480" style="padding-left:10px;"> 
        <input type="text" name="pStock" value="${dto.pStock}" size="74" maxlength="100" class="boxTF"/>
      </td>
  </tr>

  <tr><td colspan="2" bgcolor="#DBDBDB" height="1"></td></tr>

  <tr> 
      <td width="80" height="30" bgcolor="#EEEEEE" style="padding-left:20px;">파&nbsp;&nbsp;&nbsp;&nbsp;일</td>
      <td width="480" style="padding-left:10px;"> 
      <!--  file upload input-->
      
        <input type="file"  name="upload" size="58" maxlength="100" class="boxTF" onchange=""/>
        <input type="file"  name="upload" size="58" maxlength="100" class="boxTF" onchange=""/>
        <input type="file"  name="upload" size="58" maxlength="100" class="boxTF" onchange=""/>
        <input type="file"  name="upload" size="58" maxlength="100" class="boxTF" onchange=""/>
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
        <textarea name="pContent" cols="20" rows="20">${dto.pContent}</textarea>
        <script>CKEDITOR.replace('pContent' ,
        		
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
<!-- //------------------------- // -->
<div style="display: none;">


<table>
  <tr> 
      <td width="80" height="30" bgcolor="#EEEEEE" style="padding-left:20px;">파&nbsp;&nbsp;&nbsp;&nbsp;일</td>
      <td width="480" style="padding-left:10px;"> 
     
      </td>
  </tr>
</table>
</div>
</body>
</html>