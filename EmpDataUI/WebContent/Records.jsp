<%@ page import="com.emp.dao.*" %>
<%@ page import="com.emp.integer.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*;" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Employee Data</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1.0">
		<style>
			label{
				font-family:sans-serif;
				display:block;
				margin:3px;
				padding-left: 60px;
				padding-top: 3px;
			}
			label.login{
				padding-left: 100px;
				margin-right: 50px;
			}
			span.reset{
				padding-left: 50px;
			}
			span.heading{
				font-family:cursive;
				font-style:italic;
				font-size:30px;
				padding-left:70px;
				padding-bottom: 20px;
				width:420px;
				position: absolute;
			}
			span.error{
				font-family:cursive;
				font-style:italic;
				font-size:30px;
				
				padding-bottom: 20px;
				width:480px;
				position: absolute;
			}
			span{
				font-size:20px;
				display:inline-block;
				width:120px;
			}
			div.wrapper{
				background-color: bisque;
				border-radius: 10px;
				padding: 20px;
				border-color: red;
				border-width: 3px;
				border-style: solid;
				width: 450px;
				height: 400px;
				margin: auto;
				position: absolute;
				top: 0;
				bottom: 0;
				left: 0;
				right: 0;
			}
			div.wrap{
				background-color: bisque;
				border-radius: 10px;
				padding: 20px;
				border-color: red;
				border-width: 3px;
				border-style: solid;
				width: 480px;
				height: 80px;
				margin: auto;
				position: absolute;
				top: 0;
				bottom: 0;
				left: 0;
				right: 0;
			}
			body{
				background-color: rgba(0,0,0,0,5);
			}
			input.btn {
				border: 0;
				background-color: #3bab53;
				width: 80px;
				height: 30px;
				font-size: 16px;
				color: white;
			}
		</style>	
	</head>
	<body>
		  <%PreparedStatement stmt,st2;
			ResultSet rs,rs1;
			//object of IntegerVerify class
			IntegerVerify iv=new IntegerVerify();
			//getting the input 
			String input=request.getParameter("text");
			//changing the input into integer
			int id=iv.getInt(input);
			//object of EmpDAO class
			EmpDAO emp=new EmpDAO();
			//creating connection to database
			Connection con=emp.open();
			//check if input is blank
			if(input.equals(""))	
			{
				//fetching all the records from emp table
				String sql = "SELECT * FROM EMP";
				stmt = con.prepareStatement(sql);
				rs = stmt.executeQuery();%>
				<div class='wrapper'><span class='heading'>Employee(s) Found : </span><br><br><br>
					<table>
						<%while(rs.next())
						{%>
						<tr><td><label>Employee Id	: </label></td><td><label><%=rs.getString(1)%></label></td></tr>
						<tr><td><label>Employee Name: </label></td><td><label><%=rs.getString(2)%></label></td></tr>
						<tr><td><label>Employee Department: </label></td><td><label><%=rs.getString(3)%></label></td></tr>
						<br>
						<%}%>
					</table>
				</div>
				<%
				//closing database connection
				emp.close();
			}
			//if input is not blank
			else 
			{
				//input is a string
				if(id==0)
				{
					//fetching records with name containing the input value
					st2 =con.prepareStatement("select * from emp where name like '%"+input+"%'");
					rs1=st2.executeQuery();
					//if no record exists
					if(!rs1.isBeforeFirst())
					{%>
						<div class='wrap'><span class='error'>No Records Found for NAME : <%=input %></span></div>
					<%}
					else
					{%>
						<div class='wrapper'><span class='heading'>Employee(s) Found : </span><br><br><br>
							<table>
								<%while(rs1.next())
									{%>
									<tr><td><label>Employee Id	: </label></td><td><label><%=rs1.getString(1)%></label></td></tr>
									<tr><td><label>Employee Name: </label></td><td><label><%=rs1.getString(2)%></label></td></tr>
									<tr><td><label>Employee Department: </label></td><td><label><%=rs1.getString(3)%></label></td></tr>
								<%}%>
							</table>
						</div>	
						<%
						//closing database connection
						emp.close();
					}
				}
				//input is a number
				else
				{
					//fetching records with id 
					st2 =con.prepareStatement("select * from emp where id=?");
					st2.setInt(1, id);
					rs1=st2.executeQuery();
					//if no record exists
					if(!rs1.isBeforeFirst())
					{%>
						<div class='wrap'><span class='error'>No Records Found for id : <%=id %></span></div>
					<%} 
					else
					{%>
						<div class='wrapper'><span class='heading'>Employee(s) Found : </span><br><br><br>
							<table>
								<%while(rs1.next())
								{%>
									<tr><td><label>Employee Id	: </label></td><td><label><%=rs1.getString(1)%></label></td></tr>
									<tr><td><label>Employee Name: </label></td><td><label><%=rs1.getString(2)%></label></td></tr>
									<tr><td><label>Employee Department: </label></td><td><label><%=rs1.getString(3)%></label></td></tr>
								<%}%>
							</table>
						</div>	
						
						<%
						//closing database connection
						emp.close();
					}
				}
			}%>
	</body>
</html>