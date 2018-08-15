<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ch11.logon.LogonDBBean" %>

<% request.setCharacterEncoding("utf-8");%>
<% 
   //사용자의 id값은 세션속성값으로부터 얻어냄
   String id = (String)session.getAttribute("id"); //로그인상태이기 때문에 다시 읽을수잇다
   String passwd = request.getParameter("passwd"); 

   LogonDBBean manager = LogonDBBean.getInstance();//객체생성
   int check = manager.userCheck(id, passwd);
   
   out.println(check);
%>