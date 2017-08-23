<%@page import="java.sql.*"%>
<%@page import="com.connection.ezonecrm.*"%>
<%
	String slcode=request.getParameter("slcode");
	
    
   
    
 	//String buffer="Place Added Successfully";
 	String buffer="";
 	try
 		{
 			//System.out.println("Avi");
 			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn); 
			
			String sql = "select * from jobwork_entry where product_slno='"+slcode+"' and eng_status!='"+"CLOSE"+"'";
			int k=0;
			
			try 
			{
				ResultSet rs = stm.executeQuery(sql);
				while (rs.next()) 
					{								
						k=1;								
					}
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			
			if(k==0)
			{
				sql = "select * from jobwork_entry where product_slno='"+slcode+"'";
				
				
				try 
				{
					ResultSet rs = stm.executeQuery(sql);
					while (rs.next()) 
						{								
							k=2;								
						}
				} 
				catch (SQLException e) 
				{
					e.printStackTrace();
				}
			}
			

								
	 			buffer=""+k;
			
			ConnectionDAO.closeConnection(conn);
					 
 			response.getWriter().println(buffer); 
 			conn.close();
 			System.out.println("Model Added Successfully");
 		}
 	catch(Exception e)
 		{
     		System.out.println(e);
 		}
 %>