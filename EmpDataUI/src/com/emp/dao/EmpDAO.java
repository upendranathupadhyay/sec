package com.emp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class EmpDAO 
{
	public static final String DB_DRIVER = "com.mysql.jdbc.Driver";
	public static final String DB_URL = "jdbc:mysql://localhost:3306/mydb";
	public static final String DB_USER = "root";
	public static final String DB_PASS = "";
	private Connection con;
	static 
	{
		try 
		{
			Class.forName(DB_DRIVER);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	
	public Connection open() throws Exception 
	{
		con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
		return con;
	}
	
	public void close() 
	{
		try 
		{
			con.close();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
}
