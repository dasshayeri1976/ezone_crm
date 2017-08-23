<%@page import="java.sql.*"%>
<%@page import="com.connection.ezonecrm.*"%>

{"total":0,"rows":[
	
	<% 
 			
 			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn); 
			System.out.println("Avijit in spare");
			String sql = "select * from spare_master ";
			String k="",k1="";
			
			try 
			{
				ResultSet rs = stm.executeQuery(sql);
				while (rs.next()) 
					{								
						k=rs.getString(2);	
						k1=rs.getString(3);
						if(rs.isLast()==true)
						{
						
						%>
					
					{"itemid":"<%=k %>","productname":"<%=k1%>"}
					
					
					<%
						}
					else
					{
						%>
						{"itemid":"<%=k %>","productname":"<%=k1%>"},
						<%
					}
					}
			} 
 		
			catch (SQLException e) 
			{
				e.printStackTrace();
			}%>
	
	
	
	
	
	]}
