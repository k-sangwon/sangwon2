<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html> 
   <head>
      <title>catch Tag Example</title>
   </head>

   <body>
      <c:catch var ="catchException">
         <% int x = 5/0;%>
      </c:catch>

      <c:if test = "${catchException != null}">
         <p>The exception is : ${catchException} <br />
         There is an exception: ${catchException.message}</p>
      </c:if>
   </body>
</html>