<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.OutputStream" %>
<%@page import="com.connection.ezonecrm.ConnectionDAO" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Job Card Printing Page</title>
<script language="javascript" type="text/javascript" src="js/tablefilter.js"></script>
<link rel="stylesheet" href="css/style2.css" />
<link rel="stylesheet" href="css/draftbutton.css" />
<link rel="stylesheet" href="css/printbutton.css" />
<link rel="stylesheet" href="css/breadcumbs.css" ></link>

<script language="javascript">
            function printDiv(divName) {
                  var printContents = document.getElementById(divName).innerHTML;
                  var originalContents = document.body.innerHTML;
                 
                  document.body.innerHTML = printContents;
 
                  window.print();
 

                  document.body.innerHTML = originalContents;
            }
 
</script>

<style type="text/css">
table.gridtable {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #666666;
	border-collapse: collapse;
}
table.gridtable th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #dedede;
}

table.gridtable tr {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #ffff;
}
table.gridtable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #ffffff;
}


table.imagetable {
	text-decoration: none;
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#000;
	border-width: 1px;
	border-top:1px solid #c6d5e1;
	border-bottom:1px solid #c6d5e1;
	border-right:1px solid #c6d5e1;
	border-left:1px solid #c6d5e1;
	border-collapse: collapse;
	
}
table.imagetable th {
	
	background:url(images/header-bg.gif);
	border-width: 1px;
	padding:4px 6px 6px;
	color:#fff;
	border-top:1px solid #c6d5e1;
	border-bottom:1px solid #c6d5e1;
	border-right:1px solid #c6d5e1;
	border-left:1px solid #c6d5e1;
	border-style: solid;
	
}
table.imagetable td {
	text-decoration:none;
	border-width: 1px;
	padding:4px 6px 6px;
	border-top:1px solid #c6d5e1;
	border-bottom:1px solid #c6d5e1;
	border-right:1px solid #c6d5e1;
	border-left:1px solid #c6d5e1;
	border-style: solid;
	background-color: #ffffff;
	
}

</style>
<sj:head/>

<style>
#ui-datepicker-div {background:#dce6ee;}

#ui-datepicker-div .ui-state-highlight {color: #dce6ee;}

#ui-datepicker-div.ui-datepicker-control {background: blue;}


.ui-dialog-titlebar{ 
    background: #FFCC66 repeat-x;
    color:#fff;      
}
</style>


</head>

<body><center>
<% 
		java.util.Date dt = new java.util.Date();
		//final String td = (dt.getYear() + 1900) + "-" + (dt.getMonth() + 1)+ "-" + dt.getDate();
		final String td = dt.getDate()+"/"+(dt.getMonth() + 1)+"/"+(dt.getYear() + 1900);
		//String user=(String)request.getParameter("value");
		//System.out.println("user :"+user);
		
		String particulars="",qty="",rate="",amount="";
		
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		
		//String sql="select * from jobwork_entry where companycall_id='"+user+"'";
		
		String id =(String)request.getParameter("value");
		
		String voucher_num=(String)request.getParameter("voucher");
		
		String sql="select * from quotation_entry where voucher_no ='" + voucher_num + "' ";
		
		String x="";
		String date="";
		
		try {
			
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
			{
				
				
				x = rs.getString(3);
				
				date = rs.getString(2);
				
				//System.out.println(x);
			}
			
			
		}
		catch(Exception e)
		{
			
		}
		
%>
<input type="button" onclick="printDiv('printableArea')" value="Print" />
<div id="printableArea">
		
		<div style="height:100%;" align="center">
		
		<table width="100%">
		  <tr>
		    <td width="18%"><img src="Image/E_zone_logo.png" height="80px" width="80px" style="margin-top:-45px;padding-left: 10px;" /></td>
		    <td width="65%" style="text-align:center"><p style="font-family:Arial, Helvetica, sans-serif; font-size:22px;margin-top:-6px;">E ZONE CARE</p>
		    <h2>Invoice</h2>
			<p style="margin-top:-22px;">T-44,3rd Floor,Roshpa Tower,Main Road,Ranchi-834&nbsp;001(Jharkhand)<br />Phone:0651-6900067 Email:services@ezonecare.in&nbsp;Web.: ezonecare.in</p>
			</td>
		    <td style="padding-top: 0px;" width="17%">
		    <p style="margin-top:24px;font-size:12px;">The Complete Laptop Reparing Solution<br /></p>
		    <p style="margin-top:-15px;font-size:12px;">Repair Your Laptop<br />with Warranty</p>
		    </td>
		  </tr>
		  
		  <tr>
		  	<td width="17%">SLNO:&nbsp;&nbsp;<%=voucher_num %></td>
			<td>&nbsp;</td>
			<td style="padding-top: 0px;" width="17%">Date:&nbsp;&nbsp;<%=date%> </td>
		  </tr>
		  
		</table>
		
		
		<br/>
		<br/>
		<table cellpadding="0" cellspacing="0" border="0" id="table" class="imagetable" style="width:100%" >
		<thead>
				
			<tr>
				
				<th><center>Sl.No.</center></th>
				<th><center>Particulars</center></th>
				<th><center>Qty</center></th>
				<th><center>Rate</center></th>
				<th><center>Amount</center></th>
				
			</tr>
			
		</thead>
		<tbody>
			
			<%
			 sql="select * from quotation_details where voucher_no='" + x + "' ";
			
			ResultSet rs= stm.executeQuery(sql);
				
			
			%>
				
					<%
						int i=1;
					%>
				
				<%
				try
				{
					
					rs.beforeFirst();
				
					
					
					while(rs.next())
						
					{
										
				%>
				<tr>	
							
					<td><%=i %></td>
					<td><%=rs.getString(3) %></td>
					
					<td><%=rs.getString(4) %></td>
					
					<td><%=rs.getString(5) %></td>
					
					<td><%=rs.getString(6) %></td>
					
					<%
						i++;
					%>
					
				<%
					}
				}
				catch(SQLException e)
					{
						
					}
			
				%>
				
			</tr>
			
		</tbody>
		</table>
		<br/>
		
	
		</div>
		<p align="left">Thanking You</p>
  		<hr/>
  		
  			<div style="height:100%;" align="center">
	
		
		<table width="100%">
		  <tr>
		    <td width="18%"><img src="Image/E_zone_logo.png" height="80px" width="80px" style="margin-top:-45px;padding-left: 10px;" /></td>
		    <td width="65%" style="text-align:center"><p style="font-family:Arial, Helvetica, sans-serif; font-size:22px;">E ZONE CARE</p>
		    <h2>Invoice</h2>
			<p style="margin-top:-22px;">T-44,3rd Floor,Roshpa Tower,Main Road,Ranchi-834&nbsp;001(Jharkhand)<br />Phone:0651-6900067 Email:services@ezonecare.in&nbsp;Web.: ezonecare.in</p>
			</td>
		    <td style="padding-top: 0px;" width="17%">
		    <p style="margin-top:24px;font-size:12px;">The Complete Laptop Reparing Solution<br /></p>
		    <p style="margin-top:-15px;font-size:12px;">Repair Your Laptop<br />with Warranty</p>
		    </td>
		  </tr>
		  
		  <tr>
		  	<td width="17%">SLNO:&nbsp;&nbsp;<%=voucher_num %></td>
			<td>&nbsp;</td>
			<td style="padding-top: 0px;" width="17%">Date:&nbsp;&nbsp;<%=date%> </td>
		  </tr>
		  
		</table>
		
		
		<br/>
		<br/>
		<table cellpadding="0" cellspacing="0" border="0" id="table" class="imagetable" style="width:100%" >
		<thead>
				
			<tr>
				
				<th><center>Sl.No.</center></th>
				<th><center>Particulars</center></th>
				<th><center>Qty</center></th>
				<th><center>Rate</center></th>
				<th><center>Amount</center></th>
				
			</tr>
			
		</thead>
		<tbody>
			
			<%
			sql="select * from quotation_details where voucher_no='" + x + "' ";
			
			rs= stm.executeQuery(sql);
				
			%>
			
				<%
						int j=1;
				%>
				
				<%
				try
				{
					
					// rs.beforeFirst();
					
					while(rs.next())
					{
						
				%>
				<tr>				
					<td><%=j %></td>
					<td><%=rs.getString(3) %></td>
					
					<td><%=rs.getString(4) %></td>
					
					<td><%=rs.getString(5) %></td>
					
					<td><%=rs.getString(6) %></td>
				
					<%
						j++;
					%>
				
				<%
					}
				}
				catch(SQLException e)
					{
						
					}
			
					ConnectionDAO.closeConnection(conn);
				%>
				
				
			</tr>
			
		
		</tbody>
		</table>
		<br/>
		
	
		</div>
			
  <br/>
  
  <p align="left">Thanking You</p>
  
</div>
<input type="button" onclick="printDiv('printableArea')" value="Print" /> 	         
</center></body>
</html>
