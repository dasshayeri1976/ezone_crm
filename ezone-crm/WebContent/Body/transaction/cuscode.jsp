<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="com.connection.ezonecrm.*"%>

<%
try
{
	String a=request.getParameter("cusname");
	
	String x="";
	
	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn); 
	
		ResultSet rs=stm.executeQuery("select customer_code from customer_master where customer_name='"+a.trim()+"'");
		
		while(rs.next())
		{
			x=rs.getString(1);
			//System.out.println("Customer code: "+x);
		}
		
	response.getWriter().println(x); 
	conn.close();
}
catch(Exception d) 
{
	d.printStackTrace();
	System.out.println("error found on:- "+d);
}
%>



