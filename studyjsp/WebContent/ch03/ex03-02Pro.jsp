<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>입력결과</h2>
<%
	//Integer.parseInt(); 정수로 형변환 작업 메서드
int val =Integer.parseInt(request.getParameter("val"));

if(val>=10){
	out.print("10보다 크거나 같은 값");
}else{
	out.print("10보다 작은 값");
}

%>


</body>
</html>