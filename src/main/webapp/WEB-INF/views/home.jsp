<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈화면</title>

<link rel="icon" type="image/svg+xml" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 width=%22256%22 height=%22256%22 viewBox=%220 0 100 100%22><text x=%2250%%22 y=%2250%%22 dominant-baseline=%22central%22 text-anchor=%22middle%22 font-size=%2290%22>🌠</text></svg>" />
<link rel="stylesheet"  href="/css/common.css" /> 

<c:if test="${not empty msg}">
<script>
    alert('${msg}');
</script>
</c:if>

</head>
<body>
  <main>
   <h2>Home</h2>
   <div>
   	${ sessionScope.login.yu_username } 님 환영합니다<br>
   	<a href="/Libb/LoginForm">로그인</a>
   	<a href="/Libb/Logout">로그아웃</a>
   	<a href="/Libb/WriteForm">회원가입</a>
   	<hr>
   	<a href="/Libb/List">내 정보</a>
   </div>
  </main>
   
</body>
</html>







