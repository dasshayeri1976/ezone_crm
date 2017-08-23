<%@page import="java.sql.*"%>
<%@page import="com.connection.ezonecrm.*"%>
<%@page import="com.helper.aimt.*"%>
<%
	String modelcode=request.getParameter("modelcode");
	String modelname=request.getParameter("modelname");
	String brandname=request.getParameter("brandname");
	String productname=request.getParameter("productname");
    
   
    
 	//String buffer="Place Added Successfully";
 	String buffer="<select><option value=''></option>";
 	try
 		{
 			//System.out.println("Avi");
 			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn); 
			
			
			
			String sql = "select * from brand_master where brand_name='"+brandname+"'";
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
			
			sql = "select * from product_master where product_name='"+productname+"'";
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
			
			int k12=0;
			try
			{
			ResultSet rs = stm.executeQuery("Select * from model_master where model_name like '%"+modelname+"%'");
 			//System.out.println("Select * from jobwork_entry where brand like '%"+trancode+"%'");
			while(rs.next())
				{
					k12=1;
		 			
				}
			}
			catch(Exception e)
			{
				
			}
			if(k12==0)
			{
 			 
			sql = "insert into model_master(model_code,model_name,brand_code,product_code) values ('"
					+ modelcode /* "ST000"+(k+1)  */
					+ "','"
					+ modelname
					+ "','"
					+ k
					+ "','"
					+ k1
					+"');";
			
			ConnectionDAO.executeUpdate(stm, sql);
			}
			
			ResultSet rs = stm.executeQuery("select * from model_master");     
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
				x0="MC"+"0000"+j;
				if(k22==2)
				x0="MC"+"000"+j;
				if(k22==3)
				x0="MC"+"00"+j;
				if(k22==4)
				x0="MC"+"0"+j;
				if(k22==5)
					x0="MC"+j;
				
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
			x="Model is already in our database";
			else
			x="Model Save Successfully";
					 
 			response.getWriter().println(buffer+"|"+x+"|"+x0); 
 			conn.close();
 			
 			//System.out.println(buffer+"|"+"Model Save Successfully");
 		}
 	catch(Exception e)
 		{
     		System.out.println(e);
 		}
 %>