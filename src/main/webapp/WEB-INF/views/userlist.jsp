<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>마이페이지</title>

      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.0/css/all.min.css"
        integrity="sha512-DxV+EoADOkOygM4IR9yXP8Sb2qwgidEmeqAEmDKIOfPRQZOWbXCzLC6vjbZyy0vPisbH2SyW27+ddLVCN+OMzQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
      <link rel="icon" type="image/svg+xml"
        href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 width=%22256%22 height=%22256%22 viewBox=%220 0 100 100%22><text x=%2250%%22 y=%2250%%22 dominant-baseline=%22central%22 text-anchor=%22middle%22 font-size=%2290%22>🌠</text></svg>" />
      <link rel="stylesheet" href="/css/common.css">
      <link rel="stylesheet" href="/css/admin.css">
      <link rel="stylesheet" href="/css/updatee.css" />

      <c:if test="${not empty msg}">
        <script>
          alert('${msg}');
        </script>
      </c:if>

    </head>

    <body>

      <nav>
        <!-- === 로고 === -->
        <div class="logo-name">
          <div class="logo-image">
            <a href="/">
              <img id="logoimg" src="/img/LightModeLogo.png" alt="logo">
              <img id="logoimgsmall" src="/img/SmallLogoLight.png" alt="logo">
            </a>
          </div>
        </div>

        <!-- === 메뉴 아이템 === -->
        <div class="menu-items">
          <ul class="nav-links">
            <!-- 화면 크기 400 미만일 때 로고 대신 홈 버튼 등장 -->
            <li id="house">
              <a href="/">
                <i class="fa-solid fa-house"></i>
                <span class="link-name">홈으로</span>
              </a>
            </li>
             <c:if test = "${sessionScope.login.yu_userid ne null and sessionScope.login.yu_userid ne 'admin'}">
				        <li>
				          <a href = "/Userlist">
				             <i class="fa-solid fa-users"></i>
				             <span class="link-name">${sessionScope.login.yu_username}</span>
				          </a>
				        </li>
			  	  </c:if>
		  
			        <li> 
			          <a href="/RentalList">
			            <i class="fa-solid fa-book"></i>
			            <span class="link-name">대여 내역</span>
			          </a>
			        </li>
			        <li>
			          <a href="/ReturnList">
			            <i class="fa-solid fa-book"></i>
			            <span class="link-name">반납 내역</span>
			          </a>
			        </li>
          </ul>
          <!-- === 로그아웃 / 다크모드 스위치 === -->
          <ul class="logout-mode">
            <li>
              <a href="/logout">
                <i class="fa-solid fa-arrow-right-from-bracket"></i>
                <span class="link-name">로그아웃</span>
              </a>
            </li>
            <li class="mode">
              <a href="#">
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
                <span class="link-name" id="modeword">다크모드</span>
              </a>
            </li>
          </ul>
        </div>
      </nav>
      <section class="dashboard">
        <!-- 사이드바 토글 버튼 -->
        <i class="fa-solid fa-bars sidebar-toggle"></i>

        <main class="update-container">
          <h2>내 정보</h2>
          <form action="/Update" method="POST" class="update-form">
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
              <a href="/" class="cancel-btn">취소</a>
              <button type="submit" class="update-btn">수정</button>
              <a href="/Delete?yu_userid=${userInfo.yu_userid}" class="del-btn"
                onclick="return confirm('정말 탈퇴하시겠습니까?')">탈퇴</a>
            </div>
          </form>
        </main>
      </section>
      <script>

        document.getElementById("changePw").onclick = function () {
          location.href = "/ChangePwForm?yu_userid=${userInfo.yu_userid}";
        }

        const formEl = document.querySelectorAll("form")[0];

        formEl.addEventListener('submit', function (e) {

          const inputEl8 = document.querySelector('[name="yu_email"]')
          if (inputEl8.value.trim() == '') {
            alert('이메일을 입력해 주세요.')
            e.stopPropagation();
            e.preventDefault();
            inputEl8.focus();
            return false
          }

          const inputEl9 = document.querySelector('[name="yu_phone"]')
          if (inputEl9.value.trim() == '') {
            alert('전화번호를 입력해 주세요.')
            e.stopPropagation();
            e.preventDefault();
            inputEl9.focus();
            return false
          }
        })  
      </script>

      <script src="/js/darkmode.js"></script>
    </body>

    </html>