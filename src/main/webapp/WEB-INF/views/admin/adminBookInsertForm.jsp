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
	<link rel="icon" type="image/svg+xml"
	href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 width=%22256%22 height=%22256%22 viewBox=%220 0 100 100%22><text x=%2250%%22 y=%2250%%22 dominant-baseline=%22central%22 text-anchor=%22middle%22 font-size=%2290%22>🌠</text></svg>" />

</head>
<body>
	<%@include file = "../include/adminNav.jsp" %>
	
	<!-- ====== 대시보드 ====== -->
	<section class="dashboard">
        <!-- 메뉴 버튼 -->
		<i class="fa-solid fa-bars sidebar-toggle"></i>
		<!-- == 도서 목록 == -->
		<div class="activity">
			<div class="title">
				<i class="fa-solid fa-book"></i>
				<span class="text">도서등록</span>
			</div>
			<form class="form" name="form" action="/Admin/AdminBookInsert" method="POST">
				<table class="elem-container">
					<tr>
						<td><label for="bookname" class="labelname">도서제목</label></td>
						<td><input type="text" name="ybi_subject" class="input-bar"/></td>
					</tr>
					<tr>
						<td><label for="pubname" class="labelname">출판사</label></td>
						<td><input type="text" name="ybi_publi" class="input-bar"/></td>
					</tr>
					<tr>
						<td><label for="authname" class="labelname">저자</label></td>
						<td><input type="text" name="ybi_name" class="input-bar"/></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" class="action-btn" value="등록" />&nbsp;&nbsp;
							<input type="button" class="action-btn" id="list" value="목록" />
						</td>
					</tr>
				</table>
			</form>
		</div>
	</section>
	<script src="/js/darkmode.js"></script>
	<script>
		// 리스트 이동
		const listEl = document.getElementById('list');
		listEl.onclick = function(e){
			//alert('1');
			//location.href='/Admin/AdminBookList';
			window.history.back();
		}

		const formEl = document.getElementsByName('form')[0];
		formEl.addEventListener('submit',function(e){

			if(confirm('등록하시겠습니까?')){
				alert('등록되었습니다.');
			}else{
				e.stopPropagation();
				e.preventDefault();
			}
		})

	</script>
</body>
</html>