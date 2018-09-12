<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ include file="/common/header.jsp"%>
<section>
	<h1>회원가입 등록 페이지</h1>
	<form id='reg_form' onsubmit='return register()' method='post'>
		<table>
			<tr>
				<td><label for='member_num'>회원아이디: </label></td>
				<td><input type='text' name='member_id' required></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input id='mem_pw1' type='password' name='member_pw1'
					placeholder='Enter Password' required></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input id='mem_pw2' type='password' name='member_pw2'
					placeholder='Enter Password again' required></td>
			</tr>
			<tr>
				<td>회원성명</td>
				<td><input id='mem_name' type='text' name='member_name'
					placeholder='Enter name...' required></td>
			</tr>
			<tr>
				<td>가입일자</td>
				<td><input type='text' name='member_join_date'
					value='${today }'></td>
			</tr>

			<tr>
				<!-- required 는  폼태그안에 전송버튼이 submit 이여야 작동한다. -->
				<td colspan='2'><input id='reg_button' type='submit' value='가입'>
					<input id='list_button' type='button' value='조회' onclick='list()'>
				</td>

			</tr>
		</table>
	</form>
</section>
<script>
	var request;
	function register() {
		console.log('register called');

	/* 	if(pw_validate()==false){
			return false;
		} */
		
		var params='';
		var formObj = document.getElementById('reg_form');
		request= new XMLHttpRequest();
		var url = "${pageContext.request.contextPath}/register";
		var elem = formObj.elements;
		
		for(var i=0; i<elem.length; i++){
			if(elem[i].tagName=="SELECT"){
				value= elem[i].options[elem[i].selectedIndex].value;
			}else{
				value=elem[i].value;
			}
			params += elem[i].name+'='+ encodeURIComponent(elem[i].value)+ '&';
		}
		
		try{
			request.onreadystatechange = getResult;
			request.open("post",url,true);
			reqeust.setReqeustHeader("Content-Type","application/x-www-form-urlencoded");
			request.send();
		}catch(e){
			alert('서버로 요청이 실패')
		}

		return false;
	}
	
	function getReuslt(){
		if(request.readyState == 4)
		var result=request.responseText;
		
		if(result=="success"){
			alert('update success')
		}else{
			alert('update fail')
		}
	}
	
	function pw_validate() {
		var pw1 = document.getElementById('mem_pw1');
		var pw2 = document.getElementById('mem_pw2');
		
		if (pw1 == pw2) {
			return true;
		} else {
			return false;
		}
	}
</script>

<%@ include file="/common/footer.jsp"%>