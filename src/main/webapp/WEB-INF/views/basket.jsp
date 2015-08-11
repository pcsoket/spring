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
	
	//var r = 0;

	function p(i, price, index) {
	//	alert(index);
		var obj = document.getElementsByName("amount");
		var obj2 = document.getElementsByName("temp");
		// alert( obj.length );
	
		
		if(i==-1 && obj[index].value == 1){ 
	      alert("더 이상 내릴 수 없습니다."); 
		          return false; 
		 } 
	//	alert(obj[index].value);
		obj[index].value=Number(obj[index].value) + i;
		obj2[index].value=Number(obj[index].value) * price;
		
	}
	
	function checked() {
		
		
		
	}
	
	var r = 0;
	function check(i) {
		
		var f = document.myForm;
		
		if('${bklists.size()}'== 1){
		
			if(f.chk.checked){
					
				r+=Number(f.temp.value);
				
			
				
				f.minus.disabled=true;
				f.plus.disabled=true; 
				
			}else{
				
				r-=Number(f.temp.value);
		
				f.minus.disabled=false;
				f.plus.disabled=false;
			}

		
		}else if(i==0){
	
			
			if(f.chk[0].checked){
				
				r+=Number(f.temp[0].value);
		
				f.minus[0].disabled=true;
				f.plus[0].disabled=true;
				
			}else{
				r-=Number(f.temp[0].value);
				
		
				f.minus[0].disabled=false;
				f.plus[0].disabled=false;
			}
		}else {
			alert(7);
			if(f.chk[i].checked){
				r+=Number(f.temp[i].value);
			
				f.minus[i].disabled=true;
				f.plus[i].disabled=true;
				
			}else{
				
				r-=Number(f.temp[i].value);
	
				f.minus[i].disabled=false;
				f.plus[i].disabled=false;
			}
			
		}
	
		f.price.value= r;
	
	}
	
	
	function total() {
		
		var f = document.myForm;
		
		f.total.value = Number(f.price.value) + 2500;
	}
	
</script>

</head>

<body>

<div align="center" style="width: 100%;"> <!-- 전체 틀 -->
	<form action="" method="post" name="myForm">
	<div style="background-color: #ffd2d7;width: 1000px; height: 55px;">
		<div align="left" style="font-size: 30pt; float:left; width: 535px; margin-left: 15px; font-family: 나눔손글씨 붓;">장바구니</div>
		<div align="right" style="font-size: 20pt; float:left; width: 440px; height:55px; vertical-align: bottom; margin-right: 10px; font-family: 나눔손글씨 붓;"><font style="font-size:25pt;"><b>장바구니</b></font> > 주문결제 > 주문완료 </div>
	</div>
	<br/>
	<div> <!-- 장바구니 메뉴 -->
		
		<div style="width: 1000px;"> <!-- 장바구니에 들어있는 물품 -->
		
			<div align="center" style="height:25px; background-color:#ffd2d7; border-top: solid 2px #ff7b8a; border-bottom: solid 2px #ffa3ad; padding-left: 10px; padding-right: 10px;"> <!-- 장바구니 물품 내역 -->
				<div style="float: left; width: 100px;"><input type="checkbox" name="chk1" onclick="checked();"></div>
				<div style="float: left; width: 450px;">상품명</div>
				<div style="float: left; width: 100px;">수량</div>
				<div style="float: left; width: 100px; margin-left: 15px;">가격</div>
				<div style="width: 200px; float: left;">상태</div>
			</div>
		
			<div style="padding-left: 10px; padding-right: 10px;">
			
			<c:if test="${dataCount != 0 }">
			<c:forEach var="dto" items="${bklists }" varStatus="status">
				
				<div style="height: 60px; padding-top: 10px;">
					<div style="float: left; width: 100px;"><input type="checkbox" name="chk" onclick="check('${status.index }');"></div>
					<div style="float: left; width: 450px;"><img src="" width="30" height="30" border="0" />${dto.bPName }</div>
					<div style="float: left; width: 100px; margin-left: 20px;">
						<div style="float: left;"><img src="/god/resources/image/minus.png" name="minus" id="minus" width="20px" height="20px" onclick="p(-1,'${dto.bPrice}','${status.index }');"></div>
						 
						
						
						<div style="float: left; width: 12px;" ><input type="text" value="1" style="border: none;" id="amount" name="amount" maxlength="2" width="5px"  /></div>
						
						
						<div style="float: left;"><img src="/god/resources/image/plus.png" name="plus" width="20px" height="20px" onclick="p(1,'${dto.bPrice}','${status.index }');" ></div>
					</div>
					<div style="float: left; width: 90px;">
					<input type="text" name="bprice" style="border: none;" readonly="readonly" value="${dto.bPrice }">
					<input type="hidden" id="temp" name="temp" value="${dto.bPrice * dto.bAmount }" onchange="check('${status.index }');" >
					</div>
					<div style="width: 200px; float: left; margin-left: 5px;">상태</div>
				</div>
				
				<div align="left" style=" padding-left: 50px;">
					<div>
					<button type="button" class="btn btn-link" onclick="javascript:location.href='/god/direct.action?bnum=${dto.bNum}';">즉시구매></button>&nbsp;&nbsp;
					<button type="button" class="btn btn-link" onclick="javascript:location.href='/god/del.action';">삭제></button>&nbsp;&nbsp;
					</div>
				</div>
				
				
			</c:forEach>
			
			</c:if>
			<c:if test="${dataCount == 0 }">
				<div align="left" style="padding-left: 50px;">
					장바구니에 등록된 상품이 없습니다.
				</div>
				</c:if>
			</div>
			
			<br/>
			
			<div style="border-bottom: solid 2px #ff7b8a; padding-left: 10px; padding-right: 10px;">
				<div style="float: left; width: 100px;"><input type="checkbox" name = "chk1"></div>
				<div align="left" style="padding-bottom: 5px;"><button type="button" class="btn btn-primary btn-xs" onclick="">삭제</button></div>
			</div>
			
			<div> <!-- 결제 예정금액 틀--> 
			
				<div style="height: 200px; padding-right: 30px; padding-top: 10px;"> <!-- 결제예정금액 상자 -->
					<div style="font-size: 15pt; border: solid 2px #8e8e8e; width: 400px; float: right;">
						<div align="left" style="background-color: #a4a0a5; padding-left: 10px; ">
							결제 예정금액
						</div>
						
						<div align="left" style="padding-left: 20px; font-size: 13pt;">
							<div style="float: left;"> · 상품가격 </div> <div align="right"><input type="text" name="price" readonly="readonly" style="border: none; width: 50px;" value="0" onchange="total();"/>원</div>
							<div style="float: left;"> · 배송비 </div> <div align="right"><input type="text" name="deli" readonly="readonly" style="border: none; width: 50px;" value=" 2500"> 원 </div>
						</div>
						
						<div align="left" style="padding-left: 20px; font-size: 13pt;">
							<div style="float: left;"> 총 합계</div> <div align="right"><input type="text" name="total" value="0" readonly="readonly" style="border: none;"> 원</div>
						</div>
						
					</div>
				</div>
			
			</div>
			<!-- 결제예정금액 끝 -->
		
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