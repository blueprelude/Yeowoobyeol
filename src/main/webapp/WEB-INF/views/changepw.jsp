<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"     %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>

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
  <a href="/"><img src="/img/LightModeLogo.png" alt="여우별" class="logo"></a>
<main class="update-container">
  <h2>비밀번호 변경</h2>
  <form action="/ChangePw" method="POST" class="change-form">
    <div class="form-group">
      <label for="pw1">현재 비밀번호</label>
      <input name="pw1" type="password" id="pw1">
    </div>
    <div class="form-group">
      <label for="yu_passwd">새 비밀번호</label>
      <input name="yu_passwd" type="password" id="pw2">
    </div>
    <div class="form-group">
      <label for="pwd3">새 비밀번호 확인</label>
      <input type="password" id="pw3">
    </div>
    <div class="button-group">
      <a href="/Userlist" class="cancel-btn">취소</a>
  	  <button type="submit" class="update-btn" >수정</button>
	</div>
  </form>
</main>

 <script>

    const  formEl = document.querySelectorAll("form")[0];
    
    formEl.addEventListener('submit', function(e) {
    	const  inputEl1 = document.querySelector('#pw1')
    	if( inputEl1.value.trim() == '' ) {
    		alert('현재 비밀번호를 입력해 주세요.')
    		e.stopPropagation();
    		e.preventDefault();
    		inputEl1.focus();
    		return false
    	}
    	
    	const  inputEl2 = document.querySelector('#pw2')
    	if( inputEl2.value.trim() == '' ) {
    		alert('새 비밀번호를 입력해 주세요.')
    		e.stopPropagation();
    		e.preventDefault();
    		inputEl2.focus();
    		return false
    	}
    	
    	const  inputEl3 = document.querySelector('#pw3')
    	if( inputEl3.value.trim() == '' ) {
    		alert('새 비밀번호 확인을 입력해 주세요.')
    		e.stopPropagation();
    		e.preventDefault();
    		inputEl3.focus();
    		return false
    	}
    	
    	if( inputEl2.value != inputEl3.value ) {
    		alert('비밀번호가 일치하지 않습니다.')
    		e.stopPropagation();
    		e.preventDefault();
    		inputEl3.focus();
    		return false
    	}
    })  
  </script>
</body>
</html>