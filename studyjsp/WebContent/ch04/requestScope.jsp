<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setAttribute("name","홍길동");


	response.sendRedirect("requestInfo.jsp");
%>

<a href="requestInfo.jsp">requestScope 정보확인</a>
</body>
</html>