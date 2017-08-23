<%@page import="java.sql.*"%>
<%@page import="com.connection.ezonecrm.*"%>
<%

	String name=request.getParameter("count");  
	//String dd =request.getParameter("sec");
	
//System.out.println(name);
/*    String a= name.split(",");
   //System.out.println(name[0]+","+name[1]); */
	String buffer="";
   boolean result=false;
   String billno="",engstatus="";
   String bill="";
	//System.out.println("value: "+name);
 	try
 		{
 			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn); 
			
 		
 			
 			
 				String x2=name;
 		
 		   	 x2=x2.replaceAll("\\<.*?>", "");
 		   	 x2=x2.trim();
 		   	 //System.out.println("final1: "+x2);
 			  
 		   	String sql="select eng_status from jobwork_entry where companycall_id='"+x2+"' ";
           	//System.out.println(sql);
           	ResultSet rs1 = stm.executeQuery(sql);
           		while(rs1.next())
           			{
           				engstatus=rs1.getString(1);
           				//System.out.println(engstatus);
          			 }

		
 	
 			
 			 
 			 
 			String sql1 = "select id from bill_no where jobno='" + x2 + "'";
			 
			// System.out.println(sql1);
			ResultSet rs = stm.executeQuery(sql1);
			 while(rs.next())
			 {
				 bill=rs.getString(1);
			 }
			 //System.out.println("bill no: "+bill);
			 buffer=bill+","+engstatus;
			 //System.out.println("buffer check :"+buffer);
			out.print(buffer);
 			conn.close();
 		}
 	catch(Exception e)
 		{
     		System.out.println(e);
 		}
 %>