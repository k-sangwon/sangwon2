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
String realFolder = "";//웹 어플리케이션상의 절대 경로 저장
String saveFolder = "/upload"; //파일 업로드 폴더 지정

//현재 jsp페이지의 웹 어플리케이션상의 절대 경로를 구함
ServletContext context = getServletContext();//  프로젝트의 흐름을 얻어온다
realFolder = context.getRealPath(saveFolder);  

%>

서버의 절대(물리적) 경로: <%= realFolder %>
</body>
</html>