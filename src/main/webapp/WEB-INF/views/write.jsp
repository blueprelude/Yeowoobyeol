<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="icon" type="image/svg+xml" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 width=%22256%22 height=%22256%22 viewBox=%220 0 100 100%22><text x=%2250%%22 y=%2250%%22 dominant-baseline=%22central%22 text-anchor=%22middle%22 font-size=%2290%22>🌠</text></svg>" />
<link rel="stylesheet"  href="/css/register.css" />

</head>
<body>
  <main>
   <a href="/"><img src="/img/LightModeLogo.png" alt="여우별" class="logo"></a>
	<form action="/Write" method="POST" class="joinForm" >                                                                                         
      <div class="textForm">
        <input name="yu_userid" type="text" class="id" placeholder="아이디(5~12자)" maxlength="12">
        <input type="button" id="checkId" value="중복확인" >
      </div>
      <div class="textForm">
        <input name="yu_passwd" type="password" class="pw" placeholder="비밀번호">
      </div>
       <div class="textForm">
        <input name="yu_passwd2" type="password" class="pw" placeholder="비밀번호 확인">
      </div>
      <div class="textForm">
        <input name="yu_username" type="text" class="name" placeholder="이름">
      </div>
       <div class="textForm">
        <input name="yu_birth" type="text" class="bday" placeholder="생년월일(8자리)" maxlength="8">
      </div>
      <div class="textForm">
        <input name="yu_email" type="text" class="email" placeholder="이메일">
      </div>
      <div class="textForm">
        <input name="yu_phone" type="text" class="phone" placeholder="전화번호(하이픈(-) 제외 11자리)" maxlength="11">
      </div>
      <input type="submit" class="btn" value="회원가입"/>
    </form>
  </main>	
    
  <script>
  let isChecked = false;
  
  document.querySelector("input[name='yu_userid']").addEventListener("input", () => {
	  isChecked = false;
  })
  
  document.querySelector('#checkId').addEventListener('click', function() {
	    const userId = document.querySelector('[name="yu_userid"]').value.trim();
	    if (userId === '') {
	        alert('아이디를 입력해 주세요.');
	        e.stopPropagation(); 
    		e.preventDefault();   
    		userId.focus();
    		return false
	    }
	    
	    if(userId.length < 5
       		 || userId.length > 12 ) {
    		alert('아이디는 5~12자 사이로 입력해 주세요.')
    		e.stopPropagation(); 
    		e.preventDefault();   
    		userId.focus();
    		return false
	    }

	   fetch("/CheckId?yu_userid=" + encodeURIComponent(userId))
	        .then(res => res.text())
	        .then(data => {
	            if (data === 'NO') {
	                alert('이미 존재하는 아이디입니다.');
	                isChecked = false;
	            } else if (data === 'OK') {
	                alert('사용할 수 있는 아이디입니다.');
	                isChecked = true;
	            } else {
	                alert('알 수 없는 응답입니다.');
	                isChecked = false;
	            }
	        })
	});
  
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
    	
    	//아이디2
 		const  inputEl2 = document.querySelector('[name="yu_userid"]')
    	if( inputEl2.value.trim().length < 5
       		 || inputEl2.value.trim().length > 12 ) {
    		alert('아이디는 5~12자 사이로 입력해 주세요.')
    		e.stopPropagation(); 
    		e.preventDefault();   
    		inputEl2.focus();
    		return false
    	}
    	
 		
    	// 암호
    	const  inputEl3 = document.querySelector('[name="yu_passwd"]')
    	if( inputEl3.value.trim() == '' ) {
    		alert('비밀번호를 입력해 주세요.')
    		e.stopPropagation();
    		e.preventDefault();
    		inputEl3.focus();
    		return false
    	}
    	
    	// 암호확인
    	const  inputEl4 = document.querySelector('[name="yu_passwd2"]')
    	if( inputEl4.value.trim() == '' ) {
    		alert('비밀번호 확인을 입력해 주세요.')
    		e.stopPropagation();
    		e.preventDefault();
    		inputEl4.focus();
    		return false
    	}
    	
    	// 암호 == 암호확인
    	if( inputEl3.value != inputEl4.value ) {
    		alert('비밀번호가 일치하지 않습니다.')
    		e.stopPropagation();
    		e.preventDefault();
    		inputEl4.focus();
    		return false
    	}
		
    	// 이름
    	const  inputEl5 = document.querySelector('[name="yu_username"]')
    	if( inputEl5.value.trim() == '' ) {
    		alert('이름을 입력해 주세요.')
    		e.stopPropagation();
    		e.preventDefault();
    		inputEl5.focus();
    		return false
    	} 
    	
    	// 생년월일
    	const  inputEl6 = document.querySelector('[name="yu_birth"]')
    	if( inputEl6.value.trim() == '' ) {
    		alert('생년월일을 입력해 주세요.')
    		e.stopPropagation();
    		e.preventDefault();
    		inputEl6.focus();
    		return false
    	}
    	
    	if( inputEl6.value.trim().length < 8 ) {
    		alert('생년월일의 형식이 올바르지 않습니다.')
    		e.stopPropagation();
    		e.preventDefault();
    		inputEl6.focus();
    		return false
    	}
    	
    	const  inputEl7 = document.querySelector('[name="yu_email"]')
    	if( inputEl7.value.trim() == '' ) {
    		alert('이메일을 입력해 주세요.')
    		e.stopPropagation();
    		e.preventDefault();
    		inputEl7.focus();
    		return false
    	}
    	
    	const  inputEl8 = document.querySelector('[name="yu_phone"]')
    	if( inputEl8.value.trim() == '' ) {
    		alert('전화번호를 입력해 주세요.')
    		e.stopPropagation();
    		e.preventDefault();
    		inputEl8.focus();
    		return false
    	}
    	
    	 if (!isChecked) {
             alert("아이디 중복확인을 해 주세요.");
             e.preventDefault();
             document.querySelector('[name="yu_userid"]');
             return false;
         }
    })
    
  </script>
  
</body>
</html>



