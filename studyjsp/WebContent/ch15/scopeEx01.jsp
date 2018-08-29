<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>Set in Scope Examples</title>
  </head>
<!-- 모든 스코프의 기본값은 page이다 -->
  <body>
    <c:set var="test" value="Page Level Value" scope="page" />

    <c:set var="test" value="Request Level Value" scope="request" />

    <c:set var="test" value="Session Level Value" scope="session" />

    <c:set var="test" value="Application Level Value" scope="application" />

    <table border="1">
<tr>
        <td>
          <b>Default Level</b>
        </td>

        <td>
          <c:out value="${test}" />
        </td>
      </tr>
      <tr>
        <td>
          <b>Page Level</b>
        </td>

        <td>
          <c:out value="${pageScope.test}" />
        </td>
      </tr>

      <tr>
        <td>
          <b>Request Level</b>
        </td>

        <td>
          <c:out value="${requestScope.test}" />
        </td>
      </tr>

      <tr>
        <td>
          <b>Session Level</b>
        </td>

        <td>
          <c:out value="${sessionScope.test}" />
        </td>
      </tr>

      <tr>
        <td>
          <b>Application Level</b>
        </td>

        <td>
          <c:out value="${applicationScope.test}" />
        </td>
      </tr>
      <tr>
        <td>
          <b>info</b>
        </td>

        <td>
          <a href="scopeinfo.jsp">테스트</a>
        </td>
      </tr>
    </table>
  </body>
</html>