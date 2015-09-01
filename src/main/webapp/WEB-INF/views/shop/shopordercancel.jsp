<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

*{ margin:0;}

div{
}

#bodyWrap{
width: 1000px;
margin: 0 auto;
}
#bodyContent{
width: 700px;
height: 800px;
float: left;
margin: 0 auto;
}

                                                  /*게시물부분  */

#orderList {
	width:690px;
	margin:30px auto;
	text-align:left;
}

#orderList_title {
	width:664px;   /* 690px - (padding-left+border:3px+border:3px) */
	padding-left:20px;
	height:40px;
	border:3px solid #D6D4A6;
	text-align:left;
	font-weight: bold;
	line-height:40px;
	font-size:10pt;
	margin-bottom:30px;
}

#title{
	font-size:9pt;
}


#orderList_header {
	height:27px;
}

#orderList_header #leftHeader{
	float:left;
	width:345px;
	text-align:left;
}
#orderList_header #rightHeader{
	float:right;
	width:345px;
	text-align:right;
}

#orderList_header .selectFiled {border:1px solid; border-color:#666666; background-color:#ffffff; font-family:굴림; font-size:9pt;}
#orderList_header .textFiled {border:1px solid; height:13px; padding:2px 2px 2px 2px; border-color:#666666; background-color:#ffffff; font-family:"굴림"; font-size:9pt;}

#orderList_list {
	clear:both;
}

#orderList_list dd {
	float:left;
	height:27px;
	line-height:27px;
	text-align:center;
}

#orderList_list #title {
	height:30px;
	border-top:1px solid #CCCCCC;
	border-bottom:1px solid #CCCCCC;
	background-color: #E6E4E6;
}

#orderList_list #title dl {
	height:27px;
	border-left:0px solid #5db062;
	border-right:0px solid #5db062;
}

#orderList_list #title dt {
	float:left;
	line-height:34px;
	text-align:center;
}

#orderList_list .date {width:70px;}
#orderList_list .orderinfo {width:370px;}
#orderList_list .price {width:110px;}
#orderList_list .tax {width:80px;}
#orderList_list .state {width:60px;}

#orderList_list #lists {
	clear:both;
}

#orderList_list #lists dl {
	float:left;
	border-bottom:1px solid #E4E4E4;
}

#orderList_list dd.subject {
	width:360px;
	margin-left:10px;
	text-align:left;
}
#orderList_list a {
	line-height: 27px;
}

#orderList_list #footer {
	clear:both;
	height:32px;
	line-height:32px;
	margin-top:5px;
	text-align:center;
}

#selectwhy{
font-size: 9pt;
margin: 0 auto;
height: 30px;
width: 700px;
background-color:#ffd2d7;
padding-top: 8px;padding-left: 6px;
}

select {vertical-align:middle;color: gray;}

input {color:#4d4d4d;border:1px solid #bbb;vertical-align:middle;}

.repay_wrap{
height: 150px;
width: 700px;
}

.repay_wrap div{
border-color: #4d4d4d;
}

.subtraction{
height: 150px;
width: 200px;
float: left;
background-color:#ffd2d7;
}
.final_sum{
height: 150px;
width: 250px;
float: left;
background-color:#ffd2d7;
}
.paybox{
height: 150px;
width: 250px;
float: left;
background-color:#ffd2d7;
border-right: 1px white;
}

.btn1{
	background-color: #ffd2d7;
	border:1px solid #ffd2d7;
	font :"#8b4513";
	font-family : 나눔바른펜";
}
a{
text-decoration: none;

}


</style>
</head>
<body>
<div id="bodyWrap">
	<div id="bodyContent">
		
		<!-- 반품신청아티클   -->
		<div id="orderList_list">
			<div id="title">
				<dl>
					<dt class="date">주문일자</dt>
					<dt class="orderinfo">주문상품정보</dt>
					<dt class="price">상품금액(수량)</dt>
					<dt class="tax">배송비(판매자)</dt>
					<dt class="state">주문상태</dt>
				</dl>
			</div>
			<div id="lists">
				<dl>
					<dd class="date"></dd>
					<dd class="orderinfo">
					<a href="${articleUrl}&num=${dto.num}">
					${dto.subject }</a></dd>
					<dd class="price">${dto.name }</dd>
					<dd class="tax">${dto.created }</dd>
					<dd class="state">${dto.hitCount }</dd>
				</dl>
			</div>
			<div class="banner" style="height: 90px;width: 700px;">
			
			
			</div>
			
			<div id="selectwhy">
				<p class="tfoot">
					반품사유선택
					<select name="clmReqRsn" id="clmReqRsn" style="width:200px;background:#f8f8f8;" onChange="">
						<option value="">반품사유선택</option>
										<option value="101">상품에 이상 없으나 구매 의사 없어짐</option>
							
										<option value="110">사이즈, 색상 등을 잘못 선택함</option>
							
										<option value="105">상품이 상품상세 정보와 틀림</option>
							
										<option value="111">배송된 상품의 파손/하자/포장 불량</option>
							
										<option value="112">상품이 도착하고 있지 않음</option>
							
										<option value="108">다른 상품이 잘못 배송됨</option>
							
										<option value="113">기타(구매자 책임사유)</option>
							
										<option value="116">기타(판매자 책임사유)</option>
					</select>&nbsp;
					<input type="text" name="clmReqCont"  id="clmReqCont" class="gray" value="상세 사유를 입력해 주세요" onclick="" style="width:280px;background:#f8f8f8;border-left:none;">
					반품책임 :
                    <span id="cnCouponGuide" class="gold" style="display: none;">구매자 책임사유로 반품 완료 시 유효기간이 만료된 쿠폰은 재발급되지 않습니다.</span>
				</p>
			</div>
			
			<!-- 반품사유 선택 끝 -->
			
			<div>
				<div class="mytmall_title refundsum">
					<h3 class="t_refundsum_v2"><span>환불예상금액 확인</span></h3>
					<em>환불확정금액은 아래 예상금액과 다를 수 있습니다.</em>
					<button type="button" class="defbtn_info"  onclick="layerView('defbtnInfo01');">도움말</button>
					<div class="layer_def_wrap"  id="defbtnInfo01"><!-- layer_def_wrap, view : 부모 태그에 addclass "selected" -->
						<div class="layer_def_b have_close">
							<div class="layer_conts">
								동일한 주문에서 여러 건의 취소/반품 진행될 경우 환불이 확정되는 순서에 따라 환불확정금액이 신청 시 환불예상금액과 달라질 수 있습니다.
							</div>
						</div>
					</div>
				</div>
				<div class="repay_wrap">
					<div class="paybox">
						<div>
							<span>원 결제금액</span><strong><em>0</em>원</strong>
						</div>
						<ul>
							<li>
								<span>상품금액</span>
								<strong><em>0</em>원</strong>
							</li>
							<li>
								<span>환불배송비</span>
								<strong><em>0</em>원</strong>
							</li>
							<li class="">
								<span>할인금액</span>
								<strong><em>0</em>원</strong>
							</li>
						</ul>
					</div>
					<div class="subtraction">
						<div>
							<span>차감금액</span><strong><em>0</em>원</strong>
						</div>
						<ul>
							<li>
								<span>추가배송비</span>
								<strong><em>0</em>원</strong>
							</li>
						</ul>
					</div>
					<div class="final_sum">
						<div>
							<span>환불예상금액</span><strong><em>0</em>원</strong>
						</div>
						<ul>
							<li>
								<span>결제</span>
								<strong><em>0</em>원</strong>
							</li>
						</ul>
					</div>
				</div>		
			</div>
			
			
			<!-- 반품 결정 -->
			<div style="text-align: center;">
				<a href="" class="btn1"><span>이전 페이지로</span></a>
				<a href=""  class="btn1"><span>반품신청</span></a>
			</div>
			
		</div>
	</div>
</div>
</body>
</html>