<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/login_sample.css"/>
<title>LogIn</title>
</head>
<body>
	<div id="container">
		<div id="login" >
			<h2>Login</h2>
	        <form id="login-form" action="/login" method="post" >
	            <input type="text" name="yu_userid" placeholder="아이디">
	            <input type="password" name="yu_passwd" placeholder="비밀번호">
	            <input type="submit" value="Login"><br/>
	            <a href="">회원가입</a>
	        </form>
		</div>
	</div>
	
	
		<!--로그인하지않았을경우 -->
					<script>
					    let loginError = "${loginError}";
						    if (loginError) {
						        alert(loginError);
						    }
					</script>
					
					
</body>
</html>