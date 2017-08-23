<%@page import="java.sql.*"%>
<%@page import="com.connection.ezonecrm.*"%>
<%

	String state=request.getParameter("count");  
	//String dd =request.getParameter("sec");
	
System.out.println(state);

	String buffer="";
 	
 	try
 		{
 			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn); 
 			 
 			String s1="",s2="";
 			
 			//System.out.println("Select * from Time Where (Time) Not In (select a.Time from Time a join appoinment p on a.Time = p.Time where p.Branch='"+state+"' and p.Nxtappdate='"+dd+"'"+")");
 			ResultSet rs = stm.executeQuery("Select * from district_master where DISTRICT_NAME ='"+state.trim()+"'");
			while(rs.next())
				{
					s1= rs.getString(2);
					s2= rs.getString(4);
					System.out.println(s2);
					//if(s1.compareTo(dd)!=0)
					//buffer=buffer+(Integer.parseInt(s1)+1);
					//buffer=s1;
					//buffer=buffer+"</select>";  
		 			//response.getWriter().println(buffer); 
		 			
				}
			
				// System.out.println("Select * from state_master where STATE_CODE ='"+s2.trim()+"'");
			
			rs = stm.executeQuery("Select * from state_master where STATE_CODE ='"+s2.trim()+"'");
			while(rs.next())
				{
					s2= rs.getString(3);
					System.out.println("S2: "+s2);
					//if(s1.compareTo(dd)!=0)
					//buffer=buffer+(Integer.parseInt(s1)+1);
					buffer=s1+"-"+s2;
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