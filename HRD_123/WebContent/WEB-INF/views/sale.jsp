<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/common/header.jsp"%>

<section>
	<h2>회원매출조회</h2>

	<table border=1>
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>고객등급</th>
			<th>매출</th>
		</tr>
		<c:forEach items="${list }" var="sale">
		<tr>
			<td>${sale.member_num }</td>
			<td>${sale.member_name }</td>
			<td>
				<c:choose>
					<c:when test="${sale.member_title == 'A' }">
						VIP
					</c:when>
					<c:when test="${sale.member_title=='B' }">
						일반
					</c:when>
					<c:otherwise>
						직원
					</c:otherwise>		
				</c:choose>
			</td>
			<td>${sale.sale_total }</td>
		</tr>
		</c:forEach>
	</table>

</section>

<script>
	
</script>
<%@ include file="/common/footer.jsp"%>