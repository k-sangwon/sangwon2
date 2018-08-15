<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0" />


<h2>forward 할 페이지에 파라미터값을 전달한다.</h2>
<form method="post" action="forwardParamTo.jsp">

	<label for="name">이름</label>
	 <input id="name" name="name" type="text"
		placehoder="홍길동" autofocus required>
   </br>
    <label for="color">색선택</label>
	<select id="color" name="color" required>
		<option value="blue" selected>파랑색
		<option value="green">초록색
		<option value="red">빨강색
		<option value="yellow">노랑색
	</select>
</br>
 <input type="submit" value="확인">


</form>