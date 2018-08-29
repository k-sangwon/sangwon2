<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<%@ include file="../common/header.jsp"%>
<%@ include file="../common/navigation.jsp"%>

<h1>게시물 수정</h1>
<div class="box-body">
<form role='form' method='post'>
		<div class='form-group'>
			<label>BNO</label><input type='text' name='bno' readonly='readonly'
				value='${board.bno }' class='form-control'>
		</div>
	
		<div class='form-group'>
			<label>Title</label><input type='text' name='title'
				value='${board.title }' class='form-control'>
		</div>
		<div class='form-group'>
			<label>Content</label>
			<textarea rows='3' name='content'
				class='form-control'>${board.content }</textarea>
		</div>
		<div class='form-group'>
			<label>Writer</label><input type='text' name='writer'
				value='${board.writer }' class='form-control'>
		</div>
</form>
</div>
<div class='box-footer'>
		<button type='submit' class='btn btn-primary'>SAVE</button>
		<button type='submit' class='btn btn-warning'>CANCEL</button>
</div>


<%@ include file="../common/footer.jsp"%>
<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		
		$(".btn-primary").on('click', function() {
			formObj.attr("action", "${pageContext.request.contextPath}/modify");
			formObj.submit();
		});
		
		$(".btn-warning").on('click', function() {
			self.location="${pageContext.request.contextPath}/list";
		});
	});
</script>