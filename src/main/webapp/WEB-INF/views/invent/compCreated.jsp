<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이미지 업로드</title>
<script src="<%=cp%>/resources/ckeditor/ckeditor.js"></script>

<!-- 멀티파일업로드 ajax를 이용한 gui에 필요한 js import -->

<!-- jQuery import -->
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- jQuery Form Plugin import -->
<script src="<%=cp%>/resources/js/jquery.form.min.js"></script>
<!-- jQuery MultiFile Plugin import -->
<script src="<%=cp%>/resources/js/jQuery.MultiFile.min.js"></script>

<script type="text/javascript">

	String.prototype.trim = function() {
		var TRIM_PATTERN = /(^\s*)|(\s*$)/g;
		return this.replace(TRIM_PATTERN, "");

	}
	var value1;
	
	function sendIt() {
		f = document.myForm;
		
		str = f.cSubject.value;
		str = str.trim();
		if (!str) {
			alert("제목을 입력하세요 !!!");
			f.pName.focus();
			return;
		}
		f.cSubject.value = str;
		
		f.action = "<%=cp%>/compl/created_ok.action";
		f.submit();
		
	}
	
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
	
	
	function AddSelect(value){                                  /* 하위카테고리 옵션추가 */
		
		clearOption();
		
		//alert(value);
		
		value1 = value;
		cCategory2.options.add(new Option("선택", "") );
		if(value=="life"){
		cCategory2.options.add(new Option("욕실", "bath") );
		cCategory2.options.add(new Option("공구", "util") );
		cCategory2.options.add(new Option("청소", "cleaning"));
		cCategory2.options.add(new Option("주방", "cleaning") );
		cCategory2.options.add(new Option("문구/사무", "cleaning") );
		
		}
		
		if(value=="sports"){
			cCategory2.options.add(new Option("캠핑", "camping") );
			cCategory2.options.add(new Option("등산", "climbing") );
			cCategory2.options.add(new Option("헬스", "health") );

			
			}
		
		
		if(value=="interior"){
			pCategory2.options.add(new Option("인테리어소품", "sopoom") );
			pCategory2.options.add(new Option("수납가구", "furniture") );
			pCategory2.options.add(new Option("DIY자재", "DIY") );
			
			}
		
		if(value=="digital"){
			cCategory2.options.add(new Option("PC악세서리", "PC") );
			cCategory2.options.add(new Option("음향가전", "sound") );
			cCategory2.options.add(new Option("휴대폰악세서리", "phone") );
			
			}
		
		if(value=="sundries"){
			cCategory2.options.add(new Option("남성가방", "man") );
			cCategory2.options.add(new Option("여성가방", "woman") );
			cCategory2.options.add(new Option("선글라스/안경테", "sunglasses") );

			
			}
		
	}

	
	
	function clearOption() {              /* 옵션초기화 */
	 
	        for( var i=cCategory2.options.length-1; i>=0; i--){
	 
	        	cCategory2.options[i]=null;
	        }
	}

	
	function toCategory(value2){      /* 카테고리1,2합침 */
		
		document.myForm.cCategory.value = value1+value2;
		
	}


	
	function clearOption() {              /* 옵션초기화 */
	 
	        for( var i=cCategory2.options.length-1; i>=0; i--){
	 
	        	cCategory2.options[i]=null;
	        }
	}
	
	
	function toCategory(value2){
		
		document.myForm.cCategory.value = value1+value2;
		
	}


	
</script>
</head>

<body onload="document.myForm.userId.focus();">

<br/>&nbsp;<br/>

<table width="650" border="2" cellspacing="0" cellpadding="0" bordercolor="#DBDBDB" align="center">
<tr height="40"> 
<td style="padding-left:25px;">
<b>아이디어상품 등록</b>

</td>
</tr>
</table>
<br/>&nbsp;<br/>

<form name="myForm" id="myForm" method="post" action="" enctype="multipart/form-data">
  <table width="650" border="0" cellspacing="0" cellpadding="3" align="center">

  <tr><td colspan="2" height="3" bgcolor="#DBDBDB" align="center"></td></tr>

  <tr> 
      <td width="100" height="40" bgcolor="#EEEEEE" style="padding-left:20px;">상품이름&nbsp;</td>
      <td width="500" style="padding-left:10px;"> 
        <input type="text" name="cSubject" size="74" maxlength="100" class="boxTF"/>
      </td>
  </tr>
  
  <tr> 
      <td width="80" height="30" bgcolor="#EEEEEE" style="padding-left:20px;">카테고리&nbsp;</td>
      <td width="480" style="padding-left:10px;">
      
      	<select name="cCategory1" class="boxTF" id="cCategory1" onchange="AddSelect(this.value);">

      		<option value="null">선택</option>

      		<option value="life">생활/건강</option>
      		<option value="sports">스포츠/레저</option>
      		<option value="interior">가구/인테리어</option>
      		<option value="digital">디지털/가전</option>
      		<option value="sundries">패션잡화</option>
      	</select>
      	
      	<select name="cCategory2" class="boxTF" id="cCategory2" onchange="toCategory(this.value);">
      		<option value="">선택</option>


      	</select>
      	<input type="text" name="cCategory" id="cCategory" >

      </td>
  </tr>
  
  <tr> 
      <td width="80" height="30" bgcolor="#EEEEEE" style="padding-left:20px;">&nbsp;가&nbsp;&nbsp;&nbsp;&nbsp;격</td>
      <td width="480" style="padding-left:10px;"> 
        <input type="text" name="cPrice" size="74" maxlength="100" class="boxTF"/>
      </td>
  </tr>
  
<!--   <tr> 
      <td width="80" height="30" bgcolor="#EEEEEE" style="padding-left:20px;">&nbsp;재&nbsp;&nbsp;&nbsp;&nbsp;고</td>
      <td width="480" style="padding-left:10px;"> 
        <input type="text" name="pStock" size="74" maxlength="100" class="boxTF"/>
      </td>
  </tr> -->

  <tr><td colspan="2" bgcolor="#DBDBDB" height="1"></td></tr>

  <tr> 
      <td width="80" height="50" bgcolor="#EEEEEE" style="padding-left:20px;">&nbsp;파&nbsp;&nbsp;&nbsp;&nbsp;일</td>
      <td width="480" style="padding-left:10px;"> 
      <!--  file upload input-->
      
        <input type="file"  name="upload" size="58" maxlength="100" class="boxTF" onchange=""/>
        <div id="file-list" style="border:2px solid #c9c9c9;min-height:50px"></div> 

      </td>
      
  </tr>

  <tr><td colspan="2" height="3" bgcolor="#DBDBDB" align="center"></td></tr>

  </table>
<br/>
  <table width="560" border="0" cellspacing="0" cellpadding="3" align="center">
    <tr align="center"  height="30"> 
      <td>
        <textarea name="cContent" cols="20" rows="20"></textarea>
        <script>CKEDITOR.replace('cContent' ,
        		
        		 {width : '650px', // 입력창의 넓이
        	      height : '200px',  // 입력창의 높이
        	      startupFocus : false});</script>
        <img alt="" src="${img}"><br/>
      	
        <input type="button" value=" 등록하기 " onclick="sendIt();" class="btn1"/>
        <input type="reset"  value=" 다시입력 " onclick="document.myForm.subject.focus();" class="btn1"/>
        <input type="button" value=" 작성취소 " onclick="javascript:location.href='<%=cp%>/img/list.action';" class="btn1"/>
      </td>
    </tr>
    <tr height="50px"><td></td></tr>
  </table>
</form>
<!-- //------------------------- // -->
<script>

/*jQuery form 플러그인을 사용하여 폼데이터를 ajax로 전송*/

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

</body>
</html>