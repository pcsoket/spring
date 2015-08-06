<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<style type="text/css">
.btn-primary {
    color: #8b4513;
    background-color: #ffd2d7;
    border-color: #ffd2d7;
}
</style>

<script type="text/javascript">
	function minus() {
		
		f = document.myForm;
		
		if(Number(f.amount.value)>0){
			
			f.amount.value = Number(f.amount.value) -1;
			
		}else if(Number(f.amount.value)<1){
			
			alert("수량을 1개 이상 선택해 주세요.");
			
			
		}
		
		
		
	}
	
	function plus() {
		
		f = document.myForm;
		
		f.amount.value = Number(f.amount.value) + 1;
		
	}
</script>

</head>

<body>

<div align="center" style="width: 100%;"> <!-- 전체 틀 -->
	<form action="" method="post" name="myForm">
	<div style="background-color: #ffd2d7;width: 1000px; height: 55px;">
		<div align="left" style="font-size: 30pt; float:left; width: 535px; margin-left: 15px; font-family: 나눔손글씨 붓;">장바구니</div>
		<div align="right" style="font-size: 20pt; float:left; width: 440px; height:55px; vertical-align: bottom; margin-right: 10px; font-family: 나눔손글씨 붓;">장바구니 > 주문결제 > 주문완료 </div>
	</div>
	<br/>
	<div> <!-- 장바구니 메뉴 -->
		
		<div style="width: 1000px;"> <!-- 장바구니에 들어있는 물품 -->
		
			<div align="center" style="height:25px; background-color:#ffd2d7; border-top: solid 2px #ff7b8a; border-bottom: solid 2px #ffa3ad; padding-left: 10px; padding-right: 10px;"> <!-- 장바구니 물품 내역 -->
				<div style="float: left; width: 100px;"><input type="checkbox" checked="checked"></div>
				<div style="float: left; width: 450px;">상품명</div>
				<div style="float: left; width: 100px;">수량</div>
				<div style="float: left; width: 100px;">가격</div>
				<div style="width: 200px; float: left;">배송정보</div>
			</div>
		
			<div style="padding-left: 10px; padding-right: 10px;">
			
			<c:if test="${dataCount != 0 }">
			<c:forEach var="dto" items="${bklists }">
			
			
				<div style="height: 60px;">
					<div style="float: left; width: 100px;"><input type="checkbox" checked="checked"></div>
					<div style="float: left; width: 450px;"><img src="" width="30" height="30" border="0" />${dto.bPName }</div>
					<div style="float: left; width: 100px;">
						<div style="float: left;"><img src="/god/resources/image/minus.png" width="20px" height="20px" onclick="minus();"></div>
						<div style="width: 20px;" ><input type="text" value="1" name="amount" maxlength="2" size="5px" /></div>
						<div style="float: left;"><img src="/god/resources/image/plus.png" width="20px" height="20px" onclick="plus();"></div>
					</div>
					<div style="float: left; width: 100px;"></div>
					<div style="width: 200px; float: left;">배송정보</div>
				</div>
				
				<div align="left" style="border-bottom: solid 2px #ff7b8a; padding-left: 50px;">
					<div>
					<button type="button" class="btn btn-link" onclick="javascript:location.href='/god/purchase.action';">즉시구매></button>&nbsp;&nbsp;
					<button type="button" class="btn btn-link" onclick="javascript:location.href='/god/del.action';">삭제></button>&nbsp;&nbsp;
					</div>
				</div>
				
				
				
			</c:forEach>
			</c:if>
			<c:if test="${dataCount == 0 }">
				<div align="left" style="border-bottom: solid 2px #ff7b8a; padding-left: 50px;">
					장바구니에 등록된 상품이 없습니다.
				</div>
				</c:if>
			</div>
			
			<br/>
			
			<div style="padding-left: 10px; padding-right: 10px;">
				<div style="float: left; width: 100px;"><input type="checkbox" checked="checked"></div>
				<div align="left"><button type="button" class="btn btn-primary btn-xs" onclick="">삭제</button></div>
			</div>
			
			<div> <!-- 결제 예정금액 틀--> 
			
				<div style="height: 200px; padding-right: 30px;"> <!-- 결제예정금액 상자 -->
					<div style="font-size: 15pt; border: solid 2px #8e8e8e; width: 400px; float: right;">
						<div align="left" style="background-color: #a4a0a5; padding-left: 10px; ">
							결제 예정금액
						</div>
						
						<div align="left" style="padding-left: 20px; font-size: 13pt;">
							<div> · 상품가격 (총 1개) &nbsp;&nbsp;&nbsp;&nbsp; 가격</div>
							<div> · 할인금액 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 가격 </div>
							<div> · 배송비 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 가격 </div>
						</div>
						
						<div align="right">
							<div> 총 합계</div>
						</div>
						
					</div>
				</div>
			
			</div>
		
		</div>
		<br/>
	</div>
		
		<div style="width: 100%;height: 60px;">
			<div><button type="button" class="btn btn-primary btn-lg" onclick="javascript:location.href='/god/purchase.action';">주문 결제</button>&nbsp;<button type="button" class="btn btn-primary btn-lg">취소</button></div>
		</div>
	</form>
	
</div>


</body>
</html>