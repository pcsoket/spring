<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

window.onload = function () {
	document.getElementById("gnum").value=opener.document.all.gnum.value;
	document.getElementById("boardName").value=opener.document.all.bName.value;
	document.getElementById("raddress").value= window.opener.document.location.href;
	if(opener.document.all.cmContent.value!=""){
	document.getElementById("rContent").value ="신고할 글 내용 : " + opener.document.all.cmContent.value;
	document.getElementById("rContent").value +="\r\n------------------------------------";
	document.getElementById("rContent").value +="\r\n";
	}
}

function sendIt() {
	
	var f = document.rdata;
	
	f.action ="<%=cp%>/report_ok.action";
	f.submit();
	
	if(!confirm("신고가 접수 되었습니다.")){
		  return; 
		 }
	self.close();
	
}

</script>
<title> 신 고 등 록 </title>
</head>
<body style="background-color: ">
<!-- 전체 묶기 -->
<div align="center" style=" width:460px; height: 200px;">
	<div> <font size="9pt;" style=" color:red; font-family: 나눔바른 펜;"> 신 고 등 록 </font> </div>
	<!-- <div style="border: 1px solid; border-top-color: #EAEAEA;"></div> -->
	<div>
	<form name="rdata" method="post">
		<div style="float: left; margin-top: 20px;">
			<font size="3pt;" style=" color:red; font-family: 나눔바른 펜;"> <b>제 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</b></font> :
			<input type="text" name="rsubject"/>
		</div>
		<br/>
		<div style=" margin-top: 10px;  float: left; text-align: left; width: 500px;">
		<font size="3pt;" style=" color:red; font-family: 나눔바른 펜;"> <b>신 고 내 용</b> </font>
		</div>
		<div style="margin: 0 auto; margin-top: 35px;">
		<textarea id="rContent" name="rContent" rows="10" cols="36"></textarea>
		</div> 
	<div align="right" style=" margin-right:70px; margin-top: 5px;">
		<input type="hidden" id="gnum" name="gnum"/>
		<input type="hidden" id="boardName" name="boardName"/>
		<input type="hidden" id="raddress" name="raddress" />
		<input type="submit" value="신고" onclick="sendIt();"/>
		</div>
		</form>
	</div>
</div>
</body>
</html>