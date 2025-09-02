<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>여우별 도서관</title>
  <!-- CSS -->
  <link rel="stylesheet" href="css/common.css">
  <link rel="stylesheet" href="css/menu.css">

  <!-- Icon CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.0/css/all.min.css"
    integrity="sha512-DxV+EoADOkOygM4IR9yXP8Sb2qwgidEmeqAEmDKIOfPRQZOWbXCzLC6vjbZyy0vPisbH2SyW27+ddLVCN+OMzQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  
  <!-- Favicon -->
  <link rel="icon" type="image/svg+xml" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 width=%22256%22 height=%22256%22 viewBox=%220 0 100 100%22><text x=%2250%%22 y=%2250%%22 dominant-baseline=%22central%22 text-anchor=%22middle%22 font-size=%2290%22>🌠</text></svg>" />

</head>

<body>
  <!-- ======= nav ======= -->
  <nav>
    <!-- === 로고 === -->
    <div class="logo-name">
      <div class="logo-image">
        <a href="/">
          <img id="logoimg" src="img/LightModeLogo.png" alt="logo">
          <img id="logoimgsmall" src="img/SmallLogoLight.png" alt="logo">
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
            <span class="link-name">##</span>
          </a>
        </li>
        <li>
          <a href="/">
            <i class="fa-solid fa-clipboard-list"></i>
            <span class="link-name">##</span>
          </a>
        </li>
        <li>
          <a href="/">
            <i class="fa-solid fa-users"></i>
            <span class="link-name">##</span>
          </a>
        </li>
        <li>
          <a href="/">
            <i class="fa-solid fa-book"></i>
            <span class="link-name">##</span>
          </a>
        </li>
      </ul>
      <!-- === 로그아웃 / 다크모드 스위치 === -->
      <ul class="logout-mode">
        <li>
          <a href="#">
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

  <!-- ====== 대시보드 ====== -->
  <section class="dashboard">
    <!-- 메뉴 버튼 -->
    <div class = "binder searchbar-binder">
        <!-- 메뉴 버튼 -->
        <i class="fa-solid fa-bars sidebar-toggle"></i>

        <!-- 검색 바 -->
        <input class="search-box" type="text" placeholder="사용자 이름을 입력하세요">
        <i class="search-box fa-solid fa-magnifying-glass" id="searchbtn"></i>
    </div>

    <!-- == 최근 활동 == -->
    <div class="activity">
      <div class="title">
        <i class="fa-solid fa-users"></i>
        <span class="text" style = "font-size: 50px">내 정보 수정란 입니다. 추후 변경예정</span>
      </div>
      <table class="activity-table">
        <thead>
          <tr>
            <th class="table-title"></th>
            <th class="table-title">이름</th>
            <th class="table-title">이메일</th>
            <th class="table-title">가입일</th>
            <th class="table-title">신규여부</th>
            <th class="table-title">대여상태</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="table-data">1</td>
            <td class="table-data">홍길동</td>
            <td class="table-data">ghong1991@mail.com</td>
            <td class="table-data">2025-08-21</td>
            <td class="table-data">신규회원</td>
            <td class="table-data">대여중</td>
          </tr>
          <tr>
            <td class="table-data">2</td>
            <td class="table-data">조성진</td>
            <td class="table-data">seongjincho@pianist.com</td>
            <td class="table-data">2025-08-22</td>
            <td class="table-data">기존회원</td>
            <td class="table-data">없음</td>
          </tr>
          <tr>
            <td class="table-data">3</td>
            <td class="table-data">차유진</td>
            <td class="table-data">yjcha0909@mail.net</td>
            <td class="table-data">2025-08-23</td>
            <td class="table-data">기존회원</td>
            <td class="table-data">대여중</td>
          </tr>
          <tr>
            <td class="table-data">4</td>
            <td class="table-data">이세진</td>
            <td class="table-data">sejinlee@testar.com</td>
            <td class="table-data">2025-08-24</td>
            <td class="table-data">신규회원</td>
            <td class="table-data">없음</td>
          </tr>
          <tr>
            <td class="table-data">5</td>
            <td class="table-data">임윤찬</td>
            <td class="table-data">sofrolimsky@yunchan.com</td>
            <td class="table-data">2025-08-25</td>
            <td class="table-data">신규회원</td>
            <td class="table-data">대여중</td>
          </tr>
          <tr>
            <td class="table-data">6</td>
            <td class="table-data">류건우</td>
            <td class="table-data">gunwooryu@testar.com</td>
            <td class="table-data">2025-08-25</td>
            <td class="table-data">신규회원</td>
            <td class="table-data">대여중</td>
          </tr>
          <tr>
            <td class="table-data">7</td>
            <td class="table-data">박문대</td>
            <td class="table-data">moondae@testar.com</td>
            <td class="table-data">2022-03-25</td>
            <td class="table-data">기존회원</td>
            <td class="table-data">대여중</td>
          </tr>
          <tr>
            <td class="table-data">8</td>
            <td class="table-data">신청려</td>
            <td class="table-data">chungryeoshin@vtic.com</td>
            <td class="table-data">2020-07-25</td>
            <td class="table-data">기존회원</td>
            <td class="table-data">없음</td>
          </tr>
          <tr>
            <td class="table-data">9</td>
            <td class="table-data">김래빈</td>
            <td class="table-data">rabbitkim@testar.com</td>
            <td class="table-data">2025-08-25</td>
            <td class="table-data">신규회원</td>
            <td class="table-data">대여중</td>
          </tr>
          <tr>
            <td class="table-data">10</td>
            <td class="table-data">선아현</td>
            <td class="table-data">ahhyeonsun@testar.com</td>
            <td class="table-data">2025-08-25</td>
            <td class="table-data">신규회원</td>
            <td class="table-data">대여중</td>
          </tr>
        </tbody>
      </table>
    </div>
  </section>

  <!-- === 푸터 === -->
  <footer class="footer"></footer>

  <!-- ===== 다크모드 전환, 메뉴 토글 스크립트 ===== -->
  <script src="./js/darkmode.js"></script>
</body>

</html>

<!-- Updated 2025-08-26 12:25P -->