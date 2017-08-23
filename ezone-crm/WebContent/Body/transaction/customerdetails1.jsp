<%@page import="java.sql.*"%>
<%@page import="com.connection.ezonecrm.*"%>
<%

	String name=request.getParameter("customername");  
	//String dd =request.getParameter("sec");
	
//System.out.println(dd);

	String buffer="";
 	
 	try
 		{
 			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn); 
 			 
 			String address="",pmobile="",omobile="",email="",placeCode="",cityCode="",postalcode="";
 			
 			String districtCode="",placeName="",cityName="",districtName="";
 			
 		
 			
 			String sql="select res_address,personal_mobileno,res_mobileno,email_id,place_code from customer_master where customer_name ='"+name+"'";
 			
 			//System.out.println("SQL query for AJAX: "+sql);
 			
 			ResultSet rs = stm.executeQuery(sql);
			if(rs.next())
				{
					address= rs.getString(1);
					pmobile= rs.getString(2);
					omobile= rs.getString(3);
					email= rs.getString(4);			
					
					placeCode= rs.getString(5);
					
			
				}
			
			// fetch all place details
			
			//System.out.println("Place Code: "+email);
			
			sql="select city_code,place_name,postal_code from place_master where place_code ='"+placeCode+"'";
			
			//System.out.println(sql);
			
			 rs = stm.executeQuery(sql);
			
			 while(rs.next()){
					
				 cityCode=rs.getString(1);
					
					//System.out.println("city code: "+cityCode.trim());
					
					placeName=rs.getString(2); // buffer addition
					
					//System.out.println(placeName);
				
					postalcode=rs.getString(3); // buffer addition
					
					//System.out.println(postalcode);
				 
			 }
			 
			sql="select * from city_master where CITY_CODE ='"+cityCode.trim()+"'";
			rs = stm.executeQuery(sql);
			 
			//System.out.println(sql);
			
			while(rs.next()){
				
				cityName=rs.getString(3);  // will be added to buffer
				districtCode=rs.getString(4);
				
				//System.out.println("City: "+cityName);
				
				//System.out.println("District: "+districtCode);
				
				
			}
			
			
			sql="select * from district_master where DISTRICT_CODE ='"+districtCode+"'";
			rs = stm.executeQuery(sql);
			
			//System.out.println(sql);
			
			while(rs.next()){
				
				 districtName=rs.getString(3); // will be added to buffer
				
				//System.out.println(districtName);
					
				
			}
			
			
			buffer=address+"`"+pmobile+"`"+omobile+"`"+email+"`"+placeName+"`"+cityName+"`"+districtName+"`"+postalcode;

			//System.out.println("buffer ajax: "+buffer);
			
 			response.getWriter().println(buffer); 
 			conn.close();
 		}
 	catch(Exception e)
 		{
     		System.out.println(e);
 		}
 %>