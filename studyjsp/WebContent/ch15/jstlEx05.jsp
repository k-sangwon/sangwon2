<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="../css/style.css"/>

<h3>JSTL core 태그예제 - import / jsp의 include액션태그와 비슷한 기능</h3>

<c:import url="/ch05/main.jsp" var="url"/>
${url} <!--  el 은  jsp에서 제공 -->