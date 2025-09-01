<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"     %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<link rel="icon" type="image/svg+xml" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 width=%22256%22 height=%22256%22 viewBox=%220 0 100 100%22><text x=%2250%%22 y=%2250%%22 dominant-baseline=%22central%22 text-anchor=%22middle%22 font-size=%2290%22>🌠</text></svg>" />
<link rel="stylesheet"  href="/css/updatee.css" />

<c:if test="${not empty msg}">
<script>
    alert('${msg}');
</script>
</c:if>

<!-- SCSS 문법가능하게하는 라이브러리 
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
 -->
</head>
<body>
  <a href="/Libb/Home"><img src="/img/LightModeLogo.png" alt="여우별" class="logo"></a>
<main class="update-container">
  <h2>마이페이지</h2>
  <form action="/Libb/Update" method="POST" class="update-form">
    <div class="form-group">
      <label for="yu_userid">아이디</label>
      <input name="yu_userid" type="text" value="${userInfo.yu_userid}" readonly>
    </div>
    <div class="form-group">
      <label for="yu_passwd">현재 비밀번호</label>
      <input name="yu_passwd" type="password" value="${userInfo.yu_passwd}" readonly>
      <input type="button" id="changePw" value="변경">
    </div>
    <div class="form-group">
      <label for="yu_username">이름</label>
      <input name="yu_username" type="text" value="${userInfo.yu_username}" readonly>
    </div>
    <div class="form-group">
      <label for="yu_birth">생년월일</label>
      <input name="yu_birth" type="text" value="${userInfo.yu_birth}" readonly>
    </div>
    <div class="form-group">
      <label for="yu_email">이메일</label>
      <input name="yu_email" type="text" value="${userInfo.yu_email}">
    </div>
    <div class="form-group">
      <label for="yu_phone">전화번호</label>
      <input name="yu_phone" type="text" value="${userInfo.yu_phone}">
    </div>
    <div class="form-group">
      <label for="yu_indate">가입일</label>
      <input name="yu_indate" type="text" value="${userInfo.yu_indate}" readonly>
    </div>
    <div class="button-group">
      <a href="/Libb/Home" class="cancel-btn">취소</a>
  	  <button type="submit" class="update-btn" >수정</button>
  	  <a href="/Libb/Delete?yu_userid=${userInfo.yu_userid}" class="del-btn"
  	  	 onclick="return confirm('정말 탈퇴하시겠습니까?')">탈퇴</a>
	</div>
  </form>
</main>

 <script>
 
 	document.getElementById("changePw").onclick = function() {
	location.href = "/Libb/ChangePwForm?yu_userid=${userInfo.yu_userid}";
	}

    const  formEl = document.querySelectorAll("form")[0];
    
    formEl.addEventListener('submit', function(e) {
    	
    	const  inputEl8 = document.querySelector('[name="yu_email"]')
    	if( inputEl8.value.trim() == '' ) {
    		alert('이메일을 입력해 주세요.')
    		e.stopPropagation();
    		e.preventDefault();
    		inputEl8.focus();
    		return false
    	}
    	
    	const  inputEl9 = document.querySelector('[name="yu_phone"]')
    	if( inputEl9.value.trim() == '' ) {
    		alert('전화번호를 입력해 주세요.')
    		e.stopPropagation();
    		e.preventDefault();
    		inputEl9.focus();
    		return false
    	} 
    })  
  </script>
</body>
</html>