<%@page import="java.sql.*"%>
<%@page import="com.connection.ezonecrm.*"%>
<%@page import="com.helper.aimt.*"%>
<%
	
	String brandname=request.getParameter("id");
	
	
    
   
    
 	//String buffer="Place Added Successfully";
 	String buffer="<select><option value=''></option>";
 	try
 		{
 			//System.out.println("Avi");
 			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn); 
			
			String sql = "select NAME from user where ROLE='"+"ROLE_SERVICE"+"' and CALLTYPE!='"+"CARRY IN"+"' and BRANDNAME like '%"+brandname+"%'";
			System.out.println(sql);
			
						
			ResultSet rs = stm.executeQuery(sql);     
				while(rs.next())
					{
						
						
						buffer=buffer+"<option value='"+rs.getString(1)+"'>"+rs.getString(1)+"</option>";
						
			 			
					}

								
	 			buffer=buffer+"</select>";
	 			
			
			ConnectionDAO.closeConnection(conn);
		
 			response.getWriter().println(buffer); 
 			conn.close();
 			System.out.println("Engr Added Successfully");
 		}
 	catch(Exception e)
 		{
     		System.out.println(e);
 		}
 %>