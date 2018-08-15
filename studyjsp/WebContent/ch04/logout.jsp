<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
 
<%
  session.invalidate();//세션정보 소멸, 로그
  response.sendRedirect("sessionTestForm.jsp");
%>