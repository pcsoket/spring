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

</head>



<body>

<div align="center" style="width: 100%;"> <!-- 전체 틀 -->

	<div style="background-color: #ffd2d7;width: 1000px; height: 55px;">
		<div align="left" style="font-size: 30pt; float:left; width: 535px; margin-left: 15px; font-family: 나눔손글씨 붓;">장바구니</div>
		<div align="right" style="font-size: 20pt; float:left; width: 440px; height:55px; vertical-align: bottom; margin-right: 10px; font-family: 나눔손글씨 붓;">장바구니 > <font style="font-size:25pt;"><b>주문결제</b></font> > 주문완료 </div>
	</div>
	<br/>
	
	<div style="width: 1000px;">
		<div style="width: 550px; float: left;">
			<div align="left" style="font-size: 15pt; padding-left: 10px;">
				배송지 선택
			</div>
		<div>
			<div style="border-top: solid 1px #ff7b8a; background-color: #ffd2d7; ">
				<div><input type="radio" value="새주소" name="addRadio" onclick="">새주소 
				<input type="radio" value="배송지" name="addRadio">기본배송지</div>
			</div>
			
			<div>
				<div><input type="text" style="border: none;" name="addname" value="이름"><input type="text" style="border: none;" name="tel" value="전화번호"></div>
				<div><input type="text" style="border: none;" name="addr" value="주소"> </div>
				
				<div><input type="text" style="border: none;" name="zipcode" value="우편번호"> </div>
				<div>수정버튼</div>	
			</div>
		</div>
		</div>
		<c:if test="${dto != null }">
		<div style="width: 390px; float: left; padding-left: 15px;">
			<div>주문 상품 정보</div>
			<div style="border: solid 1px #ffd2d7;" >
				<div style="float: left; width: 150px;" >이미지 </div>
				<div style="float: left;">
					<div><input type="text" name="bpname" style="border: none;" value="${dto.bPName }"> </div>
					<div><input type="text" name="bprice" style="border: none;" value="${dto.bPrice }"> </div>
				</div>
			</div>
		</div>
		</c:if>
		
	</div>
	
	<div style="width: 1000px; padding-top: 20px;">	
	
		<div style="width: 500px; float: left;"> <!-- 결제 수단 선택 -->
		
			<div align="left" style="font-size: 15pt; border-bottom: solid 1px #ff7b8a;">결제 수단 선택 </div>
			<div align="center" style="padding-top: 5px;">
				<button type="button" class="btn btn-primary btn-lg" onclick="javascript:location.href='/god/card.action';">신한카드</button>
				<button type="button" class="btn btn-primary btn-lg" onclick="javascript:location.href='/god/card.action';">롯데카드</button>
				<button type="button" class="btn btn-primary btn-lg" onclick="javascript:location.href='/god/card.action';">국민카드</button>
				<button type="button" class="btn btn-primary btn-lg" onclick="javascript:location.href='/god/card.action';">현대카드</button>
				<button type="button" class="btn btn-primary btn-lg" onclick="javascript:location.href='/god/card.action';">삼성카드</button>
			</div>
		
		
		</div>
		<div style="width: 500px; float: left; padding-top: 20px;"> <!-- 결제 예정금액 틀--> 
			
				<div style="height: 200px; padding-right: 30px; padding-top: 10px;"> <!-- 결제예정금액 상자 -->
					<div style="font-size: 15pt; border: solid 2px #8e8e8e; width: 400px; float: right;">
						<div align="left" style="background-color: #a4a0a5; padding-left: 10px; ">
							결제 예정금액
						</div>
						
						<div align="left" style="padding-left: 20px; font-size: 13pt;">
							<div style="float: left;"> · 상품가격 </div> <div align="right"><input type="text" name="pPrice" readonly="readonly" style="border: none; width: 50px;" value="${dto.bPrice * amount }"/>원</div>
							<div style="float: left;"> · 배송비 </div> <div align="right"><input type="text" name="pDeli" readonly="readonly" style="border: none; width: 50px;" value=" 2500"> 원 </div>
						</div>
						
						<div align="left" style="padding-left: 20px; font-size: 13pt;">
							<div style="float: left;"> 총 합계</div> <div align="right"><input type="text" name="total" readonly="readonly" style="border: none; width: 50px;" value="${total }"> 원</div>
						</div>
						
					</div>
				</div>
			
		</div>
		
	</div>
	
	<div style="width: 1000px;">	
		<div style="width: 490px; float: left; overflow: hidden;"><img src="/god/resources/image/card1.jpg"></div>
		<div style="width: 490px; float: left; overflow: hidden;"><img src="/god/resources/image/card2.jpg"></div>
	</div>


</div>
</body>
</html>