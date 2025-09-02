<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/index.css" />
<link rel="stylesheet" href="css/common.css" />
<!-- ICON css  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.0/css/all.min.css"
    integrity="sha512-DxV+EoADOkOygM4IR9yXP8Sb2qwgidEmeqAEmDKIOfPRQZOWbXCzLC6vjbZyy0vPisbH2SyW27+ddLVCN+OMzQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.0/css/all.min.css">
<link rel="icon" type="image/svg+xml" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 width=%22256%22 height=%22256%22 viewBox=%220 0 100 100%22><text x=%2250%%22 y=%2250%%22 dominant-baseline=%22central%22 text-anchor=%22middle%22 font-size=%2290%22>🌠</text></svg>" />
<title>여우별 도서관</title>
</head>

<body>
	<div class="main">
		<!--헤더 -->
        <div class="header-binder">
          <div class="header">
            	<a href="/" class="logo">
            
            <img src="./img/LightModeLogo.png" id="logoimg" height="40" alt="Logo" />
            <img src="./img/SmallLogolight.png" id="logoimgsmall" height="40" alt="Logo" />
            </a>
            
        <!-- ===========햄버거 버튼 등장시 나오는 메뉴들=================  -->    
         <div>    
			<div id="burger-menu">
				<span></span> <span></span> <span></span> <span></span>
			</div>
			
			<div class="menu-subbind">
				<div id="nav-menu">
		           		<c:if test="${sessionScope.login_id == null}">
							<a href="/LoginForm">로그인</a>
							<a href="/join">회원가입</a>
						</c:if>
						<c:if test="${sessionScope.login_id ne null and sessionScope.login_id ne 'admin'}">
							<a class = "nohover">${sessionScope.login_id}님 반갑습니다!</a>
							<a href="/RentalList">내 정보</a>
							<a href="/logout"  onclick="return confirm('로그아웃 하시겠습니까?');">로그아웃</a>
						</c:if>
		                <c:if test="${sessionScope.login_id ne null and sessionScope.login_id eq 'admin'}">
							<a class = "nohover">${sessionScope.login_id} [관리자]</a>
							<a href="/RentalList">관리자 메뉴</a>
							<a href="/logout"  onclick="return confirm('로그아웃 하시겠습니까?');">로그아웃</a>
						</c:if>
			       <div class="mode">
				          <a href="#" >
				            <div class="switch-icon" id="sun">
					              <svg xmlns="http://www.w3.org/2000/svg" height="30px" viewBox="0 -960 960 960" width="30px"
					                fill="currentColor">
					                <path
					                  d="M480-280q-83 0-141.5-58.5T280-480q0-83 58.5-141.5T480-680q83 0 141.5 58.5T680-480q0 83-58.5 141.5T480-280ZM217-433H23v-94h194v94Zm720 0H743v-94h194v94ZM433-743v-194h94v194h-94Zm0 720v-194h94v194h-94ZM261-633 138-754l66-69 122 122-65 68Zm496 495L633-261l66-66 123 120-65 69ZM633-699l121-123 69 65-121 124-69-66ZM138-204l122-124 67 67-120 123-69-66Z" />
					              </svg>
				            </div>
				            <div class="switch-icon" id="moon">
				              	<svg xmlns="http://www.w3.org/2000/svg" height="30px" viewBox="0 -960 960 960" width="30px"
					                fill="currentColor">
					                <path
					                  d="M615-656 490-781l125-125 125 125-125 125Zm200 131-90-91 90-90 91 90-91 91ZM474-55q-87 0-163-32.5T178-177q-57-57-90-133.5T55-474q0-155 100.5-271.5T408-890q-12 101 14.5 198.5T522-522q71 71 168.5 97.5T889-404q-26 151-143 250T474-55Z" />
					              </svg>
				            </div>
				          </a>
				   </div>
		       </div>
			<!-- --------  -->
	</div>
	       	 </div>
	 <!--====================================================================================================================-->      	 
		</div>
	</div>
	
		<!--메인글,검색창 -->
        <div class="main-container">
            <h1 id="mainread">잠시 쉬어가는 지식의 요람</h1>
            <h3 id="mainread2">안녕하세요 여우별 도서관 입니다.</h3>
            <div class="search-container">
				<form class="search-box" action="/BookList" method="get" onsubmit = "return eq()">
					<input type="hidden" name="searchType" value="bookName">
					<input class="search-txt" type="text" name="keyword" placeholder="도서명을 입력해주세요.">
					<button class="search-btn" type="submit">
						<i class="fa-solid fa-magnifying-glass fa-xl"></i>
					</button>
				</form>
				<div class="vertical-slider">
                    <div class="slider-content">
                        <div class="menu-item"><a href="/BookList?keyword=행복한 가족을 만드는 가족생활백서"><i class="fa-solid fa-book"></i>추천도서&lt;행복한 가족을 만드는 가족생활백서&gt; 방규원</a></div>
                        <div class="menu-item"><a href="/BookList?keyword=훌쩍 커버린 15세, 이제 부모가 말을 걸 차례다"><i class="fa-solid fa-book"></i>추천도서&lt;훌쩍 커버린 15세, 이제 부모가 말을 걸 차례다&gt; 손석한</a></div>
                        <div class="menu-item"><a href="/BookList?keyword=지리산 둘레길, 사람과 풍경이 만나는 곳"><i class="fa-solid fa-book"></i>추천도서&lt;지리산 둘레길, 사람과 풍경이 만나는 곳&gt; 이송이</a></div>
                        <div class="menu-item"><a href="/BookList?keyword=항산화제, 내 몸을 살린다"><i class="fa-solid fa-book"></i>추천도서&lt;항산화제, 내 몸을 살린다&gt; 정윤상</a></div>
					  </div>
                </div>
            </div>
    </div>	
    <!--푸터 -->
	<footer>
		<div id="footer" class="footer">
			<span>부산광역시 못골번영로56번길 8</span><br> <span>Copyright © 2025
				FoxStar Library. All rights reserved.</span><br>
		</div>
	</footer>
	</div>

	<!--햄버거메뉴스크립트 -->
	<script>
   		document.addEventListener('DOMContentLoaded', function() {
        const burgerMenu = document.getElementById('burger-menu');
        const navMenu = document.getElementById('nav-menu');
        burgerMenu.addEventListener('click', function() {
            navMenu.classList.toggle('active');
        });
    });
</script>



	<!--다크모드 -->
<script>
    const body = document.querySelector("body");
    const logoDOM = document.getElementById('logoimg');
    const logoDOMmobi = document.getElementById('logoimgsmall');
    const darkModeIcon = document.getElementById('moon');
    const lightModeIcon = document.getElementById('sun');

    // (페이지 로드)이전 상태가 라이트모드면 라이트모드로 설정
    // (페이지 로드)이전 상태가 다크모드면 다크모드로 설정
    // 사이드바 접혔을 때 작아지는 로고도 함께 전환
    let getMode = localStorage.getItem("mode");
    if (getMode && getMode === "dark") {
        body.classList.toggle("dark");
        logoDOM.src = "./img/DarkModeLogo.png";
        logoDOMmobi.src = "./img/SmallLogoDark.png";
        darkModeIcon.classList.add("hidden");
        lightModeIcon.classList.remove("hidden");
    } else {
        logoDOM.src = "./img/LightModeLogo.png";
        logoDOMmobi.src = "./img/SmallLogolight.png";
        darkModeIcon.classList.remove("hidden");
        lightModeIcon.classList.add("hidden");
    }

    // 라이트모드일 때 다크모드로 변환(글과 아이콘)
    // 다크모드일 때 라이트모드로 변환(글과 아이콘)
    function changeMode(){
        body.classList.toggle("dark");
        if (body.classList.contains("dark")) {
            localStorage.setItem("mode", "dark");
            logoDOM.src = "./img/DarkModeLogo.png";
            logoDOMmobi.src = "./img/SmallLogoDark.png";
            darkModeIcon.classList.add("hidden");
            lightModeIcon.classList.remove("hidden");
        } else {
            localStorage.setItem("mode", "light");
            logoDOM.src = "./img/LightModeLogo.png";
            logoDOMmobi.src = "./img/SmallLogolight.png";
            darkModeIcon.classList.remove("hidden");
            lightModeIcon.classList.add("hidden");
        }
    }

    lightModeIcon.addEventListener("click", () => {
        changeMode();
    })

    darkModeIcon.addEventListener("click", () => {
        changeMode();
    })
</script>

</body>
</html>