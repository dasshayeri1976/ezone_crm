 <%@page import="java.sql.*"%>
<%@page import="com.connection.ezonecrm.*"%>
<%

	String product=request.getParameter("product");  
	String brand=request.getParameter("brand");
	//String dd =request.getParameter("sec");
	System.out.println("In productbrandcode.jsp");

	String buffer="";
 	
 	try
 		{
 			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn); 
 			 
 			String s1="",s01="";
 			
 			//System.out.println("Select * from Time Where (Time) Not In (select a.Time from Time a join appoinment p on a.Time = p.Time where p.Branch='"+state+"' and p.Nxtappdate='"+dd+"'"+")");
 			ResultSet rs = stm.executeQuery("Select * from product_master where product_name ='"+product+"'");
			while(rs.next())
				{
					s01= rs.getString(2);
					
		 			
				}
			System.out.println("s01: "+s01);
			
			rs = stm.executeQuery("Select * from brand_master where brand_name ='"+brand+"'");
			while(rs.next())
				{
					s1= rs.getString(2);
					
		 			
				}
			System.out.println("s1: "+s1);
			
			buffer=s01+"-"+s1;
							
 			 
 			System.out.println("buffer: "+buffer);
 			response.getWriter().println(buffer); 
 			conn.close();
 		}
 	catch(Exception e)
 		{
     		System.out.println(e);
 		}
 %>