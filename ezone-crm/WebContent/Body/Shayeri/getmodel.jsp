<%@ page import="java.sql.*"%>
<%@ page import="com.connection.ezonecrm.*"%>

<%
String got=request.getParameter("count1");
//System.out.println("Count: "+got);
Connection conn = ConnectionDAO.getConnectionObject();
Statement stm = ConnectionDAO.createStatement(conn);
ResultSet rs,rs1;
String sql="",sql1="",modm="",prodm="",prodcode="";
try
{

	sql="select * from model_master where model_name='"+got.trim()+"'";
	rs=stm.executeQuery(sql);
	while(rs.next())
	{
		prodcode=rs.getString(5);
	}
	sql1="select * from product_master where product_code='"+prodcode.trim()+"'";
	rs1=stm.executeQuery(sql1);
	while(rs1.next())
	{
		prodm=prodcode+"concat"+rs1.getString(3);
	}
	System.out.println("Got: "+prodm);
	out.print(prodm);
}
catch(Exception error)
{
	error.printStackTrace();
}
%>