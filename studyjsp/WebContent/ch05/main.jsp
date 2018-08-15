<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<h1>홍길동</h1>
<jsp:forward page="templateTest.jsp">   <!-- 제어가 templateTest.jsp로 넘어가서 4, 9번라인은 효과가 없다. -->
  <jsp:param name="CONTENTPAGE" value="content.jsp"/>
</jsp:forward> 

<h1>홍길동</h1>