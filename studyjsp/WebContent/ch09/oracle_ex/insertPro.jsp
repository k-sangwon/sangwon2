<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<% request.setCharacterEncoding("utf-8");%>

<% 
   String idt = request.getParameter("idt");
   String passwd= request.getParameter("passwd");
   String name = request.getParameter("name");
   String addr = request.getParameter("addr");
   String tel = request.getParameter("tel");
   Timestamp register=new Timestamp(System.currentTimeMillis());

   Connection conn=null;
   PreparedStatement pstmt=null;
   String str="";
   
   try{
 	 String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
     String dbId="JAVA_TEST";
     String dbPass="1234";
 	 
 	 Class.forName("oracle.jdbc.driver.OracleDriver");
 	 conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
 	
 	 String sql= "insert into member values (?,?,?,?,?,?)";
 	 pstmt=conn.prepareStatement(sql);
 	 pstmt.setString(1,idt);
     pstmt.setString(2,passwd);
 	 pstmt.setString(3,name);
 	 pstmt.setTimestamp(4,register);
 	 pstmt.setString(5,addr);
 	 pstmt.setString(6,tel);
 	 pstmt.executeUpdate();
 	 
 	 out.println("member 테이블에 새로운 레코드를 추가했습니다.");

 	}catch(Exception e){ 
 		e.printStackTrace();
 		out.println("member 테이블에 새로운 레코드를 추가에 실패했습니다");
 	}finally{// 예외가 있든 없든 실행 할 것들
 		if(pstmt != null) 
 			try{pstmt.close();}catch(SQLException sqle){}
 		if(conn != null) 
 			try{conn.close();}catch(SQLException sqle){}
 	}
 %>