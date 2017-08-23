<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="com.connection.ezonecrm.*"%>

<%
try
{
	
	//System.out.println("Inside quotationApproved jsp page");
	
	String refId=request.getParameter("refid");
	
	//System.out.println("Password got: "+a);
	
	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn); 

	
	String sql="update jobwork_entry set quotation_approved='APPROVED' where customer_ref_id='"+refId+"' ";
	//String sql="insert jobwork_entry(quotation_approved) values('APPROVED') where customer_ref_id='"+refId+"'  ";
	
	
//	System.out.println(sql);
	
	String x = "success";
	
	boolean result = ConnectionDAO.executeUpdate(stm, sql);
	
	response.getWriter().println(x); 
	
	conn.close();
}
catch(Exception d) 
{
	d.printStackTrace();
	System.out.println("error found on:- "+d);
}
%>