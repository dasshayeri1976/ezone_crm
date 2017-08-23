<%@page import="java.sql.*"%>
<%@page import="com.connection.ezonecrm.*"%>
<%

	String statecode=request.getParameter("statecode");  
	//String dd =request.getParameter("sec");
	
//System.out.println(dd);

	String buffer="0";
 	
 	try
 		{
 			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn); 
 			 
 			String s1="";
 			
 			//System.out.println("Select * from Time Where (Time) Not In (select a.Time from Time a join appoinment p on a.Time = p.Time where p.Branch='"+state+"' and p.Nxtappdate='"+dd+"'"+")");
 			ResultSet rs = stm.executeQuery("Select * from district_master where STATE_CODE like '%"+statecode+"%'");
 			System.out.println("Select * from district_master where STATE_CODE like '%"+statecode+"%'");
			while(rs.next())
				{
					//s1= rs.getString(2);
					//System.out.println(s1);
					//if(s1.compareTo(dd)!=0)
					//buffer=buffer+(Integer.parseInt(s1)+1);
					buffer="1";
					//buffer=buffer+"</select>";  
		 			//response.getWriter().println(buffer); 
		 			
				}

							
 			 
 			System.out.println("buffer: "+buffer);
 			response.getWriter().println(buffer); 
 			conn.close();
 		}
 	catch(Exception e)
 		{
     		System.out.println(e);
 		}
 %>