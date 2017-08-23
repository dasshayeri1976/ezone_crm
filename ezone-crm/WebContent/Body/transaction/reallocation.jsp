<%@page import="java.sql.*"%>
<%@page import="com.connection.ezonecrm.*"%>
<%
	String id=request.getParameter("id");
	
    
   
    
 	//String buffer="Place Added Successfully";
 	String buffer="<select name='formbean.engname'>";
 	try
 		{
 			//System.out.println("Avi");
 			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn); 
			
			String sql = "select * from jobwork_entry where id='"+id+"'";
			String k="",k1="",k2="";
			
			try 
			{
				ResultSet rs = stm.executeQuery(sql);
				while (rs.next()) 
					{								
						k=rs.getString(26);	
						k1=rs.getString(27);
						k2=rs.getString(36);
					}
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			buffer=buffer+"<option value='"+k+"'>"+k+"</option>";
			sql = "select * from engineer_master where engineer_name!='"+k+"'";
			
			
			try 
			{
				ResultSet rs = stm.executeQuery(sql);
				while (rs.next()) 
					{								
					buffer=buffer+"<option value='"+rs.getString(3)+"'>"+rs.getString(3)+"</option>";								
					}
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
 			 
			

								
	 			buffer=buffer+"</select>";
				buffer=buffer+"|"+k1+"|"+"Paid Amount: "+k2;
			
			ConnectionDAO.closeConnection(conn);
					 
 			response.getWriter().println(buffer); 
 			conn.close();
 			System.out.println(buffer);
 		}
 	catch(Exception e)
 		{
     		System.out.println(e);
 		}
 %>