<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HRD 쇼핑몰</title>
<link rel="stylesheet" href="hrd_shop.css">
</head>
<body>
<header>
<h1 id="header_h1">쇼핑몰 회원관리</h1>
</header>
<nav>
<a href="${pageContext.request.contextPath }/register">회원등록</a>
<a href="${pageContext.request.contextPath }/list">회원목록조회/수정</a>
<a href="${pageContext.request.contextPath }/saleList">회원매출조회</a>
<a href="${pageContext.request.contextPath }/">홈으로.</a>
</nav>