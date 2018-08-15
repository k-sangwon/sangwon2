<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
 
<% request.setCharacterEncoding("utf-8");%>

<%
    Enumeration<String> en = request.getParameterNames();
%>

<h2>request.getParameterNames() 사용</h2>
   
<h2>헤더의 정보 표시</h2>
<%
  while(en.hasMoreElements()){
    String name = en.nextElement();
    String value = request.getParameter(name);
   	out.println(name + " : " + value +"<br>");
  }
%>