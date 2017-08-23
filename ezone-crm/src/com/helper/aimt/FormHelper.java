package com.helper.aimt;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import org.apache.commons.lang.StringUtils; 
import org.apache.poi.util.SystemOutLogger;

import com.opensymphony.xwork2.ActionContext;
import com.bean.aimt.FormBean;
import com.connection.ezonecrm.*;


public class FormHelper {
	
	public static List<FormBean> list1(String user) 
	{
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		// System.out.println(dateFormat.format(date));
		final String td = dateFormat.format(date);
		
		
		String sql="";
		
		
		List<FormBean> l1 = new ArrayList<FormBean>();
		
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		
		sql="select * from user where USERNAME='"+user+"'";
		String roll="",name="";
		try 
		{
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					

					roll=rs.getString(2);
					name=rs.getString(7);
					
				}
		} 
	catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		if(roll.compareTo("ROLE_ADMIN")==0)
		sql = "select brand,model_code,product_name,count(*) as total,count(if(eng_status = 'NA', eng_status, NULL)),count(if(eng_status = 'PENDING', eng_status, NULL)),count(if(eng_status = 'PENDING FOR PARTS', eng_status, NULL)),count(if(eng_status = 'CLOSE', eng_status, NULL)),sum(expence_given),sum(real_expence),SUM(expence_given - real_expence) from jobwork_entry group by brand,model_code,product_name";
		
		if(roll.compareTo("ROLE_RECEPTION")==0)
		sql = "select brand,model_code,product_name,count(*) as total,count(if(eng_status = 'NA', eng_status, NULL)),count(if(eng_status = 'PENDING', eng_status, NULL)),count(if(eng_status = 'PENDING FOR PARTS', eng_status, NULL)),count(if(eng_status = 'CLOSE', eng_status, NULL)),sum(expence_given),sum(real_expence),SUM(expence_given - real_expence) from jobwork_entry where user='"+user+"' group by brand,model_code,product_name";
		
		if(roll.compareTo("ROLE_SERVICE")==0)
		sql = "select brand,model_code,product_name,count(*) as total,count(if(eng_status = 'NA', eng_status, NULL)),count(if(eng_status = 'PENDING', eng_status, NULL)),count(if(eng_status = 'PENDING FOR PARTS', eng_status, NULL)),count(if(eng_status = 'CLOSE', eng_status, NULL)),sum(expence_given),sum(real_expence),SUM(expence_given - real_expence) from jobwork_entry where allocated_engr='"+name+"' group by brand,model_code,product_name";
			
		double k=0,k0=0,k1=0,k2=0,k3=0,k4=0,k5=0,k6=0;
		double m=0,m0=0,m1=0,m2=0,m3=0,m4=0,m5=0,m6=0;
		
		DecimalFormat plain = new DecimalFormat("0.00");
		
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				while (rs.next()) 
					{
						usBean = new FormBean();

						usBean.setBrandname(rs.getString(1));
						usBean.setMcode(rs.getString(2));
						usBean.setPcode(rs.getString(3));
						
						usBean.setAccid(rs.getString(4));
						k=k+Double.parseDouble(rs.getString(4));
						m=Double.parseDouble(rs.getString(4));
						
						usBean.setBrandcode(rs.getString(5));
						k0=k0+Double.parseDouble(rs.getString(5));
						m0=Double.parseDouble(rs.getString(5));
						
						usBean.setAdd(rs.getString(6));
						k1=k1+Double.parseDouble(rs.getString(6));
						m1=Double.parseDouble(rs.getString(6));
						
						usBean.setAddress(rs.getString(7));
						k2=k2+Double.parseDouble(rs.getString(7));
						m2=Double.parseDouble(rs.getString(7));
						
						usBean.setAddress2(rs.getString(8));
						k3=k3+Double.parseDouble(rs.getString(8));
						m3=Double.parseDouble(rs.getString(8));
						
						usBean.setAllocation(rs.getString(9));
						k4=k4+Double.parseDouble(rs.getString(9));
						m4=Double.parseDouble(rs.getString(9));
						
						usBean.setAmount(rs.getString(10));
						k5=k5+Double.parseDouble(rs.getString(10));
						m5=Double.parseDouble(rs.getString(10));
						
						usBean.setBname(rs.getString(11));
						k6=k6+Double.parseDouble(rs.getString(11));
						m6=Double.parseDouble(rs.getString(11));
						
					
						//System.out.println("print: "+rs.getString(2));
						
						l1.add(usBean);
					}
				
				usBean = new FormBean();

				usBean.setBrandname("");
				usBean.setMcode("");
				usBean.setPcode("");
				
				usBean.setAccid(""+k);
				usBean.setBrandcode(""+k0);		
				usBean.setAdd(""+plain.format(k1));
				
								
				usBean.setAddress(""+plain.format(k2));
							
				usBean.setAddress2(""+plain.format(k3));
								
				usBean.setAllocation(""+plain.format(k4));
							
				usBean.setAmount(""+plain.format(k5));
				
				usBean.setBname(""+plain.format(k6));
				
				
				
				//System.out.println("print: "+rs.getString(2));
				
				l1.add(usBean);
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}
	
	
		public static List<FormBean> frmplace() 
		{
			List<FormBean> l1 = new ArrayList<FormBean>();
			String sql = "select distinct place_name,place_code from place_master";
			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn);
			try 
				{
					ResultSet rs = stm.executeQuery(sql);
					FormBean usBean;
					usBean = new FormBean();
					usBean.setName("");
					l1.add(usBean);
									
					while (rs.next()) 
						{
							usBean = new FormBean();
							usBean.setName(rs.getString(1));
							l1.add(usBean);
						}
				} 
			catch (SQLException e) 
				{
					e.printStackTrace();
				}
			ConnectionDAO.closeConnection(conn);
			return l1;
		}
		public static List<FormBean> toplace() 
		{
			List<FormBean> l1 = new ArrayList<FormBean>();
			String sql = "select distinct place_name,place_code from place_master";
			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn);
			try 
				{
					ResultSet rs = stm.executeQuery(sql);
					FormBean usBean;
					
					usBean = new FormBean();
					usBean.setName("");
					l1.add(usBean);
					
					while (rs.next()) 
						{
							usBean = new FormBean();
							usBean.setFname(rs.getString(1));
							/*usBean.setBcode(rs.getString(2));*/  // To place code, Nilesh
							l1.add(usBean);
						}
				} 
			catch (SQLException e) 
				{
					e.printStackTrace();
				}
			ConnectionDAO.closeConnection(conn);
			return l1;
		}
		
		
		
		
		public static List<FormBean> routelist()
		{
			List<FormBean> l1 = new ArrayList<FormBean>();
			String sql = "select * from route_master";
			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn);
			try 
				{
					ResultSet rs = stm.executeQuery(sql);
					FormBean usBean;
					while (rs.next()) 
						{
							usBean = new FormBean();
							
							// added 8th March, Nilesh
							usBean.setId(rs.getInt(1));
							usBean.setName(frmPlaceName(rs.getString(2)));
							usBean.setFname(toPlaceName(rs.getString(3)));
							
							
							usBean.setDistance(rs.getString(4));
							
							usBean.setOwnvehicle(rs.getString(5));
							usBean.setCompanyvehicle(rs.getString(6));
							usBean.setPublictransport(rs.getString(7));
							usBean.setEdate(rs.getString(8));
							
							l1.add(usBean);
						}
				} 
			catch (SQLException e) 
				{
					e.printStackTrace();
				}
			ConnectionDAO.closeConnection(conn);
			return l1;
			
			
		}
		
		// edited 9th March, Nilesh
		public static FormBean routeedit(int id) {
			FormBean usBean = new FormBean();
			String sql = "select * from route_master where id = " + id;
			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn);
			
			try {			
				ResultSet rs = stm.executeQuery(sql);
				while (rs.next()) 
					{
					
					usBean.setId(rs.getInt(1));
					
					usBean.setName(frmPlaceName(rs.getString(2)));
					usBean.setFname(toPlaceName(rs.getString(3)));
					
					usBean.setDistance(rs.getString(4));
					usBean.setOwnvehicle(rs.getString(5));
					usBean.setCompanyvehicle(rs.getString(6));
					usBean.setPublictransport(rs.getString(7));
					usBean.setEdate(rs.getString(8));
							
					}
				} 
			catch (SQLException e) 
				{
					e.printStackTrace();
				}
		
				ConnectionDAO.closeConnection(conn);
				return usBean;
				}
		
		public static boolean routedelete(int id) {
			boolean result = false;
			String sql = "delete from route_master where id = " + id;
		
			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn);
			result = ConnectionDAO.executeUpdate(stm, sql);
			ConnectionDAO.closeConnection(conn);
			return result;
			}
		
		// Nilesh
		public static String frmPlaceName(String placeCode)
		{
			String x="";
			String xplace_name="";
			String sql = "select * from place_master where place_code like '%" +placeCode.trim()+"%' ";
			//System.out.println("\n"+sql);
			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn);
			try {			
				ResultSet rs = stm.executeQuery(sql);
				while (rs.next()) 
					{
						
					xplace_name =rs.getString(3);
					}
				//System.out.println("\n xplace_name: "+xplace_name);
				} 
			catch (SQLException e) 
				{
					e.printStackTrace();
				}
		
				ConnectionDAO.closeConnection(conn);
				
				return xplace_name;
		}
		
		public static String toPlaceName(String placeCode)
		{
			String y="";
			String yplace_name="";
			String sql = "select * from place_master where place_code  like '%" +placeCode.trim()+"%' ";
			//System.out.println("\n"+sql);
			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn);
			try {			
				ResultSet rs = stm.executeQuery(sql);
				while (rs.next()) 
					{
						
						yplace_name=rs.getString(3);
					}
				//System.out.println("\n To Place Name value= "+yplace_name);
				} 
			catch (SQLException e) 
				{
					e.printStackTrace();
				}
		
				ConnectionDAO.closeConnection(conn);
				/*return y;*/
				return yplace_name;
		}
		
		// added by Nilesh route master related FormHelper
		
		
		public static boolean routecreation(FormBean FormBean){
			
			boolean result = false;
			// Connect to database and save the FormBean object to database table
			String sql = null;
					
		
			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn);
				
				   // edited 9th March Nilesh
					if (FormBean.getId() != null) 
					{
						sql = "update route_master set fromplace_code ='"+FormBean.getAcode()+"',toplace_code ='"+FormBean.getBcode()+"',distance_km ='"+FormBean.getDistance()+"',rate_ov ='"+FormBean.getOwnvehicle()+"',rate_cv = '"+FormBean.getCompanyvehicle()+"',rate_pt = '"+FormBean.getPublictransport()+"',effective_date = '"+FormBean.getEdate()+"' where id ="+FormBean.getId();
											
						//System.out.println(sql);	
						result = ConnectionDAO.executeUpdate(stm, sql);

					}
					else
					{
						sql = "select * from route_master order by id";
						int k=0;
						
						try 
						{
							ResultSet rs = stm.executeQuery(sql);
							while (rs.next()) 
								{								
									k=rs.getInt(1);								
								}
						} 
					catch (SQLException e) 
						{
							e.printStackTrace();
						}
							
						// edited 9th March, Nilesh
						sql = "insert into route_master(fromplace_code,toplace_code,distance_km,rate_ov,rate_cv,rate_pt,effective_date) values ('"
								+ FormBean.getAcode() 
								+ "','"
								+ FormBean.getBcode()
								+ "','"
								+ FormBean.getDistance()
								+ "','"
								+ FormBean.getOwnvehicle()
								+"','"
								+ FormBean.getCompanyvehicle()
								+"','"
								+ FormBean.getPublictransport()
								+"','"
								+ FormBean.getEdate()
								+"');";
						
						result = ConnectionDAO.executeUpdate(stm, sql);
						
						
					}
					return result;
			
		}
	
	public static List<FormBean> dashboarddetails(FormBean usersBean,String user) {
		
				
		String s=(String)usersBean.getBname();
		String s1=(String)usersBean.getMcode();
		String s2=(String)usersBean.getFname();
		
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		
		String sql="select * from user where USERNAME='"+user+"'";
		String roll="",name="";
		try 
		{
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					

					roll=rs.getString(2);
					name=rs.getString(7);
					
				}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
			
		double k=0,k0=0,k1=0,k2=0,k3=0,k4=0,k5=0,k6=0;
		double m=0,m0=0,m1=0,m2=0,m3=0,m4=0,m5=0,m6=0;
		
		DecimalFormat plain = new DecimalFormat("0.00");
		
		
		//Statement s1= connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	    String query = "select brand,model_code,product_name,count(*) as total,count(if(eng_status = 'NA', eng_status, NULL)),count(if(eng_status = 'PENDING', eng_status, NULL)),count(if(eng_status = 'PENDING FOR PARTS', eng_status, NULL)),count(if(eng_status = 'CLOSE', eng_status, NULL)),sum(expence_given),sum(real_expence),SUM(expence_given - real_expence) from jobwork_entry";
	    if(s != null || s1 != null || s2 !=null){
	        query = query + " where ";
	    }
	   	   
	   
	    if(s != null && !"".equals(s)){
	        query = query + " brand='"+s+"' AND";
	    }
	    if(s1 != null && !"".equals(s1)){
	        query = query + " model_code='"+s1+"' AND";
	    }
	    if(s2 != null && !"".equals(s2)){
	        query = query + " product_name='"+s2+"' AND";
	    }
	    



	    if(query != null && query.indexOf("AND") != -1){
	        query = query.substring(0, query.length() -4);
	    }
	    
	    if(roll.compareTo("ROLE_ADMIN")==0)
		query = query+"group by brand,model_code,product_name";
		
	    if(roll.compareTo("ROLE_RECEPTION")==0)
	    query = query+" and user='"+user+"' group by brand,model_code,product_name";
			
		if(roll.compareTo("ROLE_SERVICE")==0)
		query = query+ " and allocated_engr='"+name+"' group by brand,model_code,product_name";
			
		
		List<FormBean> l1 = new ArrayList<FormBean>();
		//Double d = 0.00;
		
		try 
		{
		ResultSet rs = stm.executeQuery(query);
		FormBean usBean;
		while (rs.next()) {
			usBean = new FormBean();

			usBean.setBrandname(rs.getString(1));
			usBean.setMcode(rs.getString(2));
			usBean.setPcode(rs.getString(3));
			
			usBean.setAccid(rs.getString(4));
			k=k+Double.parseDouble(rs.getString(4));
			m=Double.parseDouble(rs.getString(4));
			
			usBean.setBrandcode(rs.getString(5));
			k0=k0+Double.parseDouble(rs.getString(5));
			m0=Double.parseDouble(rs.getString(5));
			
			usBean.setAdd(rs.getString(6));
			k1=k1+Double.parseDouble(rs.getString(6));
			m1=Double.parseDouble(rs.getString(6));
			
			usBean.setAddress(rs.getString(7));
			k2=k2+Double.parseDouble(rs.getString(7));
			m2=Double.parseDouble(rs.getString(7));
			
			usBean.setAddress2(rs.getString(8));
			k3=k3+Double.parseDouble(rs.getString(8));
			m3=Double.parseDouble(rs.getString(8));
			
			usBean.setAllocation(rs.getString(9));
			k4=k4+Double.parseDouble(rs.getString(9));
			m4=Double.parseDouble(rs.getString(9));
			
			usBean.setAmount(rs.getString(10));
			k5=k5+Double.parseDouble(rs.getString(10));
			m5=Double.parseDouble(rs.getString(10));
			
			usBean.setBname(rs.getString(11));
			k6=k6+Double.parseDouble(rs.getString(11));
			m6=Double.parseDouble(rs.getString(11));
			
			
			
			
			
			
			
			//System.out.println("print: "+rs.getString(2));
			
			l1.add(usBean);
		}
	
		usBean = new FormBean();

		usBean.setBrandname("");
		usBean.setMcode("");
		usBean.setPcode("");
		usBean.setAccid(""+k);
		usBean.setBrandcode(""+k0);		
		usBean.setAdd(""+plain.format(k1));
	
					
		usBean.setAddress(""+plain.format(k2));
				
		usBean.setAddress2(""+plain.format(k3));
					
		usBean.setAllocation(""+plain.format(k4));
				
		usBean.setAmount(""+plain.format(k5));
	
		usBean.setBname(""+plain.format(k6));
	
	
	
	//System.out.println("print: "+rs.getString(2));
	
		l1.add(usBean);

		
		
		
		} catch (SQLException e) {
		e.printStackTrace();
		}
		ConnectionDAO.closeConnection(conn);
		return l1;
		}
	
	public static List<FormBean> list2(String user) 
	{
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		// System.out.println(dateFormat.format(date));
		final String td = dateFormat.format(date);
		
		String sql="";
		
		List<FormBean> l1 = new ArrayList<FormBean>();
		
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		
		sql="select * from logins where USERNAME='"+user+"'";
		String roll="";
		try 
		{
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					

					roll=rs.getString(6);
					
				}
		} 
	catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		sql = "select brand,call_type,call_date,companycall_id,customer_name,address,phone_no,model_code,product_name,complain_code,eng_status,eng_remarks,datediff(now(),call_date) from jobwork_entry where allocated_engr='"+roll+"' and (eng_status!='"+"NA"+"' and eng_status!='"+"CLOSE"+"')";
		//System.out.println(sql);
		//double k=0,k1=0,k2=0,k3=0,k4=0,k5=0,k6=0,k7=0,k8=0,k9=0,k10=0,k11=0,k12=0,k13=0,k14=0,k15=0,k16=0,k17=0,k18=0,k19=0,k20=0;
		//double m=0,m1=0,m2=0,m3=0,m4=0,m5=0,m6=0;
		//System.out.println(sql);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				while (rs.next()) 
					{
						usBean = new FormBean();

						usBean.setBname(rs.getString(1));
						usBean.setCtype(rs.getString(2));
						usBean.setCdate(rs.getString(3));
						usBean.setScode(rs.getString(4));
						usBean.setName(rs.getString(5));
						usBean.setAddress(rs.getString(6));
						usBean.setPon(rs.getString(7));
						usBean.setMcode(rs.getString(8));
						usBean.setFname(rs.getString(9));
						usBean.setComcode(rs.getString(10));
						usBean.setEngstatus(rs.getString(11));
						usBean.setRemarks(rs.getString(12));
						usBean.setAllocation(rs.getString(13));
						
						
						l1.add(usBean);
					}
				
				
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}
	
	public static List<FormBean> callerdashboardlist(String brandname,String model,String product,String user) 
	{
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		// System.out.println(dateFormat.format(date));
		final String td = dateFormat.format(date);
		
		String sql="";
		
		List<FormBean> l1 = new ArrayList<FormBean>();
		
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		
		/*sql="select * from logins where USERNAME='"+user+"'";
		String roll="";
		try 
		{
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					

					roll=rs.getString(6);
					
				}
		} 
	catch (SQLException e) 
		{
			e.printStackTrace();
		}*/
		
		sql="select * from user where USERNAME='"+user+"'";
		String roll="",name="";
		try 
		{
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					

					roll=rs.getString(2);
					name=rs.getString(7);
					
				}
		} 
	catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		if(roll.compareTo("ROLE_ADMIN")==0)
		sql = "select brand,call_type,call_date,companycall_id,customer_name,address,phone_no,model_code,product_name,complain_code,allocated_engr,eng_status,eng_remarks,datediff(now(),call_date),expence_given,real_expence from jobwork_entry where brand='"+brandname+"' and model_code='"+model+"' and product_name='"+product+"' and eng_status='"+"PENDING"+"'";
		
		if(roll.compareTo("ROLE_RECEPTION")==0)
		sql = "select brand,call_type,call_date,companycall_id,customer_name,address,phone_no,model_code,product_name,complain_code,allocated_engr,eng_status,eng_remarks,datediff(now(),call_date),expence_given,real_expence from jobwork_entry where brand='"+brandname+"' and model_code='"+model+"' and product_name='"+product+"' and eng_status='"+"PENDING"+"' and user='"+user+"'";
		
		if(roll.compareTo("ROLE_SERVICE")==0)
		sql = "select brand,call_type,call_date,companycall_id,customer_name,address,phone_no,model_code,product_name,complain_code,allocated_engr,eng_status,eng_remarks,datediff(now(),call_date),expence_given,real_expence from jobwork_entry where brand='"+brandname+"' and model_code='"+model+"' and product_name='"+product+"' and eng_status='"+"PENDING"+"' and allocated_engr='"+name+"'";
			
		//System.out.println(sql);
		//double k=0,k1=0,k2=0,k3=0,k4=0,k5=0,k6=0,k7=0,k8=0,k9=0,k10=0,k11=0,k12=0,k13=0,k14=0,k15=0,k16=0,k17=0,k18=0,k19=0,k20=0;
		//double m=0,m1=0,m2=0,m3=0,m4=0,m5=0,m6=0;
		//System.out.println(sql);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				while (rs.next()) 
					{
						usBean = new FormBean();

						usBean.setBname(rs.getString(1));
						usBean.setCtype(rs.getString(2));
						usBean.setCdate(rs.getString(3));
						usBean.setScode(rs.getString(4));
						usBean.setName(rs.getString(5));
						usBean.setAddress(rs.getString(6));
						usBean.setPon(rs.getString(7));
						usBean.setMcode(rs.getString(8));
						usBean.setFname(rs.getString(9));
						usBean.setComcode(rs.getString(10));
						usBean.setAdd(rs.getString(11));
						usBean.setEngstatus(rs.getString(12));
						usBean.setRemarks(rs.getString(13));
						usBean.setAllocation(rs.getString(14));
						usBean.setExpencedetails(rs.getString(15));
						usBean.setCremarks(rs.getString(16));
						
						
						l1.add(usBean);
					}
				
				
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}
	
	public static List<FormBean> callerdashboardlist1(String brandname,String model,String product,String user) 
	{
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		// System.out.println(dateFormat.format(date));
		final String td = dateFormat.format(date);
		
		String sql="";
		
		List<FormBean> l1 = new ArrayList<FormBean>();
		
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		
		/*sql="select * from logins where USERNAME='"+user+"'";
		String roll="";
		try 
		{
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					

					roll=rs.getString(6);
					
				}
		} 
	catch (SQLException e) 
		{
			e.printStackTrace();
		}*/
		
		sql="select * from user where USERNAME='"+user+"'";
		String roll="",name="";
		try 
		{
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					

					roll=rs.getString(2);
					name=rs.getString(7);
					
				}
		} 
	catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		if(roll.compareTo("ROLE_ADMIN")==0)
		sql = "select brand,call_type,call_date,companycall_id,customer_name,address,phone_no,model_code,product_name,complain_code,allocated_engr,eng_status,eng_remarks,datediff(now(),call_date),expence_given,real_expence from jobwork_entry where brand='"+brandname+"' and model_code='"+model+"' and product_name='"+product+"' and eng_status='"+"PENDING FOR PARTS"+"'";
		
		if(roll.compareTo("ROLE_RECEPTION")==0)
		sql = "select brand,call_type,call_date,companycall_id,customer_name,address,phone_no,model_code,product_name,complain_code,allocated_engr,eng_status,eng_remarks,datediff(now(),call_date),expence_given,real_expence from jobwork_entry where brand='"+brandname+"' and model_code='"+model+"' and product_name='"+product+"' and eng_status='"+"PENDING FOR PARTS"+"' and user='"+user+"'";
		
		if(roll.compareTo("ROLE_SERVICE")==0)
		sql = "select brand,call_type,call_date,companycall_id,customer_name,address,phone_no,model_code,product_name,complain_code,allocated_engr,eng_status,eng_remarks,datediff(now(),call_date),expence_given,real_expence from jobwork_entry where brand='"+brandname+"' and model_code='"+model+"' and product_name='"+product+"' and eng_status='"+"PENDING FOR PARTS"+"' and allocated_engr='"+name+"'";
			
		
		//System.out.println(sql);
		//double k=0,k1=0,k2=0,k3=0,k4=0,k5=0,k6=0,k7=0,k8=0,k9=0,k10=0,k11=0,k12=0,k13=0,k14=0,k15=0,k16=0,k17=0,k18=0,k19=0,k20=0;
		//double m=0,m1=0,m2=0,m3=0,m4=0,m5=0,m6=0;
		//System.out.println(sql);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				while (rs.next()) 
					{
						usBean = new FormBean();

						usBean.setBname(rs.getString(1));
						usBean.setCtype(rs.getString(2));
						usBean.setCdate(rs.getString(3));
						usBean.setScode(rs.getString(4));
						usBean.setName(rs.getString(5));
						usBean.setAddress(rs.getString(6));
						usBean.setPon(rs.getString(7));
						usBean.setMcode(rs.getString(8));
						usBean.setFname(rs.getString(9));
						usBean.setComcode(rs.getString(10));
						usBean.setAdd(rs.getString(11));
						usBean.setEngstatus(rs.getString(12));
						usBean.setRemarks(rs.getString(13));
						usBean.setAllocation(rs.getString(14));
						usBean.setExpencedetails(rs.getString(15));
						usBean.setCremarks(rs.getString(16));
						
						
						l1.add(usBean);
					}
				
				
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}
	
	public static List<FormBean> callerdashboardlist2(String brandname,String model,String product,String user) 
	{
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		// System.out.println(dateFormat.format(date));
		final String td = dateFormat.format(date);
		
		String sql="";
		
		List<FormBean> l1 = new ArrayList<FormBean>();
		
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		
		/*sql="select * from logins where USERNAME='"+user+"'";
		String roll="";
		try 
		{
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					

					roll=rs.getString(6);
					
				}
		} 
	catch (SQLException e) 
		{
			e.printStackTrace();
		}*/
		
		sql="select * from user where USERNAME='"+user+"'";
		String roll="",name="";
		try 
		{
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					

					roll=rs.getString(2);
					name=rs.getString(7);
					
				}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		if(roll.compareTo("ROLE_ADMIN")==0)
		sql = "select brand,call_type,call_date,companycall_id,customer_name,address,phone_no,model_code,product_name,complain_code,allocated_engr,eng_status,eng_remarks,datediff(now(),call_date),expence_given,real_expence from jobwork_entry where brand='"+brandname+"' and model_code='"+model+"' and product_name='"+product+"' and eng_status='"+"CLOSE"+"'";
		
		if(roll.compareTo("ROLE_RECEPTION")==0)
		sql = "select brand,call_type,call_date,companycall_id,customer_name,address,phone_no,model_code,product_name,complain_code,allocated_engr,eng_status,eng_remarks,datediff(now(),call_date),expence_given,real_expence from jobwork_entry where brand='"+brandname+"' and model_code='"+model+"' and product_name='"+product+"' and eng_status='"+"CLOSE"+"' and user='"+user+"'";
		
		if(roll.compareTo("ROLE_SERVICE")==0)
		sql = "select brand,call_type,call_date,companycall_id,customer_name,address,phone_no,model_code,product_name,complain_code,allocated_engr,eng_status,eng_remarks,datediff(now(),call_date),expence_given,real_expence from jobwork_entry where brand='"+brandname+"' and model_code='"+model+"' and product_name='"+product+"' and eng_status='"+"CLOSE"+"' and allocated_engr='"+name+"'";
			
		
		//sql = "select brand,call_type,call_date,companycall_id,customer_name,address,phone_no,model_code,product_name,complain_code,allocated_engr,eng_status,eng_remarks,datediff(now(),call_date),expence_given,real_expence from jobwork_entry where allocated_engr='"+user+"' and eng_status='"+"CLOSE"+"'";
		//System.out.println(sql);
		//double k=0,k1=0,k2=0,k3=0,k4=0,k5=0,k6=0,k7=0,k8=0,k9=0,k10=0,k11=0,k12=0,k13=0,k14=0,k15=0,k16=0,k17=0,k18=0,k19=0,k20=0;
		//double m=0,m1=0,m2=0,m3=0,m4=0,m5=0,m6=0;
		//System.out.println(sql);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				while (rs.next()) 
					{
						usBean = new FormBean();

						usBean.setBname(rs.getString(1));
						usBean.setCtype(rs.getString(2));
						usBean.setCdate(rs.getString(3));
						usBean.setScode(rs.getString(4));
						usBean.setName(rs.getString(5));
						usBean.setAddress(rs.getString(6));
						usBean.setPon(rs.getString(7));
						usBean.setMcode(rs.getString(8));
						usBean.setFname(rs.getString(9));
						usBean.setComcode(rs.getString(10));
						usBean.setAdd(rs.getString(11));
						usBean.setEngstatus(rs.getString(12));
						usBean.setRemarks(rs.getString(13));
						usBean.setAllocation(rs.getString(14));
						usBean.setExpencedetails(rs.getString(15));
						usBean.setCremarks(rs.getString(16));
						
						
						l1.add(usBean);
					}
				
				
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}
	
	public static List<FormBean> callerdashboardlist0(String brandname,String model,String product,String user) 
	{
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		// System.out.println(dateFormat.format(date));
		final String td = dateFormat.format(date);
		
		String sql="";
		
		List<FormBean> l1 = new ArrayList<FormBean>();
		
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		
		/*sql="select * from logins where USERNAME='"+user+"'";
		String roll="";
		try 
		{
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					

					roll=rs.getString(6);
					
				}
		} 
	catch (SQLException e) 
		{
			e.printStackTrace();
		}*/
		
		sql="select * from user where USERNAME='"+user+"'";
		String roll="",name="";
		try 
		{
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					

					roll=rs.getString(2);
					name=rs.getString(7);
					
				}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		if(roll.compareTo("ROLE_ADMIN")==0)
		sql = "select brand,call_type,call_date,companycall_id,customer_name,address,phone_no,model_code,product_name,complain_code,allocated_engr,eng_status,eng_remarks,datediff(now(),call_date),expence_given,real_expence from jobwork_entry where brand='"+brandname+"' and model_code='"+model+"' and product_name='"+product+"' and eng_status='"+"NA"+"'";
		
		if(roll.compareTo("ROLE_RECEPTION")==0)
		sql = "select brand,call_type,call_date,companycall_id,customer_name,address,phone_no,model_code,product_name,complain_code,allocated_engr,eng_status,eng_remarks,datediff(now(),call_date),expence_given,real_expence from jobwork_entry where brand='"+brandname+"' and model_code='"+model+"' and product_name='"+product+"' and eng_status='"+"NA"+"' and user='"+user+"'";
		
		if(roll.compareTo("ROLE_SERVICE")==0)
		sql = "select brand,call_type,call_date,companycall_id,customer_name,address,phone_no,model_code,product_name,complain_code,allocated_engr,eng_status,eng_remarks,datediff(now(),call_date),expence_given,real_expence from jobwork_entry where brand='"+brandname+"' and model_code='"+model+"' and product_name='"+product+"' and eng_status='"+"NA"+"' and allocated_engr='"+name+"'";
			
		
		//sql = "select brand,call_type,call_date,companycall_id,customer_name,address,phone_no,model_code,product_name,complain_code,allocated_engr,eng_status,eng_remarks,datediff(now(),call_date),expence_given,real_expence from jobwork_entry where allocated_engr='"+user+"' and eng_status='"+"CLOSE"+"'";
		//System.out.println(sql);
		//double k=0,k1=0,k2=0,k3=0,k4=0,k5=0,k6=0,k7=0,k8=0,k9=0,k10=0,k11=0,k12=0,k13=0,k14=0,k15=0,k16=0,k17=0,k18=0,k19=0,k20=0;
		//double m=0,m1=0,m2=0,m3=0,m4=0,m5=0,m6=0;
		//System.out.println(sql);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				while (rs.next()) 
					{
						usBean = new FormBean();

						usBean.setBname(rs.getString(1));
						usBean.setCtype(rs.getString(2));
						usBean.setCdate(rs.getString(3));
						usBean.setScode(rs.getString(4));
						usBean.setName(rs.getString(5));
						usBean.setAddress(rs.getString(6));
						usBean.setPon(rs.getString(7));
						usBean.setMcode(rs.getString(8));
						usBean.setFname(rs.getString(9));
						usBean.setComcode(rs.getString(10));
						usBean.setAdd(rs.getString(11));
						usBean.setEngstatus(rs.getString(12));
						usBean.setRemarks(rs.getString(13));
						usBean.setAllocation(rs.getString(14));
						usBean.setExpencedetails(rs.getString(15));
						usBean.setCremarks(rs.getString(16));
						
						
						l1.add(usBean);
					}
				
				
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}
	
	public static List<FormBean> userlist() 
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
		String sql = "select * from logins order by Name asc";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try 
			{
				String x="";
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				while (rs.next()) 
					{
						usBean = new FormBean();

						usBean.setId(rs.getInt(1));
						usBean.setUsername(rs.getString(2));
						usBean.setUserpass(rs.getString(3));
						int k=rs.getInt(4);
						if(k==0)
						usBean.setUserstatus("Disable");
						else
						usBean.setUserstatus("Enable");	
						//usBean.setBranch(rs.getString(5));
						usBean.setName(rs.getString(6));
						usBean.setPon(rs.getString(7));
						usBean.setCtype(rs.getString(9));
						x=userroll(rs.getInt(1));
						usBean.setRoll(x);
						
						l1.add(usBean);
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}
	
	public static String  userroll(int x) 
	{
		String x1="";
		String sql = "select * from roles where ROLE_ID="+x;
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				
				while (rs.next()) 
					{
						x1=rs.getString(3);
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return x1;
	}

	public static boolean usercreation(FormBean FormBean) {
		boolean result = false;
		// Connect to database and save the FormBean object to database table
		String sql = null;
				
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
				
				if (FormBean.getId() != null) 
				{
					
					String brand= FormBean.getBname();
					//brand=brand.replaceAll(" ", "");
					String brand1[]=brand.split(",");
					
					sql = "update logins set USERNAME ='"+FormBean.getUsername()+"', PASSWORD = '"+FormBean.getUserpass()+"',NAME ='"+FormBean.getName()+"',ENABLED='"+FormBean.getUserstatus()+"',PHONE='"+FormBean.getPon()+"',CALLTYPE='"+FormBean.getCtype()+"',BRANDNAME='"+brand+"' where LOGIN_ID ="+FormBean.getId();
					//System.out.println(sql);	
					result = ConnectionDAO.executeUpdate(stm, sql);
					
					sql = "update roles set ROLE ='"+FormBean.getRoll()+"' where LOGIN_ID ="+FormBean.getId();
					//System.out.println(sql);	
					result = ConnectionDAO.executeUpdate(stm, sql);
					
					sql = "update loginstatus set UserName ='"+FormBean.getUsername()+"' where Loginid ="+FormBean.getId();
					//System.out.println(sql);	
					result = ConnectionDAO.executeUpdate(stm, sql);
					
					sql = "delete from usercompany where username='"+FormBean.getUsername()+"'";
					//System.out.println(sql);	
					result = ConnectionDAO.executeUpdate(stm, sql);
					
					String companycode="",companyname="";
					for(int i=0;i<brand1.length;i++)
					{
						try 
						{
							ResultSet rs = stm.executeQuery("select * from brand_master where brand_name='"+brand1[i].trim()+"'");
							while (rs.next()) 
								{
									
									companycode=rs.getString(4);
																		
									
								}
							
							rs = stm.executeQuery("select * from company_master where company_code='"+companycode.trim()+"'");
							while (rs.next()) 
								{
									
									companyname=rs.getString(3);
																		
									
								}
							
							//System.out.println("select * from company_master where company_code='"+companycode.trim()+"'");
							
							sql = "insert into usercompany(username,brand,company) values ('"
									+ FormBean.getUsername()
									+ "','"		
									+ brand1[i].trim()
									+ "','"
									+ companyname
									+"');";
							
							result = ConnectionDAO.executeUpdate(stm, sql);
							
							
						} 
					catch (SQLException e) 
						{
							e.printStackTrace();
						}
					}
				}
				else
				{
					
					sql = "select * from logins order by LOGIN_ID";
					int k=0;
					
					try 
					{
						ResultSet rs = stm.executeQuery(sql);
						while (rs.next()) 
							{
								
								k=rs.getInt(1);
								
							}
					} 
				catch (SQLException e) 
					{
						e.printStackTrace();
					}
					
					
					/*sql = "insert into idstatus(user,countlead) values ('"
							+ FormBean.getUsername()
							+ "','"		
							+ 0
							+"');";
					
					result = ConnectionDAO.executeUpdate(stm, sql);*/
					
					String brand= FormBean.getBname();
					brand=brand.replaceAll(" ", "");
					
					String brand1[]=brand.split(",");
					
					sql = "insert into logins(LOGIN_ID,USERNAME,PASSWORD,ENABLED,BRANCH,NAME,PHONE,COMPANY,CALLTYPE,BRANDNAME) values ('"
							+ (k+1)
							+ "','"		
							+ FormBean.getUsername()
							+ "','"
							+ FormBean.getUserpass()
							+ "','"
							+ FormBean.getUserstatus()
							+"','"
							+ "Park Circus"
							+ "','"		
							+ FormBean.getName()
							+ "','"
							+FormBean.getPon()
							+"','"
							+"CSS-CRM"
							+ "','"		
							+ FormBean.getCtype()
							+ "','"		
							+ brand
							+"');";
					
					result = ConnectionDAO.executeUpdate(stm, sql);
					
					sql = "insert into roles(ROLE_ID,LOGIN_ID,ROLE) values ('"
							+ (k+1)
							+ "','"		
							+ (k+1)
							+ "','"
							+ FormBean.getRoll()
							+"');";
					
					result = ConnectionDAO.executeUpdate(stm, sql);
					
					sql = "insert into loginstatus(SessionId,UserName,UserIp,Center,Loginid) values ('"
							+"abcd"
							+"','"
							+ FormBean.getUsername()
							+ "','"		
							+ "127.0.0.1"
							+ "','"
							+ "ParkCircus"
							+ "','"
							+ (k+1)
							+"');";
					
					result = ConnectionDAO.executeUpdate(stm, sql);
					
					String companycode="",companyname="";
					for(int i=0;i<brand1.length;i++)
					{
						try 
						{
							ResultSet rs = stm.executeQuery("select * from brand_master where brand_name='"+brand1[i]+"'");
							while (rs.next()) 
								{
									
									companycode=rs.getString(4);
																		
									
								}
							
							rs = stm.executeQuery("select * from company_master where company_code='"+companycode.trim()+"'");
							while (rs.next()) 
								{
									
									companyname=rs.getString(3);
																		
									
								}
							
							sql = "insert into usercompany(username,brand,company) values ('"
									+ FormBean.getUsername()
									+ "','"		
									+ brand1[i]
									+ "','"
									+ companyname
									+"');";
							
							result = ConnectionDAO.executeUpdate(stm, sql);
							
							
						} 
					catch (SQLException e) 
						{
							e.printStackTrace();
						}
					}
					
					
				}
				return result;
		}

	public static FormBean useredit(int id) {
		FormBean usBean = new FormBean();
		String sql = "select * from logins where LOGIN_ID = " + id;
		String sql1="select * from roles where LOGIN_ID = " + id;
		//String k="";
		//String sql1 = "select * from appoinment where id = " + id;
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try {
			
		ResultSet rs = stm.executeQuery(sql);
		while (rs.next()) 
		{
			usBean.setId(rs.getInt(1));
			usBean.setUsername(rs.getString(2));
			usBean.setUserpass(rs.getString(3));
			usBean.setUserstatus(rs.getString(4));
			//usBean.setBranchall(rs.getString(5));
			usBean.setName(rs.getString(6));
			usBean.setPon(rs.getString(7));
			usBean.setCtype(rs.getString(9));
			String s=rs.getString(10);
			s=s.replaceAll(", ", ",");
			usBean.setBname(s);
			
		}
		rs = stm.executeQuery(sql1);
		while (rs.next()) 
		{
			
			usBean.setRoll(rs.getString(3));
			
		}
		} 
		catch (SQLException e) 
		{
		e.printStackTrace();
		}
		
		ConnectionDAO.closeConnection(conn);
		return usBean;
		}
	
	public static boolean userdelete(int id) {
		boolean result = false;
		
		
		String sql = "delete from logins where LOGIN_ID = " + id;
		String sql1 = "delete from roles where LOGIN_ID = " + id;
		String sql2 = "delete from loginstatus where Loginid = " + id;
		
				
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		
		
		
		String username="";
		try 
		{
			ResultSet rs = stm.executeQuery("select * from login where id='"+id+"'");
			while (rs.next()) 
				{
					
					username=rs.getString(2);
														
					
				}
			
			
		} 
	catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		String sql3 = "delete from usercompany where username = '" + username+"'";
		result = ConnectionDAO.executeUpdate(stm, sql1);
		result = ConnectionDAO.executeUpdate(stm, sql2);
		result = ConnectionDAO.executeUpdate(stm, sql);
		result = ConnectionDAO.executeUpdate(stm, sql3);
		
		
		ConnectionDAO.closeConnection(conn);
		return result;
		}
	
	
	
//   Branch Related FormHelper	
	
	public static List<FormBean> branchlist() 
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
		String sql = "select * from branch_master";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				while (rs.next()) 
					{
						usBean = new FormBean();
						usBean.setId(rs.getInt(1));
						usBean.setScode(rs.getString(2));
						usBean.setName(rs.getString(3));
						usBean.setAddress(rs.getString(4));
						usBean.setCity(rs.getString(5));
						usBean.setDistrict(rs.getString(6));
						usBean.setPcode(rs.getString(7));
						usBean.setState(rs.getString(8));
						usBean.setCperson(rs.getString(9));
						usBean.setEmail(rs.getString(10));
						usBean.setPon(rs.getString(11));
						usBean.setMobile(rs.getString(12));
						
						l1.add(usBean);
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}	
	
	public static boolean branchcreation(FormBean FormBean) {
		boolean result = false;
		// Connect to database and save the FormBean object to database table
		String sql = null;
				
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
				
				if (FormBean.getId() != null) 
				{
				//	sql = "update branch_master set BRANCH_NAME ='"+FormBean.getName()+"', PASSWORD = '"+FormBean.getUserpass()+"',NAME ='"+FormBean.getName()+"',ENABLED='"+FormBean.getUserstatus()+"',PHONE='"+FormBean.getPon()+"' where LOGIN_ID ="+FormBean.getId();
					
					sql = "update branch_master set Branch_Name ='"+FormBean.getName()+"', contact_name ='"+FormBean.getCperson()+"' where id ="+FormBean.getId();
										
					//System.out.println(sql);	
					result = ConnectionDAO.executeUpdate(stm, sql);
					
					// sql = "update roles set ROLE ='"+FormBean.getRoll()+"' where ID ="+FormBean.getId();
					//System.out.println(sql);	
				//	result = ConnectionDAO.executeUpdate(stm, sql);
					
				//	sql = "update loginstatus set UserName ='"+FormBean.getUsername()+"' where Loginid ="+FormBean.getId();
				//	//System.out.println(sql);	
				//	result = ConnectionDAO.executeUpdate(stm, sql);
				}
				else
				{
					
					sql = "select * from branch_master order by id";
					int k=0;
					
					try 
					{
						ResultSet rs = stm.executeQuery(sql);
						while (rs.next()) 
							{
								
								k=rs.getInt(1);
								
							}
					} 
				catch (SQLException e) 
					{
						e.printStackTrace();
					}
					
					
				//	sql = "insert into idstatus(user,countlead) values ('"r selce
				//			+ FormBean.getUsername()
				//			+ "','"		
			//				+ 0
			//				+"');";
			//		result = ConnectionDAO.executeUpdate(stm, sql);
					
					sql = "insert into branch_master(Branch_code,Branch_Name,Address,City_code,District_code,State_code,Postal_code,contact_name,email_id,Phone_No,Mobile_No) values ('"
							+"BR000"+(k+1) 
							+ "','"
							+ FormBean.getName()
							+ "','"
							+ FormBean.getAddress()
							+ "','"
							+ FormBean.getCity()
							+ "','"
							+ FormBean.getDistrict()
							+ "','"
							+ FormBean.getState()
							+ "','"
							+ FormBean.getPcode()
							+ "','"
							+ FormBean.getCperson()
							+"','"
							+ FormBean.getEmail()
							+ "','"		
							+ FormBean.getPon()
							+ "','"
							+FormBean.getMobile()
							+"');";
					
					result = ConnectionDAO.executeUpdate(stm, sql);
				}
				return result;
		}
	
	public static FormBean branchedit(int id) {
		FormBean usBean = new FormBean();
		String sql = "select * from branch_master where id = " + id;
		//String sql1="select * from roles where LOGIN_ID = " + id;
		//String k="";
		//String sql1 = "select * from appoinment where id = " + id;
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try {
			
		ResultSet rs = stm.executeQuery(sql);
		while (rs.next()) 
		{
			usBean.setId(rs.getInt(1));
			usBean.setScode(rs.getString(2));
			usBean.setName(rs.getString(3));
			usBean.setAddress(rs.getString(4));
			usBean.setCity(rs.getString(5));
			usBean.setDistrict(rs.getString(6));
			usBean.setState(rs.getString(7));
			usBean.setPcode(rs.getString(8));
			usBean.setCperson(rs.getString(9));
			usBean.setEmail(rs.getString(10));
			usBean.setPon(rs.getString(11));
			usBean.setMobile(rs.getString(12));
						
		}
		} 
		catch (SQLException e) 
		{
		e.printStackTrace();
		}
		
		ConnectionDAO.closeConnection(conn);
		return usBean;
		}

	public static boolean branchdelete(int id) {
		boolean result = false;
		
		
		String sql = "delete from branch_master where id = " + id;
	
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		result = ConnectionDAO.executeUpdate(stm, sql);
		ConnectionDAO.closeConnection(conn);
		return result;
		}	
	
//  State Master Related FormHelper
	
	public static List<FormBean> statelist() 
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
		String sql = "select * from state_master";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				while (rs.next()) 
					{
						usBean = new FormBean();
						usBean.setId(rs.getInt(1));
						usBean.setScode(rs.getString(2));
						usBean.setName(rs.getString(3));
												
						l1.add(usBean);
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}	
	
	public static boolean statecreation(FormBean FormBean) {
		boolean result = false;
		// Connect to database and save the FormBean object to database table
		String sql = null;
				
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
				
				if (FormBean.getId() != null) 
				{
					sql = "update state_master set STATE_NAME ='"+FormBean.getName()+"' where STATE_ID ="+FormBean.getId();
										
					//System.out.println(sql);	
					result = ConnectionDAO.executeUpdate(stm, sql);

				}
				else
				{
					sql = "select * from state_master order by STATE_ID";
					int k = 0;					
					try 
					{
						ResultSet rs = stm.executeQuery(sql);
						while (rs.next()) 
							{								
								k=rs.getInt(1);								
							}
					} 
				catch (SQLException e) 
					{
						e.printStackTrace();
					}
										
					sql = "insert into state_master(STATE_CODE,STATE_NAME) values ('"
							+ FormBean.getScode() /* "ST000"+(k+1)  */
							+ "','"
							+ FormBean.getName()
							+"');";
					
					result = ConnectionDAO.executeUpdate(stm, sql);
				}
				return result;
		}
	
	public static FormBean stateedit(int id) {
		FormBean usBean = new FormBean();
		String sql = "select * from state_master where STATE_ID = " + id;
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try {			
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					usBean.setId(rs.getInt(1));
					usBean.setScode(rs.getString(2));
					usBean.setName(rs.getString(3));			
				}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
	
			ConnectionDAO.closeConnection(conn);
			return usBean;
			}

	public static boolean statedelete(int id) {
		boolean result = false;
		String sql = "delete from state_master where STATE_ID = " + id;
	
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		result = ConnectionDAO.executeUpdate(stm, sql);
		ConnectionDAO.closeConnection(conn);
		return result;
		}
//   District Master Related FormHelper //
	
	public static List<FormBean> districtlist() 
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
		String sql = "select * from district_master";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				while (rs.next()) 
					{
					usBean = new FormBean();
					usBean.setId(rs.getInt(1));
					usBean.setScode(rs.getString(2));
					usBean.setName(rs.getString(3));
					String cname=sname(rs.getString(4));
					//System.out.println("CName: "+cname);
					usBean.setSname(cname);	
					l1.add(usBean);
							
						
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}	
	
	public static boolean districtcreation(FormBean FormBean) {
		boolean result = false;
		// Connect to database and save the FormBean object to database table
		String sql = null;
				
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
				
				if (FormBean.getId() != null) 
				{
					sql = "update district_master set DISTRICT_NAME ='"+FormBean.getName()+"', DISTRICT_CODE ='"+FormBean.getScode()+"', STATE_CODE='"+FormBean.getPcode().trim()+"' where DISTRICT_ID ="+FormBean.getId();									
					//System.out.println(sql);	
					result = ConnectionDAO.executeUpdate(stm, sql);

				}
				else
				{
					sql = "select * from district_master order by DISTRICT_ID";
					int k=0;
					
					try 
					{
						ResultSet rs = stm.executeQuery(sql);
						while (rs.next()) 
							{								
								k=rs.getInt(1);								
							}
					} 
				catch (SQLException e) 
					{
						e.printStackTrace();
					}
										
					sql = "insert into district_master(DISTRICT_CODE,DISTRICT_NAME,STATE_CODE) values ('"
							+ FormBean.getScode() /* "DS000"+(k+1)  */
							+ "','"
							+ FormBean.getName()
							+ "','"
							+ FormBean.getPcode()
							+"');";
					
					result = ConnectionDAO.executeUpdate(stm, sql);
				}
				return result;
		}
	
	public static FormBean districtedit(int id) {
		FormBean usBean = new FormBean();
		String sql = "select * from district_master where DISTRICT_ID = " + id;
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try {			
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
				usBean.setId(rs.getInt(1));
				usBean.setScode(rs.getString(2));
				usBean.setName(rs.getString(3));
				usBean.setPcode(rs.getString(4));
				String cname=sname(rs.getString(4));
				usBean.setSname(cname);	
				}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
	
			ConnectionDAO.closeConnection(conn);
			return usBean;
			}

	public static boolean districtdelete(int id) {
		boolean result = false;
		String sql = "delete from district_master where DISTRICT_ID = " + id;
	
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		result = ConnectionDAO.executeUpdate(stm, sql);
		ConnectionDAO.closeConnection(conn);
		return result;
		}
	
//    City Master Related FormHelper //
	
	public static List<FormBean> citylist() 
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
		String sql = "select * from city_master";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				while (rs.next()) 
					{
						usBean = new FormBean();
						usBean.setId(rs.getInt(1));
						usBean.setScode(rs.getString(2));
						usBean.setName(rs.getString(3));
						String cname=districtcode(rs.getString(4));
						usBean.setSname(cname);	
						
						String sname=districtcode1(rs.getString(4));
						usBean.setState(sname);	
						l1.add(usBean);
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}	
	
	public static boolean citycreation(FormBean FormBean) {
		boolean result = false;
		// Connect to database and save the FormBean object to database table
		String sql = null;
				
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
				
				if (FormBean.getId() != null) 
				{
					sql = "update city_master set CITY_CODE ='"+FormBean.getScode()+"', CITY_NAME ='"+FormBean.getName()+"', DISTRICT_CODE ='"+FormBean.getSname()+"',DISTRICT_CODE='"+FormBean.getPcode()+"' where CITY_ID ="+FormBean.getId();
					//System.out.println(sql);	
					result = ConnectionDAO.executeUpdate(stm, sql);

				}
				else
				{
					sql = "select * from city_master order by CITY_ID";
					int k=0;
					
					try 
					{
						ResultSet rs = stm.executeQuery(sql);
						while (rs.next()) 
							{								
								k=rs.getInt(1);								
							}
					} 
				catch (SQLException e) 
					{
						e.printStackTrace();
					}
										
					sql = "insert into city_master(CITY_CODE,CITY_NAME,DISTRICT_CODE) values ('"
							+ FormBean.getScode() /* "DS000"+(k+1)  */
							+ "','"
							+ FormBean.getName()
							+ "','"
							+ FormBean.getPcode()
							+"');";
					
					result = ConnectionDAO.executeUpdate(stm, sql);
				}
				return result;
		}
	
	public static FormBean cityedit(int id) {
		FormBean usBean = new FormBean();
		String sql = "select * from city_master where CITY_ID = " + id;
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try {			
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
				usBean = new FormBean();
				usBean.setId(rs.getInt(1));
				usBean.setScode(rs.getString(2));
				usBean.setName(rs.getString(3));
				usBean.setPcode(rs.getString(4));
				String cname=districtcode(rs.getString(4));
				usBean.setSname(cname);	
				
				String sname=districtcode1(rs.getString(4));
				usBean.setState(sname);	
				}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
	
			ConnectionDAO.closeConnection(conn);
			return usBean;
			}

	public static boolean citydelete(int id) {
		boolean result = false;
		String sql = "delete from city_master where CITY_ID = " + id;
	
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		result = ConnectionDAO.executeUpdate(stm, sql);
		ConnectionDAO.closeConnection(conn);
		return result;
		}
	

//   Company Related FormHelper	
	
	public static List<FormBean> companyname() 
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
		String sql = "select * from company_master";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				
				usBean = new FormBean();
				usBean.setSname("");
				l1.add(usBean);
				
				while (rs.next()) 
					{
						usBean = new FormBean();
						usBean.setSname(rs.getString(3));
						usBean.setCompanyname(rs.getString(3));
						l1.add(usBean);
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}
	
	public static List<FormBean> companynameuser(String user) 
	{
		//System.out.println("output: "+user);
		List<FormBean> l1 = new ArrayList<FormBean>();
		String sql = "select DISTINCT company from usercompany where username='"+user+"'";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				
				usBean = new FormBean();
				usBean.setSname("");
				l1.add(usBean);
				
				while (rs.next()) 
					{
						usBean = new FormBean();
						usBean.setSname(rs.getString(1));
						usBean.setCompanyname(rs.getString(1));
						l1.add(usBean);
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}
	
	public static List<FormBean> calltypeuser(String user) 
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
		String sql = "select * from logins where username='"+user+"'";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				
				
				// added by Nilesh 31st March
				usBean = new FormBean();
				usBean.setCtype("CARRY IN");
				l1.add(usBean);
				// end of added
				
				
				/*while (rs.next()) 
					{
						
						String s=rs.getString(9);
						
						if(s.compareTo("ALL")==0)
						{
						usBean = new FormBean();
						usBean.setCtype("");
						l1.add(usBean);
						usBean = new FormBean();
						usBean.setCtype("CARRY IN");
						l1.add(usBean);
						usBean = new FormBean();
						usBean.setCtype("ON SITE");
						l1.add(usBean);
						
						
						
						}
						else
						{
							usBean = new FormBean();
							usBean.setCtype(s);
							
							l1.add(usBean);
						}
					}*/
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}
	
	
	
	public static List<FormBean> complainname() 
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
		String sql = "select * from complain_master";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				
				usBean = new FormBean();
				usBean.setComcode("");
				l1.add(usBean);
				
				while (rs.next()) 
					{
						usBean = new FormBean();
						usBean.setComcode(rs.getString(3));
						l1.add(usBean);
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}
	
	public static List<FormBean> customer() 
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
		//String sql = "select distinct customer_name from jobwork_entry";
		
		String sql= "select distinct customer_name from customer_master";
		
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				
				usBean = new FormBean();
				usBean.setName("");
				l1.add(usBean);
				
				while (rs.next()) 
					{
						usBean = new FormBean();
						usBean.setName(rs.getString(1));
						l1.add(usBean);
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}
	
	public static List<FormBean> modelname() 
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
		String sql = "select * from model_master";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				
				usBean = new FormBean();
				usBean.setMcode("");
				l1.add(usBean);
				
				while (rs.next()) 
					{
						usBean = new FormBean();
						usBean.setMcode(rs.getString(3));
						l1.add(usBean);
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}
	
	public static List<FormBean> statename() 
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
		String sql = "select * from state_master order by STATE_NAME";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				
				usBean = new FormBean();
				usBean.setSname("");
				l1.add(usBean);
				
				while (rs.next()) 
					{
						usBean = new FormBean();
						usBean.setSname(rs.getString(3));
						l1.add(usBean);
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}
	
	public static List<FormBean> districtname() 
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
		String sql = "select * from district_master";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				
				usBean = new FormBean();
				usBean.setSname("");
				l1.add(usBean);
				
				while (rs.next()) 
					{
						usBean = new FormBean();
						usBean.setSname(rs.getString(3));
						l1.add(usBean);
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}
	
	public static List<FormBean> cityname() 
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
		String sql = "select * from city_master";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				
				usBean = new FormBean();
				usBean.setSname("");
				l1.add(usBean);
				
				while (rs.next()) 
					{
						usBean = new FormBean();
						usBean.setSname(rs.getString(3));
						usBean.setCity(rs.getString(3));
						l1.add(usBean);
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}
	
	public static List<FormBean> productname() 
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
		String sql = "select * from product_master";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				
				usBean = new FormBean();
				usBean.setSname("");
				l1.add(usBean);
				
				while (rs.next()) 
					{
						usBean = new FormBean();
						usBean.setSname(rs.getString(3));
						usBean.setProductname(rs.getString(3));
						l1.add(usBean);
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}
	
	public static List<FormBean> brandname() 
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
		String sql = "select * from brand_master";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				
				usBean = new FormBean();
				usBean.setBname("");
				l1.add(usBean);
				
				while (rs.next()) 
					{
						usBean = new FormBean();
						usBean.setBname(rs.getString(3));
						usBean.setBrandname(rs.getString(3));
						l1.add(usBean);
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}
	
	public static List<FormBean> brandnameuser(String user) 
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
		String sql = "select * from usercompany where username='"+user+"'";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				
				usBean = new FormBean();
				usBean.setBname("");
				l1.add(usBean);
				
				while (rs.next()) 
					{
						usBean = new FormBean();
						usBean.setBname(rs.getString(3));
						usBean.setBrandname(rs.getString(3));
						l1.add(usBean);
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}
	
	public static List<FormBean> placename() 
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
		String sql = "select * from place_master";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				
				usBean = new FormBean();
				usBean.setSname("");
				l1.add(usBean);
				
				while (rs.next()) 
					{
						usBean = new FormBean();
						usBean.setSname(rs.getString(3));
						usBean.setPlace(rs.getString(3));
						l1.add(usBean);
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}
	
	
	
	public static List<FormBean> engname() 
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
		String sql = "select * from engineer_master";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				
				usBean = new FormBean();
				usBean.setSname("");
				l1.add(usBean);
				
				while (rs.next()) 
					{
						usBean = new FormBean();
						usBean.setEngname(rs.getString(3));
						l1.add(usBean);
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}
	
	
	public static List<FormBean> engnameuser(String user) 
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
		String sql = "select * from engineer_master";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				
				usBean = new FormBean();
				usBean.setSname("");
				l1.add(usBean);
				
				while (rs.next()) 
					{
						usBean = new FormBean();
						usBean.setEngname(rs.getString(3));
						l1.add(usBean);
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}

	
	public static List<FormBean> companylist() 
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
		String sql = "select * from company_master";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				while (rs.next()) 
					{
						usBean = new FormBean();
						usBean.setId(rs.getInt(1));
						usBean.setScode(rs.getString(2));
						usBean.setName(rs.getString(3));
						usBean.setAddress(rs.getString(4));
						usBean.setAddress2(rs.getString(5));
						usBean.setPon(rs.getString(6));
						usBean.setCperson(rs.getString(7));
						usBean.setMobile(rs.getString(8));
						usBean.setEmail(rs.getString(9));
						usBean.setRemarks(rs.getString(10));	
						
						l1.add(usBean);
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}	
	
	public static int companycreation(FormBean FormBean) {
		boolean result = false;
		int x=0;
		// Connect to database and save the FormBean object to database table
		String sql = null;
				
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
				
				if (FormBean.getId() != null) 
				{						
				//	sql = "update company_master set Company_Name ='"+FormBean.getName()+"', contact_name ='"+FormBean.getCperson()+"' where id ="+FormBean.getId(); 
											
					sql = "update company_master set Company_code ='"+FormBean.getScode()+"', Company_Name ='"+FormBean.getName()+"', Address1 ='"+FormBean.getAddress()+"',"+
					" Address2 ='"+FormBean.getAddress2()+"', Office_Phoneno ='"+FormBean.getPon()+"',Product_Support='"+FormBean.getRemarks()+"', CSM_Name ='"+FormBean.getCperson()+"',"+
					" Mobile_no ='"+FormBean.getMobile()+"', Email_id ='"+FormBean.getEmail()+"' where id ="+FormBean.getId();
														
					//System.out.println(sql);
					x=2;
					result = ConnectionDAO.executeUpdate(stm, sql);
				}
				else
				{					
					sql = "select * from company_master where Company_Name='"+FormBean.getName()+"'";
					
					
					try 
					{
						ResultSet rs = stm.executeQuery(sql);
						while (rs.next()) 
							{								
								x=1;
							}
						//System.out.println("X value: "+x);	
					} 
				catch (SQLException e) 
					{
						e.printStackTrace();
					}
					
					if(x==0)
					{
					sql = "insert into company_master(Company_code,Company_Name,Address1,Address2,Office_Phoneno,CSM_Name,Mobile_no,Email_id,Product_Support) values ('"
							+ FormBean.getScode()
							+ "','"
							+ FormBean.getName()
							+ "','"
							+ FormBean.getAddress()
							+ "','"
							+ FormBean.getAddress2()
							+ "','"
							+ FormBean.getPon()
							+ "','"
							+ FormBean.getCperson()
							+ "','"
							+ FormBean.getMobile()
							+ "','"
							+ FormBean.getEmail()
							+"','"
							+ FormBean.getRemarks()
							+"');";
					
							
							//System.out.println(sql);
					
					result = ConnectionDAO.executeUpdate(stm, sql);
				}
				}
				return x;
		}
	
	public static FormBean companyedit(int id) {
		FormBean usBean = new FormBean();
		String sql = "select * from company_master where id = " + id;
		
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try {
			
		ResultSet rs = stm.executeQuery(sql);
		while (rs.next()) 
		{
			usBean.setId(rs.getInt(1));
			usBean.setScode(rs.getString(2));
			usBean.setName(rs.getString(3));
			usBean.setAddress(rs.getString(4));
			usBean.setAddress2(rs.getString(5));
			usBean.setPon(rs.getString(6));
			usBean.setCperson(rs.getString(7));
			usBean.setMobile(rs.getString(8));
			usBean.setEmail(rs.getString(9));
			usBean.setRemarks(rs.getString(10));						
		}
		} 
		catch (SQLException e) 
		{
		e.printStackTrace();
		}
		ConnectionDAO.closeConnection(conn);
		return usBean;
		}
	public static boolean companydelete(int id) {
		boolean result = false;
				
		String sql = "delete from company_master where id = " + id;
	
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		result = ConnectionDAO.executeUpdate(stm, sql);
		ConnectionDAO.closeConnection(conn);
		return result;
		}	
	
//   Engineer Related FormHelper
	
	
	
	
	
	// Customer Master Related FormHelper //
	public static boolean customercreation(FormBean FormBean) {
		boolean result = false;
		// Connect to database and save the FormBean object to database table
		String sql = null;
				
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
				
				if (FormBean.getId() != null) 
				{	
					sql="update customer_master set customer_code = '"+FormBean.getScode()+"', customer_name ='"+FormBean.getName()+"',"+
							 "category = '"+FormBean.getCategory()+"', res_address = '"+FormBean.getAddress()+"', place_code ='"+FormBean.getCcode()+"',"+
							 "res_mobileno ='"+FormBean.getRmobile()+"', contact_person = '"+FormBean.getContact_person()+"', personal_mobileno = '"+FormBean.getPmobile()+"', office_mobileno = '"+FormBean.getMobile()+"', email_id = '"+FormBean.getEmail()+"' where id ="+FormBean.getId()+" ";
														
				//	System.out.println(sql);
					
					result = ConnectionDAO.executeUpdate(stm, sql);
				}
				else
				{					
					sql = "select * from customer_master order by id";
					int k=0;
					
					try 
					{
						ResultSet rs = stm.executeQuery(sql);
						while (rs.next()) 
							{								
								k=rs.getInt(1);
							}
					} 
				catch (SQLException e) 
					{
						e.printStackTrace();
					}
					
					sql="insert into customer_master(customer_code,customer_name,category,res_address,place_code,res_mobileno,contact_person,personal_mobileno,office_mobileno,email_id) values ('"
							+ FormBean.getScode()
							+ "','"
							+ FormBean.getName()
							+ "','"
							+ FormBean.getCategory()
							+ "','"
							+ FormBean.getAddress()
							+ "','"
							+ FormBean.getCcode()
							+ "','"
							+ FormBean.getRmobile()
							+ "','"
							+ FormBean.getContact_person()
							+ "','"
							+ FormBean.getPmobile()
							+ "','"
							+ FormBean.getMobile()
							+"','"
							+ FormBean.getEmail()
							+"');";
											
						//	System.out.println(sql);
					
					result = ConnectionDAO.executeUpdate(stm, sql);
				}
				return result;
		}
	
	public static FormBean customeredit(int id) {
		FormBean usBean = new FormBean();
		String sql = "select * from customer_master where id=" + id;
		
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try {
			
		ResultSet rs = stm.executeQuery(sql);
		while (rs.next()) 
		{
			// added 16th March, Nilesh
						usBean.setId(rs.getInt(1));
						usBean.setScode(rs.getString(2));
						usBean.setName(rs.getString(3));
						usBean.setCategory(rs.getString(11));
						usBean.setAddress(rs.getString(4));
						usBean.setCcode(rs.getString(5));
						
						String cname=placename(rs.getString(5));
						//System.out.println("Cname: "+cname);
						String cname1[]=cname.split("[|]");
						//System.out.println(cname1[0]);
						usBean.setSname(cname1[0]);
						usBean.setCity(cname1[1]);
						usBean.setDistrict(cname1[2]);
						usBean.setState(cname1[3]);
						usBean.setPcode(cname1[4]);
						
						usBean.setPmobile(rs.getString(7));
						usBean.setMobile(rs.getString(8));
						usBean.setEmail(rs.getString(9));
						
						usBean.setContact_person(rs.getString(10));
						usBean.setRmobile(rs.getString(6));									
		}
		} 
		catch (Exception e) 
		{
		System.out.println(e);
		}
		ConnectionDAO.closeConnection(conn);
		return usBean;
		}
	
	public static List<FormBean> customerlist() 
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
		//String sql = "select * from engineer_master";
		String sql="select * from customer_master order by id desc";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				while (rs.next()) 
					{
						usBean = new FormBean();
						usBean.setId(rs.getInt(1)); 
						
						usBean.setScode(rs.getString(2));
						usBean.setName(rs.getString(3));
						usBean.setCatagory(rs.getString(11));
						usBean.setAddress(rs.getString(4));
						usBean.setCcode(rs.getString(5));
						usBean.setRmobile(rs.getString(6));
						usBean.setContact_person(rs.getString(10));
						usBean.setPmobile(rs.getString(7));
						usBean.setMobile(rs.getString(8));
						usBean.setEmail(rs.getString(9));
						
						l1.add(usBean);
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}
	
	public static boolean customerdelete(int id) {
		boolean result = false;

		// added 16th March, Nilesh
		String sql = "delete from customer_master where id = " + id;
		
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		result = ConnectionDAO.executeUpdate(stm, sql);
		ConnectionDAO.closeConnection(conn);
		return result;
		}
	
	// codes to generate dynamic voucher numbers
		// added by Nilesh 20th March
		public static String getCode(String code)
		{
			String first= "QO";
			//String x= "";
			int x = 0;
			
			//String code= "";
			String zero= "";
			
			String sql="select max(id) from quotation_entry";
			
			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn);
			
				try
				{
					ResultSet rs = stm.executeQuery(sql);
					while (rs.next()) 
						{								
							x=rs.getInt(1);
						}
					
					if(x == 0)
					{
						zero = "0000000";  // 7 zeros
						code = first + zero + 1; // total: 10 digits code
					}
					else if(x > 0  && x < 9)
					{
						zero = "0000000"; // 7 zeros
						code = first + zero + (x+1); 
					}
					
					else if(x > 8 && x<99)
					{
						//System.out.println("Hello from x>8 and x<99");
						zero = "000000";  // 6 zeros
						
						code = first + zero + (x+1);
						
					}
					
					else if(x > 98 && x<999 )
					{
						zero = "00000"; // 5 zeros
						code = first + zero + (x+1);
					}
					
					else if(x> 998 && x<9999)
					{
						zero = "0000"; // 4 zeros
						code = first + zero + (x+1);
					}
					
					else if(x>9998 && x<99999)
					{
						zero = "000"; // 3 zeros
						code = first + zero + (x+1);
					}
					
					else if(x>99998 && x<999999 )
					{
						zero = "00"; // 2 zeros
						code = first + zero + (x+1);
					}
					
					else if(x>999998 && x<9999999 )
					{
						zero = "0";
						code = first + zero + (x+1);
					}
					
					else
					{
						code = first + x+1;
					}
					
					//System.out.println("Generated code: "+code);
				}
				catch(SQLException e)
				{
					e.printStackTrace();
				}
				
				return code;
			
		}
	
// Quotation Master Related FormHelper
		public static boolean quotationcreation(FormBean FormBean) {
			boolean result = false;
			// Connect to database and save the FormBean object to database table
			String sql = null;
			
			String s1[]=FormBean.getParticular_nos();
			String s2[]= FormBean.getQty_nos();
			String s3[]= FormBean.getRate_nos();
			String s4[]= FormBean.getAmount_nos();
			
			String s5[]= FormBean.getApproved_nos();
			
			String s6 = FormBean.getCcode();
			
			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn);
					
					if (FormBean.getId() != null) 
					{	
						//System.out.println("Yes In");
						try
						{
						ResultSet rs;
						String vou="",sysid="";
						String a[]=FormBean.getParticular_nos1();
						String b[]=FormBean.getQty_nos1();
						//String c[]=FormBean.getQty_nos1();
						String d[]=FormBean.getRate_nos1();
						/*String e[]=FormBean.getRate_nos1();
						String f[]=FormBean.getRate_nos1();*/
						//String g[]=FormBean.getRate_nos1();
						String h[]=FormBean.getAmount_nos1();
						String i[]=FormBean.getApproved1();
						//System.out.println("hello "+a[0]+","+b[0]);
						sql="select voucher_no,systemcall_id from quotation_entry where id='"+FormBean.getId()+"'";
						rs=stm.executeQuery(sql);
						while(rs.next())
						{
							vou=rs.getString(1);
							sysid=rs.getString(2);
						}
						sql="delete from quotation_details where voucher_no='"+vou+"'";
						//System.out.println(sql);
						result=ConnectionDAO.executeUpdate(stm, sql);
						for(int j=0;j<a.length;j++)
						{
							sql="insert into quotation_details(particulars, qty, rate, amount, approved,voucher_no,systemcall_id)values('"+a[j]+"', '"+b[j]+"', '"+d[j]+"', '"+h[j]+"', '"+i[j]+"', '"+vou+"','"+sysid+"')";
							result=ConnectionDAO.executeUpdate(stm, sql);
							
						}
						
						String x="NOT APPROVED";
						for(int i0=0;i0<i.length;i0++)
						{
							if(i[i0].equals("APPROVED"))
							{
								x=i[i0];
								break;
							}
						
						}
						
						sql="update jobwork_entry set quotation_approved='"+x+"' where companycall_id='"+s6+"' ";
						//System.out.println(sql);
						result = ConnectionDAO.executeUpdate(stm, sql);
						
						ConnectionDAO.closeConnection(conn);
						}
						catch(Exception ffff)
						{
							System.out.println("error on quotation entry update "+ffff);
						}
					}
					else
					{					
						sql = "select * from quotation_details order by id";
						int k=0;
						
						try 
						{
							ResultSet rs = stm.executeQuery(sql);
							while (rs.next()) 
								{								
									k=rs.getInt(1);
								}
						} 
					catch (SQLException e) 
						{
							e.printStackTrace();
						}
						
						// added by Nilesh 22th March
						String cuscode = ""; 
						//String codeGot = FormHelper.getCode();
						//String codeGot = "";
						
						sql = "select customer_name from customer_master";
						 
						 try 
							{
								ResultSet rs = stm.executeQuery(sql);
								while (rs.next()) 
									{
										cuscode=cusname(rs.getString(1));
									}
							} 
						catch (SQLException e) 
							{
								e.printStackTrace();
							}
						 
						 // end of added 22th March
						 
						 // added by Nilesh 24th March
						 //sql = "select * from quotation_details";
						 
						 /************************************/
						 int mid=0;
						 String code="",code1="",totalcode="",zero="",fcode="QO";
							//usBean = new FormBean();
							sql="select max(id) from quotation_entry";
							try
							{
								ResultSet rs=stm.executeQuery(sql);
								FormBean usBean = new FormBean();
								while(rs.next())
								{
									mid=rs.getInt(1);
								}
								//System.out.println("mid "+mid);
								if(mid==0)
								{
									zero="0000000";
									totalcode=fcode+zero+1;
									//System.out.println(totalcode);
								}
								else if(mid > 0 && mid < 9)
								{
									zero="0000000";
									totalcode=fcode+zero+(mid+1);
									//System.out.println(totalcode);
								}
								else if(mid > 8 && mid < 99)
								{
									zero="000000";
									totalcode=fcode+zero+(mid+1);
									//System.out.println(totalcode);
								}
								else if(mid > 98 && mid < 999)
								{
									zero="00000";
									totalcode=fcode+zero+(mid+1);
									//System.out.println(totalcode);
								}
								else if(mid > 998 && mid < 9999)
								{
									zero="0000";
									totalcode=fcode+zero+(mid+1);
									//System.out.println(totalcode);
								}
								else if(mid > 9998 && mid < 99999)
								{
									zero="000";
									totalcode=fcode+zero+(mid+1);
									//System.out.println(totalcode);
								}
								else if(mid > 99998 && mid < 999999)
								{
									zero="00";
									totalcode=fcode+zero+(mid+1);
									//System.out.println(totalcode);
								}
								else if(mid > 999998 && mid < 9999999)
								{
									zero="0";
									totalcode=fcode+zero+(mid+1);
									//System.out.println(totalcode);
								}
								else if(mid > 9999998 && mid < 99999999)
								{
									//zero="0";
									totalcode=fcode+(mid+1);
									//System.out.println(totalcode);
								}
								//System.out.println("code generated "+totalcode);
								totalcode=totalcode.replace("QO", "");
								int finaltotal=Integer.parseInt(totalcode);
								//System.out.println("finaltotal "+finaltotal);
								//usBean.setSlnum(Integer.toString(finaltotal));
							}
							catch(SQLException e)
							{
								
							}
							
						 /************************************/
						 
						/* try
						 {
							 ResultSet rs = stm.executeQuery(sql);
							 // changed to if from while 28th March
							 if(rs.next())
							 {
								 codeGot = getCode(rs.getString(2));
							 }
						 }
						 catch(SQLException e)
						 {
							 e.printStackTrace();
						 }*/
						 String z="";
						 //end of added 24th March
						if(FormBean.getApproved_amt().equals(""))
						{
							z="0";
						}
						else
						{
							z=FormBean.getApproved_amt();
						}
						// added 23rd March (working)
						sql = "insert into quotation_entry(entry_date,voucher_no,customer_code,customer_name,total_amount,approved_amount,terms_conditions,systemcall_id) values('"
								+ FormBean.getEdate()
								+"','"
								+ totalcode
								+"','"
								+ FormBean.getAcode() // added
								
								+"','"
								+ FormBean.getName()
								+"','"
								+ FormBean.getTotal()
								+"','"
								
								+ z
								+"','"
								
								+ FormBean.getRemarks()
								
								+"','"
								
								+ s6
								
								+"');";
						
							//System.out.println("entry value "+sql);
						
						////System.out.println("ccode: "+FormBean.getCcode1());
						
						result = ConnectionDAO.executeUpdate(stm, sql);
						
						for(int i=0;i<s1.length;i++)
						{
							
							
						sql="insert into quotation_details(voucher_no,particulars,qty,rate,amount,approved,systemcall_id) values('"
						+ totalcode // codes for generating voucher number
						+ "','"
						+ s1[i]
						+ "','"
						+ s2[i]
						+ "','"
						+ s3[i]
						+ "','"
						+ s4[i]
						+"','"
						+s5[i]
								
						+"','"
						+s6
								
						+"');";
						
						result = ConnectionDAO.executeUpdate(stm, sql);
						
						//System.out.println("detail value: "+sql);
						
						
						
						}
						
						String x="NOT APPROVED";
						for(int i=0;i<s1.length;i++)
						{
							if(s5[i].equals("APPROVED"))
							{
								x=s5[i];
								break;
							}
						
						}
						
						sql="update jobwork_entry set quotation_approved='"+x+"' where companycall_id='"+s6+"' ";
						//System.out.println(sql);
						
						result = ConnectionDAO.executeUpdate(stm, sql);
						ConnectionDAO.closeConnection(conn);
						
					}
			
					return result;
		
		}
		public static List<FormBean> quotationlist() 
		{
			List<FormBean> l1 = new ArrayList<FormBean>();
			//String sql = "select * from engineer_master";
			String sql="select * from quotation_entry order by entry_date desc";
			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn);
			try 
				{
					ResultSet rs = stm.executeQuery(sql);
					FormBean usBean;
					while (rs.next()) 
						{
							usBean = new FormBean();
							
							usBean.setId(rs.getInt(1));
							
							usBean.setName(rs.getString(5));
							usBean.setEdate(rs.getString(2));
							usBean.setSlnum(rs.getString(3));
							usBean.setTotal(rs.getString(6));
							l1.add(usBean);
						}
				} 
			catch (SQLException e) 
				{
					e.printStackTrace();
				}
			ConnectionDAO.closeConnection(conn);
			return l1;
		}
		public static List<FormBean> quotationlist1(int id) 
		{
			List<FormBean> l1 = new ArrayList<FormBean>();
			//String sql = "select * from engineer_master";
			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn);
			String cmp="";
			try 
				{
				String sql="select companycall_id from jobwork_entry where id='"+id+"'";
				ResultSet rs=stm.executeQuery(sql);
				while(rs.next())
				{
					cmp=rs.getString(1);
				}
				//System.out.println("hello "+cmp);
				sql="select * from quotation_entry where systemcall_id='"+cmp+"' order by entry_date desc";
				//System.out.println(sql);
				rs = stm.executeQuery(sql);
					FormBean usBean;
					while (rs.next()) 
						{
							usBean = new FormBean();
							
							usBean.setId(rs.getInt(1));
							
							usBean.setName(rs.getString(5));
							usBean.setEdate(rs.getString(2));
							usBean.setSlnum(rs.getString(3));
							usBean.setTotal(rs.getString(6));
							
							l1.add(usBean);
						}
				} 
			catch (SQLException e) 
				{
					e.printStackTrace();
				}
			ConnectionDAO.closeConnection(conn);
			return l1;
		}
	
	
	
	
	public static FormBean quotationedit(int id) {
		FormBean usBean = new FormBean();
		Map<String,Object> s=ActionContext.getContext().getSession();
		String sql = "select * from quotation_entry where id =" + id;
		String aa=(String)s.get("name");
		String bb=(String)s.get("add");
		String cc=(String)s.get("ccode");
		String dd=(String)s.get("cref");
		String ee=(String)s.get("rem");
		
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		
		try {		
			usBean.setName(aa);
			usBean.setAddress(bb);
			usBean.setCcode(cc);
			usBean.setCust_ref_id(dd);
			usBean.setRemarks(ee);
			ResultSet rs = stm.executeQuery(sql);
			String serialNo="";
			String syscall_id="";
			while (rs.next()) 
				{
				
						usBean.setId(rs.getInt(1));
						
						//totalcode.substring(2, totalcode.length());
						
						serialNo = rs.getString(3);
						
						//serialNo=serialNo.substring(2, serialNo.length());
						
						
						//usBean.setSlnum(rs.getString(3));
						
						
						
						usBean.setEdate(rs.getString(2));
						
						//usBean.setName(rs.getString(5));
				
						usBean.setTotal(rs.getString(6));
						
						usBean.setTerms_conditions(rs.getString(7));
						syscall_id=rs.getString(9);
						
						
				}
			sql="select * from jobwork_entry where companycall_id='"+syscall_id+"'";
			rs=stm.executeQuery(sql);
			while(rs.next())
			{
				//System.out.println("new data need "+rs.getString(30)+","+rs.getString(25)+","+rs.getString(14));
				usBean.setMobile(rs.getString(14));
				usBean.setCus_remarks(rs.getString(25));
				usBean.setRemarks(rs.getString(30));
			}
			String zz=serialNo.substring(2,serialNo.length());
			//System.out.println(zz);
			usBean.setSlnum(zz);
						rs.close();
						// added by Nilesh 27th March
						
						String vno = usBean.getSlnum();
						
							// dynamic table population
						
							//Vector<String> quotes=new Vector<String>();
						
							sql="select particulars,qty,rate,amount from quotation_details where voucher_no like '%"+vno+"' ";
							ResultSet rs1=stm.executeQuery(sql);
							//System.out.println(sql);
							Vector<String> vparticulars=new Vector<String>();
							Vector<String> vqty=new Vector<String>();
							Vector<String> vrate=new Vector<String>();
							Vector<String> vamount=new Vector<String>();
							
							
							while(rs1.next())
							{
								
								vparticulars.add(rs1.getString(1));
								vqty.add(rs1.getString(2));
								vrate.add(rs1.getString(3));
								vamount.add(rs1.getString(4));
							}
							//ConnectionDAO.closeConnection(conn);
							
							//String ledgergot="";
							
							String[] particulars1=new String[vparticulars.size()];
							String[] qty1=new String[vqty.size()];
							String[] rate1=new String[vrate.size()];
							String[] amount1=new String[vamount.size()];
							
							
							for(int i=0;i<=vamount.size()-1;i++)
							{
								//////System.out.println("dsfjdkjsdgh");
								particulars1[i]=vparticulars.get(i);
								qty1[i]=vqty.get(i);
								rate1[i]=vrate.get(i);
								amount1[i]=vamount.get(i);
								
							}


							usBean.setParticular_nos(particulars1);
							usBean.setQty_nos(qty1);
							usBean.setRate_nos(rate1);
							usBean.setAmount_nos(amount1);
							
							// end of dynamic table population
							
							
				
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		
			//ConnectionDAO.closeConnection(conn);
			return usBean;
			}
	
	
	public static boolean quotationdelete(int id) {
		boolean result = false;
		//String sql = "delete from quotation_details where id = " + id;
		
		//added 27th march
		String sql = "select distinct voucher_no from quotation_entry where id=" + id;
		
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		
		String vno = "";
		
		try
		{
			ResultSet rs = stm.executeQuery(sql);
			
			while(rs.next())
			{
				/*sql = "delete from quotation_details where voucher_no = '" + rs.getString(1)+ "' ";
				
				vno = rs.getString(1);
				
				////System.out.println("Delete query: "+sql);
				
				result = ConnectionDAO.executeUpdate(stm, sql);*/
				
				vno = rs.getString(1).trim();
				
				/*sql = "delete from quotation_entry where voucher_no = '"+rs.getString(1)+"' ";
				result = ConnectionDAO.executeUpdate(stm, sql);*/
				
			}
			
			if(vno!= null)
			{
				sql = "delete from quotation_details where voucher_no = '" + vno+ "' ";
				//System.out.println("Delete query: "+sql);
				result = ConnectionDAO.executeUpdate(stm, sql);
				
				sql = "delete from quotation_entry where voucher_no = '"+vno+"' ";
				result = ConnectionDAO.executeUpdate(stm, sql);
				//System.out.println(sql);
				
			}
			
			
		}
		
		/*try
		{
			ResultSet rs = stm.executeQuery(sql);
			
			
			
			if(rs.next())
			{
				sql = "delete from quotation_details where voucher_no = '" + rs.getString(1)+ "' ";
				
				vno = rs.getString(1);
				
				System.out.println("Delete query: "+sql);
				
				result = ConnectionDAO.executeUpdate(stm, sql);
				
				vno = rs.getString(1).trim();
				if(vno!= null)
				{
					sql = "delete from quotation_details where voucher_no = '" + vno+ "' ";
					System.out.println("Delete query: "+sql);
					result = ConnectionDAO.executeUpdate(stm, sql);
					
					sql = "delete from quotation_entry where voucher_no = '"+vno+"' ";
					result = ConnectionDAO.executeUpdate(stm, sql);
					
				}
				
			}*/
			
			
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		// added by Nilesh 28th March
		/*	sql = "delete from quotation_entry where voucher_no = '"+vno+"' ";
			result = ConnectionDAO.executeUpdate(stm, sql);
		*/
		
		//result = ConnectionDAO.executeUpdate(stm, sql);
		ConnectionDAO.closeConnection(conn);
		return result;
		}
	
	


	public static FormBean quotations(int id,String check)
	{
		boolean result = false;
		//System.out.println("hiii");
		Map<String,Object> s=ActionContext.getContext().getSession();
		Map<String,Object> s123=ActionContext.getContext().getSession();
		s123.put("check", ""+check);
		String sql = "select * from jobwork_entry where id= " + id;
		//System.out.println(check);
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		
		//FormBean usBean=null;
		FormBean usBean=new FormBean();
		//usBean.setCheck(check);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				while (rs.next()) 
					{
						usBean = new FormBean();
						
						usBean.setName(rs.getString(7));
						s.put("name", ""+rs.getString(7));
						
						usBean.setAddress(rs.getString(8));
						s.put("add", ""+rs.getString(8));
						
						usBean.setCcode(rs.getString(6));
						s.put("ccode", ""+rs.getString(6));
						
						 usBean.setComcode(rs.getString(20));
							//System.out.println(rs.getString(20)); 
							
						
							//usBean.setRemarks();
						usBean.setCust_ref_id(rs.getString(55));
						s.put("cref", ""+rs.getString(55));
						
					
						
						// added by Nilesh, 4th April
						usBean.setCus_remarks(rs.getString(25));
						usBean.setRemarks(rs.getString(30));
						usBean.setMobile(rs.getString(14));
						s.put("rem", ""+rs.getString(25));
						//System.out.println("hello "+rs.getString(7)+","+rs.getString(8)+","+rs.getString(6)+","+rs.getString(55)+","+rs.getString(25));
					}
				
				
			
				// added by Nilesh, 30th March
				
				String no="";
				int mid=0;
				String code="",code1="",totalcode="",zero="",fcode="QO";
				//usBean = new FormBean();
				sql="select max(id) from quotation_entry";
				rs=stm.executeQuery(sql);
				while(rs.next())
				{
					mid=rs.getInt(1);
				}
				//System.out.println("mid "+mid);
				if(mid==0)
				{
					zero="0000000";
					totalcode=fcode+zero+1;
					//System.out.println(totalcode);
				}
				else if(mid > 0 && mid < 9)
				{
					zero="0000000";
					totalcode=fcode+zero+(mid+1);
					//System.out.println(totalcode);
				}
				else if(mid > 8 && mid < 99)
				{
					zero="000000";
					totalcode=fcode+zero+(mid+1);
					//System.out.println(totalcode);
				}
				else if(mid > 98 && mid < 999)
				{
					zero="00000";
					totalcode=fcode+zero+(mid+1);
					//System.out.println(totalcode);
				}
				else if(mid > 998 && mid < 9999)
				{
					zero="0000";
					totalcode=fcode+zero+(mid+1);
					//System.out.println(totalcode);
				}
				else if(mid > 9998 && mid < 99999)
				{
					zero="000";
					totalcode=fcode+zero+(mid+1);
					//System.out.println(totalcode);
				}
				else if(mid > 99998 && mid < 999999)
				{
					zero="00";
					totalcode=fcode+zero+(mid+1);
					//System.out.println(totalcode);
				}
				else if(mid > 999998 && mid < 9999999)
				{
					zero="0";
					totalcode=fcode+zero+(mid+1);
					//System.out.println(totalcode);
				}
				else if(mid > 9999998 && mid < 99999999)
				{
					//zero="0";
					totalcode=fcode+(mid+1);
					//System.out.println(totalcode);
				}
				
				//System.out.println("code generated "+totalcode);
				
				totalcode=totalcode.replace("QO", "");
				int finaltotal=Integer.parseInt(totalcode);
				
				//System.out.println("finaltotal "+finaltotal);
				
				usBean.setSlnum(Integer.toString(finaltotal));
				
				String comid="";
				sql="select companycall_id from jobwork_entry where id='"+id+"'";
				//System.out.println(sql);
				rs=stm.executeQuery(sql);
				while(rs.next())
				{
					comid=rs.getString(1);
					//System.out.println("company call  id :"+comid);
				}
				
				int count=0;
			    sql="select count(id) from quotation_entry where systemcall_id='"+comid+"'";
			    rs=stm.executeQuery(sql);
			    while(rs.next())
			    {
			    	count=rs.getInt(1);
			    }
			    if(count > 0)
			    {
			    sql = "select * from quotation_entry where systemcall_id ='"+comid+"' ";
				//System.out.println(sql);
				rs = stm.executeQuery(sql);
				String serialNo="";
				while (rs.next()) 
					{
					usBean.setId(rs.getInt(1));
					
					//totalcode.substring(2, totalcode.length());		
					serialNo = rs.getString(3);	
					//System.out.println("serial no: "+serialNo);
					//serialNo=serialNo.substring(2, serialNo.length());			
					//usBean.setSlnum(rs.getString(3));
					usBean.setEdate(rs.getString(2));
					
					//usBean.setName(rs.getString(5));
			
					usBean.setTotal(rs.getString(6));
					usBean.setApproved_amt(rs.getString(7));
					System.out.println(sql);
					
					System.out.println("ami ja chai"+rs.getString(7));
					
					/*usBean.setComcode(rs.getString(20));
					System.out.println(rs.getString(20));*/
					
					usBean.setTerms_conditions(rs.getString(7));
					}
				
				
				String zz=serialNo.substring(2,serialNo.length());
				//System.out.println("call id: "+	zz);
				usBean.setSlnum(zz);
				
				
					
			
							rs.close();
							
							
							String vno = usBean.getSlnum();		
							
								// dynamic table population
							
								//Vector<String> quotes=new Vector<String>();
							//sql="select count(particulars) from quotation_details where systemcall_id='"++"'";
								sql="select particulars,qty,rate,amount,approved from quotation_details where systemcall_id = '"+comid+"' ";
								//System.out.println(sql);
								ResultSet rs1=stm.executeQuery(sql);
								//System.out.println(sql);
								Vector<String> vparticulars=new Vector<String>();
								Vector<String> vqty=new Vector<String>();
								Vector<String> vrate=new Vector<String>();
								Vector<String> vamount=new Vector<String>();
								Vector<String> status=new Vector<String>();
							//	Vector<String> vapm=new Vector<String>();
								
								
								while(rs1.next())
								{
									
									vparticulars.add(rs1.getString(1));
									vqty.add(rs1.getString(2));
									vrate.add(rs1.getString(3));
									vamount.add(rs1.getString(4));
									status.add(rs1.getString(5));
								}
								//ConnectionDAO.closeConnection(conn);
								
								//String ledgergot="";
								
								String[] particulars1=new String[vparticulars.size()];
								String[] qty1=new String[vqty.size()];
								String[] rate1=new String[vrate.size()];
								String[] amount1=new String[vamount.size()];
								String[] status1=new String[status.size()];
								
								
								for(int i=0;i<=vamount.size()-1;i++)
								{
									//////System.out.println("dsfjdkjsdgh");
									particulars1[i]=vparticulars.get(i);
									qty1[i]=vqty.get(i);
									rate1[i]=vrate.get(i);
									amount1[i]=vamount.get(i);
									status1[i]=status.get(i);
									//System.out.println("value got: "+particulars1[i]);
									
								}


								usBean.setParticular_nos(particulars1);
								usBean.setQty_nos(qty1);
								usBean.setRate_nos(rate1);
								usBean.setAmount_nos(amount1);
								usBean.setApproved_nos(status1);
								
								
								// end of dynamic table population
			    }
			    else
			    {
			    	usBean.setEdate("");
					usBean.setTotal("");
					usBean.setTerms_conditions("");
					usBean.setSlnum("1");
			    	String ar[]=new String[0];
			    	String ar1[]=new String[0];
			    	String ar2[]=new String[0];
			    	String ar3[]=new String[0];
			    	String ar4[]=new String[0];
			    	usBean.setParticular_nos(ar);
					usBean.setQty_nos(ar1);
					usBean.setRate_nos(ar2);
					usBean.setAmount_nos(ar3);
					usBean.setApproved_nos(ar4);
					//usBean.setApproved_amt(ar4);
			    }
			}
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		ConnectionDAO.closeConnection(conn);
		
		return usBean;	
	}
	
	
	
	// added by Nilesh, 29th March
	/*public static FormBean vouchernum()
	{
		
		FormBean usBean= null;
		
		int x=0;
		String no="";
		String code="",code1="",totalcode="";
		
		String sql="select max(voucher_no) from quotation_entry";
		
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		
			try
			{
				ResultSet rs = stm.executeQuery(sql);
				while (rs.next()) 
					{			
						usBean = new FormBean();
						no=rs.getString(1);
						
						//no = String.valueOf(x);
						code1=no.substring(0, 2);
						code=no.substring(2, no.length());
						
						totalcode = code1+(Integer.parseInt(code)+1);
						
						// added by Nilesh, 30th March
						
						if(totalcode.length() == 4)
						{
							totalcode = code1 + "000000" + (Integer.parseInt(code)+1); // 6 zeros
						}
						
						else if(totalcode.length() == 5)
						{
							totalcode = code1 + "00000" + (Integer.parseInt(code)+1); // 5 zeros
						}
						
						else if(totalcode.length() == 6)
						{
							totalcode = code1 + "0000" + (Integer.parseInt(code)+1); // 4 zeros
						}
						
						else if(totalcode.length() == 7)
						{
							totalcode = code1 + "000" + (Integer.parseInt(code)+1); // 3 zeros
						}
						
						else if(totalcode.length() == 8)
						{
							totalcode = code1 + "00" + (Integer.parseInt(code)+1); // 2 zeros
						}
						
						else if(totalcode.length() == 9)
						{
							totalcode = code1 + "0" + (Integer.parseInt(code)+1); // 1 zeros
						}
						
						else 
						{
							totalcode = code1 + (Integer.parseInt(code)+1);
						}
						
						usBean.setSlnum(totalcode);
						
						System.out.println("Generated Code: "+ totalcode);
					}
				
			}
					
			
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			
			
			
			
			
		return usBean;
		
	}*/
	

	// added by Nilesh, 22th March
	public static List<FormBean> customerCodeslist()
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
		String sql = "select * from customer_master";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				while (rs.next()) 
					{
						usBean = new FormBean();
						String cuscode=cusname(rs.getString(3));
						//System.out.println("CName: "+cname);
						//usBean.setSname(cname);	
						l1.add(usBean);
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}
	
	public static String cusname(String s) {
		String x="";
		String sql = "select * from customer_master where customer_name ='" +s.trim()+"'";
		//System.out.println("\n"+sql);
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try {			
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					x=rs.getString(2);
				}
			//System.out.println("\n Customer Code: "+x);
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
	
			ConnectionDAO.closeConnection(conn);
			return x;
			}
	
//   Brand Master Related FormHelper //
	
	public static List<FormBean> brandlist() 
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
		String sql = "select * from brand_master";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				while (rs.next()) 
					{
						usBean = new FormBean();
						usBean.setId(rs.getInt(1));
						usBean.setScode(rs.getString(2));
						usBean.setName(rs.getString(3));
						String cname=cname(rs.getString(4));
						//System.out.println("CName: "+cname);
						usBean.setSname(cname);	
						l1.add(usBean);
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}	
	
	public static boolean brandcreation(FormBean FormBean) {
		boolean result = false;
		// Connect to database and save the FormBean object to database table
		String sql = null;
				
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
				
				if (FormBean.getId() != null) 
				{
					sql = "update brand_master set brand_name ='"+FormBean.getName()+"', brand_code ='"+FormBean.getScode()+"', company_code='"+FormBean.getPcode()+"' where id ="+FormBean.getId();									
					//System.out.println(sql);	
					result = ConnectionDAO.executeUpdate(stm, sql);

				}
				else
				{
					sql = "select * from brand_master order by id";
					int k=0;
					
					try 
					{
						ResultSet rs = stm.executeQuery(sql);
						while (rs.next()) 
							{								
								k=rs.getInt(1);								
							}
					} 
				catch (SQLException e) 
					{
						e.printStackTrace();
					}
										
					sql = "insert into brand_master(brand_code,brand_name,company_code) values ('"
							+ FormBean.getScode() /* "DS000"+(k+1)  */
							+ "','"
							+ FormBean.getName()
							+ "','"
							+ FormBean.getPcode()
							+"');";
					
					result = ConnectionDAO.executeUpdate(stm, sql);
				}
				return result;
		}
	
	public static FormBean brandedit(int id) {
		FormBean usBean = new FormBean();
		String sql = "select * from brand_master where id = " + id;
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try {			
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
				usBean.setId(rs.getInt(1));
				usBean.setScode(rs.getString(2));
				usBean.setName(rs.getString(3));
				usBean.setPcode(rs.getString(4));
				String cname=cname(rs.getString(4));
				usBean.setSname(cname);	
				}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
	
			ConnectionDAO.closeConnection(conn);
			return usBean;
			}

	public static boolean branddelete(int id) {
		boolean result = false;
		String sql = "delete from brand_master where id = " + id;
	
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		result = ConnectionDAO.executeUpdate(stm, sql);
		ConnectionDAO.closeConnection(conn);
		return result;
		}

	// Product related FormHelper 
	
	public static List<FormBean> productlist() 
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
		String sql = "select * from product_master";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				while (rs.next()) 
					{
						usBean = new FormBean();
						usBean.setId(rs.getInt(1));
						usBean.setScode(rs.getString(2));
						usBean.setName(rs.getString(3));
						usBean.setSname(rs.getString(4));
						usBean.setPcode(rs.getString(5));
						usBean.setAmount(rs.getString(6));
						usBean.setIcharge(rs.getString(7));
						////System.out.println("Check: "+rs.getString(6));
						
						l1.add(usBean);
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}	
	
	public static boolean productcreation(FormBean FormBean) {
		boolean result = false;
		// Connect to database and save the FormBean object to database table
		String sql = null;
				
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
				
				if (FormBean.getId() != null) 
				{
					sql = "update product_master set product_code ='"+FormBean.getScode()+"', product_name ='"+FormBean.getName()+"', short_name ='"+FormBean.getSname()+"',support_type ='"+FormBean.getPcode()+"',service_charge='"+FormBean.getAmount()+"',ins_charge='"+FormBean.getIcharge()+"' where id ="+FormBean.getId();									
					//System.out.println(sql);	
					result = ConnectionDAO.executeUpdate(stm, sql);

				}
				else
				{
					sql = "select * from product_master order by id";
					int k=0;
					
					try 
					{
						ResultSet rs = stm.executeQuery(sql);
						while (rs.next()) 
							{								
								k=rs.getInt(1);								
							}
					} 
				catch (SQLException e) 
					{
						e.printStackTrace();
					}
										
					sql = "insert into product_master(product_code,product_name,short_name,support_type,service_charge,ins_charge) values ('"
							+ FormBean.getScode() /* "DS000"+(k+1)  */
							+ "','"
							+ FormBean.getName()
							+ "','"
							+ FormBean.getSname()
							+ "','"
							+ FormBean.getPcode()
							+ "','"
							+ FormBean.getAmount()
							+ "','"
							+ FormBean.getIcharge()
							+"');";
					
					result = ConnectionDAO.executeUpdate(stm, sql);
				}
				return result;
		}
	
	public static FormBean productedit(int id) {
		FormBean usBean = new FormBean();
		String sql = "select * from product_master where id = " + id;
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try {			
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					usBean.setId(rs.getInt(1));
					usBean.setScode(rs.getString(2));
					usBean.setName(rs.getString(3));
					usBean.setSname(rs.getString(4));
					usBean.setPcode(rs.getString(5));
					usBean.setAmount(rs.getString(6));
					usBean.setIcharge(rs.getString(7));
					
				}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
	
			ConnectionDAO.closeConnection(conn);
			return usBean;
			}

	public static boolean productdelete(int id) {
		boolean result = false;
		String sql = "delete from product_master where id = " + id;
	
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		result = ConnectionDAO.executeUpdate(stm, sql);
		ConnectionDAO.closeConnection(conn);
		return result;
		}
	
// Model related FormHelper 
	
	public static List<FormBean> modellist() 
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
		String sql = "select * from model_master";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				while (rs.next()) 
					{
						usBean = new FormBean();
						usBean.setId(rs.getInt(1));
						usBean.setScode(rs.getString(2));
						usBean.setName(rs.getString(3));
						usBean.setCcode(rs.getString(4));
						String cname=brand(rs.getString(4));
						usBean.setBname(cname);
						
						usBean.setPcode(rs.getString(5));
						cname=product(rs.getString(5));
						usBean.setSname(cname);
						l1.add(usBean);
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}	
	
	public static boolean modelcreation(FormBean FormBean) {
		boolean result = false;
		// Connect to database and save the FormBean object to database table
		String sql = null;
				
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
				
				if (FormBean.getId() != null) 
				{
					sql = "update model_master set model_code ='"+FormBean.getScode()+"', model_name ='"+FormBean.getName()+"', brand_code ='"+FormBean.getCcode()+"',product_code ='"+FormBean.getPcode()+"' where id ="+FormBean.getId();									
					//System.out.println(sql);	
					result = ConnectionDAO.executeUpdate(stm, sql);

				}
				else
				{
					sql = "select * from model_master order by id";
					int k=0;
					
					try 
					{
						ResultSet rs = stm.executeQuery(sql);
						while (rs.next()) 
							{								
								k=rs.getInt(1);								
							}
					} 
				catch (SQLException e) 
					{
						e.printStackTrace();
					}
										
					sql = "insert into model_master(model_code,model_name,brand_code,product_code) values ('"
							+ FormBean.getScode()
							+ "','"
							+ FormBean.getName()
							+ "','"
							+ FormBean.getCcode()
							+ "','"
							+ FormBean.getPcode()
							+"');";
					
					result = ConnectionDAO.executeUpdate(stm, sql);
				}
				return result;
		}
	
	public static FormBean modeledit(int id) {
		FormBean usBean = new FormBean();
		String sql = "select * from model_master where id = " + id;
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try {			
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					usBean.setId(rs.getInt(1));
					usBean.setScode(rs.getString(2));
					usBean.setName(rs.getString(3));
					usBean.setCcode(rs.getString(4));
					String cname=brand(rs.getString(4));
					usBean.setBname(cname);
					
					usBean.setPcode(rs.getString(5));
					cname=product(rs.getString(5));
					usBean.setSname(cname);
				}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
	
			ConnectionDAO.closeConnection(conn);
			return usBean;
			}

	public static boolean modeldelete(int id) {
		boolean result = false;
		String sql = "delete from model_master where id = " + id;
	
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		result = ConnectionDAO.executeUpdate(stm, sql);
		ConnectionDAO.closeConnection(conn);
		return result;
		}

//   Resolve Master Related FormHelper
	
	public static List<FormBean> resolvelist() 
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
		String sql = "select * from resolve_master";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				while (rs.next()) 
					{
						usBean = new FormBean();
						usBean.setId(rs.getInt(1));
						usBean.setScode(rs.getString(2));
						usBean.setName(rs.getString(3));
												
						l1.add(usBean);
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}	
	
	public static boolean resolvecreation(FormBean FormBean) {
		boolean result = false;
		// Connect to database and save the FormBean object to database table
		String sql = null;
				
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
				
				if (FormBean.getId() != null) 
				{
					sql = "update resolve_master set resolve_code ='"+FormBean.getScode()+"'resolve_name ='"+FormBean.getName()+"' where id ="+FormBean.getId();
										
					//System.out.println(sql);	
					result = ConnectionDAO.executeUpdate(stm, sql);

				}
				else
				{
					sql = "select * from resolve_master order by id";
					int k=0;
					
					try 
					{
						ResultSet rs = stm.executeQuery(sql);
						while (rs.next()) 
							{								
								k=rs.getInt(1);								
							}
					} 
				catch (SQLException e) 
					{
						e.printStackTrace();
					}
										
					sql = "insert into resolve_master(resolve_code,resolve_name) values ('"
							+ FormBean.getScode() /* "ST000"+(k+1)  */
							+ "','"
							+ FormBean.getName()
							+"');";
					
					result = ConnectionDAO.executeUpdate(stm, sql);
				}
				return result;
		}
	
	public static FormBean resolveedit(int id) {
		FormBean usBean = new FormBean();
		String sql = "select * from resolve_master where id = " + id;
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try {			
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					usBean.setId(rs.getInt(1));
					usBean.setScode(rs.getString(2));
					usBean.setName(rs.getString(3));			
				}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
	
			ConnectionDAO.closeConnection(conn);
			return usBean;
			}

	public static boolean resolvedelete(int id) {
		boolean result = false;
		String sql = "delete from resolve_master where id = " + id;
	
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		result = ConnectionDAO.executeUpdate(stm, sql);
		ConnectionDAO.closeConnection(conn);
		return result;
		}

//  Complain Master Related FormHelper
	
	public static List<FormBean> complainlist() 
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
		String sql = "select * from complain_master";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				while (rs.next()) 
					{
						usBean = new FormBean();
						usBean.setId(rs.getInt(1));
						usBean.setScode(rs.getString(2));
						usBean.setName(rs.getString(3));
												
						l1.add(usBean);
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}	
	
	public static boolean complaincreation(FormBean FormBean) {
		boolean result = false;
		// Connect to database and save the FormBean object to database table
		String sql = null;
				
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
				
				if (FormBean.getId() != null) 
				{
					sql = "update complain_master set complain_code ='"+FormBean.getScode()+"',complain_name ='"+FormBean.getName()+"' where id ="+FormBean.getId();
										
					//System.out.println(sql);	
					result = ConnectionDAO.executeUpdate(stm, sql);

				}
				else
				{
					sql = "select * from complain_master order by id";
					int k=0;
					
					try 
					{
						ResultSet rs = stm.executeQuery(sql);
						while (rs.next()) 
							{								
								k=rs.getInt(1);								
							}
					} 
				catch (SQLException e) 
					{
						e.printStackTrace();
					}
										
					sql = "insert into complain_master(complain_code,complain_name) values ('"
							+ FormBean.getScode() /* "ST000"+(k+1)  */
							+ "','"
							+ FormBean.getName()
							+"');";
					
					result = ConnectionDAO.executeUpdate(stm, sql);
				}
				return result;
		}
	
	public static FormBean complainedit(int id) {
		FormBean usBean = new FormBean();
		String sql = "select * from complain_master where id = " + id;
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try {			
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					usBean.setId(rs.getInt(1));
					usBean.setScode(rs.getString(2));
					usBean.setName(rs.getString(3));			
				}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
	
			ConnectionDAO.closeConnection(conn);
			return usBean;
			}

	public static boolean complaindelete(int id) {
		boolean result = false;
		String sql = "delete from complain_master where id = " + id;
	
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		result = ConnectionDAO.executeUpdate(stm, sql);
		ConnectionDAO.closeConnection(conn);
		return result;
		}

//  Place Master Related FormHelper
	
	public static List<FormBean> placelist() 
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
		String sql = "select * from place_master";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				while (rs.next()) 
					{
						usBean = new FormBean();
						usBean.setId(rs.getInt(1));
						usBean.setScode(rs.getString(2));
						usBean.setName(rs.getString(3));
						usBean.setPcode(rs.getString(4));
						
						String cname=cityname(rs.getString(5));
						usBean.setSname(cname);
						
						l1.add(usBean);
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}	
	
	public static boolean placecreation(FormBean FormBean) {
		boolean result = false;
		// Connect to database and save the FormBean object to database table
		String sql = null;
				
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
				
				if (FormBean.getId() != null) 
				{
					sql = "update place_master set place_code ='"+FormBean.getScode()+"',place_name ='"+FormBean.getName()+"',postal_code ='"+FormBean.getPcode()+"',City_code ='"+FormBean.getCity()+"' where id ="+FormBean.getId();
										
					//System.out.println(sql);	
					result = ConnectionDAO.executeUpdate(stm, sql);

				}
				else
				{
					sql = "select * from place_master order by id";
					int k=0;
					
					try 
					{
						ResultSet rs = stm.executeQuery(sql);
						while (rs.next()) 
							{								
								k=rs.getInt(1);								
							}
					} 
				catch (SQLException e) 
					{
						e.printStackTrace();
					}
										
					sql = "insert into place_master(place_code,place_name,postal_code,city_code) values ('"
							+ FormBean.getScode() /* "ST000"+(k+1)  */
							+ "','"
							+ FormBean.getName()
							+ "','"
							+ FormBean.getPcode()
							+ "','"
							+ FormBean.getCity()
							+"');";
					
					result = ConnectionDAO.executeUpdate(stm, sql);
				}
				return result;
		}
	
	public static FormBean placeedit(int id) {
		FormBean usBean = new FormBean();
		String sql = "select * from place_master where id = " + id;
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try {			
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
				usBean.setId(rs.getInt(1));
				usBean.setScode(rs.getString(2));
				usBean.setName(rs.getString(3));
				usBean.setPcode(rs.getString(4));
				usBean.setCity(rs.getString(5));
				String cname=cityname(rs.getString(5));
				usBean.setSname(cname);					
				}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
	
			ConnectionDAO.closeConnection(conn);
			return usBean;
			}

	public static boolean placedelete(int id) {
		boolean result = false;
		String sql = "delete from place_master where id = " + id;
	
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		result = ConnectionDAO.executeUpdate(stm, sql);
		ConnectionDAO.closeConnection(conn);
		return result;
		}

//  Transport Master Related FormHelper
	
	public static List<FormBean> transportlist() 
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
		String sql = "select * from transport_master";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				while (rs.next()) 
					{
						usBean = new FormBean();
						usBean.setId(rs.getInt(1));
						usBean.setScode(rs.getString(2));
						usBean.setName(rs.getString(3));
												
						l1.add(usBean);
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}	
	
	public static boolean transportcreation(FormBean FormBean) {
		boolean result = false;
		// Connect to database and save the FormBean object to database table
		String sql = null;
				
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
				
				if (FormBean.getId() != null) 
				{
					sql = "update transport_master set transport_code ='"+FormBean.getScode()+"'transport_name ='"+FormBean.getName()+"' where id ="+FormBean.getId();
										
					//System.out.println(sql);	
					result = ConnectionDAO.executeUpdate(stm, sql);

				}
				else
				{
					sql = "select * from transport_master order by id";
					int k=0;
					
					try 
					{
						ResultSet rs = stm.executeQuery(sql);
						while (rs.next()) 
							{								
								k=rs.getInt(1);								
							}
					} 
				catch (SQLException e) 
					{
						e.printStackTrace();
					}
										
					sql = "insert into transport_master(transport_code,transport_name) values ('"
							+ FormBean.getScode() /* "ST000"+(k+1)  */
							+ "','"
							+ FormBean.getName()
							+"');";
					
					result = ConnectionDAO.executeUpdate(stm, sql);
				}
				return result;
		}
	
	public static FormBean transportedit(int id) {
		FormBean usBean = new FormBean();
		String sql = "select * from transport_master where id = " + id;
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try {			
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					usBean.setId(rs.getInt(1));
					usBean.setScode(rs.getString(2));
					usBean.setName(rs.getString(3));			
				}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
	
			ConnectionDAO.closeConnection(conn);
			return usBean;
			}

	public static boolean transportdelete(int id) {
		boolean result = false;
		String sql = "delete from transport_master where id = " + id;
	
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		result = ConnectionDAO.executeUpdate(stm, sql);
		ConnectionDAO.closeConnection(conn);
		return result;
		}
	
//  Spare Master Related FormHelper
	
	public static List<FormBean> sparelist() 
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
		String sql = "select * from spare_master";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				while (rs.next()) 
					{
						usBean = new FormBean();
						usBean.setId(rs.getInt(1));
						usBean.setScode(rs.getString(2));
						usBean.setName(rs.getString(3));
						usBean.setSname(rs.getString(4));
						l1.add(usBean);
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}	
	
	public static boolean sparecreation(FormBean FormBean) {
		boolean result = false;
		// Connect to database and save the FormBean object to database table
		String sql = null;
				
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
				
				if (FormBean.getId() != null) 
				{
					sql = "update spare_master set spare_code ='"+FormBean.getScode()+"',spare_name ='"+FormBean.getName()+"',spare_unit='"+FormBean.getSname()+"' where id ="+FormBean.getId();
										
					//System.out.println(sql);	
					result = ConnectionDAO.executeUpdate(stm, sql);

				}
				else
				{
					sql = "select * from spare_master order by id";
					int k=0;
					
					try 
					{
						ResultSet rs = stm.executeQuery(sql);
						while (rs.next()) 
							{								
								k=rs.getInt(1);								
							}
					} 
				catch (SQLException e) 
					{
						e.printStackTrace();
					}
										
					sql = "insert into spare_master(spare_code,spare_name,spare_unit) values ('"
							+ FormBean.getScode() /* "ST000"+(k+1)  */
							+ "','"
							+ FormBean.getName()
							+ "','"
							+ FormBean.getSname()
							+"');";
					
					result = ConnectionDAO.executeUpdate(stm, sql);
				}
				ConnectionDAO.closeConnection(conn);
				return result;
		}
	
	public static FormBean spareedit(int id) {
		FormBean usBean = new FormBean();
		String sql = "select * from spare_master where id = " + id;
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try {			
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					usBean.setId(rs.getInt(1));
					usBean.setScode(rs.getString(2));
					usBean.setName(rs.getString(3));
					usBean.setSname(rs.getString(4));
				}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
	
			ConnectionDAO.closeConnection(conn);
			return usBean;
			}

	public static boolean sparedelete(int id) {
		boolean result = false;
		String sql = "delete from spare_master where id = " + id;
	
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		result = ConnectionDAO.executeUpdate(stm, sql);
		ConnectionDAO.closeConnection(conn);
		return result;
		}

	public static String cname(String s) {
		String x="";
		String sql = "select * from company_master where Company_code ='" +s.trim()+"'";
		//System.out.println("\n"+sql);
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try {			
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					x=rs.getString(3);
				}
			//System.out.println("\n x: "+x);
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
	
			ConnectionDAO.closeConnection(conn);
			return x;
			}
	
	public static String sname(String s) {
		String x="";
		String sql = "select * from state_master where STATE_CODE ='" +s.trim()+"'";
		//System.out.println("\n"+sql);
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try {			
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					x=rs.getString(3);
				}
			//System.out.println("\n x: "+x);
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
	
			ConnectionDAO.closeConnection(conn);
			return x;
			}
	
	public static String districtcode(String s) {
		String x="";
		String sql = "select * from district_master where DISTRICT_CODE ='" +s.trim()+"'";
		//System.out.println("\n"+sql);
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try {			
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					x=rs.getString(3);
				}
			//System.out.println("\n x: "+x);
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
	
			ConnectionDAO.closeConnection(conn);
			return x;
			}
	
	public static String districtcode1(String s) {
		String x="";
		String sql = "select * from district_master where DISTRICT_CODE ='" +s.trim()+"'";
		
		//System.out.println("\n"+sql);
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try {			
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					x=rs.getString(4);
				}
			//System.out.println("\n x: "+x);
			sql = "select * from state_master where STATE_CODE ='" +x.trim()+"'";
			rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					x=rs.getString(3);
				}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
	
			ConnectionDAO.closeConnection(conn);
			return x;
			}
	
	public static String cityname(String s) {
		String x="";
		String sql = "select * from city_master where CITY_CODE ='" +s.trim()+"'";
		//System.out.println("\n"+sql);
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try {			
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					x=rs.getString(3);
				}
			//System.out.println("\n x: "+x);
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
	
			ConnectionDAO.closeConnection(conn);
			return x;
			}
	
	public static String placename(String s) {
		String x="",x0="",x1="",x2="",x3="";
		String sql = "select * from place_master where PLACE_CODE ='" +s.trim()+"'";
		
		//System.out.println("\n"+sql);
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try {			
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					x=rs.getString(3);
					x0=rs.getString(4);
					x1=rs.getString(5);
				}
			//System.out.println("\n x: "+x);
			
			sql = "select * from city_master where CITY_CODE ='" +x1.trim()+"'";
			rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					x1=rs.getString(3);
					x2=rs.getString(4);
				}
			
			sql = "select * from district_master where DISTRICT_CODE ='" +x2.trim()+"'";
			rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					x2=rs.getString(3);
					x3=rs.getString(4);
				}
			
			sql = "select * from state_master where STATE_CODE ='" +x3.trim()+"'";
			rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					x3=rs.getString(3);
					
				}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
	
			ConnectionDAO.closeConnection(conn);
			x=x+"|"+x1+"|"+x2+"|"+x3+"|"+x0;
			//System.out.println(x);
			return x;
			}
	
	public static String brand(String s) {
		String x="";
		String sql = "select * from brand_master where brand_code ='" +s.trim()+"'";
		//System.out.println("\n"+sql);
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try {			
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					x=rs.getString(3);
				}
			//System.out.println("\n x: "+x);
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
	
			ConnectionDAO.closeConnection(conn);
			return x;
			}
	
	public static String product(String s) {
		String x="";
		String sql = "select * from product_master where product_code ='" +s.trim()+"'";
		//System.out.println("\n"+sql);
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try {			
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					x=rs.getString(3);
				}
			//System.out.println("\n x: "+x);
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
	
			ConnectionDAO.closeConnection(conn);
			return x;
			}
	
	public static List<FormBean> jobworklist(String user) 
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
	
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		
		String sql = "select * from user where USERNAME='"+user+"'";
		
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
		
		if(k.compareTo("ROLE_ADMIN")==0)
			sql = "select * from jobwork_entry where allocated_engr='"+"NA"+"' order by tdate desc";
		else
			sql = "select * from jobwork_entry where allocated_engr='"+"NA"+"' and user='"+user+"'  order by tdate desc";
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				while (rs.next()) 
					{
						usBean = new FormBean();
						usBean.setId(rs.getInt(1));
						usBean.setBname(rs.getString(2));
						usBean.setCtype(rs.getString(3));
						usBean.setCdate(rs.getString(4));
						usBean.setCcode(rs.getString(5));
						usBean.setScode(rs.getString(6));
						usBean.setName(rs.getString(7));
						usBean.setAddress(rs.getString(8));
						usBean.setPlace(rs.getString(9));
						usBean.setCity(rs.getString(10));
						usBean.setDistrict(rs.getString(11));
						usBean.setPcode(rs.getString(12));
						usBean.setPon(rs.getString(13));
						usBean.setMobile(rs.getString(14));
						usBean.setEmail(rs.getString(15));
						
						usBean.setMcode(rs.getString(16));
						usBean.setFname(rs.getString(17));
						usBean.setPserial(rs.getString(18));
						usBean.setPdate(rs.getString(19));
						usBean.setComcode(rs.getString(20));
						usBean.setCatagory(rs.getString(22));
						usBean.setCptype(rs.getString(23));
						
						usBean.setPtype(rs.getString(24));
						usBean.setRemarks(rs.getString(25));
						usBean.setAllocation(rs.getString(26));
						usBean.setDistance("<span style='color:red;'>"+rs.getString(34)+"</span>");
						usBean.setCust_ref_id(rs.getString(55));
						
						l1.add(usBean);
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}
	
	
	
	public static String jobworkcreation(FormBean FormBean,String user) {
		boolean result = false;
		// Connect to database and save the FormBean object to database table
		String sql = null;
		int k=0;
		java.util.Date dt = new java.util.Date();
		final String td = (dt.getYear() + 1900) + "-" + (dt.getMonth() + 1)+ "-" + dt.getDate();
		String s="",z="";
		int r=0;
		int x=0,y=0;
		try
		{
		LatitudeAndLongitudeWithPincode lp=new LatitudeAndLongitudeWithPincode();
		s=lp.Totaldistance(FormBean.getPcode());
		}
		catch(Exception e)
		{
			
		}
		
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
				
				if (FormBean.getId() != null) 
				{
					
					//System.out.println("Name: "+FormBean.getName());
					
					// added by Nilesh 4th April
					String w="0";
					if(FormBean.getWifi1().equals("1"))
					{
						w="1";
					}
					else if(FormBean.getWifi1().equals("0"))
					{
						w="0";
					}
					
					String v = "0";
					if(FormBean.getBag1().equals("1"))
					{
						v="1";
					}
					else if(FormBean.getBag1().equals("0"))
					{
						v="0";
					}
					
										
					sql = "update jobwork_entry set brand ='"+FormBean.getBname()
							+"',call_type='"+FormBean.getCtype()
							+"',call_date='"+FormBean.getCdate()
							+"',call_type='"+FormBean.getCtype()
							+"',companycall_id='"+FormBean.getScode()
							+"',customer_name='"+FormBean.getName()
							+"',address='"+FormBean.getAddress()
							+"',place_code='"+FormBean.getPlace()
							+"',city='"+FormBean.getCity()
							+"',district='"+FormBean.getDistrict()
							+"',postal_code='"+FormBean.getPcode()
							+"',phone_no='"+FormBean.getPon()
							+"',mobile_no='"+FormBean.getMobile()
							+"',email_id='"+FormBean.getEmail()
							+"',model_code='"+FormBean.getMcode()
							+"',product_name='"+FormBean.getFname()
							+"',product_slno='"+FormBean.getPserial()
							+"',purchase_date='"+FormBean.getPdate()
							+"',complain_code='"+FormBean.getComcode()
							+"',call_category='"+"NA"
							+"',call_priority='"+FormBean.getCptype()
							+"',payout_type='"+FormBean.getPtype()
							+"',cus_remarks='"+FormBean.getRemarks()
							+"',distance='"+s
							+"',scharge='"+FormBean.getAmount()
							+"',icharge='"+FormBean.getIcharge()
							
							+"',adopter_serialno='"+FormBean.getAdapter1()
							+"',battery_serialno='"+FormBean.getBattery1()
							+"',harddisk_details='"+FormBean.getHarddisk1()
							+"',odd_details='"+FormBean.getOdd1()
							+"',ram_details='"+FormBean.getRam1()
							+"',screen_details='"+FormBean.getScreen1()
							+"',keyboard_details='"+FormBean.getKeyboard1()
							+"',Other_details='"+FormBean.getOther1()
							+"',physical_damage='"+FormBean.getPhysical1()
							
							//+"',Wifi='"+FormBean.getWifi1()
							+"',Wifi='"+w
							
							//+"',bag='"+FormBean.getBag1()
							+"',bag='"+v
							
							
							+"',checked_by='"+FormBean.getEngineername1()
							
							+"',customer_ref_id='"+FormBean.getCust_ref_id()
							
							+"' where id ="+FormBean.getId();
										
						//System.out.println(sql);
						
						result = ConnectionDAO.executeUpdate(stm, sql);

					sql = "insert into jobwork_history(brand,call_type,call_date,systemcall_id,companycall_id,customer_name,address,place_code,city,district,postal_code,phone_no,"+
						      "mobile_no,email_id,model_code,product_name,product_slno,purchase_date,complain_code,complain_text,call_category,"+
						      "call_priority,payout_type,cus_remarks,user,distance,scharge,icharge,adopter_serialno,battery_serialno,harddisk_details,odd_details,ram_details,screen_details,keyboard_details,Other_details,physical_damage,Wifi,bag,checked_by,customer_ref_id) values ('"				      
						      	+ FormBean.getBname() 
								+ "','"
						      	+ FormBean.getCtype()
								+ "','"
								+ FormBean.getCdate() 
								+ "','"
								+ FormBean.getCcode()
								+ "','"
								+ FormBean.getScode()
								+ "','"
								+ FormBean.getName()
								+ "','"
								+ FormBean.getAddress()
								+ "','"
								+ FormBean.getPlace()
								+ "','"
								+ FormBean.getCity()
								+ "','"
								+ FormBean.getDistrict()
								+ "','"
								+ FormBean.getPcode()
								+ "','"
								+ FormBean.getPon()
								+ "','"
								+ FormBean.getMobile()
								+ "','"
								+ FormBean.getEmail()
								+ "','"
								+ FormBean.getMcode()
								+ "','"
								+ FormBean.getFname()
								+ "','"
								+ FormBean.getPserial()
								+ "','"
								+ FormBean.getPdate()
								+ "','"
								+ FormBean.getComcode()
								+ "','"
								+ "NA"
								+ "','"
								+ "NA"  
								+ "','"
								+ FormBean.getCptype()
								+ "','"
								+ FormBean.getPtype()
								+ "','"
								+ FormBean.getRemarks()
								+ "','"
								+ user
								+"','"
								+s
								+ "','"
								+ FormBean.getAmount()
								+ "','"
								+ FormBean.getIcharge()
								+"','"
								
								+ FormBean.getAdapter1()
								+"','"
								+ FormBean.getBattery1()
								+"','"
								+ FormBean.getHarddisk1()
								+"','"
								+ FormBean.getOdd1()
								+"','"
								+ FormBean.getRam1()
								+"','"
								+ FormBean.getScreen1()
								+"','"
								+ FormBean.getKeyboard1()
								+"','"
								+ FormBean.getOther1()
								+"','"
								+ FormBean.getPhysical1()
								
								/*+"','"
								+ FormBean.getWifi1()*/
								
								+"','"
								+ w
								
								
								/*+"','"
								+ FormBean.getBag1()*/
								
								+"','"
								+ v
								
								+"','"
								+ FormBean.getEngineername1()
								+"','"
								+ FormBean.getCust_ref_id()
								+"');";
						
						result = ConnectionDAO.executeUpdate(stm, sql);
						k=2;
				}
				else
				{
					/*sql = "select * from jobwork_entry where companycall_id='"+FormBean.getScode()+"'";
					
					
					try 
					{
						ResultSet rs = stm.executeQuery(sql);
						while (rs.next()) 
							{								
								k=1;								
							}
					} 
				catch (SQLException e) 
					{
						e.printStackTrace();
					}*/
					
					if(k==0)
					{
						
						// added by Nilesh 4th April
						String w="0";
						if(FormBean.getWifi1().equals("1"))
						{
							w="1";
						}
						else if(FormBean.getWifi1().equals("0"))
						{
							w="0";
						}
						
						String v = "0";
						if(FormBean.getBag1().equals("1"))
						{
							v="1";
						}
						else if(FormBean.getBag1().equals("0"))
						{
							v="0";
						}
						
						
						String c= FormBean.getScode();
						//System.out.println("company call id: "+c);
                        z=c;
						String value=c.substring(8);
					 y=Integer.parseInt(value.trim());
						//System.out.println("value got: "+value.trim()+" integer value: "+y);
						
						sql="select max(id) from jobwork_entry";
						try
						{
							ResultSet rs = stm.executeQuery(sql);
						while(rs.next())
						{
							x = rs.getInt(1);
							
						}
					//System.out.println("Max id of jobwork: "+x);
					//	x=x+1;
				
					
						
					} 
				catch (SQLException e) 
					{
						e.printStackTrace();
					}
						
						sql="select * from jobwork_entry where id= " +x;
						//System.out.println(sql);
						
						try
						{
							ResultSet rs = stm.executeQuery(sql);
						while(rs.next())
						{
							r = rs.getInt(57);
							
						}
					//System.out.println("Max id of bill no: "+r);
					r=r+1;
					//System.out.println("final of bill no: "+r);
					
						
					} 
				catch (SQLException e) 
					{
						e.printStackTrace();
					}
						
						if (x>(y-1))
						{
							x=x+1;
							z="EZC/RNC "+x;
							//System.out.println("output: "+z);
						}
					sql = "insert into jobwork_entry(brand,call_type,call_date,systemcall_id,companycall_id,customer_name,address,place_code,city,district,postal_code,phone_no,"+
					      "mobile_no,email_id,model_code,product_name,product_slno,purchase_date,complain_code,complain_text,call_category,"+
					      "call_priority,payout_type,cus_remarks,user,distance,scharge,icharge,adopter_serialno,battery_serialno,harddisk_details,odd_details,ram_details,screen_details,keyboard_details,Other_details,physical_damage,Wifi,bag,checked_by,customer_ref_id) values ('"				      
					      	+ FormBean.getBname() 
							+ "','"
					      	+ FormBean.getCtype()
							+ "','"
							+ FormBean.getCdate() 
							+ "','"
							+ FormBean.getCcode()
							+ "','"
							+ z
							+ "','"
							+ FormBean.getName()
							+ "','"
							+ FormBean.getAddress()
							+ "','"
							+ FormBean.getPlace()
							+ "','"
							+ FormBean.getCity()
							+ "','"
							+ FormBean.getDistrict()
							+ "','"
							+ FormBean.getPcode()
							+ "','"
							+ FormBean.getPon()
							+ "','"
							+ FormBean.getMobile()
							+ "','"
							+ FormBean.getEmail()
							+ "','"
							+ FormBean.getMcode()
							+ "','"
							+ FormBean.getFname()
							+ "','"
							+ FormBean.getPserial()
							+ "','"
							+ FormBean.getPdate()
							+ "','"
							+ FormBean.getComcode()
							+ "','"
							+ "NA"
							+ "','"
							+ "NA"
							+ "','"
							+ FormBean.getCptype()
							+ "','"
							+ FormBean.getPtype()
							+ "','"
							+ FormBean.getRemarks()
							+ "','"
							+ user
							+ "','"
							+ s
							+ "','"
							+ FormBean.getAmount()
							+ "','"
							+ FormBean.getIcharge()
							+"','"
							
							+ FormBean.getAdapter1()
							+"','"
							+ FormBean.getBattery1()
							+"','"
							+ FormBean.getHarddisk1()
							+"','"
							+ FormBean.getOdd1()
							+"','"
							+ FormBean.getRam1()
							+"','"
							+ FormBean.getScreen1()
							+"','"
							+ FormBean.getKeyboard1()
							+"','"
							+ FormBean.getOther1()
							+"','"
							+ FormBean.getPhysical1()
							+"','"
							
							
							+ FormBean.getWifi1()
							
							/*+ w*/
							
							+"','"
							
							
							+ FormBean.getBag1()
							
							/*+ v*/
							
							+"','"
							
							
							+ FormBean.getEngineername1()
							+"','"
							
							+ FormBean.getCust_ref_id()
							+"');";
					
					result = ConnectionDAO.executeUpdate(stm, sql);
					//System.out.println(sql);
					
					sql = "insert into jobwork_history(brand,call_type,call_date,systemcall_id,companycall_id,customer_name,address,place_code,city,district,postal_code,phone_no,"+
						      "mobile_no,email_id,model_code,product_name,product_slno,purchase_date,complain_code,complain_text,call_category,"+
						      "call_priority,payout_type,cus_remarks,user,distance,scharge,icharge,adopter_serialno,battery_serialno,harddisk_details,odd_details,ram_details,screen_details,keyboard_details,Other_details,physical_damage,Wifi,bag,checked_by,customer_ref_id) values ('"				      
						      	+ FormBean.getBname() 
								+ "','"
						      	+ FormBean.getCtype()
								+ "','"
								+ FormBean.getCdate() 
								+ "','"
								+ FormBean.getCcode()
								+ "','"
								+ FormBean.getScode()
								+ "','"
								+ FormBean.getName()
								+ "','"
								+ FormBean.getAddress()
								+ "','"
								+ FormBean.getPlace()
								+ "','"
								+ FormBean.getCity()
								+ "','"
								+ FormBean.getDistrict()
								+ "','"
								+ FormBean.getPcode()
								+ "','"
								+ FormBean.getPon()
								+ "','"
								+ FormBean.getMobile()
								+ "','"
								+ FormBean.getEmail()
								+ "','"
								+ FormBean.getMcode()
								+ "','"
								+ FormBean.getFname()
								+ "','"
								+ FormBean.getPserial()
								+ "','"
								+ FormBean.getPdate()
								+ "','"
								+ FormBean.getComcode()
								+ "','"
								+ "NA"
								+ "','"
								+ "NA"
								+ "','"
								+ FormBean.getCptype()
								+ "','"
								+ FormBean.getPtype()
								+ "','"
								+ FormBean.getRemarks()
								+ "','"
								+ user
								+ "','"
								+ s
								+ "','"
								+ FormBean.getAmount()
								+ "','"
								+ FormBean.getIcharge()
								+"','"
								+ FormBean.getAdapter1()
								+"','"
								+ FormBean.getBattery1()
								+"','"
								+ FormBean.getHarddisk1()
								+"','"
								+ FormBean.getOdd1()
								+"','"
								+ FormBean.getRam1()
								+"','"
								+ FormBean.getScreen1()
								+"','"
								+ FormBean.getKeyboard1()
								+"','"
								+ FormBean.getOther1()
								+"','"
								+ FormBean.getPhysical1()
								+"','"
								+ FormBean.getWifi1()
								+"','"
								+ FormBean.getBag1()
								+"','"
								
								+ FormBean.getEngineername1()
								+"','"
								
								+ FormBean.getCust_ref_id()
								+"');";
						
						result = ConnectionDAO.executeUpdate(stm, sql);
					}
					
				}
				return k+z;
		}
	
	public static FormBean jobworkedit(int id) {
		FormBean usBean = new FormBean();
		String sql = "select * from jobwork_entry where id = " + id;
		String sql1 = "select * from jobwork_history where id = " + id;
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try {			
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
				usBean.setId(rs.getInt(1));
				usBean.setBname(rs.getString(2));
				usBean.setCtype(rs.getString(3));
				usBean.setCdate(rs.getString(4));
				System.out.println("call date: "+rs.getString(4));
				usBean.setCcode(rs.getString(5));
				usBean.setScode(rs.getString(6));
				usBean.setName(rs.getString(7));
				usBean.setAddress(rs.getString(8));
				usBean.setPlace(rs.getString(9));
				usBean.setCity(rs.getString(10));
				usBean.setDistrict(rs.getString(11));
				usBean.setPcode(rs.getString(12));
				usBean.setPon(rs.getString(13));
				usBean.setMobile(rs.getString(14));
				usBean.setEmail(rs.getString(15));
				
				usBean.setMcode(rs.getString(16));
				usBean.setFname(rs.getString(17));
				usBean.setPserial(rs.getString(18));
				usBean.setPdate(rs.getString(19));
				//System.out.println(rs.getString(20));
				usBean.setComcode(rs.getString(20));
				usBean.setCatagory(rs.getString(22));
				usBean.setCptype(rs.getString(23));
				
				usBean.setPtype(rs.getString(24));
				usBean.setRemarks(rs.getString(25));
				usBean.setAmount(rs.getString(39));
				usBean.setIcharge(rs.getString(40));
				
				usBean.setAdopter(rs.getString(42));
				usBean.setBattery(rs.getString(43));
				usBean.setHdd(rs.getString(44));
				usBean.setOpd(rs.getString(45));
				usBean.setRam(rs.getString(46));
				usBean.setScreen(rs.getString(47));
				usBean.setKeyboard(rs.getString(48));
				usBean.setOtheraccessories(rs.getString(49));
				usBean.setPhysicaldamaged(rs.getString(50));
				usBean.setWifi_yes_no(rs.getString(51));
				usBean.setBag_yes_no(rs.getString(52));	
				usBean.setEngineername1(rs.getString(53));				
				usBean.setCust_ref_id(rs.getString(55));
					
				}
			
			/*rs = stm.executeQuery(sql1);
			while (rs.next()) 
				{
					usBean.setId(rs.getInt(1));
					usBean.setCdate(rs.getString(2));
					usBean.setCtype(rs.getString(3));
					usBean.setCcode(rs.getString(4));
					usBean.setScode(rs.getString(5));
					
				}*/
			
		}
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
	
			ConnectionDAO.closeConnection(conn);
			return usBean;
			}

	public static boolean jobworkdelete(int id) {
		boolean result = false;
		String sql = "delete from jobwork_entry where id = " + id;
		String sql1 = "delete from jobwork_history where id = " + id;
		
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		
		result = ConnectionDAO.executeUpdate(stm, sql);
		result = ConnectionDAO.executeUpdate(stm, sql1);
		
		ConnectionDAO.closeConnection(conn);
		return result;
		}
	
	public static FormBean uniqueid() {
		
		UniqueIDGenerator u = new UniqueIDGenerator(); 
		String x=u.getUniqueID();
		int j=0;
		FormBean usBean = new FormBean();
		String sql = "select * from uniqueid";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try {			
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					j=rs.getInt(3);
										
				}
			
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			// System.out.println(dateFormat.format(date));
			final String td = dateFormat.format(date);
			String ntd=td.replaceAll("-", "");
			String x0=ntd+j;
			usBean.setCcode(x0);
			
			sql = "insert into uniqueid(uid,sid) values ('"
					+ x /* "DS000"+(k+1)  */
					+ "','"
					+ (j+1)
					+"');";
			
			
			rs = stm.executeQuery("select * from uniqueid");
			while (rs.next()) 
				{
					j=rs.getInt(3);
										
				}
			
			int k=String.valueOf(j).length();
			
			String x00="";
			if(k==1)
			x00="PC"+"0000"+j;
			if(k==2)
			x00="PC"+"000"+j;
			if(k==3)
			x00="PC"+"00"+j;
			if(k==4)
			x00="PC"+"0"+j;
			if(k==5)
				x00="PC"+j;
			usBean.setMcode(x00);
			
			
			sql = "insert into uniqueid(uid,sid) values ('"
					+ x /* "DS000"+(k+1)  */
					+ "','"
					+ (j+1)
					+"');";
			
			rs = stm.executeQuery("select * from uniqueid");
			while (rs.next()) 
				{
					j=rs.getInt(3);
										
				}
			
			k=String.valueOf(j).length();
			
			String x000="";
			if(k==1)
			x000="MC"+"0000"+j;
			if(k==2)
			x000="MC"+"000"+j;
			if(k==3)
			x000="MC"+"00"+j;
			if(k==4)
			x000="MC"+"0"+j;
			if(k==5)
				x000="MC"+j;
			usBean.setModelcode(x000);
			
			
			sql = "insert into uniqueid(uid,sid) values ('"
					+ x /* "DS000"+(k+1)  */
					+ "','"
					+ (j+1)
					+"');";
			
			rs = stm.executeQuery("select * from uniqueid");
			while (rs.next()) 
				{
					j=rs.getInt(3);
										
				}
			
			k=String.valueOf(j).length();
			
			String x0000="";
			if(k==1)
			x0000="BR"+"0000"+j;
			if(k==2)
			x0000="BR"+"000"+j;
			if(k==3)
			x0000="BR"+"00"+j;
			if(k==4)
			x0000="BR"+"0"+j;
			if(k==5)
				x0000="BR"+j;
			usBean.setBrandcode(x0000);
			
			
			sql = "insert into uniqueid(uid,sid) values ('"
					+ x /* "DS000"+(k+1)  */
					+ "','"
					+ (j+1)
					+"');";
			
			rs = stm.executeQuery("select * from uniqueid");
			while (rs.next()) 
				{
					j=rs.getInt(3);
										
				}
			
			k=String.valueOf(j).length();
			
			String x00000="";
			if(k==1)
			x00000="CC"+"0000"+j;
			if(k==2)
			x00000="CC"+"000"+j;
			if(k==3)
			x00000="CC"+"00"+j;
			if(k==4)
			x00000="CC"+"0"+j;
			if(k==5)
				x00000="CC"+j;
			usBean.setComplaincode(x00000);
			
			
			sql = "insert into uniqueid(uid,sid) values ('"
					+ x /* "DS000"+(k+1)  */
					+ "','"
					+ (j+1)
					+"');";
			
			ConnectionDAO.executeUpdate(stm, sql);
		}
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
	
			ConnectionDAO.closeConnection(conn);
			return usBean;
			}
	
	public static List<FormBean> englist(String user) 
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		String ch="a";

		String sql = "select * from user where USERNAME='"+user+"'";
		
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
		
		if(k.compareTo("ROLE_ADMIN")==0)
		sql = "select * from jobwork_entry where (allocated_engr='"+"NA"+"' or eng_status!='"+"REPAIR READY"+"' or eng_status!='"+"UN-REPAIR READY"+"') and call_type='"+"CARRY IN"+"' order by id desc ";
		else
		sql = "select * from jobwork_entry where (allocated_engr='"+"NA"+"' or eng_status!='"+"REPAIR READY"+"' or eng_status!='"+"UN-REPAIR READY"+"') and call_type='"+"CARRY IN"+"'and user='"+user+"' order by id desc ";
		//System.out.println(sql);
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				while (rs.next()) 
					{
						usBean = new FormBean();
						usBean.setId(rs.getInt(1));
						usBean.setBname(rs.getString(2));
						usBean.setCtype(rs.getString(3));
						usBean.setCdate(rs.getString(4));
						usBean.setCcode(rs.getString(5));
						usBean.setScode(rs.getString(6));
						usBean.setName(rs.getString(7));
						usBean.setAddress(rs.getString(8));
						usBean.setPlace(rs.getString(9));
						usBean.setCity(rs.getString(10));
						usBean.setDistrict(rs.getString(11));
						usBean.setPcode(rs.getString(12));
						usBean.setPon(rs.getString(13));
						usBean.setMobile(rs.getString(14));
						usBean.setEmail(rs.getString(15));
						
						usBean.setMcode(rs.getString(16));
						usBean.setFname(rs.getString(17));
						usBean.setPserial(rs.getString(18));
						usBean.setPdate(rs.getString(19));
						usBean.setComcode(rs.getString(20));
						usBean.setCatagory(rs.getString(22));
						usBean.setCptype(rs.getString(23));
						usBean.setEngstatus(rs.getString(29));
						usBean.setPtype(rs.getString(24));
						usBean.setRemarks(rs.getString(25));
						usBean.setAllocation(rs.getString(26));
						usBean.setCheck(ch);
						usBean.setCust_ref_id(rs.getString(55));
						usBean.setApproved(rs.getString(54));
																	
						l1.add(usBean);
					}
			}
		
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}
	
	public static List<FormBean> englistc(String user) 
	{
		List<FormBean> l1 = new ArrayList<FormBean>();
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		
		String sql = "select * from user where USERNAME='"+user+"'";
		
		String k="";
		
		try 
		{
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{								
					k=rs.getString(3);								
				}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		if(k.compareTo("ROLE_ADMIN")==0)
		sql = "select * from jobwork_entry where (allocated_engr='"+"NA"+"' or eng_status!='"+"CLOSE"+"') and call_type='"+"ON SITE"+"'";
		else
		sql = "select * from jobwork_entry where (allocated_engr='"+"NA"+"' or eng_status!='"+"CLOSE"+"') and call_type='"+"ON SITE"+"' and user='"+user+"'";
		
		try 
			{
				ResultSet rs = stm.executeQuery(sql);
				FormBean usBean;
				while (rs.next()) 
					{
						usBean = new FormBean();
						usBean.setId(rs.getInt(1));
						usBean.setBname(rs.getString(2));
						usBean.setCtype(rs.getString(3));
						usBean.setCdate(rs.getString(4));
						usBean.setCcode(rs.getString(5));
						usBean.setScode(rs.getString(6));
						usBean.setName(rs.getString(7));
						usBean.setAddress(rs.getString(8));
						usBean.setPlace(rs.getString(9));
						usBean.setCity(rs.getString(10));
						usBean.setDistrict(rs.getString(11));
						usBean.setPcode(rs.getString(12));
						usBean.setPon(rs.getString(13));
						usBean.setMobile(rs.getString(14));
						usBean.setEmail(rs.getString(15));
						
						usBean.setMcode(rs.getString(16));
						usBean.setFname(rs.getString(17));
						usBean.setPserial(rs.getString(18));
						usBean.setPdate(rs.getString(19));
						usBean.setComcode(rs.getString(20));
						usBean.setCatagory(rs.getString(22));
						usBean.setCptype(rs.getString(23));
						
						usBean.setPtype(rs.getString(24));
						usBean.setRemarks(rs.getString(25));
						usBean.setAllocation(rs.getString(26));
						usBean.setDistance("<span style='color:red;'>"+rs.getString(34)+"</span>");
																	
						l1.add(usBean);
					}
			} 
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
		ConnectionDAO.closeConnection(conn);
		return l1;
	}
	
	public static boolean engcreationcin(FormBean FormBean,int id) {
		boolean result = false;
		int x=0;
		// Connect to database and save the FormBean object to database table
		String sql = null;
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String ts=""+new Timestamp(date.getTime());
		//System.out.println("Time: "+ts);
		
		//ts=ts.replace("-", "");
		//System.out.println("ts: "+ts);
		String ts1[]=ts.split("[.]");
		ts=ts1[0];

				
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
				
					if(FormBean.getCatagory().compareTo("WITH SPARE")==0)
					{
					sql = "update jobwork_entry set allocated_engr ='"+FormBean.getEngname()+"', spare_included ='"+FormBean.getSpare()+"', allocated_date ='"+ts+"', expence_given='"+"0.00"+"' where id ="+id;
													
					//System.out.println(sql);
					result = ConnectionDAO.executeUpdate(stm, sql);
					
					
					
					String a[]=new String[25];
					sql = "select * from jobwork_entry where id="+id;
					try 
					{
						ResultSet rs = stm.executeQuery(sql);
						while (rs.next()) 
							{								
								a[0]=rs.getString(2);
								a[1]=rs.getString(3);
								a[2]=rs.getString(4);
								a[3]=rs.getString(5);
								a[4]=rs.getString(6);
								a[5]=rs.getString(7);
								a[6]=rs.getString(8);
								a[7]=rs.getString(9);
								a[8]=rs.getString(10);
								a[9]=rs.getString(11);
								a[10]=rs.getString(12);
								a[11]=rs.getString(13);
								a[12]=rs.getString(14);
								a[13]=rs.getString(15);
								a[14]=rs.getString(16);
								a[15]=rs.getString(17);
								a[16]=rs.getString(18);
								a[17]=rs.getString(19);
								a[18]=rs.getString(20);
								a[19]=rs.getString(21);
								a[20]=rs.getString(22);
								a[21]=rs.getString(23);
								a[22]=rs.getString(24);
								a[23]=rs.getString(25);
								a[24]=rs.getString(34);
							}
						//System.out.println("X value: "+x);	
					} 
				catch (SQLException e) 
					{
						e.printStackTrace();
					}
					
					sql = "insert into jobwork_history(brand,call_type,call_date,systemcall_id,companycall_id,customer_name,address,place_code,city,district,postal_code,phone_no,"+
						      "mobile_no,email_id,model_code,product_name,product_slno,purchase_date,complain_code,complain_text,call_category,"+
						      "call_priority,payout_type,cus_remarks,allocated_engr,spare_included,allocated_date,user,distance,expence_given) values ('"				      
						      	+ a[0] 
								+ "','"
						      	+ a[1]
								+ "','"
								+ a[2] 
								+ "','"
								+ a[3]
								+ "','"
								+ a[4]
								+ "','"
								+ a[5]
								+ "','"
								+ a[6]
								+ "','"
								+ a[7]
								+ "','"
								+ a[8]
								+ "','"
								+ a[9]
								+ "','"
								+ a[10]
								+ "','"
								+ a[11]
								+ "','"
								+ a[12]
								+ "','"
								+ a[13]
								+ "','"
								+ a[14]
								+ "','"
								+ a[15]
								+ "','"
								+ a[16]
								+ "','"
								+ a[17]
								+ "','"
								+ a[18]
								+ "','"
								+ a[19]
								+ "','"
								+ a[20]
								+ "','"
								+ a[21]
								+ "','"
								+ a[22]
								+ "','"
								+ a[23]
								+ "','"
								+ FormBean.getEngname()
								+ "','"
								+ FormBean.getSpare()
								+ "','"
								+ ts
								+"','"
								+ FormBean.getUser()
								+"','"
								+ a[24]
								+"','"
								+ "0.00"
								+"');";
						
						result = ConnectionDAO.executeUpdate(stm, sql);
						
						java.util.Date dt = new java.util.Date();
						final String td = (dt.getYear() + 1900) + "-" + (dt.getMonth() + 1)+ "-" + dt.getDate();
						
						String spare[]=FormBean.getSpare().split(",");
						if(spare.length>0)
						{
							for(int i=0;i<spare.length;i++)
							{
								sql = "insert into spare_table(companycall_Id,eng_name,spare_name,spareallocation_date) values ('"				      
									      	+ a[4] 
											+ "','"
									      	+ FormBean.getEngname()
											+ "','"
											+ spare[i] 
											+ "','"
											+ td
											+"');";
									
									result = ConnectionDAO.executeUpdate(stm, sql);
							}
						}
						else
						{
							sql = "insert into spare_table(companycall_Id,eng_name,spare_name,spareallocation_date) values ('"				      
							      	+ a[4] 
									+ "','"
							      	+ FormBean.getEngname()
									+ "','"
									+ FormBean.getSpare()
									+ "','"
									+ td
									+"');";
							
							result = ConnectionDAO.executeUpdate(stm, sql);
						}
						
					}
					else
					{
						
						sql = "update jobwork_entry set allocated_engr ='"+FormBean.getEngname()+"', spare_included ='"+"NA"+"', allocated_date ='"+ts+"',spare_details='"+"Done"+"',expence_given='"+"0.00"+"' where id ="+id;
														
						//System.out.println(sql);
						result = ConnectionDAO.executeUpdate(stm, sql);
						
						
						
						String a[]=new String[25];
						sql = "select * from jobwork_entry where id="+id;
						try 
						{
							ResultSet rs = stm.executeQuery(sql);
							while (rs.next()) 
								{								
									a[0]=rs.getString(2);
									a[1]=rs.getString(3);
									a[2]=rs.getString(4);
									a[3]=rs.getString(5);
									a[4]=rs.getString(6);
									a[5]=rs.getString(7);
									a[6]=rs.getString(8);
									a[7]=rs.getString(9);
									a[8]=rs.getString(10);
									a[9]=rs.getString(11);
									a[10]=rs.getString(12);
									a[11]=rs.getString(13);
									a[12]=rs.getString(14);
									a[13]=rs.getString(15);
									a[14]=rs.getString(16);
									a[15]=rs.getString(17);
									a[16]=rs.getString(18);
									a[17]=rs.getString(19);
									a[18]=rs.getString(20);
									a[19]=rs.getString(21);
									a[20]=rs.getString(22);
									a[21]=rs.getString(23);
									a[22]=rs.getString(24);
									a[23]=rs.getString(25);
									a[24]=rs.getString(34);
								}
							//System.out.println("X value: "+x);	
						} 
					catch (SQLException e) 
						{
							e.printStackTrace();
						}
						
						sql = "insert into jobwork_history(brand,call_type,call_date,systemcall_id,companycall_id,customer_name,address,place_code,city,district,postal_code,phone_no,"+
							      "mobile_no,email_id,model_code,product_name,product_slno,purchase_date,complain_code,complain_text,call_category,"+
							      "call_priority,payout_type,cus_remarks,allocated_engr,spare_included,allocated_date,user,distance,spare_details,expence_given) values ('"				      
							      	+ a[0] 
									+ "','"
							      	+ a[1]
									+ "','"
									+ a[2] 
									+ "','"
									+ a[3]
									+ "','"
									+ a[4]
									+ "','"
									+ a[5]
									+ "','"
									+ a[6]
									+ "','"
									+ a[7]
									+ "','"
									+ a[8]
									+ "','"
									+ a[9]
									+ "','"
									+ a[10]
									+ "','"
									+ a[11]
									+ "','"
									+ a[12]
									+ "','"
									+ a[13]
									+ "','"
									+ a[14]
									+ "','"
									+ a[15]
									+ "','"
									+ a[16]
									+ "','"
									+ a[17]
									+ "','"
									+ a[18]
									+ "','"
									+ a[19]
									+ "','"
									+ a[20]
									+ "','"
									+ a[21]
									+ "','"
									+ a[22]
									+ "','"
									+ a[23]
									+ "','"
									+ FormBean.getEngname()
									+ "','"
									+ "NA"
									+ "','"
									+ ts
									+ "','"
									+ FormBean.getUser()
									+ "','"
									+ a[24]
									+ "','"
									+ "Done"
									+ "','"
									+ "0.00"
									+"');";
							
							result = ConnectionDAO.executeUpdate(stm, sql);
							
							
							
					}
						return result;
					
				
		}
	
	public static boolean engcreationcin1(FormBean FormBean,String id) {
		boolean result = false;
		int x=0;
		// Connect to database and save the FormBean object to database table
		String sql = null;
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String ts=""+new Timestamp(date.getTime());
		//System.out.println("Time: "+ts);
		
		
		//ts=ts.replace("-", "");
		//System.out.println("ts: "+ts);
		String ts1[]=ts.split("[.]");
		ts=ts1[0];

				
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
				
					if(FormBean.getCatagory().compareTo("WITH SPARE")==0)
					{
									
					
					String a[]=new String[31];
					sql = "select * from jobwork_entry where id="+id;
					try 
					{
						ResultSet rs = stm.executeQuery(sql);
						while (rs.next()) 
							{								
								a[0]=rs.getString(2);
								a[1]=rs.getString(3);
								a[2]=rs.getString(4);
								a[3]=rs.getString(5);
								a[4]=rs.getString(6);
								a[5]=rs.getString(7);
								a[6]=rs.getString(8);
								a[7]=rs.getString(9);
								a[8]=rs.getString(10);
								a[9]=rs.getString(11);
								a[10]=rs.getString(12);
								a[11]=rs.getString(13);
								a[12]=rs.getString(14);
								a[13]=rs.getString(15);
								a[14]=rs.getString(16);
								a[15]=rs.getString(17);
								a[16]=rs.getString(18);
								a[17]=rs.getString(19);
								a[18]=rs.getString(20);
								a[19]=rs.getString(21);
								a[20]=rs.getString(22);
								a[21]=rs.getString(23);
								a[22]=rs.getString(24);
								a[23]=rs.getString(25);
								a[24]=rs.getString(28);
								a[25]=rs.getString(29);
								a[26]=rs.getString(30);
								a[27]=rs.getString(34);
								a[28]=rs.getString(36);
								a[29]=rs.getString(37);
								a[30]=rs.getString(38);
								
							}
						//System.out.println("X value: "+x);	
					} 
					catch (SQLException e) 
					{
						e.printStackTrace();
					}
					
					double d=Double.parseDouble(a[28])+Double.parseDouble("0.00");
					sql = "update jobwork_entry set allocated_engr ='"+FormBean.getEngname()+"', spare_included ='"+FormBean.getSpare()+"', allocated_date ='"+ts+"', expence_given='"+""+d+"',spare_details='"+"NA"+"' where id ="+id;
					//System.out.println(sql);
					result = ConnectionDAO.executeUpdate(stm, sql);
					
					java.util.Date dt = new java.util.Date();
					final String td = (dt.getYear() + 1900) + "-" + (dt.getMonth() + 1)+ "-" + dt.getDate();
					
					sql = "update parts_required set status ='"+"Done"+"', user ='"+FormBean.getUser()+"', senddate ='"+td+"', engstatus='"+"P"+"' where companycall_Id ='"+FormBean.getComcode()+"'";
					//System.out.println(sql);
					result = ConnectionDAO.executeUpdate(stm, sql);
					
					sql = "insert into jobwork_history(brand,call_type,call_date,systemcall_id,companycall_id,customer_name,address,place_code,city,district,postal_code,phone_no,"+
						      "mobile_no,email_id,model_code,product_name,product_slno,purchase_date,complain_code,complain_text,call_category,"+
						      "call_priority,payout_type,cus_remarks,allocated_engr,spare_included,allocated_date,eng_status,eng_remarks,user,distance,spare_details,expence_given,real_expence,expence_details) values ('"				      
						      	+ a[0] 
								+ "','"
						      	+ a[1]
								+ "','"
								+ a[2] 
								+ "','"
								+ a[3]
								+ "','"
								+ a[4]
								+ "','"
								+ a[5]
								+ "','"
								+ a[6]
								+ "','"
								+ a[7]
								+ "','"
								+ a[8]
								+ "','"
								+ a[9]
								+ "','"
								+ a[10]
								+ "','"
								+ a[11]
								+ "','"
								+ a[12]
								+ "','"
								+ a[13]
								+ "','"
								+ a[14]
								+ "','"
								+ a[15]
								+ "','"
								+ a[16]
								+ "','"
								+ a[17]
								+ "','"
								+ a[18]
								+ "','"
								+ a[19]
								+ "','"
								+ a[20]
								+ "','"
								+ a[21]
								+ "','"
								+ a[22]
								+ "','"
								+ a[23]
								+ "','"
								+ FormBean.getEngname()
								+ "','"
								+ FormBean.getSpare()
								+ "','"
								+ a[24]
								+ "','"
								+ a[25]
								+ "','"
								+ a[26]
								+ "','"
								+ FormBean.getUser()
								+ "','"
								+ a[27]
								+ "','"
								+ "NA"
								+ "','"
								+ "0.00"
								+ "','"
								+ a[29]
								+ "','"
								+ a[30]
								+"');";
						
						result = ConnectionDAO.executeUpdate(stm, sql);
						
						sql = "delete from spare_table where companycall_Id ='" + FormBean.getComcode()+"'";
						
						result = ConnectionDAO.executeUpdate(stm, sql);
						
						String spare[]=FormBean.getSpare().split(",");
						if(spare.length>0)
						{
							for(int i=0;i<spare.length;i++)
							{
								sql = "insert into spare_table(companycall_Id,eng_name,spare_name,spareallocation_date) values ('"				      
									      	+ a[4] 
											+ "','"
									      	+ FormBean.getEngname()
											+ "','"
											+ spare[i] 
											+ "','"
											+ td
											+"');";
									
									result = ConnectionDAO.executeUpdate(stm, sql);
							}
						}
						else
						{
							sql = "insert into spare_table(companycall_Id,eng_name,spare_name,spareallocation_date) values ('"				      
							      	+ a[4] 
									+ "','"
							      	+ FormBean.getEngname()
									+ "','"
									+ FormBean.getSpare()
									+ "','"
									+ td
									+"');";
							
							result = ConnectionDAO.executeUpdate(stm, sql);
						}
						
					}
					else
					{
						
						String a[]=new String[31];
						sql = "select * from jobwork_entry where id="+id;
						try 
						{
							ResultSet rs = stm.executeQuery(sql);
							while (rs.next()) 
								{								
									a[0]=rs.getString(2);
									a[1]=rs.getString(3);
									a[2]=rs.getString(4);
									a[3]=rs.getString(5);
									a[4]=rs.getString(6);
									a[5]=rs.getString(7);
									a[6]=rs.getString(8);
									a[7]=rs.getString(9);
									a[8]=rs.getString(10);
									a[9]=rs.getString(11);
									a[10]=rs.getString(12);
									a[11]=rs.getString(13);
									a[12]=rs.getString(14);
									a[13]=rs.getString(15);
									a[14]=rs.getString(16);
									a[15]=rs.getString(17);
									a[16]=rs.getString(18);
									a[17]=rs.getString(19);
									a[18]=rs.getString(20);
									a[19]=rs.getString(21);
									a[20]=rs.getString(22);
									a[21]=rs.getString(23);
									a[22]=rs.getString(24);
									a[23]=rs.getString(25);
									a[24]=rs.getString(28);
									a[25]=rs.getString(29);
									a[26]=rs.getString(30);
									a[27]=rs.getString(34);
									a[28]=rs.getString(36);
									a[29]=rs.getString(37);
									a[30]=rs.getString(38);
									
								}
							//System.out.println("X value: "+x);	
						} 
						catch (SQLException e) 
						{
							e.printStackTrace();
						}
						
						double d=Double.parseDouble(a[28])+Double.parseDouble("0.00");
						sql = "update jobwork_entry set allocated_engr ='"+FormBean.getEngname()+"', allocated_date ='"+ts+"', expence_given='"+""+d+"' where id ="+id;
						//System.out.println(sql);
						result = ConnectionDAO.executeUpdate(stm, sql);
						
						java.util.Date dt = new java.util.Date();
						final String td = (dt.getYear() + 1900) + "-" + (dt.getMonth() + 1)+ "-" + dt.getDate();
						
							
						sql = "insert into jobwork_history(brand,call_type,call_date,systemcall_id,companycall_id,customer_name,address,place_code,city,district,postal_code,phone_no,"+
							      "mobile_no,email_id,model_code,product_name,product_slno,purchase_date,complain_code,complain_text,call_category,"+
							      "call_priority,payout_type,cus_remarks,allocated_engr,spare_included,allocated_date,eng_status,eng_remarks,user,distance,spare_details,expence_given,real_expence,expence_details) values ('"				      
							      	+ a[0] 
									+ "','"
							      	+ a[1]
									+ "','"
									+ a[2] 
									+ "','"
									+ a[3]
									+ "','"
									+ a[4]
									+ "','"
									+ a[5]
									+ "','"
									+ a[6]
									+ "','"
									+ a[7]
									+ "','"
									+ a[8]
									+ "','"
									+ a[9]
									+ "','"
									+ a[10]
									+ "','"
									+ a[11]
									+ "','"
									+ a[12]
									+ "','"
									+ a[13]
									+ "','"
									+ a[14]
									+ "','"
									+ a[15]
									+ "','"
									+ a[16]
									+ "','"
									+ a[17]
									+ "','"
									+ a[18]
									+ "','"
									+ a[19]
									+ "','"
									+ a[20]
									+ "','"
									+ a[21]
									+ "','"
									+ a[22]
									+ "','"
									+ a[23]
									+ "','"
									+ FormBean.getEngname()
									+ "','"
									+ "NA"
									+ "','"
									+ a[24]
									+ "','"
									+ a[25]
									+ "','"
									+ a[26]
									+ "','"
									+ FormBean.getUser()
									+ "','"
									+ a[27]
									+ "','"
									+ "NA"
									+ "','"
									+ "0.00"
									+ "','"
									+ a[29]
									+ "','"
									+ a[30]
									+"');";
							
							result = ConnectionDAO.executeUpdate(stm, sql);
							
							
							
					}
						return result;
					
				
		}
	
	public static boolean engcreation(FormBean FormBean,int id) {
		boolean result = false;
		int x=0;
		// Connect to database and save the FormBean object to database table
		String sql = null;
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String ts=""+new Timestamp(date.getTime());
		//System.out.println("Time: "+ts);
		
		//ts=ts.replace("-", "");
		//System.out.println("ts: "+ts);
		String ts1[]=ts.split("[.]");
		ts=ts1[0];

				
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
				
					if(FormBean.getCatagory().compareTo("WITH SPARE")==0)
					{
					sql = "update jobwork_entry set allocated_engr ='"+FormBean.getEngname()+"', spare_included ='"+FormBean.getSpare()+"', allocated_date ='"+ts+"', expence_given='"+FormBean.getAmount()+"' where id ="+id;
													
					//System.out.println(sql);
					result = ConnectionDAO.executeUpdate(stm, sql);
					
										
					String a[]=new String[25];
					sql = "select * from jobwork_entry where id="+id;
					try 
					{
						ResultSet rs = stm.executeQuery(sql);
						while (rs.next()) 
							{								
								a[0]=rs.getString(2);
								a[1]=rs.getString(3);
								a[2]=rs.getString(4);
								a[3]=rs.getString(5);
								a[4]=rs.getString(6);
								a[5]=rs.getString(7);
								a[6]=rs.getString(8);
								a[7]=rs.getString(9);
								a[8]=rs.getString(10);
								a[9]=rs.getString(11);
								a[10]=rs.getString(12);
								a[11]=rs.getString(13);
								a[12]=rs.getString(14);
								a[13]=rs.getString(15);
								a[14]=rs.getString(16);
								a[15]=rs.getString(17);
								a[16]=rs.getString(18);
								a[17]=rs.getString(19);
								a[18]=rs.getString(20);
								a[19]=rs.getString(21);
								a[20]=rs.getString(22);
								a[21]=rs.getString(23);
								a[22]=rs.getString(24);
								a[23]=rs.getString(25);
								a[24]=rs.getString(34);
							}
						//System.out.println("X value: "+x);	
					} 
				catch (SQLException e) 
					{
						e.printStackTrace();
					}
					
					sql = "insert into jobwork_history(brand,call_type,call_date,systemcall_id,companycall_id,customer_name,address,place_code,city,district,postal_code,phone_no,"+
						      "mobile_no,email_id,model_code,product_name,product_slno,purchase_date,complain_code,complain_text,call_category,"+
						      "call_priority,payout_type,cus_remarks,allocated_engr,spare_included,allocated_date,user,distance,expence_given) values ('"				      
						      	+ a[0] 
								+ "','"
						      	+ a[1]
								+ "','"
								+ a[2] 
								+ "','"
								+ a[3]
								+ "','"
								+ a[4]
								+ "','"
								+ a[5]
								+ "','"
								+ a[6]
								+ "','"
								+ a[7]
								+ "','"
								+ a[8]
								+ "','"
								+ a[9]
								+ "','"
								+ a[10]
								+ "','"
								+ a[11]
								+ "','"
								+ a[12]
								+ "','"
								+ a[13]
								+ "','"
								+ a[14]
								+ "','"
								+ a[15]
								+ "','"
								+ a[16]
								+ "','"
								+ a[17]
								+ "','"
								+ a[18]
								+ "','"
								+ a[19]
								+ "','"
								+ a[20]
								+ "','"
								+ a[21]
								+ "','"
								+ a[22]
								+ "','"
								+ a[23]
								+ "','"
								+ FormBean.getEngname()
								+ "','"
								+ FormBean.getSpare()
								+ "','"
								+ ts
								+"','"
								+ FormBean.getUser()
								+"','"
								+ a[24]
								+"','"
								+ FormBean.getAmount()
								+"');";
						
						result = ConnectionDAO.executeUpdate(stm, sql);
						
						java.util.Date dt = new java.util.Date();
						final String td = (dt.getYear() + 1900) + "-" + (dt.getMonth() + 1)+ "-" + dt.getDate();
						Double d=Double.parseDouble(FormBean.getAmount());
						sql = "insert into expance_table(companycall_Id,engname,description,cramount,expence_date,user) values ('"
								+ a[4]
								+ "','"
								+ FormBean.getEngname()
								+ "','"
								+ "Expence Given"
								+ "','"
								+ d
								+ "','"
								+ td
								+"','"
								+ FormBean.getUser()
								+ "');";
						

						result = ConnectionDAO.executeUpdate(stm, sql);

						try
						{
						String spare[]=FormBean.getSpare().split(",");
						if(spare.length>0)
						{
							for(int i=0;i<spare.length;i++)
							{
								sql = "insert into spare_table(companycall_Id,eng_name,spare_name,spareallocation_date) values ('"				      
									      	+ a[4] 
											+ "','"
									      	+ FormBean.getEngname()
											+ "','"
											+ spare[i] 
											+ "','"
											+ td
											+"');";
									
									result = ConnectionDAO.executeUpdate(stm, sql);
							}
						}
						else
						{
							sql = "insert into spare_table(companycall_Id,eng_name,spare_name,spareallocation_date) values ('"				      
							      	+ a[4] 
									+ "','"
							      	+ FormBean.getEngname()
									+ "','"
									+ FormBean.getSpare()
									+ "','"
									+ td
									+"');";
							
							result = ConnectionDAO.executeUpdate(stm, sql);
						}
						}
						catch(Exception e)
						{
							System.out.println(e);
						}
					}
					else
					{
						
						sql = "update jobwork_entry set allocated_engr ='"+FormBean.getEngname()+"', spare_included ='"+"NA"+"', allocated_date ='"+ts+"',spare_details='"+"Done"+"',expence_given='"+FormBean.getAmount()+"' where id ="+id;
														
						//System.out.println(sql);
						result = ConnectionDAO.executeUpdate(stm, sql);
						
						
						
						String a[]=new String[25];
						sql = "select * from jobwork_entry where id="+id;
						try 
						{
							ResultSet rs = stm.executeQuery(sql);
							while (rs.next()) 
								{								
									a[0]=rs.getString(2);
									a[1]=rs.getString(3);
									a[2]=rs.getString(4);
									a[3]=rs.getString(5);
									a[4]=rs.getString(6);
									a[5]=rs.getString(7);
									a[6]=rs.getString(8);
									a[7]=rs.getString(9);
									a[8]=rs.getString(10);
									a[9]=rs.getString(11);
									a[10]=rs.getString(12);
									a[11]=rs.getString(13);
									a[12]=rs.getString(14);
									a[13]=rs.getString(15);
									a[14]=rs.getString(16);
									a[15]=rs.getString(17);
									a[16]=rs.getString(18);
									a[17]=rs.getString(19);
									a[18]=rs.getString(20);
									a[19]=rs.getString(21);
									a[20]=rs.getString(22);
									a[21]=rs.getString(23);
									a[22]=rs.getString(24);
									a[23]=rs.getString(25);
									a[24]=rs.getString(34);
								}
							//System.out.println("X value: "+x);	
						} 
					catch (SQLException e) 
						{
							e.printStackTrace();
						}
						
						sql = "insert into jobwork_history(brand,call_type,call_date,systemcall_id,companycall_id,customer_name,address,place_code,city,district,postal_code,phone_no,"+
							      "mobile_no,email_id,model_code,product_name,product_slno,purchase_date,complain_code,complain_text,call_category,"+
							      "call_priority,payout_type,cus_remarks,allocated_engr,spare_included,allocated_date,user,distance,spare_details,expence_given) values ('"				      
							      	+ a[0] 
									+ "','"
							      	+ a[1]
									+ "','"
									+ a[2] 
									+ "','"
									+ a[3]
									+ "','"
									+ a[4]
									+ "','"
									+ a[5]
									+ "','"
									+ a[6]
									+ "','"
									+ a[7]
									+ "','"
									+ a[8]
									+ "','"
									+ a[9]
									+ "','"
									+ a[10]
									+ "','"
									+ a[11]
									+ "','"
									+ a[12]
									+ "','"
									+ a[13]
									+ "','"
									+ a[14]
									+ "','"
									+ a[15]
									+ "','"
									+ a[16]
									+ "','"
									+ a[17]
									+ "','"
									+ a[18]
									+ "','"
									+ a[19]
									+ "','"
									+ a[20]
									+ "','"
									+ a[21]
									+ "','"
									+ a[22]
									+ "','"
									+ a[23]
									+ "','"
									+ FormBean.getEngname()
									+ "','"
									+ "NA"
									+ "','"
									+ ts
									+ "','"
									+ FormBean.getUser()
									+ "','"
									+ a[24]
									+ "','"
									+ "Done"
									+ "','"
									+ FormBean.getAmount()
									+"');";
							
							result = ConnectionDAO.executeUpdate(stm, sql);
							
							java.util.Date dt = new java.util.Date();
							final String td = (dt.getYear() + 1900) + "-" + (dt.getMonth() + 1)+ "-" + dt.getDate();
							Double d=Double.parseDouble(FormBean.getAmount());
							sql = "insert into expance_table(companycall_Id,engname,description,cramount,expence_date,user) values ('"
									+ a[4]
									+ "','"
									+ FormBean.getEngname()
									+ "','"
									+ "Expence Given"
									+ "','"
									+ d
									+ "','"
									+ td
									+"','"
									+ FormBean.getUser()
									+ "');";
							

							result = ConnectionDAO.executeUpdate(stm, sql);
							
							
							
					}
						return result;
					
				
		}
	
	public static boolean engcreation1(FormBean FormBean,String id) {
		boolean result = false;
		int x=0;
		// Connect to database and save the FormBean object to database table
		String sql = null;
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String ts=""+new Timestamp(date.getTime());
		//System.out.println("Time: "+ts);
		
		
		//ts=ts.replace("-", "");
		//System.out.println("ts: "+ts);
		String ts1[]=ts.split("[.]");
		ts=ts1[0];

				
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
				
					if(FormBean.getCatagory().compareTo("WITH SPARE")==0)
					{
									
					
					String a[]=new String[31];
					sql = "select * from jobwork_entry where id="+id;
					try 
					{
						ResultSet rs = stm.executeQuery(sql);
						while (rs.next()) 
							{								
								a[0]=rs.getString(2);
								a[1]=rs.getString(3);
								a[2]=rs.getString(4);
								a[3]=rs.getString(5);
								a[4]=rs.getString(6);
								a[5]=rs.getString(7);
								a[6]=rs.getString(8);
								a[7]=rs.getString(9);
								a[8]=rs.getString(10);
								a[9]=rs.getString(11);
								a[10]=rs.getString(12);
								a[11]=rs.getString(13);
								a[12]=rs.getString(14);
								a[13]=rs.getString(15);
								a[14]=rs.getString(16);
								a[15]=rs.getString(17);
								a[16]=rs.getString(18);
								a[17]=rs.getString(19);
								a[18]=rs.getString(20);
								a[19]=rs.getString(21);
								a[20]=rs.getString(22);
								a[21]=rs.getString(23);
								a[22]=rs.getString(24);
								a[23]=rs.getString(25);
								a[24]=rs.getString(28);
								a[25]=rs.getString(29);
								a[26]=rs.getString(30);
								a[27]=rs.getString(34);
								a[28]=rs.getString(36);
								a[29]=rs.getString(37);
								a[30]=rs.getString(38);
								
							}
						//System.out.println("X value: "+x);	
					} 
					catch (SQLException e) 
					{
						e.printStackTrace();
					}
					
					double d=Double.parseDouble(a[28])+Double.parseDouble(FormBean.getAmount());
					sql = "update jobwork_entry set allocated_engr ='"+FormBean.getEngname()+"', spare_included ='"+FormBean.getSpare()+"', allocated_date ='"+ts+"', expence_given='"+""+d+"',spare_details='"+"NA"+"' where id ="+id;
					//System.out.println(sql);
					result = ConnectionDAO.executeUpdate(stm, sql);
					
					
					//  Engineer Exp.
					
					
					java.util.Date dt = new java.util.Date();
					final String td = (dt.getYear() + 1900) + "-" + (dt.getMonth() + 1)+ "-" + dt.getDate();
					
					sql = "update parts_required set status ='"+"Done"+"', user ='"+FormBean.getUser()+"', senddate ='"+td+"', engstatus='"+"P"+"' where companycall_Id ='"+FormBean.getComcode()+"'";
					//System.out.println(sql);
					result = ConnectionDAO.executeUpdate(stm, sql);
					
					sql = "insert into jobwork_history(brand,call_type,call_date,systemcall_id,companycall_id,customer_name,address,place_code,city,district,postal_code,phone_no,"+
						      "mobile_no,email_id,model_code,product_name,product_slno,purchase_date,complain_code,complain_text,call_category,"+
						      "call_priority,payout_type,cus_remarks,allocated_engr,spare_included,allocated_date,eng_status,eng_remarks,user,distance,spare_details,expence_given,real_expence,expence_details) values ('"				      
						      	+ a[0] 
								+ "','"
						      	+ a[1]
								+ "','"
								+ a[2] 
								+ "','"
								+ a[3]
								+ "','"
								+ a[4]
								+ "','"
								+ a[5]
								+ "','"
								+ a[6]
								+ "','"
								+ a[7]
								+ "','"
								+ a[8]
								+ "','"
								+ a[9]
								+ "','"
								+ a[10]
								+ "','"
								+ a[11]
								+ "','"
								+ a[12]
								+ "','"
								+ a[13]
								+ "','"
								+ a[14]
								+ "','"
								+ a[15]
								+ "','"
								+ a[16]
								+ "','"
								+ a[17]
								+ "','"
								+ a[18]
								+ "','"
								+ a[19]
								+ "','"
								+ a[20]
								+ "','"
								+ a[21]
								+ "','"
								+ a[22]
								+ "','"
								+ a[23]
								+ "','"
								+ FormBean.getEngname()
								+ "','"
								+ FormBean.getSpare()
								+ "','"
								+ a[24]
								+ "','"
								+ a[25]
								+ "','"
								+ a[26]
								+ "','"
								+ FormBean.getUser()
								+ "','"
								+ a[27]
								+ "','"
								+ "NA"
								+ "','"
								+ FormBean.getAmount()
								+ "','"
								+ a[29]
								+ "','"
								+ a[30]
								+"');";
						
						result = ConnectionDAO.executeUpdate(stm, sql);
						
						if(FormBean.getAmount().compareTo("0")!=0);
		
						sql = "insert into expance_table(companycall_Id,engname,description,cramount,expence_date,user) values ('"
								+ a[4]
								+ "','"
								+ FormBean.getEngname()
								+ "','"
								+ "Expence Given"
								+ "','"
								+ Double.parseDouble(FormBean.getAmount())
								+ "','"
								+ td
								+"','"
								+ FormBean.getUser()
								+ "');";
						

						result = ConnectionDAO.executeUpdate(stm, sql);
						
						
						
						sql = "delete from spare_table where companycall_Id ='" + FormBean.getComcode()+"'";
						
						result = ConnectionDAO.executeUpdate(stm, sql);
						
						String spare[]=FormBean.getSpare().split(",");
						if(spare.length>0)
						{
							for(int i=0;i<spare.length;i++)
							{
								sql = "insert into spare_table(companycall_Id,eng_name,spare_name,spareallocation_date) values ('"				      
									      	+ a[4] 
											+ "','"
									      	+ FormBean.getEngname()
											+ "','"
											+ spare[i] 
											+ "','"
											+ td
											+"');";
									
									result = ConnectionDAO.executeUpdate(stm, sql);
							}
						}
						else
						{
							sql = "insert into spare_table(companycall_Id,eng_name,spare_name,spareallocation_date) values ('"				      
							      	+ a[4] 
									+ "','"
							      	+ FormBean.getEngname()
									+ "','"
									+ FormBean.getSpare()
									+ "','"
									+ td
									+"');";
							
							result = ConnectionDAO.executeUpdate(stm, sql);
						}
						
					}
					else
					{
						
						String a[]=new String[31];
						sql = "select * from jobwork_entry where id="+id;
						try 
						{
							ResultSet rs = stm.executeQuery(sql);
							while (rs.next()) 
								{								
									a[0]=rs.getString(2);
									a[1]=rs.getString(3);
									a[2]=rs.getString(4);
									a[3]=rs.getString(5);
									a[4]=rs.getString(6);
									a[5]=rs.getString(7);
									a[6]=rs.getString(8);
									a[7]=rs.getString(9);
									a[8]=rs.getString(10);
									a[9]=rs.getString(11);
									a[10]=rs.getString(12);
									a[11]=rs.getString(13);
									a[12]=rs.getString(14);
									a[13]=rs.getString(15);
									a[14]=rs.getString(16);
									a[15]=rs.getString(17);
									a[16]=rs.getString(18);
									a[17]=rs.getString(19);
									a[18]=rs.getString(20);
									a[19]=rs.getString(21);
									a[20]=rs.getString(22);
									a[21]=rs.getString(23);
									a[22]=rs.getString(24);
									a[23]=rs.getString(25);
									a[24]=rs.getString(28);
									a[25]=rs.getString(29);
									a[26]=rs.getString(30);
									a[27]=rs.getString(34);
									a[28]=rs.getString(36);
									a[29]=rs.getString(37);
									a[30]=rs.getString(38);
									
								}
							//System.out.println("X value: "+x);	
						} 
						catch (SQLException e) 
						{
							e.printStackTrace();
						}
						
						double d=Double.parseDouble(a[28])+Double.parseDouble(FormBean.getAmount());
						sql = "update jobwork_entry set allocated_engr ='"+FormBean.getEngname()+"', allocated_date ='"+ts+"', expence_given='"+""+d+"' where id ="+id;
						//System.out.println(sql);
						result = ConnectionDAO.executeUpdate(stm, sql);
						
						java.util.Date dt = new java.util.Date();
						final String td = (dt.getYear() + 1900) + "-" + (dt.getMonth() + 1)+ "-" + dt.getDate();
						
							
						sql = "insert into jobwork_history(brand,call_type,call_date,systemcall_id,companycall_id,customer_name,address,place_code,city,district,postal_code,phone_no,"+
							      "mobile_no,email_id,model_code,product_name,product_slno,purchase_date,complain_code,complain_text,call_category,"+
							      "call_priority,payout_type,cus_remarks,allocated_engr,spare_included,allocated_date,eng_status,eng_remarks,user,distance,spare_details,expence_given,real_expence,expence_details) values ('"				      
							      	+ a[0] 
									+ "','"
							      	+ a[1]
									+ "','"
									+ a[2] 
									+ "','"
									+ a[3]
									+ "','"
									+ a[4]
									+ "','"
									+ a[5]
									+ "','"
									+ a[6]
									+ "','"
									+ a[7]
									+ "','"
									+ a[8]
									+ "','"
									+ a[9]
									+ "','"
									+ a[10]
									+ "','"
									+ a[11]
									+ "','"
									+ a[12]
									+ "','"
									+ a[13]
									+ "','"
									+ a[14]
									+ "','"
									+ a[15]
									+ "','"
									+ a[16]
									+ "','"
									+ a[17]
									+ "','"
									+ a[18]
									+ "','"
									+ a[19]
									+ "','"
									+ a[20]
									+ "','"
									+ a[21]
									+ "','"
									+ a[22]
									+ "','"
									+ a[23]
									+ "','"
									+ FormBean.getEngname()
									+ "','"
									+ "NA"
									+ "','"
									+ a[24]
									+ "','"
									+ a[25]
									+ "','"
									+ a[26]
									+ "','"
									+ FormBean.getUser()
									+ "','"
									+ a[27]
									+ "','"
									+ "NA"
									+ "','"
									+ FormBean.getAmount()
									+ "','"
									+ a[29]
									+ "','"
									+ a[30]
									+"');";
							
							result = ConnectionDAO.executeUpdate(stm, sql);
							
							if(FormBean.getAmount().compareTo("0")!=0);
							
							sql = "insert into expance_table(companycall_Id,engname,description,cramount,expence_date,user) values ('"
									+ a[4]
									+ "','"
									+ FormBean.getEngname()
									+ "','"
									+ "Expence Given"
									+ "','"
									+  Double.parseDouble(FormBean.getAmount())
									+ "','"
									+ td
									+"','"
									+ FormBean.getUser()
									+ "');";
							

							result = ConnectionDAO.executeUpdate(stm, sql);
							
							
					}
						return result;
					
				
		}
	
public static FormBean uniqueid1(String prefix) {
		
		UniqueIDGenerator u = new UniqueIDGenerator(); 
		String x=u.getUniqueID();
		int j=0;
		FormBean usBean = new FormBean();
		String sql = "select * from uniqueid";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try {			
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{
					j=rs.getInt(3);
				}
			
			int k=String.valueOf(j).length();
			String x0="";
			if(k==1)
			x0=prefix+"0000"+j;
			if(k==2)
			x0=prefix+"000"+j;
			if(k==3)
			x0=prefix+"00"+j;
			if(k==4)
			x0=prefix+"0"+j;
			if(k==5)
				x0=prefix+j;
			usBean.setScode(x0);
			usBean.setCustid(x0);
			
			sql = "insert into uniqueid(uid,sid) values ('"
					+ x /* "DS000"+(k+1)  */
					+ "','"
					+ (j+1)
					+"');";
			
			ConnectionDAO.executeUpdate(stm, sql);
		}
		catch (SQLException e) 
			{
				e.printStackTrace();
			}
	
			ConnectionDAO.closeConnection(conn);
			return usBean;
			}



public static List<FormBean> englistcp(String user) 
{
	java.util.Date dt = new java.util.Date();
	final String td = (dt.getYear() + 1900) + "-" + (dt.getMonth() + 1)+ "-" + dt.getDate();
	
	List<FormBean> l1 = new ArrayList<FormBean>();
	
	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn);
	
	String sql = "select * from user where USERNAME='"+user+"'";
	
	String k="",k1="";
	
	try 
	{
		ResultSet rs = stm.executeQuery(sql);
		while (rs.next()) 
			{								
				k=rs.getString(2);								
			}
		
		rs = stm.executeQuery("select NAME from logins where USERNAME='"+user+"'");
		while (rs.next()) 
			{								
				k1=rs.getString(1);								
			}
	} 
catch (SQLException e) 
	{
		e.printStackTrace();
	}
	
	//System.out.println("Role: "+k);
	if(k.compareTo("ROLE_ADMIN")==0)
		sql = "select * from jobwork_entry where allocated_date>='"+td+" 00:00"+"' and allocated_date<='"+td+" 23:59"+"' and call_type='"+"ON SITE"+"'";
	else
	{
		if(k.compareTo("ROLE_RECEPTION")==0)
		sql = "select * from jobwork_entry where allocated_date>='"+td+" 00:00"+"' and allocated_date<='"+td+" 23:59"+"' and call_type='"+"ON SITE"+"' and user='"+user+"'";
		else
		sql = "select * from jobwork_entry where allocated_date>='"+td+" 00:00"+"' and allocated_date<='"+td+" 23:59"+"' and call_type='"+"ON SITE"+"' and allocated_engr='"+k1+"'";
	}		
	try 
		{
			//System.out.println(sql);
			ResultSet rs = stm.executeQuery(sql);
			FormBean usBean;
			while (rs.next()) 
				{
					usBean = new FormBean();
					usBean.setId(rs.getInt(1));
					usBean.setBname(rs.getString(2));
					usBean.setCtype(rs.getString(3));
					usBean.setCdate(rs.getString(4));
					usBean.setCcode(rs.getString(5));
					usBean.setScode(rs.getString(6));
					usBean.setName(rs.getString(7));
					usBean.setAddress(rs.getString(8));
					usBean.setPlace(rs.getString(9));
					usBean.setCity(rs.getString(10));
					usBean.setDistrict(rs.getString(11));
					usBean.setPcode(rs.getString(12));
					usBean.setPon(rs.getString(13));
					usBean.setMobile(rs.getString(14));
					usBean.setEmail(rs.getString(15));
					
					usBean.setMcode(rs.getString(16));
					usBean.setFname(rs.getString(17));
					usBean.setPserial(rs.getString(18));
					usBean.setPdate(rs.getString(19));
					usBean.setComcode(rs.getString(20));
					usBean.setCatagory(rs.getString(22));
					usBean.setCptype(rs.getString(23));
					
					usBean.setPtype(rs.getString(24));
					usBean.setRemarks(rs.getString(25));
					usBean.setAllocation(rs.getString(26));
					usBean.setDistance("<span style='color:red;'>"+rs.getString(34)+"</span>");
																
					l1.add(usBean);
				}
		} 
	catch (SQLException e) 
		{
			e.printStackTrace();
		}
	ConnectionDAO.closeConnection(conn);
	return l1;
}

public static List<FormBean> englistcp1() 
{
	java.util.Date dt = new java.util.Date();
	final String td = (dt.getYear() + 1900) + "-" + (dt.getMonth() + 1)+ "-" + dt.getDate();
	
	List<FormBean> l1 = new ArrayList<FormBean>();
	String sql = "select * from jobwork_entry where allocated_date>='"+td+" 00:00"+"' and allocated_date<='"+td+" 23:00"+"' and call_type='"+"CARRY IN"+"'";
	//System.out.println(sql);
	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn);
	try 
		{
			ResultSet rs = stm.executeQuery(sql);
			FormBean usBean;
			while (rs.next()) 
				{
					usBean = new FormBean();
					usBean.setId(rs.getInt(1));
					usBean.setBname(rs.getString(2));
					usBean.setCtype(rs.getString(3));
					usBean.setCdate(rs.getString(4));
					usBean.setCcode(rs.getString(5));
					usBean.setScode(rs.getString(6));
					usBean.setName(rs.getString(7));
					usBean.setAddress(rs.getString(8));
					usBean.setPlace(rs.getString(9));
					usBean.setCity(rs.getString(10));
					usBean.setDistrict(rs.getString(11));
					usBean.setPcode(rs.getString(12));
					usBean.setPon(rs.getString(13));
					usBean.setMobile(rs.getString(14));
					usBean.setEmail(rs.getString(15));
					
					usBean.setMcode(rs.getString(16));
					usBean.setFname(rs.getString(17));
					usBean.setPserial(rs.getString(18));
					usBean.setPdate(rs.getString(19));
					usBean.setComcode(rs.getString(20));
					usBean.setCatagory(rs.getString(22));
					usBean.setCptype(rs.getString(23));
					
					usBean.setPtype(rs.getString(24));
					usBean.setRemarks(rs.getString(25));
					usBean.setAllocation(rs.getString(26));
					usBean.setDistance("<span style='color:red;'>"+rs.getString(34)+"</span>");
																
					l1.add(usBean);
				}
		} 
	catch (SQLException e) 
		{
			e.printStackTrace();
		}
	ConnectionDAO.closeConnection(conn);
	return l1;
}

public static List<FormBean> printview(String[] id) {
	
	
	
	FormBean usBean;
	List<FormBean> l1 = new ArrayList<FormBean>();
	
	for (int i = 0; i < id.length; i++) {
		//String x[] = id[i].split("-");
		String sql = "select * from jobwork_entry where id = '"
				+ id[i]+"'";
		//System.out.println(sql);
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try {

			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
			
				usBean = new FormBean();
				usBean.setId(rs.getInt(1));
				usBean.setBname(rs.getString(2));
				usBean.setCtype(rs.getString(3));
				usBean.setCdate(rs.getString(4));
				usBean.setCcode(rs.getString(5));
				usBean.setScode(rs.getString(6));
				usBean.setName(rs.getString(7));
				usBean.setAddress(rs.getString(8));
				usBean.setPlace(rs.getString(9));
				usBean.setCity(rs.getString(10));
				usBean.setDistrict(rs.getString(11));
				usBean.setPcode(rs.getString(12));
				usBean.setPon(rs.getString(13));
				usBean.setMobile(rs.getString(14));
				usBean.setEmail(rs.getString(15));
				
				usBean.setMcode(rs.getString(16));
				usBean.setFname(rs.getString(17));
				usBean.setPserial(rs.getString(18));
				usBean.setPdate(rs.getString(19));
				usBean.setComcode(rs.getString(20));
				usBean.setCatagory(rs.getString(22));
				usBean.setCptype(rs.getString(23));
				
				usBean.setPtype(rs.getString(24));
				usBean.setRemarks(rs.getString(25));
				usBean.setAllocation(rs.getString(26));
				usBean.setDistance("<span style='color:red;'>"+rs.getString(34)+"</span>");
				String x=spare(rs.getString(6));
				usBean.setSpare(x);
						
				l1.add(usBean);
				}

			
		} catch (Exception e) {
			System.out.println(e);
		}

		
		ConnectionDAO.closeConnection(conn);

	}
	return l1;

}

public static String spare(String x) {
	
	
	
	
		String sql = "select * from spare_table where companycall_Id = '"+x+"'";
		String x1="";		
		//System.out.println(sql);
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		try {

			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
			{
			    if(rs.isLast()==true)
			    x1=x1+rs.getString(4);
			    else
				x1=x1+rs.getString(4)+",";
			}

			
		} catch (Exception e) 
		{
			System.out.println(e);
		}

		
		ConnectionDAO.closeConnection(conn);

	
	return x1;

}

public static List<FormBean> englistcin(String user) 
{
	java.util.Date dt = new java.util.Date();
	final String td = (dt.getYear() + 1900) + "-" + (dt.getMonth() + 1)+ "-" + dt.getDate();
	String ch="b";
	List<FormBean> l1 = new ArrayList<FormBean>();
	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn);
	try 
		{
		
		String a6="",a7="";
		String sql = "select * from user where USERNAME ='" + user + "'";
		ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {

				a6 = rs.getString(2);
				
			}
			
		sql = "select * from logins where USERNAME ='" + user + "'";
		rs = stm.executeQuery(sql);
			while (rs.next()) {

					a7 = rs.getString(6);
					
				}
			
			
			
				   
			if((a6.compareTo("ROLE_ADMIN")==0))
			sql = "select * from jobwork_entry where (eng_status!='"+"REPAIR READY"+"' or eng_status!='"+"UN-REPAIR READY"+"' or spare_details='"+"NA"+"') and call_type='"+"CARRY IN"+"' order by companycall_id desc,call_date desc ";
			//System.out.println(sql);
			if((a6.compareTo("ROLE_RECEPTION")==0))
			sql = "select * from jobwork_entry where (eng_status!='"+"REPAIR READY"+"' or eng_status!='"+"UN-REPAIR READY"+"' or spare_details='"+"NA"+"') and call_type='"+"CARRY IN"+"' and user='"+user+"' order by companycall_id desc,call_date desc ";
				
			if((a6.compareTo("ROLE_SERVICE")==0))
			sql = "select * from jobwork_entry where (eng_status!='"+"REPAIR READY"+"' or eng_status!='"+"UN-REPAIR READY"+"' or spare_details='"+"NA"+"') and call_type='"+"CARRY IN"+"' and allocated_engr='"+a7+"' order by companycall_id desc,call_date desc ";
			
			//System.out.println(sql);
			
			rs = stm.executeQuery(sql);
			FormBean usBean;
			while (rs.next()) 
				{
					usBean = new FormBean();
					String a=rs.getString(56);
					//System.out.println(a);
					if( a.equals("0") ) 
					{
					usBean.setId(rs.getInt(1));
					usBean.setBname(rs.getString(2));
					usBean.setCtype(rs.getString(3));
					usBean.setCdate(rs.getString(4));
					usBean.setCcode(rs.getString(5));
					usBean.setScode(rs.getString(6));
					usBean.setName(rs.getString(7));
					usBean.setAddress(rs.getString(8));
					usBean.setPlace(rs.getString(9));
					usBean.setCity(rs.getString(10));
					usBean.setDistrict(rs.getString(11));
					usBean.setPcode(rs.getString(12));
					usBean.setPon(rs.getString(13));
					usBean.setMobile(rs.getString(14));
					usBean.setEmail(rs.getString(15));
					
					usBean.setMcode(rs.getString(16));
					usBean.setFname(rs.getString(17));
					usBean.setPserial(rs.getString(18));
					usBean.setPdate(rs.getString(19));
					usBean.setComcode(rs.getString(20));
					usBean.setCatagory(rs.getString(22));
					usBean.setCptype(rs.getString(23));
					usBean.setCheck(ch);
					usBean.setPtype(rs.getString(24));
					usBean.setRemarks(rs.getString(25));
					usBean.setAllocation(rs.getString(26));
					usBean.setEngstatus(rs.getString(29));
					usBean.setEngremarks(rs.getString(30));
					usBean.setDistance("<span style='color:red;'>"+rs.getString(34)+"</span>");
					usBean.setSparedetails(rs.getString(35));
					usBean.setExpencedetails(rs.getString(38));
					usBean.setCust_ref_id(rs.getString(55));
					usBean.setApproved(rs.getString(54));
					l1.add(usBean);
					}
					//System.out.println("hello "+rs.getString(56));
					
				}
		} 
	catch (SQLException e) 
		{
			e.printStackTrace();
		}
	ConnectionDAO.closeConnection(conn);
	return l1;
}

public static List<FormBean> englistcem(String user) 
{
	java.util.Date dt = new java.util.Date();
	final String td = (dt.getYear() + 1900) + "-" + (dt.getMonth() + 1)+ "-" + dt.getDate();
	
	List<FormBean> l1 = new ArrayList<FormBean>();
	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn);
	try 
		{
		
		String a6="",a7="";
		String sql = "select * from user where USERNAME ='" + user + "'";
		ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {

				a6 = rs.getString(2);
				
			}
			
		sql = "select * from logins where USERNAME ='" + user + "'";
		rs = stm.executeQuery(sql);
			while (rs.next()) {

					a7 = rs.getString(6);
					
				}
			
			
			
				   
			if((a6.compareTo("ROLE_ADMIN")==0))
			//sql = "select * from jobwork_entry where (eng_status!='"+"CLOSE"+"' or spare_details='"+"NA"+"' or expence_details='"+"NA"+"') and call_type='"+"ON SITE"+"'";
			sql = "select * from jobwork_entry where eng_status!='"+"CLOSE"+"' and call_type='"+"ON SITE"+"'";
			
			if((a6.compareTo("ROLE_RECEPTION")==0))
			//sql = "select * from jobwork_entry where (eng_status!='"+"CLOSE"+"' or spare_details='"+"NA"+"' or expence_details='"+"NA"+"') and call_type='"+"ON SITE"+"' and user='"+user+"'";
			sql = "select * from jobwork_entry where eng_status!='"+"CLOSE"+"' and call_type='"+"ON SITE"+"' and user='"+user+"'";
				
			if((a6.compareTo("ROLE_SERVICE")==0))
			sql = "select * from jobwork_entry where (eng_status!='"+"CLOSE"+"' or spare_details='"+"NA"+"' or expence_details='"+"NA"+"') and call_type='"+"ON SITE"+"' and allocated_engr='"+a7+"'";
				
			rs = stm.executeQuery(sql);
			FormBean usBean;
			while (rs.next()) 
				{
					usBean = new FormBean();
					usBean.setId(rs.getInt(1));
					usBean.setBname(rs.getString(2));
					usBean.setCtype(rs.getString(3));
					usBean.setCdate(rs.getString(4));
					usBean.setCcode(rs.getString(5));
					usBean.setScode(rs.getString(6));
					usBean.setName(rs.getString(7));
					usBean.setAddress(rs.getString(8));
					usBean.setPlace(rs.getString(9));
					usBean.setCity(rs.getString(10));
					usBean.setDistrict(rs.getString(11));
					usBean.setPcode(rs.getString(12));
					usBean.setPon(rs.getString(13));
					usBean.setMobile(rs.getString(14));
					usBean.setEmail(rs.getString(15));
					
					usBean.setMcode(rs.getString(16));
					usBean.setFname(rs.getString(17));
					usBean.setPserial(rs.getString(18));
					usBean.setPdate(rs.getString(19));
					usBean.setComcode(rs.getString(20));
					usBean.setCatagory(rs.getString(22));
					usBean.setCptype(rs.getString(23));
					
					usBean.setPtype(rs.getString(24));
					usBean.setRemarks(rs.getString(25));
					usBean.setAllocation(rs.getString(26));
					usBean.setEngstatus(rs.getString(29));
					usBean.setDistance("<span style='color:red;'>"+rs.getString(34)+"</span>");
					usBean.setSparedetails(rs.getString(35));
					usBean.setExpencedetails(rs.getString(38));
					l1.add(usBean);
				}
		} 
	catch (SQLException e) 
		{
			e.printStackTrace();
		}
	ConnectionDAO.closeConnection(conn);
	return l1;
}

public static boolean sparereturn(FormBean FormBean,String[] checked,String[] checked1,String[] checked2,int id) 
{
	boolean result = false;
	java.util.Date dt = new java.util.Date();
	final String td = (dt.getYear() + 1900) + "-" + (dt.getMonth() + 1)+ "-" + dt.getDate();
	
	
	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn);
	
	try
	{
	for (int i = 0; i < checked.length; i++) 
	{
		String sql = "update spare_table set spare_return ='"+"1"+"', spare_defect = '"+"0"+"',spare_doa ='"+"0"+"', sparereturn_date='"+td+"' where id ='"+checked[i]+"'";
		//System.out.println(sql);	
		result = ConnectionDAO.executeUpdate(stm, sql);
	}
	}
	catch(Exception e)
	{
		
	}
	
	try
	{
	for (int i = 0; i < checked1.length; i++) 
	{
		String sql = "update spare_table set spare_return ='"+"0"+"', spare_defect = '"+"1"+"',spare_doa ='"+"0"+"', sparereturn_date='"+td+"' where id ='"+checked1[i]+"'";
		//System.out.println(sql);	
		result = ConnectionDAO.executeUpdate(stm, sql);
	}
	}
	catch(Exception e)
	{
		
	}
	
	try
	{
	for (int i = 0; i < checked2.length; i++) 
	{
		String sql = "update spare_table set spare_return ='"+"0"+"', spare_defect = '"+"0"+"',spare_doa ='"+"1"+"', sparereturn_date='"+td+"' where id ='"+checked2[i]+"'";
		//System.out.println(sql);	
		result = ConnectionDAO.executeUpdate(stm, sql);
	}
	}
	catch(Exception e)
	{
		
	}
	
	
		String sql = "update jobwork_entry set spare_details ='"+"Done"+"' where id ='"+id+"'";
		//System.out.println(sql);	
		result = ConnectionDAO.executeUpdate(stm, sql);
		
		String a[]=new String[31];
		sql = "select * from jobwork_entry where id="+id;
		try 
		{
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{								
					a[0]=rs.getString(2);
					a[1]=rs.getString(3);
					a[2]=rs.getString(4);
					a[3]=rs.getString(5);
					a[4]=rs.getString(6);
					a[5]=rs.getString(7);
					a[6]=rs.getString(8);
					a[7]=rs.getString(9);
					a[8]=rs.getString(10);
					a[9]=rs.getString(11);
					a[10]=rs.getString(12);
					a[11]=rs.getString(13);
					a[12]=rs.getString(14);
					a[13]=rs.getString(15);
					a[14]=rs.getString(16);
					a[15]=rs.getString(17);
					a[16]=rs.getString(18);
					a[17]=rs.getString(19);
					a[18]=rs.getString(20);
					a[19]=rs.getString(21);
					a[20]=rs.getString(22);
					a[21]=rs.getString(23);
					a[22]=rs.getString(24);
					a[23]=rs.getString(25);
					a[24]=rs.getString(26);
					a[25]=rs.getString(27);
					a[26]=rs.getString(28);
					a[27]=rs.getString(29);
					a[28]="NA";
					a[29]=rs.getString(34);
					a[30]=rs.getString(36);
					
				}
			//System.out.println("X value: "+x);	
		} 
	catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		sql = "insert into jobwork_history(brand,call_type,call_date,systemcall_id,companycall_id,customer_name,address,place_code,city,district,postal_code,phone_no,"+
			      "mobile_no,email_id,model_code,product_name,product_slno,purchase_date,complain_code,complain_text,call_category,"+
			      "call_priority,payout_type,cus_remarks,allocated_engr,spare_included,allocated_date,eng_status,eng_remarks,user,distance,spare_details,expence_given) values ('"				      
			      	+ a[0] 
					+ "','"
			      	+ a[1]
					+ "','"
					+ a[2] 
					+ "','"
					+ a[3]
					+ "','"
					+ a[4]
					+ "','"
					+ a[5]
					+ "','"
					+ a[6]
					+ "','"
					+ a[7]
					+ "','"
					+ a[8]
					+ "','"
					+ a[9]
					+ "','"
					+ a[10]
					+ "','"
					+ a[11]
					+ "','"
					+ a[12]
					+ "','"
					+ a[13]
					+ "','"
					+ a[14]
					+ "','"
					+ a[15]
					+ "','"
					+ a[16]
					+ "','"
					+ a[17]
					+ "','"
					+ a[18]
					+ "','"
					+ a[19]
					+ "','"
					+ a[20]
					+ "','"
					+ a[21]
					+ "','"
					+ a[22]
					+ "','"
					+ a[23]
					+ "','"
					+ a[24]
					+ "','"
					+ a[25]
					+ "','"
					+ a[26]
					+ "','"
					+ a[27]
					+ "','"
					+"Spare Return Done"
					+"','"
					+ FormBean.getUser()
					+ "','"
					+ a[29]
					+ "','"
					+ "Done"
					+ "','"
					+ a[30]
					+"');";
			
			result = ConnectionDAO.executeUpdate(stm, sql);
	
	
	ConnectionDAO.closeConnection(conn);
	return result;
}

public static boolean expencereturn(FormBean FormBean,String id) 
{
	boolean result = false;
	java.util.Date dt = new java.util.Date();
	final String td = (dt.getYear() + 1900) + "-" + (dt.getMonth() + 1)+ "-" + dt.getDate();
	
	DecimalFormat plain = new DecimalFormat("0.00");
	
	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn);
	
		String s1[]=FormBean.getQuantity();
		String s2[]=FormBean.getAmount1();

		for(int i=0;i<s1.length;i++)
		{
		try{
		String sql = "insert into expance_table(companycall_Id,engname,description,dramount,expence_date,user) values ('"
				+ FormBean.getComcode()
				+ "','"
				+ FormBean.getEngname()
				+ "','"
				+ s1[i]
				+ "','"
				+ s2[i]
				+ "','"
				+ td
				+"','"
				+ FormBean.getUser()
				+ "');";
		

		result = ConnectionDAO.executeUpdate(stm, sql);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		}

		String n="";
		try 
		{
			ResultSet rs = stm.executeQuery("select * from jobwork_entry where id='"+id+"'");
			while (rs.next()) 
				{								
					n=rs.getString(36);
				}
		}
		catch(Exception e)
		{
			
		}
		
		double j=Double.parseDouble(n)+Double.parseDouble(FormBean.getTotal());
		
		String sql = "update jobwork_entry set real_expence ='"+plain.format(j)+"',expence_details='"+"Done"+"' where id ='"+id+"'";
		//System.out.println(sql);	
		result = ConnectionDAO.executeUpdate(stm, sql);
		
		String a[]=new String[32];
		sql = "select * from jobwork_entry where id="+id;
		try 
		{
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{								
					a[0]=rs.getString(2);
					a[1]=rs.getString(3);
					a[2]=rs.getString(4);
					a[3]=rs.getString(5);
					a[4]=rs.getString(6);
					a[5]=rs.getString(7);
					a[6]=rs.getString(8);
					a[7]=rs.getString(9);
					a[8]=rs.getString(10);
					a[9]=rs.getString(11);
					a[10]=rs.getString(12);
					a[11]=rs.getString(13);
					a[12]=rs.getString(14);
					a[13]=rs.getString(15);
					a[14]=rs.getString(16);
					a[15]=rs.getString(17);
					a[16]=rs.getString(18);
					a[17]=rs.getString(19);
					a[18]=rs.getString(20);
					a[19]=rs.getString(21);
					a[20]=rs.getString(22);
					a[21]=rs.getString(23);
					a[22]=rs.getString(24);
					a[23]=rs.getString(25);
					a[24]=rs.getString(26);
					a[25]=rs.getString(27);
					a[26]=rs.getString(28);
					a[27]=rs.getString(29);
					a[28]="NA";
					a[29]=rs.getString(34);
					a[30]=rs.getString(35);
					a[31]=rs.getString(36);
					
					
				}
			//System.out.println("X value: "+x);	
		} 
	catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		sql = "insert into jobwork_history(brand,call_type,call_date,systemcall_id,companycall_id,customer_name,address,place_code,city,district,postal_code,phone_no,"+
			      "mobile_no,email_id,model_code,product_name,product_slno,purchase_date,complain_code,complain_text,call_category,"+
			      "call_priority,payout_type,cus_remarks,allocated_engr,spare_included,allocated_date,eng_status,eng_remarks,user,distance,spare_details,expence_given,real_expence,expence_details) values ('"				      
			      	+ a[0] 
					+ "','"
			      	+ a[1]
					+ "','"
					+ a[2] 
					+ "','"
					+ a[3]
					+ "','"
					+ a[4]
					+ "','"
					+ a[5]
					+ "','"
					+ a[6]
					+ "','"
					+ a[7]
					+ "','"
					+ a[8]
					+ "','"
					+ a[9]
					+ "','"
					+ a[10]
					+ "','"
					+ a[11]
					+ "','"
					+ a[12]
					+ "','"
					+ a[13]
					+ "','"
					+ a[14]
					+ "','"
					+ a[15]
					+ "','"
					+ a[16]
					+ "','"
					+ a[17]
					+ "','"
					+ a[18]
					+ "','"
					+ a[19]
					+ "','"
					+ a[20]
					+ "','"
					+ a[21]
					+ "','"
					+ a[22]
					+ "','"
					+ a[23]
					+ "','"
					+ a[24]
					+ "','"
					+ a[25]
					+ "','"
					+ a[26]
					+ "','"
					+ a[27]
					+ "','"
					+"Expance Return Done"
					+"','"
					+ FormBean.getUser()
					+ "','"
					+ a[29]
					+ "','"
					+ a[30]
					+ "','"
					+ a[31]
					+"','"
					+ FormBean.getTotal()
					+"','"
					+"Done"
					+"');";
			
			result = ConnectionDAO.executeUpdate(stm, sql);
	
	
	ConnectionDAO.closeConnection(conn);
	return result;
}

public static boolean pstatus(FormBean FormBean,String id) 
{
	//System.out.println("Username: "+id);
	
	boolean result = false;
	java.util.Date dt = new java.util.Date();
	final String td = (dt.getYear() + 1900) + "-" + (dt.getMonth() + 1)+ "-" + dt.getDate();
	
	
	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn);
	
		String s=FormBean.getEngstatus();
		if(s.compareTo("PENDING FOR PARTS")==0)
		{
			
			String user="";
			try 
			{
				ResultSet rs = stm.executeQuery("select * from jobwork_entry where companycall_id='"+FormBean.getComcode()+"'");
				while (rs.next()) 
					{								
						user=rs.getString(32);
						
						
					}
					
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			
			String sql = "insert into parts_required(companycall_Id,engname,enq_date,senderid,remarks,status,user) values ('"				      
				      	+ FormBean.getComcode() 
						+ "','"
				      	+ FormBean.getEngname()
						+ "','"
						+ td 
						+ "','"
						+ FormBean.getUser()
						+ "','"
						+ FormBean.getRemarks()
						+ "','"
						+ "P"
						+ "','"
						+ user
						+"');";
				
				result = ConnectionDAO.executeUpdate(stm, sql);
				
				sql = "update jobwork_entry set call_category ='"+"WITH SPARE"+"' where id ='"+id+"'";
				//System.out.println(sql);	
				result = ConnectionDAO.executeUpdate(stm, sql);
		}
		else
		{
			String sql = "update parts_required set engstatus ='"+"NA"+"' where companycall_Id ='"+FormBean.getComcode()+"'";
			//System.out.println(sql);	
			result = ConnectionDAO.executeUpdate(stm, sql);
		}
		
		String sql = "update jobwork_entry set eng_status ='"+FormBean.getEngstatus()+"',eng_remarks='"+FormBean.getRemarks()+"',srcno='"+FormBean.getUserid()+"' where id ='"+id+"'";
		//System.out.println(sql);	
		result = ConnectionDAO.executeUpdate(stm, sql);
		
		String a[]=new String[34];
		sql = "select * from jobwork_entry where id='"+id+"'";
		try 
		{
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{								
					a[0]=rs.getString(2);
					a[1]=rs.getString(3);
					a[2]=rs.getString(4);
					a[3]=rs.getString(5);
					a[4]=rs.getString(6);
					a[5]=rs.getString(7);
					a[6]=rs.getString(8);
					a[7]=rs.getString(9);
					a[8]=rs.getString(10);
					a[9]=rs.getString(11);
					a[10]=rs.getString(12);
					a[11]=rs.getString(13);
					a[12]=rs.getString(14);
					a[13]=rs.getString(15);
					a[14]=rs.getString(16);
					a[15]=rs.getString(17);
					a[16]=rs.getString(18);
					a[17]=rs.getString(19);
					a[18]=rs.getString(20);
					a[19]=rs.getString(21);
					a[20]=rs.getString(22);
					a[21]=rs.getString(23);
					a[22]=rs.getString(24);
					a[23]=rs.getString(25);
					a[24]=rs.getString(26);
					a[25]=rs.getString(27);
					a[26]=rs.getString(28);
					
					a[27]=rs.getString(33);
					a[28]=rs.getString(34);
					a[29]=rs.getString(35);
					a[30]=rs.getString(36);
					a[31]=rs.getString(37);
					a[32]=rs.getString(38);
					a[33]=rs.getString(39);
					
					
					
				}
			//System.out.println("X value: "+x);	
		} 
	catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		sql = "insert into jobwork_history(brand,call_type,call_date,systemcall_id,companycall_id,customer_name,address,place_code,city,district,postal_code,phone_no,"+
			      "mobile_no,email_id,model_code,product_name,product_slno,purchase_date,complain_code,complain_text,call_category,"+
			      "call_priority,payout_type,cus_remarks,allocated_engr,spare_included,allocated_date,eng_status,eng_remarks,user,distance,spare_details,expence_given,real_expence,expence_details,scharge,icharge,srcno) values ('"				      
			      	+ a[0] 
					+ "','"
			      	+ a[1]
					+ "','"
					+ a[2] 
					+ "','"
					+ a[3]
					+ "','"
					+ a[4]
					+ "','"
					+ a[5]
					+ "','"
					+ a[6]
					+ "','"
					+ a[7]
					+ "','"
					+ a[8]
					+ "','"
					+ a[9]
					+ "','"
					+ a[10]
					+ "','"
					+ a[11]
					+ "','"
					+ a[12]
					+ "','"
					+ a[13]
					+ "','"
					+ a[14]
					+ "','"
					+ a[15]
					+ "','"
					+ a[16]
					+ "','"
					+ a[17]
					+ "','"
					+ a[18]
					+ "','"
					+ a[19]
					+ "','"
					+ a[20]
					+ "','"
					+ a[21]
					+ "','"
					+ a[22]
					+ "','"
					+ a[23]
					+ "','"
					+ a[24]
					+ "','"
					+ a[25]
					+ "','"
					+ a[26]
					+ "','"
					+ FormBean.getEngstatus()
					+ "','"
					+ FormBean.getRemarks()
					+"','"
					+ FormBean.getUser()
					+ "','"
					+ a[27]
					+ "','"
					+ a[28]
					+ "','"
					+ a[29]
					+ "','"
					+ a[30]
					+ "','"
					+ a[31]
					+ "','"
					+ a[32]
					+ "','"
					+ a[33]
					+ "','"
					+ FormBean.getUserid()
					+"');";
			
			result = ConnectionDAO.executeUpdate(stm, sql);
	
	
	ConnectionDAO.closeConnection(conn);
	return result;
}

public static boolean pstatus1(FormBean FormBean,String id) 
{
	//System.out.println("inside pstatus1 helper "+id);
	
	boolean result = false;
	java.util.Date dt = new java.util.Date();
	final String td = (dt.getYear() + 1900) + "-" + (dt.getMonth() + 1)+ "-" + dt.getDate();
	int x=0;
	
	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn);
	
		String s=FormBean.getEngstatus();
		if(s.compareTo("PENDING FOR PARTS")==0)
		{
			String sql = "insert into parts_required(companycall_Id,engname,enq_date,senderid,remarks,status) values ('"				      
				      	+ FormBean.getComcode() 
						+ "','"
				      	+ FormBean.getEngname()
						+ "','"
						+ td 
						+ "','"
						+ FormBean.getUser()
						+ "','"
						+ FormBean.getRemarks()
						+ "','"
						+ "P"
						+"');";
				
				result = ConnectionDAO.executeUpdate(stm, sql);
				
				sql = "update jobwork_entry set call_category ='"+"WITH SPARE"+"' where id ='"+id+"'";
				//System.out.println(sql);	
				result = ConnectionDAO.executeUpdate(stm, sql);
		}
		else
		{
			String sql = "update parts_required set engstatus ='"+"NA"+"' where companycall_Id ='"+FormBean.getComcode()+"'";
			//System.out.println(sql);	
			result = ConnectionDAO.executeUpdate(stm, sql);
		}
		if(FormBean.getEngstatus().equals("REPAIR READY") || FormBean.getEngstatus().equals("UN-REPAIR READY"))
		{
			x=1;
		}
		String sql = "update jobwork_entry set eng_status ='"+FormBean.getEngstatus()+"',eng_remarks='"+FormBean.getRemarks()+"', ready='"+x+"' where id ='"+id+"'";
		//System.out.println(sql);	
		result = ConnectionDAO.executeUpdate(stm, sql);
		
		String a[]=new String[27];
		sql = "select * from jobwork_entry where id='"+id+"'";
		try 
		{
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
				{								
					a[0]=rs.getString(2);
					a[1]=rs.getString(3);
					a[2]=rs.getString(4);
					
					//System.out.println("Call date: "+a[2]);
					
					a[3]=rs.getString(5);
					a[4]=rs.getString(6);
					a[5]=rs.getString(7);
					a[6]=rs.getString(8);
					a[7]=rs.getString(9);
					a[8]=rs.getString(10);
					a[9]=rs.getString(11);
					a[10]=rs.getString(12);
					a[11]=rs.getString(13);
					a[12]=rs.getString(14);
					a[13]=rs.getString(15);
					a[14]=rs.getString(16);
					a[15]=rs.getString(17);
					a[16]=rs.getString(18);
					a[17]=rs.getString(19);
					a[18]=rs.getString(20);
					a[19]=rs.getString(21);
					a[20]=rs.getString(22);
					a[21]=rs.getString(23);
					a[22]=rs.getString(24);
					a[23]=rs.getString(25);
					a[24]=rs.getString(26);
					a[25]=rs.getString(27);
					a[26]=rs.getString(28);	
				}
			//System.out.println("X value: "+a[11]);	
			//System.out.println("X value: "+a[12]);	
			
		} 
	catch (SQLException e) 
		{
			e.printStackTrace();
		}
		if(a[26]==null)
		{
			a[26]="0000-00-00";
		}
		sql = "insert into jobwork_history(brand,call_type,call_date,systemcall_id,companycall_id,customer_name,address,place_code,city,district,postal_code,phone_no,"+
			      "mobile_no,email_id,model_code,product_name,product_slno,purchase_date,complain_code,complain_text,call_category,"+
			      "call_priority,payout_type,cus_remarks,allocated_engr,spare_included,allocated_date,eng_status,eng_remarks,user) values ('"				      
			      	+ a[0] 
					+ "','"
			      	+ a[1]
					+ "','"
					+ a[2] 
					+ "','"
					+ a[3]
					+ "','"
					+ a[4]
					+ "','"
					+ a[5]
					+ "','"
					+ a[6]
					+ "','"
					+ a[7]
					+ "','"
					+ a[8]
					+ "','"
					+ a[9]
					+ "','"
					+ a[10]
					+ "','"
					+ a[11]
					+ "','"
					+ a[12]
					+ "','"
					+ a[13]
					+ "','"
					+ a[14]
					+ "','"
					+ a[15]
					+ "','"
					+ a[16]
					+ "','"
					+ a[17]
					+ "','"
					+ a[18]
					+ "','"
					+ a[19]
					+ "','"
					+ a[20]
					+ "','"
					+ a[21]
					+ "','"
					+ a[22]
					+ "','"
					+ a[23]
					+ "','"
					+ a[24]
					+ "','"
					+ a[25]
					+ "','"
					+ a[26]
					+ "','"
					+ FormBean.getEngstatus()
					+ "','"
					+ FormBean.getRemarks()
					+"','"
					+ FormBean.getUser()
					+"');";
			
			//System.out.println("Call date in insert: "+sql);
		
			result = ConnectionDAO.executeUpdate(stm, sql);
	
	
	ConnectionDAO.closeConnection(conn);
	return result;
}

public static List<FormBean> pertsreq(String user) 
{
	
	
	List<FormBean> l1 = new ArrayList<FormBean>();
	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn);
	
	try 
	{
	
	String a6="",a7="";
	String sql = "select * from user where USERNAME ='" + user + "'";
	ResultSet rs = stm.executeQuery(sql);
		while (rs.next()) {

			a6 = rs.getString(2);
			
		}
		
	sql = "select * from logins where USERNAME ='" + user + "'";
	rs = stm.executeQuery(sql);
		while (rs.next()) {

				a7 = rs.getString(6);
				
			}
	
			   
		if((a6.compareTo("ROLE_ADMIN")==0))
		sql = "select * from parts_required where status='"+"P"+"'";
		else
		sql = "select * from parts_required where status='"+"P"+"' and user='"+user+"'";	
		
		try 
		{
			rs = stm.executeQuery(sql);
			FormBean usBean;
			while (rs.next()) 
				{
					usBean = new FormBean();
					
					usBean.setScode(rs.getString(2));
					usBean.setName(rs.getString(3));
					usBean.setCdate(rs.getString(4));
					usBean.setRemarks(rs.getString(6));
					
					l1.add(usBean);
				}
		} 
	catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}
	catch( Exception e)
	{
		
	}
	ConnectionDAO.closeConnection(conn);
	return l1;
}

public static List<FormBean> pertsrec(String user) 
{
	
	
	List<FormBean> l1 = new ArrayList<FormBean>();
	
	//System.out.println(sql);
	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn);
	String a6="";
	
			    
		
	try 
		{
		String sql = "select * from user where USERNAME ='" + user + "'";
		ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {

				a6 = rs.getString(2);
				
			}
			
			
				   
			if(a6.compareTo("ROLE_ADMIN")==0)
			sql = "select * from parts_required where engstatus='"+"P"+"'";
			else
			sql="select * from parts_required where engstatus='"+"P"+"' and senderid='"+user+"'";
		
			rs = stm.executeQuery(sql);
			FormBean usBean;
			while (rs.next()) 
				{
					usBean = new FormBean();
					
					usBean.setScode(rs.getString(2));
					usBean.setName(rs.getString(3));
					usBean.setCdate(rs.getString(4));
					usBean.setRemarks(rs.getString(6));
					usBean.setPremarks("As per your need parts is added");
					usBean.setEdate(rs.getString(9));
					l1.add(usBean);
				}
		} 
	catch (SQLException e) 
		{
			e.printStackTrace();
		}
	ConnectionDAO.closeConnection(conn);
	return l1;
}

public static List<FormBean> reportdetails(FormBean usersBean) {
	
	String s=(String)usersBean.getFrmdate();
	String s1=(String)usersBean.getTodate();
	
	String s2=(String)usersBean.getBname();
	String s3=(String)usersBean.getMcode();
	String s4=(String)usersBean.getFname();
	
	String s5=(String)usersBean.getCtype();
	String s6=(String)usersBean.getCatagory();
	
	String s7=(String)usersBean.getCptype();
	String s8=(String)usersBean.getEngname();
	String s9=(String)usersBean.getUserstatus();
	String s10=(String)usersBean.getPtype();
	
	
	// System.out.println("BABLU"+s9);
	
	
	//Statement s1= connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
    String query = "select brand,call_type,call_date,companycall_id,customer_name,address,phone_no,model_code,product_name,complain_code,eng_status,eng_remarks,datediff(now(),call_date),expence_given,real_expence,product_slno,user,payout_type,customer_ref_id from jobwork_entry";
    if(s != null || s1 != null || s2 !=null || s3 !=null || s4 !=null || s5 !=null || s6 !=null || s7 !=null || s8 !=null || s9!=null){
        query = query + " where ";
    }
   
   
    if(s != null && !"".equals(s)){
        query = query + " tdate>='"+s+"' AND";
    }
    if(s1 != null && !"".equals(s1)){
        query = query + " tdate<='"+s1+"' AND";
    }
    if(s2 != null && !"".equals(s2)){
        query = query + " brand='"+s2+"' AND";
    }
    if(s3 != null && !"".equals(s3)){
        query = query + " model_code='"+s3+"' AND";
    }
    if(s4 != null && !"".equals(s4)){
        query = query + " product_name='"+s4+"' AND";
    }
    
    if (s5 != null && !"".equals(s5)){
        query = query + " call_type='"+s5+"' AND";
    }
    
    if(s6 != null && !"".equals(s6)){
        query = query + " call_category='"+s6+"' AND";
    }
    
    if(s7 != null && !"".equals(s7)){
        query = query + " call_priority='"+s7+"' AND";
    }
    if(s8 != null && !"".equals(s8)){
        query = query + " allocated_engr='"+s8+"' AND";
    }
    if(s9 != null && !"".equals(s9)){
        query = query + " eng_status='"+s9+"' AND";
    }

    if(s10 != null && !"".equals(s10)){
        query = query + " payout_type='"+s10+"' AND";
    }

    
    if(query != null && query.indexOf("AND") != -1){
        query = query.substring(0, query.length() -4);
    }
    
	
	List<FormBean> l1 = new ArrayList<FormBean>();
	//Double d = 0.00;
	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn);
	try 
	{
		
		
	ResultSet rs = stm.executeQuery(query);
	FormBean usBean;
	while (rs.next()) {
		usBean = new FormBean();

		usBean.setBname(rs.getString(1));
		usBean.setCtype(rs.getString(2));
		usBean.setCdate(rs.getString(3));
		usBean.setScode(rs.getString(4));
		usBean.setCust_ref_id(rs.getString(19));
		usBean.setName(rs.getString(5));
		usBean.setAddress(rs.getString(6));
		usBean.setPon(rs.getString(7));
		usBean.setMcode(rs.getString(8));
		usBean.setFname(rs.getString(9));
		usBean.setComcode(rs.getString(10));
		usBean.setEngstatus(rs.getString(11));
		usBean.setRemarks(rs.getString(12));
		usBean.setAllocation(rs.getString(13));
		usBean.setExpencedetails(rs.getString(14));
		usBean.setCremarks(rs.getString(15));
		usBean.setPserial(rs.getString(16));
		usBean.setUsername(rs.getString(17));
		usBean.setPtype(rs.getString(18));
		
		l1.add(usBean);
	}

	
	
	
	} catch (SQLException e) {
	e.printStackTrace();
	}
	ConnectionDAO.closeConnection(conn);
	return l1;
	}

public static List<FormBean> sparereturndetails(FormBean usersBean) {
	
	String s=(String)usersBean.getFrmdate();
	String s1=(String)usersBean.getTodate();
	String s2=(String)usersBean.getScode();
	String s3=(String)usersBean.getEngname();
	
	
	
	
	
	//Statement s1= connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
    String query = "select * from spare_table";
    if(s != null || s1 != null || s2 !=null || s3 !=null ){
        query = query + " where";
    }
   
    if(s != null && !"".equals(s)){
        query = query + " spareallocation_date>='"+s+"' AND";
    }
    if(s1 != null && !"".equals(s1)){
        query = query + " spareallocation_date<='"+s1+"' AND";
    }
    if(s2 != null && !"".equals(s2)){
        query = query + " companycall_Id='"+s2+"' AND";
    }
    if(s3 != null && !"".equals(s3)){
        query = query + " eng_name='"+s3+"' AND";
    }


    if(query != null && query.indexOf("AND") != -1){
        query = query.substring(0, query.length() -4);
    }
    
	
	List<FormBean> l1 = new ArrayList<FormBean>();
	//Double d = 0.00;
	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn);
	try 
	{
	ResultSet rs = stm.executeQuery(query);
	FormBean usBean;
	while (rs.next()) {
		
		usBean = new FormBean();

		usBean.setScode(rs.getString(2));
		usBean.setName(rs.getString(3));
		usBean.setBname(rs.getString(4));
		usBean.setCdate(rs.getString(5));
		int k=Integer.parseInt(rs.getString(6));
		if(k==0)
		usBean.setAddress("No");
		else
		usBean.setAddress("Yes");	
		
		k=Integer.parseInt(rs.getString(7));
		if(k==0)
		usBean.setPon("No");
		else
		usBean.setPon("Yes");
		
		k=Integer.parseInt(rs.getString(8));
		if(k==0)
		usBean.setMcode("No");
		else
		usBean.setMcode("Yes");
		
		usBean.setFname(rs.getString(9));
				
		l1.add(usBean);
	}

	
	} catch (SQLException e) {
	e.printStackTrace();
	}
	ConnectionDAO.closeConnection(conn);
	return l1;
	}


public static List<FormBean> engexpensedetails(FormBean usersBean) {
	
	String s=(String)usersBean.getFrmdate();
	String s1=(String)usersBean.getTodate();
	String s2=(String)usersBean.getScode();
	String s3=(String)usersBean.getEngname();
	String s4=(String)usersBean.getUserstatus();
	
	
	//Statement s1= connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
    String query = "select * from expencedetails";
    
//System.out.println("Test   :  "+query);

  
  
    if(s != null || s1 != null || s2 !=null || s3 !=null ){
        query = query + " where";
    }
   
    if(s != null && !"".equals(s)){
        query = query + " expence_date>='"+s+"' AND";
    }
    if(s1 != null && !"".equals(s1)){
        query = query + " expence_date<='"+s1+"' AND";
    }
    if(s2 != null && !"".equals(s2)){
        query = query + " companycall_Id='"+s2+"' AND";
    }
    if(s3 != null && !"".equals(s3)){
        query = query + " engname='"+s3+"' AND";
    }
    if(s4 != null && !"".equals(s4)){
        query = query + " eng_status='"+s4+"' AND";
    }

    if(query != null && query.indexOf("AND") != -1){
        query = query.substring(0, query.length() -4);
    }
    
	
	List<FormBean> l1 = new ArrayList<FormBean>();
	//Double d = 0.00;
	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn);
	try 
	{
	ResultSet rs = stm.executeQuery(query);
	FormBean usBean;
	while (rs.next()) {
		usBean = new FormBean();

		usBean.setBname(rs.getString(1));
		usBean.setCdate(rs.getString(2));
		usBean.setScode(rs.getString(3));
		usBean.setName(rs.getString(4));
		usBean.setFname(rs.getString(5));
		usBean.setScrno(rs.getString(6));
		usBean.setAddress(rs.getString(7));
		usBean.setEdate(rs.getString(8));
		usBean.setAmount(rs.getString(9));
		usBean.setCramount(rs.getDouble(10));
		usBean.setUsername(rs.getString(11));
		
		l1.add(usBean);
	}

	} catch (SQLException e) {
	e.printStackTrace();
	}
	ConnectionDAO.closeConnection(conn);
	return l1;
	}


//Engineer Related FormHelper	

public static List<FormBean> engineerlist() 
{
	List<FormBean> l1 = new ArrayList<FormBean>();
	String sql = "select * from engineer_master";
	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn);
	try 
		{
			ResultSet rs = stm.executeQuery(sql);
			FormBean usBean;
			while (rs.next()) 
				{
					usBean = new FormBean();
					usBean.setId(rs.getInt(1)); 
					usBean.setScode(rs.getString(2));
					usBean.setName(rs.getString(3));
					usBean.setDoj(rs.getString(6));
					usBean.setEmail(rs.getString(15));
					usBean.setMobile(rs.getString(14));
					usBean.setPmobile(rs.getString(13));											
					l1.add(usBean);
				}
		} 
	catch (SQLException e) 
		{
			e.printStackTrace();
		}
	ConnectionDAO.closeConnection(conn);
	return l1;
}	

// added by Nilesh
public static boolean add_inspection_item(FormBean FormBean)
{
	
	boolean result = false;
	
	String sql = null;
	/*int k = 0;*/
	
	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn);
	
	if(FormBean.getId() != null)
	{
		
		/*
		sql = "update jobwork_entry set adopter_serialno = '"+FormBean.getAdopter()  
		+"',battery_serialno = '"+FormBean.getBattery()
			+"',harddisk_details = '"+FormBean.getHdd()
		+"',odd_details = '"+FormBean.getOpd()
		+"',ram_details = '"+FormBean.getRam()
		+"',screen_details = '"+FormBean.getScreen()
		+"',keyboard_details = '"+FormBean.getKeyboard()
		+"',Other_details = '"+FormBean.getOtheraccessories()
		+"',physical_damage = '"+FormBean.getPhysicaldamaged()
	 	+"',Wifi = '"+FormBean.getWifi_yes_no()
		+"',bag = '"+FormBean.getBag_yes_no()
	 	+"',checked_by = '"+FormBean.getInspected_by()
		+"' where id = "+FormBean.getId()
		+");";
		*/
		
		sql = "insert into jobwork_entry(adopter_serialno,battery_serialno,harddisk_details,odd_details,ram_details,screen_details,keyboard_details,Other_details,physical_damage,Wifi,bag,checked_by) values ('"
				+ FormBean.getAdopter()
				+"',' "
				+ FormBean.getBattery()
				+"',' "
				+FormBean.getHdd()
				+"',' "
				+FormBean.getOpd()
				+"','"
				+FormBean.getRam()
				+"','"
				+FormBean.getScreen()
				+"','"
				+FormBean.getKeyboard()
				+"','"
				+FormBean.getOtheraccessories()
				+"','"
				+FormBean.getPhysicaldamaged()
				+"','"
				+FormBean.getWifi_yes_no()
				+"','"
				+FormBean.getBag_yes_no()
				+"','"
				+FormBean.getInspected_by()
				+"');";
		
		result = ConnectionDAO.executeUpdate(stm, sql);
		
	}
	ConnectionDAO.closeConnection(conn);
	return result;
	
}


public static boolean engineercreation(FormBean FormBean) {
	boolean result = false;
	// Connect to database and save the FormBean object to database table
	String sql = null;
			
	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn);
			
			if (FormBean.getId() != null) 
			{	
				sql = "update engineer_master set engineer_code ='"+FormBean.getScode()+"', engineer_name ='"+FormBean.getName()+"',"+
				" gender ='"+FormBean.getGender()+"', birth_date ='"+FormBean.getDob()+"', joining_date ='"+FormBean.getDoj()+"',"+
				" father_name ='"+FormBean.getFname()+"', res_address ='"+FormBean.getAddress()+"', place_code ='"+FormBean.getCcode()+"',"+
				" res_mobileno ='"+FormBean.getRmobile()+"', edu_qualification ='"+FormBean.getEduqli()+"', tech_qualification ='"+FormBean.getTecqli()+"',"+
				" personal_mobileno ='"+FormBean.getPmobile()+"', office_mobileno ='"+FormBean.getMobile()+"',"+
				" email_id ='"+FormBean.getEmail()+"' where id ="+FormBean.getId();
													
			//	System.out.println(sql);
				
				result = ConnectionDAO.executeUpdate(stm, sql);
			}
			else
			{					
				sql = "select * from engineer_master order by id";
				int k=0;
				
				try 
				{
					ResultSet rs = stm.executeQuery(sql);
					while (rs.next()) 
						{								
							k=rs.getInt(1);
						}
				} 
			catch (SQLException e) 
				{
					e.printStackTrace();
				}
				
				sql = "insert into engineer_master(engineer_code,engineer_name,gender,birth_date,joining_date,father_name,res_address,place_code,res_mobileno,edu_qualification,tech_qualification,personal_mobileno,office_mobileno,email_id) values ('"
						+ FormBean.getScode()
						+ "','"
						+ FormBean.getName()
						+ "','"
						+ FormBean.getGender()
						+ "','"
						+ FormBean.getDob()
						+ "','"
						+ FormBean.getDoj()
						+ "','"
						+ FormBean.getFname()
						+ "','"
						+ FormBean.getAddress()
						+ "','"
						+ FormBean.getCcode()
						+ "','"
						+ FormBean.getRmobile()
						+ "','"
						+ FormBean.getEduqli()
						+ "','"
						+ FormBean.getTecqli()
						+ "','"
						+ FormBean.getPmobile()
						+ "','"
						+ FormBean.getMobile()
						+"','"
						+ FormBean.getEmail()
						+"');";
										
					//	System.out.println(sql);
				
				result = ConnectionDAO.executeUpdate(stm, sql);
			}
			return result;
	}

public static FormBean engineeredit(int id) {
	FormBean usBean = new FormBean();
	String sql = "select * from engineer_master where id=" + id;
	
	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn);
	try {
		
	ResultSet rs = stm.executeQuery(sql);
	while (rs.next()) 
	{
		usBean.setId(rs.getInt(1));
		usBean.setScode(rs.getString(2));
		usBean.setName(rs.getString(3));
		usBean.setGender(rs.getString(4));
		usBean.setDob(rs.getString(5));
		usBean.setDoj(rs.getString(6));
		usBean.setFname(rs.getString(7));
		usBean.setAddress(rs.getString(8));
		usBean.setCcode(rs.getString(9));
		
		String cname=placename(rs.getString(9));
		//System.out.println("Cname: "+cname);
		String cname1[]=cname.split("[|]");
		//System.out.println(cname1[0]);
		usBean.setSname(cname1[0]);
		usBean.setCity(cname1[1]);
		usBean.setDistrict(cname1[2]);
		usBean.setState(cname1[3]);
		usBean.setPcode(cname1[4]);
		usBean.setRmobile(rs.getString(10));
		usBean.setEduqli(rs.getString(11));
		usBean.setTecqli(rs.getString(12));
		usBean.setPmobile(rs.getString(13));
		usBean.setMobile(rs.getString(14));
		usBean.setEmail(rs.getString(15));									
	}
	} 
	catch (Exception e) 
	{
	System.out.println(e);
	}
	ConnectionDAO.closeConnection(conn);
	return usBean;
	}
public static boolean engineerdelete(int id) {
	boolean result = false;
			
	String sql = "delete from engineer_master where id = " + id;

	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn);
	result = ConnectionDAO.executeUpdate(stm, sql);
	ConnectionDAO.closeConnection(conn);
	return result;
	}	




public static List<FormBean> searchr(FormBean usersBean) {
	//System.out.println("hello");
	String s=(String)usersBean.getScode();
	String s1=(String)usersBean.getName();
	String s2=(String)usersBean.getPserial();
	String s3=(String)usersBean.getPon();
	String s4=(String)usersBean.getCust_ref_id();
	
	
	//Statement s1= connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
    String query = "select * from jobwork_entry";
    if(s != null || s1 != null || s2 !=null || s3 !=null || s4 !=null){
        query = query + " where";
    }
   
   
    if(s != null && !"".equals(s)){
        query = query + " companycall_Id='"+s+"' AND";
    }
    if(s1 != null && !"".equals(s1)){
        query = query + " customer_name<='"+s1+"' AND";
    }
    if(s2 != null && !"".equals(s2)){
        query = query + " product_slno='"+s2+"' AND";
    }
    if(s3 != null && !"".equals(s3)){
        query = query + " mobile_no='"+s3+"' AND";
    }
    if(s4 != null && !"".equals(s4)){
        query = query + " customer_ref_id='"+s4+"' AND";
    }

    if(query != null && query.indexOf("AND") != -1){
        query = query.substring(0, query.length() -4);
    }
    
	
	List<FormBean> l1 = new ArrayList<FormBean>();
	//Double d = 0.00;
	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn);
	try 
	{
	//System.out.println(query);
	ResultSet rs = stm.executeQuery(query);
	FormBean usBean;
	while (rs.next()) {
		usBean = new FormBean();
		usBean.setId(rs.getInt(1));
		usBean.setBname(rs.getString(2));
		usBean.setCtype(rs.getString(3));
		usBean.setCdate(rs.getString(4));
		usBean.setCcode(rs.getString(5));
		usBean.setScode(rs.getString(6));
		usBean.setName(rs.getString(7));
		usBean.setAddress(rs.getString(8));
		usBean.setPlace(rs.getString(9));
		usBean.setCity(rs.getString(10));
		usBean.setDistrict(rs.getString(11));
		usBean.setPcode(rs.getString(12));
		usBean.setPon(rs.getString(13));
		usBean.setMobile(rs.getString(14));
		usBean.setEmail(rs.getString(15));
		usBean.setCust_ref_id(rs.getString(55));
		//System.out.println(rs.getString(55));
		usBean.setMcode(rs.getString(16));
		usBean.setFname(rs.getString(17));
		usBean.setPserial(rs.getString(18));
		usBean.setPdate(rs.getString(19));
		usBean.setComcode(rs.getString(20));
		usBean.setCatagory(rs.getString(22));
		usBean.setCptype(rs.getString(23));
		
		usBean.setPtype(rs.getString(24));
		usBean.setRemarks(rs.getString(25));
		usBean.setAllocation(rs.getString(26));
		usBean.setUserstatus(rs.getString(29));
	
													
		l1.add(usBean);
	}


	
	} catch (SQLException e) {
	e.printStackTrace();
	}
	ConnectionDAO.closeConnection(conn);
	return l1;
	}


public static List<FormBean> customername(FormBean formbean)
{
	List<FormBean> l1 = new ArrayList<FormBean>();
	String sql ="select customer_name from customer_master";
	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn);
	try 
		{
			ResultSet rs = stm.executeQuery(sql);
			FormBean usBean;
	
			while (rs.next()) 
				{
					usBean = new FormBean();
					usBean.setCustomername(rs.getString(1));
					l1.add(usBean);
				}		
		} 
	catch (SQLException e) 
		{
			e.printStackTrace();
		}
	ConnectionDAO.closeConnection(conn);
	return l1;
}
public static List<FormBean> model(FormBean formbean)
{
	List<FormBean> l1 = new ArrayList<FormBean>();
	String sql ="select model_name from model_master";
	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn);
	try 
		{
			ResultSet rs = stm.executeQuery(sql);
			FormBean usBean;
	
			while (rs.next()) 
				{
					usBean = new FormBean();
					usBean.setModel(rs.getString(1));
					l1.add(usBean);
				}		
		} 
	catch (SQLException e) 
		{
			e.printStackTrace();
		}
	ConnectionDAO.closeConnection(conn);
	return l1;
}
public static List<FormBean> salescrmserviceslist(FormBean formbean)
{
	List<FormBean> l1 = new ArrayList<FormBean>();
	String sql ="select * from enquiry_transaction where custid like 'SS%' order by id desc";
	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn);
	try 
		{
			ResultSet rs = stm.executeQuery(sql);
			FormBean usBean;
	
			while (rs.next()) 
				{
					usBean = new FormBean();
					usBean.setId(rs.getInt(1));
					usBean.setSlno(rs.getString(2));
					usBean.setCustomername(rs.getString(3));
					usBean.setAddress(rs.getString(4));
					usBean.setDate1(rs.getString(5));
					usBean.setMobileno(rs.getString(6));
					usBean.setState(rs.getString(7));
					usBean.setCity(rs.getString(8));
					usBean.setPincode(rs.getString(9));
					usBean.setProduct(rs.getString(10));
					usBean.setProductid(rs.getString(11));
					usBean.setModel(rs.getString(12));
					usBean.setPayouttype(rs.getString(13));
					usBean.setRemarks(rs.getString(14));
					usBean.setEmail(rs.getString(15));
					l1.add(usBean);
				}		
		} 
	catch (SQLException e) 
		{
			e.printStackTrace();
		}
	ConnectionDAO.closeConnection(conn);
	return l1;
}
public static boolean salescrmservicescreation(FormBean formbean) {
	boolean result = false;
	ResultSet rs;
	String sql;
	String en="";	
	//String slno[]=formbean.getSlno();
	String particulars[]=formbean.getParticulars();
	String report[]=formbean.getReport();
	String status[]=formbean.getStatus();
	String attendedby[]=formbean.getAttendedby();
	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn);
		
		
		if (formbean.getId() != null) 
		{
			sql = "update enquiry_transaction set slno='"+formbean.getSlno()+"',customername='"+formbean.getCustomername()+"',address='"+formbean.getAddress()+"',date='"+formbean.getDate()+"',mobile_no='"+formbean.getMobileno()+"',state='"+formbean.getState()+"',city='"+formbean.getCity()+"',pincode='"+formbean.getPincode()+"',productid='"+formbean.getProductid()+"',product='"+formbean.getProduct()+"',model='"+formbean.getModel()+"',payouttype='"+formbean.getPayouttype()+"',remarks='"+formbean.getRemarks()+"',email='"+formbean.getEmail()+"' where id='"+formbean.getId()+"' ";	
			result = ConnectionDAO.executeUpdate(stm, sql);
		
			sql="select  from enquiry_transaction where id='"+formbean.getId()+"' ";
			String custid="";
			try{
					rs=stm.executeQuery(sql);
					while(rs.next())
					{
						custid=rs.getString(1);
					}
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		else
		{
			String pre="SS17181718",finalcode="";
			sql = "select max(right(slno,5)) from enquiry_transaction";
			//System.out.println(sql);
			String k = "";
			int n=0;
			String scode="";
						try{
						rs = stm.executeQuery(sql);
							while (rs.next()) 
								{								
									n=rs.getInt(1);	
									
								}
						}catch(Exception e)
						{
							e.printStackTrace();
						}
						
					
				
			
				if(n==0)
				{
					finalcode=pre+"0000"+(n+1);
				}
				else if(n > 0 && n < 9)
				{
					
					finalcode=pre+"0000"+(n+1);
				}
				else if(n > 8 && n < 99)
				{
					
					finalcode=pre+"000"+(n+1);
				}
				else if(n > 98 && n < 999)
				{
					
					finalcode=pre+"00"+(n+1);
				}
				else if(n > 998 && n < 9999)
				{
					
					finalcode=pre+"0"+(n+1);
				}
				try
				{
				sql = "insert into enquiry_transaction(slno,customername,address,date1,mobileno,state,city,pincode,productid,product,model,payouttype,remarks,email) values ('"
						+ formbean.getSlno() 
						+ "','"
						+ formbean.getCustomername()
						+ "','"
						+ formbean.getAddress()
						+ "','"
						+ formbean.getDate1()
						+ "','"
						+ formbean.getMobileno()
						+ "','"
						+ formbean.getState()
						+ "','"
						+ formbean.getCity()
						+ "','"
						+ formbean.getPincode()
						+ "','"
						+ formbean.getProductid()
						+ "','"
						+ formbean.getProduct()
						+ "','"
						+ formbean.getModel()
						+ "','"
						+ formbean.getPayouttype()
						+ "','"
						+ formbean.getRemarks()
						+ "','"
						+ formbean.getEmail()
						+"')" ;
				System.out.println(sql);
				//result = ConnectionDAO.executeUpdate(stm, sql);
				
				/*sql="update customer_master set customer_code='"+formbean.getCustomercode()+"',customer_name='"+formbean.getCustomername()+"',res_address='"+formbean.getAddress()+"',personal_mobileno='"+formbean.getMobileno()+"', email_id='"+formbean.getEmail()+"'where customer_code='EN0%' ";
				result = ConnectionDAO.executeUpdate(stm, sql);
			*/
				for(int i=0;i<particulars.length;i++)
				{				
					sql="insert into enquiry_details(particulars,report,status,attendedby) values('"
							+ particulars[i]
							+ "','"
							+ report[i]
							+ "','"
							+ status[i]
							+ "','"
							+ attendedby[i]
							+"')";
					//result = ConnectionDAO.executeUpdate(stm, sql);
					System.out.println(sql);
				}	
					
		}
			
				catch(Exception gh)
				{
					System.out.println("Error on enquiry transaction creation "+gh);
				}
		}
			return result;
		}
//update
public static FormBean salescrmservicesupdate(int id,String slno) {
	FormBean usBean = new FormBean();
	List<FormBean> l1 = new ArrayList<FormBean>();
	String sql ="select * from enquiry_transaction where slno='"+slno+"' ";
	//System.out.println(sql);
	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn);
	try 
		{
			ResultSet rs = stm.executeQuery(sql);
			
			while (rs.next()) 
				{
					usBean = new FormBean();
					usBean.setId(rs.getInt(1));
					usBean.setSlno(rs.getString(2));
					usBean.setCustomername(rs.getString(3));
					usBean.setAddress(rs.getString(4));
					usBean.setDate(rs.getString(5));
					usBean.setMobileno(rs.getString(6));
					usBean.setEmail(rs.getString(7));
					usBean.setCity(rs.getString(8));
					usBean.setState(rs.getString(9));
					usBean.setPincode(rs.getString(10));
					usBean.setProductid(rs.getString(11));
					usBean.setProduct(rs.getString(12));
					usBean.setModel(rs.getString(13));
					usBean.setPayouttype(rs.getString(14));
					usBean.setProblems(rs.getString(15));
					
					//l1.add(usBean);
				}
			Vector<String> particulars=new Vector<String>();
			Vector<String> report=new Vector<String>();
			Vector<String> status=new Vector<String>();
			Vector<String> attendedby=new Vector<String>();
			Vector<String> d=new Vector<String>();
			
			
			sql="select * from inventory_details where particulars='"+particulars+"' ";
			rs = stm.executeQuery(sql);
			System.out.println(sql);
			while(rs.next())
			{
				particulars.add(rs.getString(1));
				report.add(rs.getString(2));
				status.add(rs.getString(3));
				attendedby.add(rs.getString(4));
				
			}
			for(int i=0;i<particulars.size();i++)
			{
				sql="select customer_name from customer_master where particulars='"+particulars.get(i)+"' ";
				rs=stm.executeQuery(sql);
				while(rs.next())
				{
					d.add(rs.getString(1));
					
				}
				
			}
			
			String darr[]=new String[d.size()];
			String particularsarr[]=new String[particulars.size()];
			String reportarr[]=new String[report.size()];
			String statusarr[]=new String[status.size()];
			String attendedbyarr[]=new String[attendedby.size()];
			
			for(int i=0;i<particulars.size();i++)
			{
					particularsarr[i]=particulars.get(i);
					reportarr[i]=report.get(i);
					statusarr[i]=status.get(i);
					attendedbyarr[i]=attendedby.get(i);
					darr[i]=d.get(i);
			}
			
			usBean=new FormBean();
			usBean.setParticulars(particularsarr);
			usBean.setReport(reportarr);
			usBean.setStatus(statusarr);
			usBean.setAttendedby(attendedbyarr);
			//usBean.setDesc(darr);
			
	}
	catch (SQLException e) 
		{
			e.printStackTrace();
		}
	ConnectionDAO.closeConnection(conn);
		return usBean;
		}

// delete
public static boolean salescrmservicesdelete(int id,String slno) {
	boolean result = false;
	String sql = "delete from enquiry_transaction where slno='"+slno+"' ";

	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn);
	result = ConnectionDAO.executeUpdate(stm, sql);
	ConnectionDAO.closeConnection(conn);
	return result;
	}


}
