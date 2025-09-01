<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="icon" type="image/svg+xml" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 width=%22256%22 height=%22256%22 viewBox=%220 0 100 100%22><text x=%2250%%22 y=%2250%%22 dominant-baseline=%22central%22 text-anchor=%22middle%22 font-size=%2290%22>🌠</text></svg>" />
<link rel="stylesheet"  href="/css/register.css" />

<c:if test="${not empty msg}">
<script>
    alert('${msg}');
</script>
</c:if>

</head>
<body>
	<main>
	  <a href="/Libb/Home"><img src="/img/LightModeLogo.png" alt="여우별" class="logo"></a>
	  <form action="/Libb/Login" method="POST" class="joinForm">
	  <div class="textForm">
        <input name="yu_userid" type="text" class="id" placeholder="아이디" maxlength="12" />
      </div>
      <div class="textForm">
        <input name="yu_passwd" type="password" class="pw" placeholder="비밀번호" />
      </div>
       <input type="submit" class="btn" value="로그인"/>
	  </form>
	</main>
	
<script>

	const  formEl = document.querySelectorAll("form")[0];

	//아이디
	formEl.addEventListener('submit', function(e) { 
	const  inputEl1 = document.querySelector('[name="yu_userid"]')
	if( inputEl1.value.trim() == '' ) {
		alert('아이디를 입력해 주세요.')
		e.stopPropagation();  
		e.preventDefault();   
		inputEl1.focus();
	return false
	}

	//비밀번호
	const  inputEl2 = document.querySelector('[name="yu_passwd"]')
	if( inputEl2.value.trim() == '' ) {
		alert('비밀번호를 입력해 주세요.')
		e.stopPropagation();
		e.preventDefault();
		inputEl2.focus();
	return false
	}
});
</script>

</body>
</html>