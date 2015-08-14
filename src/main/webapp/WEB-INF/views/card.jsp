<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>card 결제</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</head>
<body>

<div style="width: 500px; padding: 5px;" align="center"> <!-- 큰 틀 -->

	<div align="left" style="padding-bottom: 10px; font-size: 13pt;">
		일반결제(ISP)
	</div>
	<div style="padding-bottom: solid 2px #5D5D5D; "></div>
	<div align="left" style="font-size: 10pt; padding-bottom: 10px;">
	·고객님의 <span style="font-weight: bold;">신용카드번호 16자리</span>와 <span style="font-weight: bold;">이메일 주소</span>를 정확하게 입력해주세요.
	</div>
	
	<div style="border: solid 2px #005766; width: 490px; ">
		
			<div style="background-color: #C7D3ED; float: left; padding: 5px; width: 100px; border-right: solid 1px #005766; border-bottom: solid 1px #005766; " >
				<div >카드번호</div>
				<div style="font-size: 7pt;">/ Credit Card No. </div>
			</div>
			<div  align="left" style="padding: 10px; padding-left: 110px; border-bottom: solid 1px #005766;"><input type="text" style="border: solid 1px; width: 50px;">-<input type="text" style="border: solid 1px;width: 50px;">-<input type="text" style="border: solid 1px; width: 50px;">-<input type="text" style="border: solid 1px; width: 50px;"></div>
	
		<div style="background-color: #C7D3ED; float: left; padding: 5px; width: 100px; border-right: solid 1px #005766; border-bottom: solid 1px #005766;">
			<div>이메일</div>
			<div style="font-size: 7pt;">/ E-mail address </div>
		</div>
		<div align="left" style="padding:  9px; padding-left: 110px;"><input type="text" style="width: 70px;" name="email1">@<input type="text" style="width: 100px;" name="email2"> </div>
	</div>
	
	<br/>
	<br/>
	<div>
		<div align="left" style="padding-left: 10px; padding-bottom: 10px; font-size: 16px; color: #4948FF;">
		 ※ 신종전자 금융사기 주의안내
		</div>
		<div style="border: solid 1px #B2CCFF; padding: 8px;">
		일반결제(ISP) 창에서는 별도의 팝업을 통해 개인정보를 요구하지 않습니다.
		개인정보를 요구하는 창이 뜨거나 메세지가 보이면 절대 입력하지 마세요.
		</div>
	</div>
	
	<div style="padding: 10px;">
		<input type="button" value="결제" style="padding: 10px;">
		<input type="button" value="취소" style="padding: 10px;">
	</div>
	
</div>






</body>
</html>