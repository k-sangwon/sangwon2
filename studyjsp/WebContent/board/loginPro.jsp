<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bbs.board.LogonDBBean" %>

<% request.setCharacterEncoding("utf-8");%>

<%

  String id = request.getParameter("id");
  String passwd  = request.getParameter("passwd");

  LogonDBBean manager = LogonDBBean.getInstance();
  int check= manager.userCheck(id,passwd);

  if(check==1)
	session.setAttribute("id",id);

  out.println(check);
%>