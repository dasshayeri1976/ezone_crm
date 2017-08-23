<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="com.connection.ezonecrm.*"%>

<%
try
{

	 String b=request.getParameter("toPlaceName");  // to route name
	
	String buffer=""; // to create the AJAX response 

	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn); 
	
	String sql="select place_code from place_master where place_name like '%" +b.trim()+"%' ";
	
	String toPlaceCode="";
	
	ResultSet rs2=stm.executeQuery(sql);
	
	while(rs2.next())
	{
		toPlaceCode = rs2.getString(1);
		buffer=toPlaceCode;
	} 
	 response.getWriter().println(buffer);  // send AJAX response back to the caller
	
	conn.close();
}
catch(Exception d) 
{
	d.printStackTrace();
	System.out.println("error found on:- "+d);
}
%>



