<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 신 고 게 시 판 </title>
</head>
<body>
<!-- 전체 묶기 -->
<div align="center" style=" width:500px; height: 500px;">
	<div> <font> 신 고 </font> </div>
	<div style=""></div>
	<div>
		<div style="float: left;">
			<font size="5pt;" style="font-family: 나눔손글씨 붓;">제목 : </font><input type="text" name="rsubject"/>
		</div>
		<br/>
		<div style=" margin-top: 10px;  float: left; text-align: left; width: 500px;">
		<font size="5pt;" style="font-family: 나눔손글씨 붓;">신 고 내 용 </font>
		</div>
		<div style="margin: 0 auto; margin-top: 50px;">
	 
		<textarea name="rcontext" rows="10" cols="50">aaaa</textarea>
		</div> 
	<div align="right" style="margin-right: 60px; margin-top: 10px;">
		<input type="submit" value="신고" onclick="sendIt();"/>
		</div>
	</div>
</div>
</body>
</html>