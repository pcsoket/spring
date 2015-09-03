<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- ck에디터 -->
<script src="<%=cp%>/resources/ckeditor/ckeditor.js"></script>

<!-- 멀티파일업로드 ajax를 이용한 gui에 필요한 js import -->

<!-- jQuery import -->
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- jQuery Form Plugin import -->
<script src="<%=cp%>/resources/js/jquery.form.min.js"></script>
<!-- jQuery MultiFile Plugin import -->
<script src="<%=cp%>/resources/js/jQuery.MultiFile.min.js"></script>

<script type="text/javascript">
	function sendIt(){
	
	f = document.myForm;

	f.action = "<%=cp%>/group/created_ok.action";
	f.submit();
	
}
	
	// 파일업로드 gui ajax
	$(document).ready(function(){
		
		//use jQuery MultiFile Plugin 
		$('#myForm input[name=upload]').MultiFile({
			max: 4, //업로드 최대 파일 갯수 (지정하지 않으면 무한대)
			accept: 'jpg|png|gif', //허용할 확장자(지정하지 않으면 모든 확장자 허용)
			maxfile: 1024, //각 파일 최대 업로드 크기
			maxsize: 3024,  //전체 파일 최대 업로드 크기
			STRING: { //Multi-lingual support : 메시지 수정 가능
			    remove : "제거", //추가한 파일 제거 문구, 이미태그를 사용하면 이미지사용가능
			    duplicate : "$file 은 이미 선택된 파일입니다.", 
			    denied : "$ext 는(은) 업로드 할수 없는 파일확장자입니다.",
			     selected:'$file 을 선택했습니다.', 
			    toomuch: "업로드할 수 있는 최대크기를 초과하였습니다.($size)", 
			    toomany: "업로드할 수 있는 최대 갯수는 $max개 입니다.",
			    toobig: "$file 은 크기가 매우 큽니다. (max $size)"
			},
			list:"#file-list" //파일목록을 출력할 요소 지정가능
		});
	});
	
	$(function(){
		//폼전송 : 해당폼의 submit 이벤트가 발생했을경우 실행  
	    $('#myForm').ajaxForm({
	       cache: false,
	       dataType:"json",
	       //ajax error
	       error: function(e){
	           alert("에러발생!!");
	           console.log(e);
	       }
		});
	});
	
</script>

<style type="text/css">

.box{
	border-collapse: collapse;
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
	background-color: #EAEAEA;
	border:1px solid #EAEAEA;
	font :"#8b4513";
	font-family : 나눔바른펜";	
	color: #8C8C8C;	
	}

</style>

</head>
<body>
<form name="myForm" id="myForm" method="post" action="" enctype="multipart/form-data" style="margin-bottom: 69px;">
<table width="1000" align="center" class="box">
	<tr height="100px"></tr>
	
	<tr height="40px"> 
		<td class="line3" colspan="2"><font color="#8b4513 " style="font-family:나눔바른펜; size :10pt;"><b>글 쓰기</b></font></td>
	</tr>
	<tr height="20px"></tr>
	
	<tr height="30px">
		<td colspan="2"><input type="text" style="height:25px; width: 679px;"
		name="gSubject" size="107" maxlength="100" 
		class="border1"/></td>
	</tr>
	<tr>
		<td><input type="hidden" name="boardName" value="${boardName }">
		<input type="file"  name="upload" size="58" maxlength="100" class="boxTF" onchange=""/>
        <div id="file-list" style="border:2px solid #c9c9c9;min-height:50px; width: 682px;"></div> 
		</td>
	</tr>
	<tr height="10px"></tr>
	<tr>
		<td colspan="2"><!-- <textarea name="gContent" cols="125" rows="12"></textarea> -->
		<textarea name="gContent" cols="20" rows="20"></textarea>
        <script>CKEDITOR.replace('gContent' ,	
        		 {width : '680px', // 입력창의 넓이
        	      height : '200px',  // 입력창의 높이
        	      startupFocus : false});</script>
        </td>
	</tr>

	<tr height="20px">
	</tr>	
	<tr>
		<td>
		<input type="button" style="width:50px; height:50px;" value="목록" class="btn1"
        onclick="javascript:location.href='<%=cp%>/group/list.action';"/>
        <input type="button" style="width:50px; height:50px;" value=" 등록" class="btn1"
        onclick="sendIt();"/>               
		<input type="reset" style="width:70px; height:50px;" value="다시입력 " class="btn1" 
		onclick="document.myForm.gSubject.focus();"/>
        </td>
       
    
    </tr>
    </table>

<!-- <script>
	$(function(){
		//폼전송 : 해당폼의 submit 이벤트가 발생했을경우 실행  
	    $('#myForm').ajaxForm({
	       cache: false,
	       dataType:"json",
	       //ajax error
	       error: function(e){
	           alert("에러발생!!");
	           console.log(e);
	       }
		});
	});
</script> -->
</form>
</body>
</html>