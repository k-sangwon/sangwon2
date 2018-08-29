<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>

<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navigation.jsp" %>

<h1>
	게시물 리스트
</h1>

<table class="table table-striped">
	<tr>
		<th>BNO</th>
		<th>TITLE</th>
		<th>WRITER</th>
		<th>REGDATE</th>
		<th>VIEWCNT</th>
	</tr>
	<c:forEach items="${list }" var="board">
	<tr>
		<td>${board.bno }</td>
		<td><a href="${pageContext.request.contextPath}/read?bno=${board.bno}">${board.title }</a></td>
		<td>${board.writer }</td>
		<td><fmt:formatDate pattern="yy-MM-dd HH:mm" value='${board.regdate }' /></td>
		<td>${board.viewcnt }</td>
	</tr>
	</c:forEach>
</table>


<%@ include file="../common/footer.jsp" %>
<script>
	var result = '${msg}';
	if (result == 'success') {
		alert("게시물 업데이트 성공");
	}
	var result2 = '${msg2}';
	if (result2 == 'success') {
		alert("게시물 삭제 성공");
	}
	
</script>