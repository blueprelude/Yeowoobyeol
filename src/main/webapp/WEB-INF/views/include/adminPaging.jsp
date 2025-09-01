<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="adminpaging">
	<c:if test = "${totalCount > 0}">
	<table id="adminpage">
		<tr>
			<c:if test="${searchDTO.pagination.existPrevPage}">
				<td><a href="${pagingUrl}page=1">맨처음</a></td>		
				<td><a href="${pagingUrl}page=${searchDTO.page- 1}">이전</a></td>		
			</c:if>	
				
			<c:forEach var="pagenum" begin="${searchDTO.pagination.startPage}" end="${searchDTO.pagination.endPage}" step="1">
				<td><a href="${pagingUrl}page=${pagenum}">${pagenum}</a></td>		
			</c:forEach>
				
			<c:if test="${searchDTO.pagination.existNextPage}">
				<td><a href="${pagingUrl}page=${searchDTO.page + 1}">다음</a></td>		
				<td><a href="${pagingUrl}page=${searchDTO.pagination.totalPageCount}">맨끝</a></td>		
			</c:if>
		</tr>
	</table>
	</c:if>
	<c:if test ="${totalCount == 0 }">
	<table id="page" style="text-align:cenrer;color:var(--text-color);">
		<tr><td><h2>목록이 없습니다</h2></td></tr>
	</table>
	</c:if>
</div>
<script>
	let width = document.querySelector(".activity-table").offsetWidth;
	let result = document.querySelector(".adminpaging");
	/* console.log(width); */
	result.style.width = (width)+'px';

</script>