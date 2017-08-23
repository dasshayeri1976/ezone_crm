<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="com.connection.ezonecrm.*"%>

<%
try
{
	String a=request.getParameter("password");
	
	String x="";
	
	//System.out.println("Password got: "+a);
	
	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn); 
		 
	 ResultSet rs=stm.executeQuery("select distinct NAME from logins where PASSWORD='"+a+"'");
		while(rs.next())
				{
					x = rs.getString(1);
				}
				
		if(x == null || x == "")
		{
			x="No Match found";
		}
	
		//System.out.println("Username got: "+x);
		
	response.getWriter().println(x); 
	
	conn.close();
}
catch(Exception d) 
{
	d.printStackTrace();
	System.out.println("error found on:- "+d);
}
%>