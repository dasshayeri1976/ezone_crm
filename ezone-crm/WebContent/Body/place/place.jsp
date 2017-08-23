<%@page import="java.sql.*"%>
<%@page import="com.connection.ezonecrm.*"%>
<%@page import="com.helper.aimt.*"%>
<%
	String pcode=request.getParameter("pmcode");
	String name=request.getParameter("name");
	String pin=request.getParameter("pin");
	String city=request.getParameter("city");
    
   
    
 	//String buffer="Place Added Successfully";
 	String buffer="<select><option value=''></option>";
 	try
 		{
 			//System.out.println("Avi");
 			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn); 
			
			String sql = "select * from city_master where CITY_NAME='"+city+"'";
			String k="";
			
			try 
			{
				ResultSet rs = stm.executeQuery(sql);
				while (rs.next()) 
					{								
						k=rs.getString(2);								
					}
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			
			int k12=0;
			ResultSet rs = stm.executeQuery("Select * from place_master where place_name like '%"+name+"%'");
 			//System.out.println("Select * from jobwork_entry where brand like '%"+trancode+"%'");
			while(rs.next())
				{
					k12=1;
		 			
				}
			if(k12==0)
			{
 			 
			sql = "insert into place_master(place_code,place_name,postal_code,city_code) values ('"
					+ pcode /* "ST000"+(k+1)  */
					+ "','"
					+ name
					+ "','"
					+ pin
					+ "','"
					+ k
					+"');";
			
			ConnectionDAO.executeUpdate(stm, sql);
			}
			
			rs = stm.executeQuery("select * from place_master");     
				while(rs.next())
					{
						
						
						buffer=buffer+"<option value='"+rs.getString(3)+"'>"+rs.getString(3)+"</option>";
						
			 			
					}

								
	 			buffer=buffer+"</select>";
	 			
	 			int j=0;
	 			rs = stm.executeQuery("select * from uniqueid");
	 			//System.out.println("Select * from jobwork_entry where brand like '%"+trancode+"%'");
				while(rs.next())
					{
					j=rs.getInt(3);
					}
				
				int k22=String.valueOf(j).length();
				String x0="";
				if(k22==1)
				x0="PC"+"0000"+j;
				if(k22==2)
				x0="PC"+"000"+j;
				if(k22==3)
				x0="PC"+"00"+j;
				if(k22==4)
				x0="PC"+"0"+j;
				if(k22==5)
					x0="PC"+j;
				
				UniqueIDGenerator u = new UniqueIDGenerator(); 
				String xm=u.getUniqueID();
				sql = "insert into uniqueid(uid,sid) values ('"
						+ xm/* "DS000"+(k+1)  */
						+ "','"
						+ (j+1)
						+"');";
				
				ConnectionDAO.executeUpdate(stm, sql);
			
			ConnectionDAO.closeConnection(conn);
			
			String x="";
			if(k12==1)
			x="Place is already in our database";
			else
			x="Place Save Successfully";
					 
 			response.getWriter().println(buffer+"|"+x+"|"+x0); 
 			conn.close();
 			System.out.println("Place Added Successfully");
 		}
 	catch(Exception e)
 		{
     		System.out.println(e);
 		}
 %>