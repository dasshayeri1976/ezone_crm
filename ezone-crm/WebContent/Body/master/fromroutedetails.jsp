<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="com.connection.ezonecrm.*"%>

<%
try
{
	String a=request.getParameter("count");  // from route name
	
	String b=request.getParameter("count2");
	
	String buffer=""; // to create the AJAX response 
	
	
	double distanceKm=0.0;
	double rateOwnVh=0.0;
	double rateComVh=0.0;
	double ratePubVh=0.0;

	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn); 
	
	String sql="select place_code from place_master where place_name like '%" +a.trim()+"%' ";
	
	System.out.println(sql);
	
	String fromPlaceCode="";
	
	ResultSet rs=stm.executeQuery(sql);
	
	while(rs.next())
	{
		fromPlaceCode = rs.getString(1);
		//buffer+=fromPlaceCode;
		System.out.println("From place Code= "+fromPlaceCode);
	}
	
	String sql2="select place_code from place_master where place_name like '%" +b.trim()+"%' ";
	
	System.out.println(sql2);
	
	String toPlaceCode="";
	
	ResultSet rs2=stm.executeQuery(sql2);
	
	while(rs2.next())
	{
		toPlaceCode = rs2.getString(1);
	}
	
	//******
	String sql3="select * from route_master where fromplace_code like '" +fromPlaceCode.trim()+"' and toplace_code like '"+toPlaceCode.trim()+"'";
	
	ResultSet rs3=stm.executeQuery(sql3);
	
	while(rs3.next())
	{
		distanceKm=rs3.getDouble(3);
		rateOwnVh=rs3.getDouble(4);
		rateComVh=rs3.getDouble(5);
		ratePubVh=rs3.getDouble(6);
		
		buffer= distanceKm + "-" + rateOwnVh + "-" + rateComVh + "-" + ratePubVh;
		
	}
	
	//********
	
	System.out.println("Buffer= " + buffer);
	
	response.getWriter().println(buffer);  // send AJAX response back to the caller
	
	conn.close();
}
catch(Exception d) 
{
	d.printStackTrace();
	System.out.println("error found on:- "+d);
}
%>



