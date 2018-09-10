<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ include file="/common/header.jsp"%>
<section>
	<h1>회원가입 등록 페이지</h1>
	<form  id='reg_form' action='${pageContext.request.contextPath}/register' method='post'>
		<table>
			<tr>
				<td><label for='member_num'>회원아이디: </label></td>
				<td><input type='text' name='member_id' required></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input id='mem_pw1' type='password' name='member_pw1' placeholder='Enter Password' required></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input id='mem_pw2' type='password' name='member_pw2' placeholder='Enter Password again' required></td>
			</tr>
			<tr>
				<td>회원성명</td>
				<td><input id='mem_name' type='text' name='member_name' placeholder='Enter name...' required ></td>
			</tr>
			<tr>
				<td>가입일자</td>
				<td><input type='text' name='member_join_date' value='${today }'></td>
			</tr>

			<tr>
				<td colspan='2'><input id='reg_button' type='button' value='가입' onclick='register()'>
								<input id='list_button' type='button' value='조회' onclick='list()'>
		     	</td>
			
			</tr>
		</table>
	</form>
</section>
<script>
function register(){
	console.log('register called');
	
	var formObj = document.getElementById('reg_form');
	formObj.action="${pageContext.request.contextPath}/register";
	formObjmethod='post';
	formObj.submit();
}

</script>

<%@ include file="/common/footer.jsp"%>