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

<div> <!-- 큰 틀 -->

	<div>
		일반결제(ISP)
	</div>
	
	<div>
	고객님의 신용카드번호 16자리와 이메일 주소를 정확하게 입력해주세요.
	</div>
	
	<div>
		<div>카드번호</div>
		<div><input type="text" style="border: solid 1px;">-<input type="text" style="border: solid 1px;">-<input type="text" style="border: solid 1px;">-<input type="text" style="border: solid 1px;"></div>
		<div>이메일</div><div><input type="text" name="email1">@<input type="text" name="email2"> </div>
	</div>
	
	<div>
		<div>
		 ※ 신종전자 금융사기 주의안내
		</div>
		<div>
		일반결제(ISP) 창에서는 별도의 팝업을 통해 개인정보를 요구하지 않습니다.
		개인정보를 요구하는 창이 뜨거나 메세지가 보이면 절대 입력하지 마세요.
		</div>
	</div>
	
	<div>
		<button>결제</button><button>취소</button>
	</div>
	
</div>






</body>
</html>