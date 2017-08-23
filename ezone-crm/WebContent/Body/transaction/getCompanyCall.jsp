<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="com.connection.ezonecrm.*"%>

<%
try
{
	//String a=request.getParameter("password");
	
	int x=0;
	
	//System.out.println("Password got: "+a);
	
	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn); 
		 
	 ResultSet rs=stm.executeQuery("select max(id) from jobwork_entry");
		while(rs.next())
				{
					x = rs.getInt(1);
					
				}
		
		x= x + 1;
	
		System.out.println("Serial ID got: "+x);
		
	response.getWriter().println(x); 
	conn.close();
}
catch(Exception d) 
{
	d.printStackTrace();
	System.out.println("error found on:- "+d);
}
%>