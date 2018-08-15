<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=session.getId()%><br>
<%=session.getCreationTime()%><br>

<%session.setMaxInactiveInterval(1200);
	
  session.setAttribute("name", "홍길동");
%>

<%=session.getMaxInactiveInterval()%><br>
<a href="sessionnameinfo.jsp">세션정보확인</a>
</body>
</html>