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

	<!-- Icon CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.0/css/all.min.css"
	integrity="sha512-DxV+EoADOkOygM4IR9yXP8Sb2qwgidEmeqAEmDKIOfPRQZOWbXCzLC6vjbZyy0vPisbH2SyW27+ddLVCN+OMzQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

	<!-- Favicon -->
	<link rel="icon" type="image/svg+xml"
	href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 width=%22256%22 height=%22256%22 viewBox=%220 0 100 100%22><text x=%2250%%22 y=%2250%%22 dominant-baseline=%22central%22 text-anchor=%22middle%22 font-size=%2290%22>🌠</text></svg>" />

</head>
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
				<i class="fa-solid fa-user"></i>
				<span class="text">사용자 상세</span>
			</div>
			<form class="form" name="form" action="/Admin/AdminUserUpdate" method="POST">
				<table class="elem-container">
				<tr>
					<td><label class="labelname">이름</label></td>
					<td><input type="text" name="username" class="input-bar" value="${ userData.yu_username }" readonly /></td>
				</tr>
				<tr>
					<td><label class="labelname">아이디</label></td>
					<td><input type="text" name="yu_userid" class="input-bar" value="${ userData.yu_userid }" readonly /></td>
				</tr>
				<tr>
					<td><label class="labelname">생년월일</label></td>
					<td><input type="text" name="birth" class="input-bar" value="${ userData.yu_birth }" readonly /></td>
				</tr>
				<tr>
					<td><label class="labelname">이메일</label></td>
					<td><input type="text" name="email" class="input-bar" value="${ userData.yu_email }" readonly /></td>
				</tr>
				<tr>
					<td><label class="labelname">가입일</label></td>
					<td><input type="text" name="indate" class="input-bar" value="${ userData.yu_indate }" readonly /></td>
				</tr>
				<tr>
					<td><label class="labelname">휴면전환 및 탈퇴일</label></td>
					<td><input type="text" name="outdate" class="input-bar" value="${ userData.yu_outdate }" readonly /></td>
				</tr>
				<tr>
					<td><label class="labelname">가입상태</label></td>
					<td>
						<c:choose>
							<c:when test="${userData.yu_del == 'Y'}">
								<input type="text" name="email" class="input-bar" value="삭제" readonly />
							</c:when>
							<c:otherwise>
								<input type="text" name="yuauth" class="input-bar" value="${ userData.yu_auth }" readonly />
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="radio" class="input-radio" id="authY" name="auth" value="Y" /><label for="authY" class="labelname">사용전환</label>
						<input type="radio" class="input-radio" id="authN" name="auth" value="N" checked /><label for="authN" class="labelname">휴면전환</label>
						<input type="radio" class="input-radio" id="authD" name="auth" value="D" /><label for="authD" class="labelname">삭제</label><br />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" class="action-btn" value="수정" />&nbsp;&nbsp;<input type="button" class="action-btn" id="list" value="목록" />
					</td>
				</tr>
			</table>
			</form>
		</div>
             
		<!-- ------------------------------------------------------------------ -->
		<div class="activity">
               <div class="title">
                   <i class="fa-solid fa-book"></i>
                   <span class="text">대여 상세</span>
               </div>
               <!-- 검색 바 컨테이너 -->
			<div class="binder searchbar-binder">
				<!-- 검색 바 -->
				<input class="search-box" type="text" id="searchText" placeholder="도서 이름을 입력하세요" value="${search }" >
				<i class="search-box fa-solid fa-magnifying-glass" id="searchbtn"></i>
			</div>
			<table class="activity-table">
				<thead>
					<tr>
						<th class="table-title"></th>
						<th class="table-title">번호</th>
						<th class="table-title">제목</th>
						<th class="table-title">저자</th>
						<th class="table-title">대여일자</th>
						<th class="table-title">반납일자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${userBookList}">
					<tr>
						<td class="table-data">${ list.rownum }</td>
						<td class="table-data">${ list.ybi_subject }</td>
						<td class="table-data">${ list.ybi_name }</td>
						<td class="table-data">${ list.yri_rtdate }</td>
						<td class="table-data">${ list.yri_redate }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>
    <script src="/js/darkmode.js"></script>
 	<script>
		// 리스트 이동
		const listEl = document.getElementById('list');
		listEl.onclick = function(e){
			//alert('1');
			location.href='/Admin/AdminUserList';
		}
		
		const formEl = document.getElementsByName('form')[0];
		formEl.addEventListener('submit',function(e){
			const authList = document.querySelector('input[name="auth"]:checked').value;
			//alert(authList);
			//alert(formEl.action);
			if(confirm('수정하시겠습니까?')){
				alert('수정되었습니다.');
			}else{
				e.stopPropagation();
				e.preventDefault();
			}
		})
		
		const searchEl = document.getElementById("searchbtn");
    	searchEl.onclick = function(){
    		const search_str = document.getElementById("searchText").value.trim();
    		//alert(search_str);
    		location.href="/Admin/AdminUserViewSearch?yu_userid=${ userData.yu_userid }&search="+search_str;
    	}
	</script>
</body>
</html>