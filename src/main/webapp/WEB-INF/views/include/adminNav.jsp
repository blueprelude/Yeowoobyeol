<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<!-- ======= nav ======= -->
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
					<a href="/Admin/AdminNewIngList">
						<i class="fa-solid fa-house"></i>
						<span class="link-name">홈으로</span>
					</a>
				</li>
				<li>
					<a href="/Admin/AdminNewIngList">
						<i class="fa-solid fa-clipboard-list"></i>
						<span class="link-name">메인으로</span>
					</a>
				</li>
				<li>
					<a href="/Admin/AdminUserList">
						<i class="fa-solid fa-users"></i>
						<span class="link-name">사용자 목록</span>
					</a>
				</li>
				<li>
					<a href="/Admin/AdminBookList">
						<i class="fa-solid fa-book"></i>
						<span class="link-name">도서 목록</span>
					</a>
				</li>
			</ul>
            <!-- === 로그아웃 / 다크모드 스위치 === -->
			<ul class="logout-mode">
				<li>
					<a href="/logout"  onclick="return confirm('로그아웃 하시겠습니까?');">
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
