<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>



<c:if test = "${totalCount > 0}">
	<table id = "page">
		<tr>
			<c:if test="${searchDTO.pagination.existPrevPage}">
				<td><a href="/ReturnList?page=1&keyword=${searchDTO.keyword}">처음</a></td>		
				<td><a href="/ReturnList?page=${searchDTO.page - 1}&keyword=${searchDTO.keyword}">이전</a></td>		
			</c:if>	
			<c:forEach var="pagenum" begin="${searchDTO.pagination.startPage}" end="${searchDTO.pagination.endPage}" step="1">	
				<c:choose>
					<c:when test = "${pagenum eq searchDTO.page}">
							<td class = "active"><a href="/ReturnList?page=${pagenum}&keyword=${searchDTO.keyword}">${pagenum}</a></td>		
					</c:when>
					<c:otherwise>
							<td><a href="/ReturnList?page=${pagenum}&keyword=${searchDTO.keyword}">${pagenum}</a></td>		
					</c:otherwise>
				</c:choose>
		    </c:forEach>
			<c:if test="${searchDTO.pagination.existNextPage}"> 
				<td><a href="/ReturnList?page=${searchDTO.page + 1}&keyword=${searchDTO.keyword}">다음</a></td>		
				<td><a href="/ReturnList?page=${searchDTO.pagination.totalPageCount}&keyword=${searchDTO.keyword}">끝</a></td>		
			</c:if>	 
		</tr>
	</table>
</c:if>

<c:if test = "${totalCount == 0 }">
	<h2 id = "notBookList">반납목록이없습니다</h2>
</c:if>	
</div>


