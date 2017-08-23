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
 			 
 			String s1="",s01="",s2="",s3="",s4="",s5="",s6="";
 			
 			//System.out.println("Select * from Time Where (Time) Not In (select a.Time from Time a join appoinment p on a.Time = p.Time where p.Branch='"+state+"' and p.Nxtappdate='"+dd+"'"+")");
 			ResultSet rs = stm.executeQuery("Select * from place_master where place_name ='"+state+"'");
			while(rs.next())
				{
					s1= rs.getString(2);
					s01= rs.getString(4);
					s2= rs.getString(5);
					//System.out.println(s1);
					//if(s1.compareTo(dd)!=0)
					//buffer=buffer+(Integer.parseInt(s1)+1);
					//buffer=s1;
					//buffer=buffer+"</select>";  
		 			//response.getWriter().println(buffer); 
		 			
				}
			System.out.println(s2);
			
			rs = stm.executeQuery("Select * from city_master where CITY_CODE ='"+s2.trim()+"'");
			while(rs.next())
				{
					s3= rs.getString(3);
					s4= rs.getString(4);
					//System.out.println(s1);
					//if(s1.compareTo(dd)!=0)
					//buffer=buffer+(Integer.parseInt(s1)+1);
					//buffer=s1+"-"+s2;
					//buffer=buffer+"</select>";  
		 			//response.getWriter().println(buffer); 
		 			
				}
			System.out.println("s3: "+s3);
			
			rs = stm.executeQuery("Select * from district_master where DISTRICT_CODE ='"+s4.trim()+"'");
			while(rs.next())
				{
					s5= rs.getString(3);
					s6= rs.getString(4);
					//System.out.println(s1);
					//if(s1.compareTo(dd)!=0)
					//buffer=buffer+(Integer.parseInt(s1)+1);
					//buffer=s1+"-"+s2;
					//buffer=buffer+"</select>";  
		 			//response.getWriter().println(buffer); 
		 			
				}
			rs = stm.executeQuery("Select * from state_master where STATE_CODE ='"+s6.trim()+"'");
			while(rs.next())
				{
					s6= rs.getString(3);
					//s8= rs.getString(4);
					//System.out.println(s1);
					//if(s1.compareTo(dd)!=0)
					//buffer=buffer+(Integer.parseInt(s1)+1);
					buffer=s1+"-"+s3.trim()+"-"+s5.trim()+"-"+s6.trim()+"-"+s01;
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