<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bbs.board.BoardDBBean" %>
<%@ page import = "bbs.board.BoardDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="../css/style.css"/>
<script src="../js/jquery-1.11.0.min.js"></script>
<script src="list.js"></script>

<% request.setCharacterEncoding("utf-8");%>
<%
String id = "";
//int pageSize = 3;
SimpleDateFormat sdf = 
new SimpleDateFormat("yyyy-MM-dd HH:mm");// 날짜데이터 표시형식 지정
//String pageNum = request.getParameter("pageNum");
//if (pageNum == null)
 //   pageNum = "1";

int count = 0;//전체글의 수
//int currentPage = Integer.parseInt(pageNum);
    
List<BoardDataBean> articleList = null;//
BoardDBBean dbPro = BoardDBBean.getInstance();
count = dbPro.getArticleCount();//

/*if(count == (currentPage-1)*pageSize)
   currentPage -=1;
  
int startRow = (currentPage - 1) * pageSize + 1;


  if(articleList.isEmpty())
    count = 0;
*/
try{
  if(count > 0)
    articleList = dbPro.getArticles();
  
}catch(Exception e){}
%>


<div id="list_head" class="box2">
   <h3 class="inline">글목록</h3>
   <button id="new">글쓰기</button>
</div>

<% if (count == 0){//게시판에 글이 없는 경우%>
<div id="list_article" class="box2">
  <ul>
    <li><p>게시판에 저장된 글이 없습니다.</p>
  </ul>
</div>
<%}else{//게시판에 글이 있는 경우%>
<div id="list_article" class="box2">
<% 
//out.println(articleList.size()); 
//글목록을 반복처리
  for (int i = 0 ; i < articleList.size() ; i++) {
     BoardDataBean article = articleList.get(i);
%>
   <ul class="article">  
    <li class="layout_f">
     <%String writer = article.getWriter();
       out.println(writer.substring(0, 4) + "****");
     %>
    <li class="layout_f">
     <%
	 int wid=0; 
	 if(article.getRe_level()>0){
	    wid=5*(article.getRe_level());
	 %>
	    <img src="../images/level.gif" width="<%=wid%>">
	    <img src="../images/re.gif">
	<%}else{%>
	   <img src="../images/level.gif" width="<%=wid%>" height="16">
	<%}%>
	
	<% int num = article.getNum();
	   int ref = article.getRef();
	   int re_step = article.getRe_step();
	   int re_level = article.getRe_level();
	%>
	<%=article.getSubject()%>
	<p class="date"><%=sdf.format(article.getReg_date())%><br>
	<pre><%=article.getContent()%></pre><br>
	<%try{
    	id = (String)session.getAttribute("id");
      }catch(Exception e){}%>
	<%if(id.equals(writer)) {%>
	  <button id="edit" 
	   name="<%=num%>" onclick="edit(this)">수정</button>
	  <button id="delete" 
	   name="<%=num%>" onclick="del(this)">삭제</button>
	<%}else{ %>
	  <button id="reply" 
	   name="<%=num+","+ref+","+re_step+","+re_level%>" 
	  onclick="reply(this)">댓글쓰기</button>
	<%}%>
  </ul>
<%}%>
</div>
<%}%>