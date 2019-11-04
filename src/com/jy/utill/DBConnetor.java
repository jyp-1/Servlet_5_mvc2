package com.jy.utill;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnetor {

	
	public static Connection getConnection() throws Exception {
		Connection con = null;
		
		//DB 접속
		//1. 로그인 4가지 정보 
		String user ="user12";
		String password ="user12";
		String url ="jdbc:oracle:thin:@211.238.142.39:1521:xe";
		String driver = "oracle.jdbc.driver.OracleDriver";

		//2. driver를 메모리에 로딩과정 
		Class.forName(driver);

		//3. 로그인 후 Connection 객체 반환 
		con = DriverManager.getConnection(url, user, password);
		
		return con;
		
	}
}
