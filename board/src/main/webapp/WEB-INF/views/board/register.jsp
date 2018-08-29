<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navigation.jsp" %>

<h1>
	게시물 등록  
</h1>

<form action="${pageContext.request.contextPath }/register" method="post">
	<div class="box-body">
		<div class="form-group">
			<label>Title</label> <input type="text" name="title" class="form-control"
				placeholder="Enter Title" />
		</div>
		<div class="form-group">
			<label>Content</label><textarea class="form-control" name='content' rows='3'
				placeholder='Enter ...' ></textarea>
		</div>
		<div class="form-group">
			<label>Writer</label><input type="text" name='writer' class='form-control' 
				placeholder="Enter Writer">
		</div>
		
	</div>
	<div class="box=footer">
		<button type="submit" class="btn btn-primary">Submit</button>
	</div>
</form>

<%@ include file="../common/footer.jsp" %>