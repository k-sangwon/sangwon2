<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<% request.setCharacterEncoding("utf-8");%>
<title>Insert title here</title>
</head>
<body>
<h2>방명록</h2>
<%
String name = request.getParameter("name");
String content= request.getParameter("content");

%>
<br>
이름:<%=name%><br>
내용:<%=content %>
</body>
</html>