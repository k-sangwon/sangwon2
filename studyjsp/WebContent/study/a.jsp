<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>

 <h2>GET 방식</h2>
 <%String id = "sangwon";
 	String name = "김상원";
 
 %>
<a href="b.jsp?id=<%=id%>&name<%=name%>">get 방식</a>