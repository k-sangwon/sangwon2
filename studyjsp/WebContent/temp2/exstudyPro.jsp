<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0" />

<%
	request.setCharacterEncoding("utf-8");
%>


<jsp:useBean id="ExTestbean" class="ex.ch08.ExTestbean">
	<jsp:setProperty name="ExTestbean" property="name" />
	<jsp:setProperty name="ExTestbean" property="email" />
	<jsp:setProperty name="ExTestbean" property="comment" />
	<jsp:setProperty name="ExTestbean" property="passwd" />
</jsp:useBean>


이름 :<jsp:getProperty name="ExTestbean" property="name" />
<br>
이메일:<jsp:getProperty name="ExTestbean" property="email" />
<br>
방문소감 :<jsp:getProperty name="ExTestbean" property="comment" />
<br>
비밀번호 :<jsp:getProperty name="ExTestbean" property="passwd" />
