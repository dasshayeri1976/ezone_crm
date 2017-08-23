<%@page import="java.sql.*"%>
<%@page import="com.connection.ezonecrm.*"%>
<%
	String id=request.getParameter("id");
	
    
   
    
 	//String buffer="Place Added Successfully";
 	String buffer="<table cellpadding='0' cellspacing='0' border='0' id='table' class='imagetable' style='width:75%' >"
 	+"<thead>"
 	+"<tr>"
	+"<th><center>Spare</center></th>"
	+"<th><center>Allocation</center></th>"
	+"<th><center>Return</center></th>"
	+"<th><center>Defect</center></th>"
	+"<th><center>Doa</center></th>"
	+"</tr>"
	+"</thead>"
	+"<tbody>";
 	try
 		{
 			//System.out.println("Avi");
 			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn); 
			
			String sql = "select * from spare_table where companycall_Id='"+id+"'";
			String k0="",k="",k1="",k2="",k3="",k4="";
			String x="",x1="",x2="";
			String m="";
			int i=1;
			try 
			{
				ResultSet rs = stm.executeQuery(sql);
				while (rs.next()) 
					{								
						k0=rs.getString(1);
						k=rs.getString(4);	
						k1=rs.getString(5);
						k2=rs.getString(6);	
						if(Integer.parseInt(k2)==1)
						x="checked";
						else
						x="";
						k3=rs.getString(7);	
						if(Integer.parseInt(k3)==1)
						x1="checked";
						else
						x1="";
						k4=rs.getString(8);	
						if(Integer.parseInt(k4)==1)
						x2="checked";
						else
						x2="";
						
						m=m+"<tr><td><center>"+k+"</center></td><td><center>"+k1+"</center></td><td><center><input type='checkbox' name='checked' value='"+k0+"' "+x+" onclick='check(this,"+i+");' class='"+"source"+i+"'></center></td><td><center><input type='checkbox' name='checked1' value='"+k0+"' "+x1+" onclick='check(this,"+i+");' class='"+"source"+i+"'></center></td><td><center><input type='checkbox' name='checked2' value='"+k0+"' "+x2+" onclick='check(this,"+i+");' class='"+"source"+i+"'></center></td></tr>";
						i++;
					}
				i=1;
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			m=m+"</table>";
			buffer=buffer+m;
			
			
			ConnectionDAO.closeConnection(conn);
					 
 			response.getWriter().println(buffer); 
 			conn.close();
 			System.out.println(buffer);
 		}
 	catch(Exception e)
 		{
     		System.out.println(e);
 		}
 %>