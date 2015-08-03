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
border: solid 1px;
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
}

#searchOrdertitle{
height: 120px;
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
			<div class="searchOrderwithdate">
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
	</div>
</div>
</body>
</html>