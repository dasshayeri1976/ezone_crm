<%@page import="java.sql.*"%>
<%@page import="com.connection.ezonecrm.*"%>
<%@page import="java.text.DecimalFormat"%>

<%
	String id=request.getParameter("id");
    DecimalFormat plain = new DecimalFormat("0.00");
    
    
 	//String buffer="Place Added Successfully";
 	String buffer="<table cellpadding='0' cellspacing='0' border='0' id='table' class='imagetable' style='width:100%' >"
 	+"<thead>"
 	+"<tr>"
 	+"<th><center>Date</center></th>"
	+"<th><center>Description</center></th>"
	+"<th><center>DrAmount</center></th>"
	+"<th><center>CrAmount</center></th>"
	+"</tr>"
	+"</thead>"
	+"<tbody>";
 	try
 		{
 			//System.out.println("Avi");
 			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn); 
			
			String sql = "select * from expance_table where companycall_Id='"+id+"'";
			String k0="",k="",k1="",k4="";
			String x="",x1="",x2="";
			String m="";
			double k2=0,k3=0,k5=0;
			
			try 
			{
				ResultSet rs = stm.executeQuery(sql);
				while (rs.next()) 
					{								
						k0=rs.getString(4);
						k=rs.getString(5);	
						k1=rs.getString(6);
						k4=rs.getString(7);
						
						k2=k2+Double.parseDouble(k);
						k5=k5+Double.parseDouble(k1);
						
						m=m+"<tr><td><center>"+k4+"</center></td><td><center>"+k0+"</center></td><td><center>"+plain.format(Double.parseDouble(k))+"</center></td><td><center>"+plain.format(Double.parseDouble(k1))+"</center></td></tr>";
						
					}
				 
				m=m+"<tr><td><center>Total</center></td><td><center>Expences</center></td><td><center>"+plain.format(k2)+"</center></td><td><center>"+plain.format(k5)+"</center></td></tr>";
				 
				 rs = stm.executeQuery("select * from jobwork_entry where companycall_Id='"+id+"'");
					while (rs.next()) 
						{								
							x=rs.getString(36);
							
							k3=Double.parseDouble(x)-k2;
							
							m=m+"<tr style='color:red'><td><center>Balance</center></td><td><center>Amount</center></td><td><center>"+plain.format(k3)+"</center></td><td><center></center></td></tr>";
							
						}
			
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