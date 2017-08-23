<%@page import="java.sql.*"%>
<%@page import="com.connection.ezonecrm.*"%>
<%@page import="com.helper.aimt.*"%>
<%
	String brandcode=request.getParameter("brandcode");
	String brandname=request.getParameter("brandname");
	String companyname=request.getParameter("companyname");
	
    
   
    
 	//String buffer="Place Added Successfully";
 	String buffer="<select><option value=''></option>";
 	try
 		{
 			//System.out.println("Avi");
 			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn); 
			
			String sql = "select * from company_master where Company_Name='"+companyname+"'";
			System.out.println(sql);
			String k1="";
			
			try 
			{
				ResultSet rs = stm.executeQuery(sql);
				while (rs.next()) 
					{								
						k1=rs.getString(2);								
					}
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			
			int k=0;
			ResultSet rs = stm.executeQuery("Select * from brand_master where brand_name like '%"+brandname+"%'");
 			//System.out.println("Select * from jobwork_entry where brand like '%"+trancode+"%'");
			while(rs.next())
				{
					k=1;
		 			
				}
			if(k==0)
			{
			sql = "insert into brand_master(brand_code,brand_name,company_code) values ('"
					+ brandcode /* "ST000"+(k+1)  */
					+ "','"
					+ brandname
					+ "','"
					+ k1
					+"');";
			
			ConnectionDAO.executeUpdate(stm, sql);
			}
			
			rs = stm.executeQuery("select * from brand_master");     
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
				x0="BR"+"0000"+j;
				if(k22==2)
				x0="BR"+"000"+j;
				if(k22==3)
				x0="BR"+"00"+j;
				if(k22==4)
				x0="BR"+"0"+j;
				if(k22==5)
					x0="BR"+j;
				
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
			if(k==1)
			x="Brand is already in our database";
			else
			x="Brand Save Successfully";
 			response.getWriter().println(buffer+"|"+x+"|"+x0); 
 			conn.close();
 			System.out.println("Brand Added Successfully");
 		}
 	catch(Exception e)
 		{
     		System.out.println(e);
 		}
 %>