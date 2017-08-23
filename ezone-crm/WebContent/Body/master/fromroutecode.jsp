<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="com.connection.ezonecrm.*"%>

<%
try
{
	String a=request.getParameter("fromPlaceName");
	
	String a1[]=a.split(",");
	
	System.out.println("From Place names: "+a);
	
	String x="";
	
	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn); 
	
	
	System.out.println("Length: "+a1.length);
	
	if(a1.length>1)
	{
		 for(int i=0;i<a1.length;i++)
		  {
			  ResultSet rs=stm.executeQuery("select place_code from place_master where place_name='"+a1[i].trim()+"'");
				while(rs.next())
				{
					x=x+", "+rs.getString(1);
					x=rs.getString(1); 
				}
		  }
	}
	
	else
	{
		ResultSet rs=stm.executeQuery("select place_code from place_master where place_name='"+a.trim()+"'");
		
		while(rs.next())
		{
			x=rs.getString(1);
			System.out.println("From place codes: "+x);
		}
	
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



