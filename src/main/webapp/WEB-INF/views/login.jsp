<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function sendIt() {
	
	f = document.login;
	
	str=f.userId.value;
	str=str.trim();
	if(!str){
		alert("\n아이디를 입력하세요.");
		f.userId.focus();
		return;
	}
	
	
	f.userId.value=str;
	str=f.userPwd.value;
	str=str.trim();
	if(!str){
		alert("\n아이디를 입력하세요.");
		f.userPwd.focus();
		return;
	}
	f.userPwd.value=str;

	f.action = "<%=cp%>/login_ok.action";
	
	f.submit();
}

function findId() {
	
	var popOption = "width=400, height=200,resizable=no,scrollbars=no, status=no, top=300,left=700;";
	window.open("<%=cp %>/findId.action","popup",popOption);
	
}
</script>
<title>로 그 인</title>

<link rel="stylesheet" href="<%=cp%>/resources/css/login.css" type="text/css"/>

</head>
<body>

<div id="memberLogin" style="width: 100%; margin: 0 auto;">
    
    <div id="pop_header" >
        <h1 style="font-family: 나눔손글씨 붓; ">로그인</h1>
    </div>
    <div style="width: 100%; border-bottom: solid 3px; border-color: #ffd2d7;">
    </div>
   
    <div id="pop_container">
       
        <div id="pop_content" class="content_primary login member" style="margin: 0 auto; width: 500px;">
            <div class="section">
                <h2 class="blind">로그인</h2>
               
                <form name="login" method="post">            
               
                <fieldset class="fieldset">
                    <legend>로그인 정보입력</legend>
               
                    <div class="field">
                        <label for="user_id" class="label" style="font-family: 나눔바른펜; font-size: 15px; color: #8b4513;">아이디</label>
                        <div class="insert">
                            <input type="text" name="userId" id="user_id" class="input_text medium input_id" style="width:290px;" />
                        </div>
                    </div>
                    <div class="field">
                        <label for="password_insert" class="label" style="font-family: 나눔바른펜; font-size: 15px; color: #8b4513;">비밀번호</label>
                        <div class="insert">
                            <input type="password" name="userPwd" id="password_insert" class="input_text medium input_pw" style="width:290px;" />
                        </div>
                    </div>
                   
                    <div class="bn_ar">
                        <button type="submit" class="bn btn_login color3" style="margin: 0 auto; cursor:pointer; outline: none;" onclick="sendIt();">로그인</button>
                    </div>
                   <div>
                   	<c:if test="${!empty message}">
                   	<font color="red">${message }</font>
                   	</c:if>
                   </div>
                   <div class="login_support_pannel">
                        <label for="keep_id" class="keep_id"><input type="checkbox" id="keep_id" name="keep_id" title="아이디 저장" class="checkbox" /> 아이디 저장</label>
                        <a onclick="findId();" class="find_profile">아이디/비밀번호 찾기</a>
                    </div>
                   <input type="text" name="pagePath" value="${pagePath}">
                </fieldset>
             
                </form>
                
              <div class="content_support" style="width: 100%; overflow: hidden; padding-left: 35px;"  >
                  
                  	<div style="width: 60%; float: left;">
	                    <div><strong style="font-family: 나눔바른펜; font-size: 20px;">아직 회원이 아니신가요?</strong></div>
	                    <div style="font-family: 나눔바른펜; font-size: 15px; ">회원으로 가입하시면 편리하게 이용 하실 수 있습니다.</div>
                   	</div>
                    <div class="bn_ar" style="width: 30%;" >
                    	<div>
                        	<a class="bn xsmall color1 join" href="<%=cp%>/write.action">
                        	<span style="color: #8b4513;">회원가입</span></a>                        
                    	</div>                    
                    </div>         
                </div>
            </div>        
       </div>
    </div>       
</div>      

</body>
</html>