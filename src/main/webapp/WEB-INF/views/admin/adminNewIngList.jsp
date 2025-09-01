<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>여우별 도서관</title>
	<!-- CSS -->
	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/admin.css">

  	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.0/css/all.min.css"
	integrity="sha512-DxV+EoADOkOygM4IR9yXP8Sb2qwgidEmeqAEmDKIOfPRQZOWbXCzLC6vjbZyy0vPisbH2SyW27+ddLVCN+OMzQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

	<!-- Favicon -->
	<link rel="icon" type="image/svg+xml" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 width=%22256%22 height=%22256%22 viewBox=%220 0 100 100%22><text x=%2250%%22 y=%2250%%22 dominant-baseline=%22central%22 text-anchor=%22middle%22 font-size=%2290%22>🌠</text></svg>" />

</head>
<body>
	<%@include file = "../include/adminNav.jsp" %>

	<!-- ====== 대시보드 ====== -->
    <section class="dashboard">
		<!-- 메뉴 버튼 -->
		<i class="fa-solid fa-bars sidebar-toggle"></i>
		<!-- == 최근 활동 == -->
		<div class="activity">
			<div class="title">
				<i class="fa-regular fa-clock"></i>
				<span class="text">최근 회원 목록</span>
			</div>
			<table class="activity-table">
				<thead>
					<tr>
						<th class="table-title"></th>
						<th class="table-title">아이디</th>
						<th class="table-title">이메일</th>
						<th class="table-title">이름</th>
						<th class="table-title">가입일자</th>
						<th class="table-title">계정상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${userList}">
					<tr>
						<td class="table-data">${ list.rownum }</td>
						<td class="table-data">${ list.yu_userid }</td>
						<td class="table-data">${ list.yu_email }</td>
						<td class="table-data">${ list.yu_username }</td>
						<td class="table-data">${ list.yu_indate }</td>
						<c:choose>
							<c:when test="${list.yu_indate_chk <= 3}">
                       			<td class="table-data">신규회원</td>
                       		</c:when>
                       		<c:otherwise>
                       			<td class="table-data">일반회원</td>
                       		</c:otherwise>
                       	</c:choose>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- 최근 도서 대여 목록 -->
		<div class="activity">
			<div class="title">
				<i class="fa-solid fa-book"></i>
				<span class="text">최근 도서 대여 목록</span>
			</div>
			<table class="activity-table">
				<thead>
					<tr>
						<th class="table-title"></th>
						<th class="table-title">책 이름</th>
						<th class="table-title">출판사</th>
						<th class="table-title">저자</th>
						<th class="table-title">대여일자</th>
						<th class="table-title">대여자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="rtlist" items="${bookrtList}">
					<tr>
						<td class="table-data">${ rtlist.rownum }</td>
						<td class="table-data">${ rtlist.ybi_subject }</td>
						<td class="table-data">${ rtlist.ybi_publi }</td>
						<td class="table-data">${ rtlist.ybi_name }</td>
						<td class="table-data">${ rtlist.yri_rtdate }</td>
						<td class="table-data">${ rtlist.yu_userid }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- 최근 도서 반납 목록 -->
		<div class="activity">
			<div class="title">
				<i class="fa-solid fa-book"></i>
				<span class="text">최근 도서 반납 목록</span>
			</div>
			<table class="activity-table">
				<thead>
					<tr>
						<th class="table-title"></th>
						<th class="table-title">출판사</th>
						<th class="table-title">제목</th>
						<th class="table-title">저자</th>
						<th class="table-title">대여일자</th>
						<th class="table-title">반납일자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="relist" items="${bookreList}">
					<tr>
						<td class="table-data">${ relist.rownum }</td>
						<td class="table-data">${ relist.ybi_publi }</td>
						<td class="table-data">${ relist.ybi_subject }</td>
						<td class="table-data">${ relist.ybi_name }</td>
						<td class="table-data">${ relist.yri_rtdate }</td>
						<td class="table-data">${ relist.yri_redate }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>
	<!-- === 푸터 === -->
	<footer class="footer"></footer>
	
	<!-- ===== 다크모드 전환, 메뉴 토글 스크립트 ===== -->
	<script src="/js/darkmode.js"></script>
</body>
</html>