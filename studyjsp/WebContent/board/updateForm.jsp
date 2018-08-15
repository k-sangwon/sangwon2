<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bbs.board.BoardDBBean" %>
<%@ page import = "bbs.board.BoardDataBean" %>

<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="../css/style.css"/>
<script src="../js/jquery-1.11.0.min.js"></script>
<script src="update.js"></script>
<% request.setCharacterEncoding("utf-8");%>

<% int num = Integer.parseInt(request.getParameter("num")); 

BoardDBBean dbPro =  BoardDBBean.getInstance();
BoardDataBean article =  dbPro.updateGetArticle(num);
%>
<div id ="editForm" class= "box">
<ul>
 <li><p class="center">글수정
      <li><label for="subject">제목</label>
          <input id="subject" name="subject" type="text" 
          value="<%=article.getSubject()%>">
          <input type="hidden" id="num" value="<%=num%>">
      <li><label for="content">내용</label>
          <textarea id="content" rows="13" 
            cols="50"><%=article.getContent()%></textarea>
      <li><label for="passwd">비밀번호</label>
          <input id="passwd" name="passwd" type="password" 
         		placeholder="6~16자 숫자/문자" maxlength="16">
      <li class="label2">
          <button id="update">수정</button>
          <button id="cancle">취소</button>
</ul>
</div>

