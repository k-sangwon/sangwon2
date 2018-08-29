<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navigation.jsp" %>

<h1>
	게시물 조회  
</h1>

<form role='form' method='post'>
	<input type='hidden' name='bno' value="${board.bno }" >
</form>

<div class="box-body">
	<div class='form-group'>
		<label>Title</label><input type='text' name='title' value='${board.title }'
			readonly='readonly' class='form-control'>
	</div>
	<div class='form-group'>
		<label>Content</label><textarea rows='3' name='content' 
			readonly='readonly' class='form-control'>${board.content }</textarea>
	</div>
	<div class='form-group'>
		<label>Writer</label><input type='text' name='writer' value='${board.writer }'
			readonly='readonly' class='form-control'>
	</div>
</div>
<div class='box-footer'>
	<button type='submit' class='btn btn-warning'>Modify</button>
	<button type='submit' class='btn btn-danger'>Remove</button>
	<button type='submit' class='btn btn-primary'>List ...</button>
</div>

<%@ include file="../common/footer.jsp" %>
<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		
		$(".btn-warning").on('click', function() {
			formObj.attr("action", "${pageContext.request.contextPath}/modify");
			formObj.attr("method", "get");
			formObj.submit();
		});
		
		$(".btn-danger").on('click', function() {
			formObj.attr("action", "${pageContext.request.contextPath}/delete");
			formObj.submit();
		});
		
		$(".btn-primary").on('click', function() {
			self.location="${pageContext.request.contextPath}/list";
		});
		
	});
</script>