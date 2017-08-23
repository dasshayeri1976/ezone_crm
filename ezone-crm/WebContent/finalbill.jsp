<%@page import="java.sql.*"%>
<%@page import="com.connection.ezonecrm.*"%>
<%

	String name=request.getParameter("count");  
	//String dd =request.getParameter("sec");
	
//System.out.println(name);
/*    String a= name.split(",");
   System.out.println(name[0]+","+name[1]); */
	String buffer="";
   boolean result=false;
   String billno="",engstatus="",jobno="";
   String bill="";
	//System.out.println("value: "+name);
 	try
 		{
 			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn); 
			
 		   String x[]=name.split(",");
 			
 			//System.out.println("Split value:"+x[0]+","+x[1]);
 			String x2=x[1];
 		
 		    x2=x2.replaceAll("\\<.*?>", "");
 		    x2=x2.trim();
 		  //if(x2.equals)
 			  
 			  
 			  
                String sql="select eng_status from jobwork_entry where companycall_id='"+x2+"' ";
                //System.out.println(sql);
                ResultSet rs1 = stm.executeQuery(sql);
                while(rs1.next())
                {
                	engstatus=rs1.getString(1);
                	//System.out.println(engstatus);
                }
                sql="select jobno from bill_no where jobno='"+x2+"' ";
 			    //System.out.println(sql);
                rs1 = stm.executeQuery(sql);
                while(rs1.next())
                {
                	jobno=rs1.getString(1);
                }
 				 //System.out.println("global jobno: " +jobno);
 	
 			 if(x[0].equals("Yes")){
 			 
 			 
 				
 				if(!engstatus.equals("Product Delivered") && !jobno.equals(x2) )
 				{
 				
                
                
              	 sql="update jobwork_entry set eng_status='"+"Product Delivered"+"' where companycall_id='"+x2+"' ";
    			
					//System.out.println("SQL query for AJAX: "+sql);
	 
				result = ConnectionDAO.executeUpdate(stm, sql);
		       
                		
                		
				 sql="select max(id) from bill_no";
				 ResultSet rs = stm.executeQuery(sql);
				//System.out.println(sql);
					while(rs.next())
						{
					
							//System.out.println("max bill id: "+rs.getInt(1));
			
							billno=rs.getString(1);
						}
		 
					int a=0;
					a=Integer.parseInt(billno);
					a=a+1;
					String aa=""+a;
					sql="insert into bill_no(id,jobno) values('"+aa+"','"+x2+"')";
					//System.out.println(sql);
					result = ConnectionDAO.executeUpdate(stm,sql);
					
					sql="select id from bill_no where jobno='"+x2+"' ";
	 				 rs1 = stm.executeQuery(sql);
	 				while(rs1.next())
	 				{
	 					bill=rs1.getString(1);
	 				}
	 				 //System.out.println("bill no(yes if): "+bill);
					
		 
 			}	
 			else if(!engstatus.equals("Product Delivered") && jobno.equals(x2))
 			{
 				 
             	 sql="update jobwork_entry set eng_status='"+"Product Delivered"+"' where companycall_id='"+x2+"' ";
   			
					//System.out.println("SQL query for AJAX: "+sql);
	 
				result = ConnectionDAO.executeUpdate(stm, sql);
 				
 				sql="select id from bill_no where jobno='"+jobno+"' ";
 				 rs1 = stm.executeQuery(sql);
 				while(rs1.next())
 				{
 					bill=rs1.getString(1);
 				}
 				 //System.out.println("bill no(yes else): "+bill);
 		 	}
 	   }
 			 
 			 
 			 
 			 if(x[0].equals("No")){
 			 //System.out.println("job no:"+jobno);
 				if(!jobno.equals(x2))
 				{
 			 
 					 sql="select max(id) from bill_no";
 					 //System.out.println("no "+sql);
					ResultSet rs2 = stm.executeQuery(sql);
						while(rs2.next())
						{
								
							////System.out.println("max bill id: "+rs1.getInt(1));
			
							billno=rs2.getString(1);
						}
		 
						int a=0;
						a=Integer.parseInt(billno);
						
						a=a+1;
						//System.out.println("integer job no: "+a);
						String aa=""+a;
						sql="insert into bill_no(id,jobno) values('"+aa+"','"+x2+"')";
						//System.out.println(sql);
						result = ConnectionDAO.executeUpdate(stm,sql);
						
						sql="select id from bill_no where jobno='"+x2+"' ";
	 	 				 rs2 = stm.executeQuery(sql);
	 	 				while(rs2.next())
	 	 				{
	 	 					bill=rs2.getString(1);
	 	 				}
	 	 				 //System.out.println("bill no(if no): "+bill);
 				 }
 				else if(jobno.equals(x2))
 				{
 					sql="select id from bill_no where jobno='"+jobno+"' ";
 	 				 rs1 = stm.executeQuery(sql);
 	 				while(rs1.next())
 	 				{
 	 					bill=rs1.getString(1);
 	 				}
 	 				 //System.out.println("bill no(else no): "+bill);
 				}
 			 }
 			 
 			/* String sql1 = "select id from bill_no where jobno='" + x2 + "'";
			 
			 System.out.println(sql1);
			ResultSet rs = stm.executeQuery(sql1);
			 while(rs.next())
			 {
				 bill=rs.getString(1);
			 }
			 System.out.println("bill no: "+bill);*/
			out.print(bill); 
 			conn.close();
 		}
 	catch(Exception e)
 		{
     		System.out.println(e);
 		}
 %>