<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댓글 게시판</title>
<style type="text/css">
.box{
	border-collapse: collapse;
	}

.line2{
		border-bottom: 2px solid #ffd2d7;
		
		}

.line3{border-top: 5px solid  #A6A6A6;
	border-bottom: 1px solid #ffd2d7;

}
.line4{	
	border-bottom: 1px solid  #EAEAEA;
	background-color:  #ffd2d7;
	}
.line5{
	border-bottom: 1px solid  #EAEAEA;

	}
	
.btn1{
	background-color: #ffd2d7;
	border:1px solid #ffd2d7;
	font :"#8b4513";
	font-family : 나눔바른펜";

	}

/* 하이퍼링크 밑줄 지우기 */
A:link {text-decoration:none}
A:visited {text-decoration:none}
A:hover {text-decoration:none}

</style>
	

<script type="text/javascript">
	function sendIt(){
		
		var f = document.searchForm;
		
		f.action = "<%=cp%>/group/list.action";
		f.submit();
		
	}

</script>

</head>
<body>
		
<table width="1000" align="center" class="box">

	<tr height="100px">
	<td></td>
	</tr>
	<tr height="30px"> 
		<td class="line3" height="80px" colspan="5">
					&nbsp;&nbsp;&nbsp;&nbsp;<font color="#8b4513 " style="font-family: 나눔손글씨 붓;" font size="10px"><b>
					흐헤헤</b></font></td>
		</tr>
	<tr height="30px">
	</tr>
	<tr height="30px">

		<td width="50px" align="left" margin-left="20px"  colspan="4">	
			<form name="searchForm" method="post" action="">		
			<select name="searchKey"  style="height: 40px;">
				<option value="gSubject">제목</option>
				<option value="mId">작성자</option>
				<option value="gContent">내용</option>
			</select>
			<input type="text" name="searchValue" style="height: 34px;"/>
			<input type="button" style="width: 50px; height: 40px;" value=" 검 색 " class="btn2" onclick="sendIt();"/>
			</form>	

		
		</td>
		<td>
		<input type="button" value=" 글쓰기 " margin-left="500px" 
		class="btn1" style="height: 40px; color: #8b4513; font-family: 나눔바른펜";"
		onclick="javascript:location.href='/god/group/created.action';"/>

		</td>
</table>

<table width="1000" align="center" class="box">

	<tr height="10px"><td></td></tr>

	<tr height="40px" class="line4" bordercolor="#EAEAEA" align="center" style="font-size: 15px; color: #8b4513; font-family: 나눔바른펜";">
		<td width="50px"><b>이름</b></td>
		<td width="300px"><b>제목</b></td>
		<td width="150px"><b>글쓴이</b></td>
		<td width="150px"><b>작성일</b></td>
		<td width="50px"><b>조회수</b></td>
	</tr>
	<c:forEach var="dto" items="${lists}">
	<tr height="30px" align="center" style="font-size: 13px" class="line5">
		<td class="line" width="50px" class="gnum">${dto.listNum}</td>
		<td class="line" width="300px" class="gsubject">
		<a href ="${articleUrl}&gNum=${dto.gNum}">${dto.gSubject}</a></td>
		<td class="line" width="150px" class="mid">${dto.mId}</td>
		<td class="line" width="150px" class="gcreated">${dto.gCreated}</td>
		<td class="line" width="50px" class="ghitCount">${dto.gHitCount}</td>	
	</tr>
			
	</c:forEach>
	
	<tr height="50px"></tr>
	<tr>
		<td colspan="5" align="center">			
				<p>
					<c:if test="${dataCount!=0 }">
						${pageIndexList}
					</c:if>
					<c:if test="${dataCount==0 }">
						등록된게시물이 없습니다.
					</c:if>
				</p>
		</td>
	</tr>
	

</table>

<!-- 하단 시작 -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" bgcolor="444444">
    <table width="1000" border="0" cellspacing="0" cellpadding="0">
      <tr><td height="40" colspan="3"></td></tr>
      <tr>
        <td width="100" height="60" background="<%=cp%>/resources/image/로고.png"></td><!-- 로고 -->
        <td width="34" valign="top">
        <td width="856" valign="top" >
        <table width="856" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="left">
            <table width="856" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="746" height="30" valign="middle" align="left" style="padding-top:2px;">
               <a href="http://www.maque.co.kr/provision.php" onfocus='this.blur()' onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ft_bt1','','http://www.maque.co.kr/img/ft/bt1_on.png',0)">
              <img src="http://www.maque.co.kr/img/ft/bt1_off.png" name="ft_bt1" border="0" id="ft_bt1" /></a>
              <img src="http://www.maque.co.kr/img/ft/line.png" alt="" border="0">
              
              <a href="http://www.maque.co.kr/privacy.php" onfocus='this.blur()' onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ft_bt2','','http://www.maque.co.kr/img/ft/bt2_on.png',0)">
              <img src="http://www.maque.co.kr/img/ft/bt2_off.png" name="ft_bt2" border="0" id="ft_bt2" /></a>
              <img src="http://www.maque.co.kr/img/ft/line.png" alt="" border="0">
              
              <a href="http://www.maque.co.kr/bbs/write.php?bo_table=partners" onfocus='this.blur()' onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ft_bt3','','http://www.maque.co.kr/img/ft/bt3_on.png',0)">
              <img src="http://www.maque.co.kr/img/ft/bt3_off.png" name="ft_bt3" border="0" id="ft_bt3" /></a>
              <img src="http://www.maque.co.kr/img/ft/line.png" alt="" border="0">
              
              <a href="http://www.maque.co.kr/bbs/write.php?bo_table=invest" onfocus='this.blur()' onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ft_bt4','','http://www.maque.co.kr/img/ft/bt4_on.png',0)">
              <img src="http://www.maque.co.kr/img/ft/bt4_off.png" name="ft_bt4" border="0" id="ft_bt4" /></a>
              <img src="http://www.maque.co.kr/img/ft/line.png" alt="" border="0">
              
              <a href="http://www.maque.co.kr/bbs/write.php?bo_table=register" onfocus='this.blur()' onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ft_bt5','','http://www.maque.co.kr/img/ft/bt5_on.png',0)">
              <img src="http://www.maque.co.kr/img/ft/bt5_off.png" name="ft_bt5" border="0" id="ft_bt5" /></a>
              	</td>
                
              </tr>
            </table>
           </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="900" class="ft_catch_text">
        <font color="#ffffff"><b>(주)종우갓코리아</b></font>&nbsp;&nbsp;대표이사 : 종우갓&nbsp;&nbsp;&nbsp;사업자등록번호 : 220-88-77149&nbsp;&nbsp;&nbsp;개인정보담당자 : 임종우<br />
        서울특별시 강남&nbsp;&nbsp;<font color="#ffffff"><b>전화 : 02-123-1234</b></font> (이용시간 : 월~금 09:00~18:00)&nbsp;&nbsp;팩스 : 02-111-2222&nbsp;&nbsp;이메일 : jw@god.com            </td>
          </tr>
        </table>        </td>
      </tr>
      <tr>
        <td height="57"></td>
        <td valign="top">      
        <td valign="top" class="ft_catch_text" style="padding-bottom:30px; padding-top:20px;">Copyright ⓒ God Korea. All Rights Reserved.</td>
      </tr>
</table>

</body>
</html>