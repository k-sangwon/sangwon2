<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<link rel="stylesheet" href="style.css" />
<form method="post" action="exstudyPro.jsp">

	<dl>
		<dd>
			<label for="name">이름 </label> 
			<input id="name" name="name" type="text"
				autofocus required/>
		</dd>
		<dd>
			<label for="email">이메일</label> 
			<input id="email" name="email"	type="email" autofocus required/>
		</dd>
		<dd>
			<label for="comment">방문소감      </label>
			 <textarea id="comment" name="comment" 
				autofocus required></textarea>
		</dd>
		<dd>
			<label for="passwd">비밀번호   </label> 
			<input id="passwd" name="passwd" type="password"
				autofocus required/>
		</dd>
	</dl>
	<input type="submit" value="전송"/> <input type="reset" value="취소"/>

</form>
