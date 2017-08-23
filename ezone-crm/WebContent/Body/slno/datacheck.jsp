<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.connection.ezonecrm.*"%>
<%@page import="java.text.DecimalFormat" %>

<%
    String pserial=request.getParameter("pserial");

    //System.out.println(catagorysave);

    String buffer=""; 
try
    {
        Connection conn = ConnectionDAO.getConnectionObject();
        Statement stm = ConnectionDAO.createStatement(conn);
         
        
        int i=0;
        String a[]=new String[21];
        		
        ResultSet rs = stm.executeQuery("select * from jobwork_entry where product_slno='"+pserial+"'");
        while(rs.next())
        {
           
           a[0]=rs.getString("brand");
           a[1]=rs.getString("call_type");
           a[2]=rs.getString("call_date");
           a[3]=rs.getString("companycall_id");
           a[4]=rs.getString("customer_name");
           a[5]=rs.getString("address");
           a[6]=rs.getString("place_code");
           a[7]=rs.getString("city");
           a[8]=rs.getString("district");
           a[9]=rs.getString("postal_code");
           a[10]=rs.getString("phone_no");
           a[11]=rs.getString("mobile_no");
           a[12]=rs.getString("email_id");
           a[13]=rs.getString("model_code");
           a[14]=rs.getString("product_name");
           a[15]=rs.getString("purchase_date");
           a[16]=rs.getString("complain_code");
           a[17]=rs.getString("call_category");
           a[18]=rs.getString("call_priority");
           a[19]=rs.getString("payout_type");
           a[20]=rs.getString("cus_remarks");
         
           
        }
      
        buffer=a[0]+"||"+a[1]+"||"+a[2]+"||"+a[3]+"||"+a[4]+"||"+a[5]+"||"+a[6]+"||"+a[7]+"||"+a[8]+"||"+a[9]+"||"+a[10]+"||"+a[11]+"||"+a[12]+"||"+a[13]+"||"+a[14]+"||"+a[15]+"||"+a[16]+"||"+a[17]+"||"+a[18]+"||"+a[19]+"||"+a[20];  
       
       
        System.out.println(buffer);
       
        response.getWriter().println(buffer);
        conn.close();
    }
catch(Exception e)
    {
        System.out.println(e);
    }
%>