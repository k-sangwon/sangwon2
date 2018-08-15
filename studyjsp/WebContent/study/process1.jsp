<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<%request.setCharacterEncoding("utf-8");%>


<%
String result = "결과: <br>";

String name = request.getParameter("name");

String stus = request.getParameter("stus");

result += "이름은 " + name + "이고,<br>";
result += "현재상태는  " + stus ;

out.println(result);
%>

