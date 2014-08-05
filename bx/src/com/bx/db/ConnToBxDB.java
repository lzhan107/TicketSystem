package com.bx.db;

import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

public class ConnToBxDB {
	public static Connection getBxConnection() throws ClassNotFoundException, SQLException
	{
		String driver ="com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/bx?useUnicode=true&characterEncoding=GBK";
	    String username = "root";
		String password = "";
		
		Class.forName(driver);
		Connection conn = (Connection) DriverManager.getConnection(url,username,password);
		
		return conn;
	}
}
