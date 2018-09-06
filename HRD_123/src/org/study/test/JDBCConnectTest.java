package org.study.test;

import java.net.ConnectException;
import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCConnectTest {

	public static Connection getConnection() throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection
				("jdbc:oracle:thin:@//localhost:1521/xe","sys as sysdba","kk12561256");
		return con;
	}
	public static void main(String[] args) {
	try {
		Connection con = getConnection();
		System.out.println(con.toString());
	}catch(Exception e) {
		e.printStackTrace();
	}
  }
}
