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
		<div class = "binder searchbar-binder">
			<!-- 메뉴 버튼 -->
			<i class="fa-solid fa-bars sidebar-toggle"></i>

			<!-- 검색 바 -->
			<input class="search-box" type="text" id="searchText" placeholder="도서 이름을 입력하세요" value="${ search }" >
			<i class="search-box fa-solid fa-magnifying-glass" id="searchbtn"></i>
		</div>
		<!-- == 도서 목록 == -->
		<div class="activity">
			<div class="title">
				<i class="fa-solid fa-book"></i>
				<span class="text">도서 목록</span>
				<a href="/Admin/AdminBookInsertForm"><button class="action-btn">도서 추가</button></a>
			</div>
			<table class="activity-table">
				<thead>
					<tr>
						<th class="table-title"></th>
						<th class="table-title">책 이름</th>
						<th class="table-title">출판사</th>
						<th class="table-title">저자</th>
						<th class="table-title">대여여부</th>
						<th class="table-title">도서상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${bookList}">
					<tr>
						<td class="table-data"><a href="/Admin/AdminBookView?ybi_idx=${ list.ybi_idx }" class="table-link">${ list.rownum }</a></td>
						<td class="table-data"><a href="/Admin/AdminBookView?ybi_idx=${ list.ybi_idx }" class="table-link">${ list.ybi_subject }</a></td>
						<td class="table-data"><a href="/Admin/AdminBookView?ybi_idx=${ list.ybi_idx }" class="table-link">${ list.ybi_publi }</a></td>
						<td class="table-data"><a href="/Admin/AdminBookView?ybi_idx=${ list.ybi_idx }" class="table-link">${ list.ybi_name }</a></td>
						<c:choose>
                       		<c:when test="${list.ybi_del == '삭제'}">
                       			<td class="table-data"><a href="/Admin/AdminBookView?ybi_idx=${ list.ybi_idx }" class="table-link">-</a></td>
                       		</c:when>
                       		<c:otherwise>
                       			<td class="table-data"><a href="/Admin/AdminBookView?ybi_idx=${ list.ybi_idx }" class="table-link">${ list.ybi_rental }</a></td>
                       		</c:otherwise>
                       	</c:choose>
                       	<td class="table-data"><a href="/Admin/AdminBookView?ybi_idx=${ list.ybi_idx }" class="table-link">${ list.ybi_del }</a></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<%@include file = "../include/adminPaging.jsp" %>
		</div>
	</section>
	<!-- ===== 다크모드 전환, 메뉴 토글 스크립트 ===== -->
	<script src="/js/darkmode.js"></script>
	<script>
		const searchEl = document.getElementById("searchbtn");
		searchEl.onclick = function(){
			const search_str = document.getElementById("searchText").value.trim();
			//alert(search_str);
			location.href="/Admin/AdminBookSearch?search="+search_str;
		}
    	
	</script>
</body>
</html>