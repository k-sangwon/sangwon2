...<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0" />

<% request.setCharacterEncoding("utf-8");%>

<%      //checkbox에서 선택 된 항목의 값만 저장된다.
    String[] names = request.getParameterValues("favorite");
%>

<h2>request.getParameterValues 사용</h2>

<h2>헤더의 정보 표시</h2>
<%
int count = names.length;
for(int i =0; i<count;i++){
	out.println(names[i]+ "<br>");
}
%>
선택한개수는: <%= count%>