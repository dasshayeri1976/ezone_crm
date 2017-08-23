<%@page import="java.sql.*"%>
<%@page import="com.connection.ezonecrm.*"%>
<%

	String name=request.getParameter("customername");  
	//String dd =request.getParameter("sec");
	
//System.out.println(dd);

	String buffer="";
 	
 	try
 		{
 			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn); 
 			 
 			String address="",pmobile="",omobile="",email="";
 			
 			String sql="select res_address,personal_mobileno,office_mobileno,email_id from customer_master where customer_name ='"+name+"'";
 			

 	        System.out.println("BKV TEST "+sql);
 	        
 	        
 			
 			ResultSet rs = stm.executeQuery(sql);
			if(rs.next())
				{
					address= rs.getString(1);
					pmobile= rs.getString(2);
					omobile= rs.getString(3);
					email= rs.getString(4);			
					buffer=address+"`"+pmobile+"`"+omobile+"`"+email;
				}

 			response.getWriter().println(buffer); 
 			conn.close();
 		}
 	catch(Exception e)
 		{
     		System.out.println(e);
 		}
 %>