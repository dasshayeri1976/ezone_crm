<%@page import="java.sql.*"%>
<%@page import="com.connection.ezonecrm.*"%>
<%

	String state=request.getParameter("count");  
	//String dd =request.getParameter("sec");
	
//System.out.println(dd);

	String buffer="";
 	
 	try
 		{
 			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn); 
 			 
 			String s1="";
 			
 			//System.out.println("Select * from Time Where (Time) Not In (select a.Time from Time a join appoinment p on a.Time = p.Time where p.Branch='"+state+"' and p.Nxtappdate='"+dd+"'"+")");
 			ResultSet rs = stm.executeQuery("Select * from model_master where model_name ='"+state+"'");
			while(rs.next())
				{
					s1= rs.getString(5);
					
		 			
				}
			//System.out.println(s2);
			
			rs = stm.executeQuery("Select * from product_master where product_code ='"+s1.trim()+"'");
			while(rs.next())
				{
					s1= rs.getString(3)+"||"+rs.getString(6)+"||"+rs.getString(7);
					
		 			
				}
			//System.out.println("s3: "+s3);
			buffer=s1;
 			 
 			System.out.println("buffer: "+buffer);
 			response.getWriter().println(buffer); 
 			conn.close();
 		}
 	catch(Exception e)
 		{
     		System.out.println(e);
 		}
 %>