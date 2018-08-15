<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<%

     // 쿠키 객체 생성
    Cookie cookie = new Cookie("id", "kingdora");

	 // 쿠키 설정 : 유효 시간           
	cookie.setMaxAge(60*2);//120초  
   
	 // 클라이언트에 보낼 쿠키정보 추가
	response.addCookie(cookie);
   
   out.println("쿠키가 생성되었습니다.");
%>

<form method="post" action="useCookie.jsp">
   <table>
    <tr>
      <td><input type="submit" value="생성된 쿠키 확인">
  </table>
</form>