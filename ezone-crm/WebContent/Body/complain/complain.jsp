<%@page import="java.sql.*"%>
<%@page import="com.connection.ezonecrm.*"%>
<%@page import="com.helper.aimt.*"%>
<%
	String complaincode=request.getParameter("complaincode");
	String complainname=request.getParameter("complainname");
	
    
   
    
 	//String buffer="Place Added Successfully";
 	String buffer="";
 	try
 		{
 			//System.out.println("Avi");
 			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn); 
			
						
			int k=0;
			ResultSet rs = stm.executeQuery("Select * from complain_master where complain_name like '%"+complainname+"%'");
 			//System.out.println("Select * from jobwork_entry where brand like '%"+trancode+"%'");
			while(rs.next())
				{
					k=1;
		 			
				}
			if(k==0)
			{
			String sql = "insert into complain_master(complain_code,complain_name) values ('"
					+ complaincode /* "ST000"+(k+1)  */
					+ "','"
					+ complainname
					+"');";
			
			ConnectionDAO.executeUpdate(stm, sql);
			}
			
			
	 			
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
				x0="CC"+"0000"+j;
				if(k22==2)
				x0="CC"+"000"+j;
				if(k22==3)
				x0="CC"+"00"+j;
				if(k22==4)
				x0="CC"+"0"+j;
				if(k22==5)
					x0="CC"+j;
				
				UniqueIDGenerator u = new UniqueIDGenerator(); 
				String xm=u.getUniqueID();
				String sql = "insert into uniqueid(uid,sid) values ('"
						+ xm/* "DS000"+(k+1)  */
						+ "','"
						+ (j+1)
						+"');";
				
				ConnectionDAO.executeUpdate(stm, sql);
			
			
			ConnectionDAO.closeConnection(conn);
			String x="";
			if(k==1)
			x="Complain Details is already in our database";
			else
			x="Complain Details Save Successfully";
			buffer=x;
 			response.getWriter().println(buffer+"|"+x0); 
 			conn.close();
 			System.out.println("Brand Added Successfully");
 		}
 	catch(Exception e)
 		{
     		System.out.println(e);
 		}
 %>