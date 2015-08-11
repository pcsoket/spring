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
}
.orderdatetitle{
width: 200px;
height: 90px;
float: left;
}

.datesearchBox{
width: 490px;
height: 30px;
float: left;
}

.datesearchBox{
width: 490px;
height: 30px;
float: left;
}

.searchOrdertitle{
height: 30px;
border-top: 2px solid #EAEAEA;
}

#searchOrdertitle{
height: 120px;
}

#searchOrderbox{
height: 150px;
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

.searchOrderwithdate{
background-color:#ffd2d7;
height: 110px;
border-top: 2px solid #EAEAEA
}


</style>
</head>
<body>
<div id="bodyWrap">
	<div id="bodyContent">
		<div id="searchOrderbox">
			<div class="searchOrdertitle">
				주문 배송조회
			</div>
			<div class="searchOrderwithdate" style="">
				<div class="orderdatetitle">조회기간</div>
				<div class="datesearchBox">
					<button type="button" class="datebtn" onClick="setDate('20150730','20150730', 'form1');"><span>오늘</span></button>
					<button type="button" class="datebtn" onClick="setDate('20150724','20150730', 'form1');"><span>1주일</span></button>
					<button type="button" class="datebtn" onClick="setDate('20150701','20150730', 'form1');"><span>1개월</span></button>
					<button type="button" class="datebtn" onClick="setDate('20150131','20150730', 'form1');"><span>6개월</span></button>
				</div>
				<div class="datesearchBox">
					<select name="startYY" id="startYY"  onchange="setDD('start', 'form1');">
						<option value='2015'  selected>2015</option>
					</select>
					<label for="startYY">년</label>
					<select name="startMM" id="startMM"  onchange="setDD('start', 'form1');">
						<option value='01' >1</option>
					</select>
					<label for="startMM">월</label>
					<select name="startDD" id="startDD">
						<option value='01' >1</option>
					</select>
					<label for="startDD">일</label>&nbsp;~&nbsp;
					<select name="endYY" id="endYY" onchange="setDD('end', 'form1');">
						<option value='2015'  selected>2015</option>
					</select>
					<label for="endYY">년</label>
					<select name="endMM" id="endMM" onchange="setDD('end', 'form1');">
						<option value='01' >1</option>
					</select>
					<label for="endMM">월</label>
						<select name="endDD" id="endDD" >
					<option value='01' >1</option>
					</select>
					<label for="endDD">일&nbsp;</label>
				</div>
				<div class="datesearchBox">
					<input type="text" name="searchPname" class="textField">
					<input type="button" value=" 검색 " class="searchbtn" onclick="sendIt();"/>
				</div>	
			</div>
		</div>
		
		<!-- 서치박스끝 리스트출력 -->
		
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
			<c:forEach var="dto" items="${lists}">
				<dl>
					<dd class="date" style="font-size: 7px;">${dto.bdate}</dd>
					<dd class="orderinfo">
					<a href="${articleUrl}&gnum=${dto.pnum}">
					${dto.pname}</a></dd>
					<dd class="price">${dto.pprice}(${dto.pamount})</dd>
					<dd class="tax">구매자</dd>
					<dd class="state">${dto.state}</dd>
				</dl>
			</c:forEach>
			</div>
			
			<div id="footer">
				<p>
					<c:if test="${dataCount!=0 }">
						${pageIndexList }
					</c:if>
					<c:if test="${dataCount==0 }">
						등록된게시물이 없습니다.
					</c:if>
				</p>
			</div>	
		</div>
	
	</div>
</div>
</body>
</html>