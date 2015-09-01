<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니</title>
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
		
		var f = document.myForm;
	//	alert(index);
		var obj = document.getElementsByName("amount");
		var obj2 = document.getElementsByName("temp");
		// alert( obj.length );
		
		if(f.chk[index].checked){
			
			alert("체크를 풀고 수량을 선택해 주세요.");
			
		}else{
		
			if(i==-1 && obj[index].value == 1){ 
		      alert("더 이상 내릴 수 없습니다."); 
			          return false; 
			 } 
		
			obj[index].value=Number(obj[index].value) + i;
			obj2[index].value=Number(obj[index].value) * price;
		}
		
	}
	
	var r = 0;
	function check(i) {		
		var f = document.myForm;
		
		if(f.chk1.checked){
			
			var p = Number(f.price.value);
			
			if(f.chk[i].checked){
				
				p+=Number(f.temp[i].value);
			
				f.price.value=p;
			}else{
				
				p-=Number(f.temp[i].value);
				f.price.value=p;
				
			}
			
			
			
		}else{
		
		
		
			if('${bklists.size()}'== 1){
			
				if(f.chk.checked){
						
					r+=Number(f.temp.value);
					
				}else{
					
					r-=Number(f.temp.value);
			
				}
	
			
			}else if(i==0){
		
				
				if(f.chk[0].checked){
					
					r+=Number(f.temp[0].value);
			
					
				}else{
					r-=Number(f.temp[0].value);
					
				}
			}else {
				
				if(f.chk[i].checked){
					r+=Number(f.temp[i].value);
				
					
				}else{
					
					r-=Number(f.temp[i].value);
		
					
				}
				
			}
		
			f.price.value= r;
			f.total.value= r+2500;
		}
	
	}
	
	
	function senddirect(bNum,index) {
		
		var f = document.myForm;
		
		amt = Number(f.amount[index].value);
		
		
		location.href="/god/direct.action?bNum=" + bNum + "&amount=" + amt ;
		
		
	}
	
	
	function allchk(count) {
		
		var f = document.myForm;
		var p=0;
		
		if(f.chk1.checked){
			for(var i=0;i<count;i++){
				
				f.chk[i].checked = true;
				
				p+=Number(f.temp[i].value);
				
				
			}
			
			f.price.value= p;
			f.total.value= p+2500;
			
		
			
		}else{
			
			for(var i=0;i<count;i++){
				
				f.chk[i].checked = false;
				
				f.temp[i].value = f.bPrice[i].value;
			}
			
			
			f.price.value= 0;
			f.total.value= 0;
			
		}
		
	}
	
	function del(bNum) {
		
		var f = document.myForm;
		
		location.href="/god/del.action?bNum=" + bNum;
		
		
		
	}
	
	function deleted(count) {
		
		var f = document.myForm;
		
		for(var i = 0;i<count;i++){
			if(f.chk[i].checked){

			}
		}
		
	}
	
	function account(size) {
		
		
		
		var f = document.myForm;
	
		var str = "";
		var amt="";
		
		if(size==1){
			if(f.chk.checked){
				str = f.bNum.value;
				amt = f.amount.value;
				
			}
			
		}else{
			
			 for(var i=0; i<size; i++){
				if(f.chk[i].checked){
					
					 str += f.bNum[i].value + "-";
					 amt += f.amount[i].value + "-";
				}
			}
		}
		alert(str);
		alert(amt);
		f.bnums.value=str;
		f.amt.value=amt;
		
		
		
		f.action="/god/basket_ok.action";
		f.submit();
		
		
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

				<div style="float: left; width: 100px;"><input type="checkbox" name="chk1" onclick="allchk(${dataCount});"></div>
				
				<div style="float: left; width: 450px;">상품명</div>
				<div style="float: left; width: 100px;">수량</div>
				<div style="float: left; width: 100px; margin-left: 15px;">가격</div>				
				<div style="width: 200px; float: left;">상태</div>
			</div>
		
			<div style="padding-left: 10px; padding-right: 10px;">
			
			<c:if test="${dataCount != 0 }">
			<c:forEach var="dto" items="${bklists }" varStatus="status">

				<input type="hidden" name="bNum" value="${dto.bNum }">		
				<div style="height: 60px; padding-top: 10px;">
					<div style="float: left; width: 100px;"><input type="checkbox" name="chk" id="chk" onclick="check('${status.index }');" ></div>
					<div style="float: left; width: 450px;"><img src="" width="30" height="30" border="0" name="bPname"/>${dto.bPName }</div>
					<div style="float: left; width: 100px; margin-left: 20px;">
						<div style="float: left;"><img src="/god/resources/image/minus.png" name="minus" id="minus"  width="20px" height="20px" onclick="p(-1,'${dto.bPrice}','${status.index }');"></div>
						 
						
						
						<div style="float: left; width: 30px;" ><input type="text" value="1" style="border: none; width: 20px;" id="amount" name="amount" maxlength="2" /></div>
						
						
						<div style="float: left;"><img src="/god/resources/image/plus.png" name="plus" width="20px" height="20px" onclick="p(1,'${dto.bPrice}','${status.index }');" ></div>
					</div>
					<div style="float: left; width: 90px;">
					<input type="text" name="bPrice" style="border: none; margin-left: 25px;" readonly="readonly" value="${dto.bPrice }">
					<input type="hidden" id="temp" name="temp" value="${dto.bPrice * dto.bAmount }" >

					</div>
					<div align="center" style="width: 200px; float: left; margin-left: 5px;"><input type="text" style="border: none; width: 100px; height: 30px;" value="착불·선결제"></div>
				</div>
				
				<div align="left" style=" padding-left: 50px;">
					<div>
					<button type="button" class="btn btn-link" onclick="senddirect('${dto.bNum}','${status.index }');">즉시구매></button>&nbsp;&nbsp;
					<button type="button" class="btn btn-link" onclick="del('${dto.bNum}');">삭제></button>&nbsp;&nbsp;
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
			
			<div style="border-top: solid 2px #ff7b8a; padding-top: 10px; padding-left: 10px; padding-right: 10px;">
				<div align="left" style="padding-bottom: 5px; padding-left: 40px;">
				<button type="button" class="btn btn-primary btn-xs" onclick="deleted('${dataCount}');">삭제</button>
				</div>
			</div>
			
			<div> <!-- 결제 예정금액 틀--> 			
				<div style="height: 200px; padding-right: 30px; padding-top: 10px;"> <!-- 결제예정금액 상자 -->
					<div style="font-size: 15pt; border: solid 2px #8e8e8e; width: 400px; float: right;">
						<div align="left" style="background-color: #a4a0a5; padding-left: 10px; ">
							결제 예정금액
						</div>
						
						<div align="left" style="padding-left: 20px; font-size: 13pt;">
							<div style="float: left;"> · 상품가격 </div> <div align="right"><input type="text" name="price" readonly="readonly" style="border: none; width: 50px;" value="0" />원</div>
							<div style="float: left;"> · 배송비 </div> <div align="right"><input type="text" name="deli" readonly="readonly" style="border: none; width: 50px;" value=" 2500"> 원 </div>
						</div>		
										
						<div align="left" style="padding-left: 20px; font-size: 13pt;">
							<div style="float: left;"> 총 합계</div> <div align="right"><input type="text" name="total" value="0" readonly="readonly" style="border: none; width: 50px;"> 원</div>
						</div>						
					</div>
				</div>
			</div>
			<!-- 결제예정금액 끝 -->
		
		</div>
		<br/>
	</div>
		
	<div style="width: 100%;height: 60px;">
		<input type="hidden" name="bnums" value=""><input type="hidden" name="amt" value="">
			<div><button type="button" class="btn btn-primary btn-lg" onclick="account('${bklists.size()}');">주문 결제</button>&nbsp;<button type="button" class="btn btn-primary btn-lg">취소</button></div>
		</div>
	</form>
	
</div>

</body>
</html>