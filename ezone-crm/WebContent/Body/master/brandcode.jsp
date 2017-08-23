<%@page import="java.sql.*"%>
<%@page import="com.connection.ezonecrm.*"%>
<%
	
	String brand=request.getParameter("brand");
	
    
 	//String buffer="Place Added Successfully";
 	String buffer="<select><option value=''></option>";
 	
 			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn); 
			
			String sql = "select * from brand_master where brand_name='"+brand+"'";
			String k="";
			
			try 
			{
				ResultSet rs = stm.executeQuery(sql);
				while (rs.next()) 
					{								
						k=rs.getString(2);								
					}
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			
			sql = "select * from model_master where brand_code like'%"+k+"%'";
			String k1="";
			System.out.println(sql);
			try 
			{
				ResultSet rs = stm.executeQuery(sql);
				while (rs.next()) 
					{								
										
						
						buffer=buffer+"<option value='"+rs.getString(3)+"'>"+rs.getString(3)+"</option>";
			 			
					}

								
	 			buffer=buffer+"</select>";
			
			ConnectionDAO.closeConnection(conn);
					 
 			response.getWriter().println(buffer); 
 			conn.close();
 			System.out.println("Model-b Added Successfully");
 		}
 	catch(Exception e)
 		{
     		System.out.println(e);
 		}
 %>