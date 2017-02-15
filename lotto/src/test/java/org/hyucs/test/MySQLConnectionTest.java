package org.hyucs.test;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class MySQLConnectionTest {
	
	private static final String DRIVER = 
			// MySQL Driver 5 이하
			// "com.mysql.jdbc.Driver"
			// MySQL Driver 6 이상
			"com.mysql.cj.jdbc.Driver";

	private static final String URL = 
			// MySQL 5.6 이하
			// "jdbc:mysql://127.0.0.1:3306/book_ex";
			// MySQL 5.7 이상
			"jdbc:mysql://127.0.0.1:3306/lottodb?useSSL=false&serverTimezone=UTC";
	
	private static final String USER = "hyucs";
	private static final String PW = "hyucs";
	
	@Test
	public void testConnection() throws Exception {
		Class.forName(DRIVER);
		
		try(Connection con = DriverManager.getConnection(URL, USER, PW)) {
			System.out.println(con);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}


}
