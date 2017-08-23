<%@ page import="java.sql.*"%>
<%@ page import="com.connection.ezonecrm.*"%>

<%
String got=request.getParameter("count");
System.out.println("Count: "+got);
Connection conn = ConnectionDAO.getConnectionObject();
Statement stm = ConnectionDAO.createStatement(conn);
ResultSet rs,rs1,rs2;
String sql="",abc="",efgh="",sql1="",sql2="",city="",var1="",place="",place1="";
try
{
	sql="select * from customer_master where customer_name='"+got+"'";
	rs=stm.executeQuery(sql);
	while(rs.next())
	{
		abc=rs.getString(4)+"concat"+rs.getString(7)+"concat"+rs.getString(9);
		efgh=rs.getString(5);
	}
	sql1="select* from place_master where place_code='"+efgh+"'";
	rs1=stm.executeQuery(sql1);
	while(rs1.next())
	{
		
		city=abc+"concat"+rs1.getString(2)+"concat"+rs1.getString(3);
		place1=rs1.getString(5);
		//System.out.println(place1);
	}
	
	sql2="select * from city_master where CITY_CODE='"+place1.trim()+"'";
	rs2=stm.executeQuery(sql2);
	while(rs2.next())
	{
		place=city+"concat"+rs2.getString(3);		
	}
 System.out.println("Got: "+place);
	out.print(place);
}
catch(Exception error)
{
	error.printStackTrace();
}
%>