<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="com.connection.ezonecrm.*"%>

<%
try
{
     String a=request.getParameter("count1");
	 String b=request.getParameter("count2");  // to route name
	
	String buffer=""; // to create the AJAX response 
	
	double distanceKm=0.0;
	double rateOwnVh=0.0;
	double rateComVh=0.0;
	double ratePubVh=0.0;
	
	String fromPlaceCode="";
	
	String toPlaceCode="";

	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn); 
	
	
	String sql3="select place_code from place_master where place_name = '"+a.trim()+"' ";
	
	ResultSet rs3=stm.executeQuery(sql3);
	
	while(rs3.next())
	{
		fromPlaceCode = rs3.getString(1);
	}
	
	String sql4="select place_code from place_master where place_name = '"+b.trim()+"' ";
	
	ResultSet rs4=stm.executeQuery(sql4);
	
	while(rs4.next())
	{
		toPlaceCode = rs4.getString(1);
	}
	
	
	String sql="select * from route_master where fromplace_code like '" +fromPlaceCode.trim()+"' and toplace_code like '"+toPlaceCode.trim()+"' ";
	
	ResultSet rs2=stm.executeQuery(sql);
	
	while(rs2.next())
	{
		distanceKm=rs2.getDouble(3);
		rateOwnVh=rs2.getDouble(4);
		rateComVh=rs2.getDouble(5);
		ratePubVh=rs2.getDouble(6);
		
		buffer= distanceKm + "-" + rateOwnVh + "-" + rateComVh + "-" + ratePubVh;
		
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



