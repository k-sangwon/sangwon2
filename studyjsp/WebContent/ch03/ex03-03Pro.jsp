<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0" />

<%
	request.setCharacterEncoding("utf-8");
%>

<h2>for문 예제 - 임의의 값을 임의의 횟수로 곱하기</h2>
<%
	int number = Integer.parseInt(request.getParameter("number"));
	int num    = Integer.parseInt(request.getParameter("num"));

	long multiply = 1;

	for(int i = 0 ; i<num; i++){ 
		
	}
%>


<%= multiply %>