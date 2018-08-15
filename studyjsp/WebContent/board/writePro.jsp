<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bbs.board.BoardDBBean" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("utf-8");%>

<%-- 글쓰기 폼에 입력한 값을 갖고 BoardDataBean클래스 객체 article을 생성 --%>
<jsp:useBean id="article" scope="page" class="bbs.board.BoardDataBean">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>
 
<%
 String id = "";
 try{
   	id = (String)session.getAttribute("id");
 }catch(Exception e){}
 
 
 article.setWriter(id);
 article.setReg_date(new Timestamp(System.currentTimeMillis()) );
 article.setIp(request.getRemoteAddr());


 BoardDBBean dbPro = BoardDBBean.getInstance();

 int check = dbPro.insertArticle(article);
 
 
 out.println(check);
%>