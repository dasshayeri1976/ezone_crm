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
<title>Jobwork Entry</title>
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
		String user=(String)request.getParameter("value");
		//System.out.println("user :"+user);
		String name="",add="",calltype="",jobno="",model="",pon="",product="",slno="",problem="",status="";
		String mob="",emil="",brand="",caprs="",crmks="";
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		String sql="select * from jobwork_entry where companycall_id='"+user+"'";
		try {
			
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
			{
				brand=rs.getString(2);
				calltype=rs.getString(3);
				jobno=rs.getString(5);
				name=rs.getString(7);
				add=rs.getString(8);
				pon=rs.getString(13);
				mob=rs.getString(14);
				emil=rs.getString(15);
				model=rs.getString(16);
				product=rs.getString(17);
				slno=rs.getString(18);
				problem=rs.getString(20);
				caprs=rs.getString(23);
				status=rs.getString(24);
				crmks=rs.getString(25);
				
			}
		}
		catch(Exception e)
		{
			
		}
		ConnectionDAO.closeConnection(conn);		
%>
<input type="button" onclick="printDiv('printableArea')" value="Print" />
<div id="printableArea">
		
		<div style="height:100%;" align="center">
		<h5>JOB CARD (Original)</h5>
		<table width="100%" style="border-top:1px solid #c6d5e1;border-bottom:1px solid #c6d5e1;border-right:1px solid #c6d5e1;border-left:1px solid #c6d5e1;font-family: verdana,arial,sans-serif;font-size:12px;">
		<tr>
		<td style="padding-left:20px;">COMPUTER SYSTEM & SERVICES<br/>Suit No 311/312, 3rd Floor<br>Commerce House,Link Tank<br/>Sarda Babu Lane,<br>Ranchi-834001</br></td>
		<td style="padding-left:40px;"align="right"><table><tr><td>Phone: </td><td>+91-651-2209923,2209924,2203022</td></tr><tr><td>Mobile No:</td><td></td></tr><tr><td>E-Mail: </td><td> mukesh.verma@softaid.net.in</td></tr><tr><td>Service Type: </td><td><%=calltype%></td></tr></table></td>
		</tr>
		</table>
		<br/>
		<table width="100%" style="border-top:1px solid #c6d5e1;border-bottom:1px solid #c6d5e1;border-right:1px solid #c6d5e1;border-left:1px solid #c6d5e1;font-family: verdana,arial,sans-serif;font-size:12px;">
		<tr>
		<td style="padding-left:20px;" valign="top"><table><tr><td>Customer Name:</td><td><%=name%></td></tr><tr><td>Customer Address:</td><td><%=add%></td></tr><tr><td>Phone No.:</td><td><%=pon%></td><td>Mobile No.:</td><td><%=mob%></td></tr><tr><td>Email-Id:</td><td><%=emil%></td></tr></table></td>
		<td style="padding-right:110px;"align="right"><table><tr><td>Job No:</td><td><%=jobno%></td></tr><tr><td>Date:</td><td><%=td%></td></tr><tr><td>Brand:</td><td><%=brand.trim()%></td></tr><tr><td>Call Priority:</td><td><%=caprs%></td></tr></table></td>
		</tr>
		</table>
		<br/>
		<table cellpadding="0" cellspacing="0" border="0" id="table" class="imagetable" style="width:100%" >
		<thead>
				
			<tr>
				
				<th><center>Sl.No.</center></th>
				<th><center>Products Name</center></th>
				<th><center>Product Sl.No.</center></th>
				<th><center>Model</center></th>
				<th><center>Problem Reported</center></th>
				<th><center>Status</center></th>
				
			</tr>
			
		</thead>
		<tbody>
		
			<tr>				
				<td>1.</td>
				<td><%=product%></td>
				<td><%=slno%></td>
				<td><%=model%></td>
				<td><%=problem%></td>
				<td><%=status%></td>				
			</tr>
			
		
		</tbody>
		</table>
		<br/>
		<table width="100%" class="imagetable">
		<tr>
		<td align="left" valign="top">RECEIVER'S SIGNATURE<br/><br/>Date:</td><td align="right" valign="top">AUTHORISED SIGNATORY</td>
		</tr>
		<tr>
		<td align="left" COLSPAN=2>Customer Remarks:  <%=crmks%></td>
		</tr>
		</table>
		<table width="100%">
		<tr>
		<td align="left" style="font-family: verdana,arial,sans-serif;font-size:12px;">SERVICE CHARGE: 630</td><td align="right" style="font-family: verdana,arial,sans-serif;font-size:12px;">INSPECTION CHARGE: 400</td>
		</tr>
		</table>
		<table width="100%">
		<tr>
		<td align="center" style="font-family: verdana,arial,sans-serif;font-size:10px;">An Authorised Business Partner For Acer,BG,Bradma,Canon,Elnova,Panasonic,Posiflex,Tally,TVSE,Microsoft & Quick-Heal.
		<br/>An Authorised Service Provider For Acer,Bradma,Canon,Dell,Elnova,Lenovo,TVSE,Microsoft & Quick-Heal
		</br>NOTE - We are not responsible of your Products after 4 months(If you not pickup repaired/Un-repaired)</td>
		</tr>
		</table>
		</div>
  		<hr/>
  		<div style="height:100%;" align="center">
		<h5>JOB CARD (Duplicate)</h5>
		<table width="100%" style="border-top:1px solid #c6d5e1;border-bottom:1px solid #c6d5e1;border-right:1px solid #c6d5e1;border-left:1px solid #c6d5e1;font-family: verdana,arial,sans-serif;font-size:12px;">
		<tr>
		<td style="padding-left:20px;">COMPUTER SYSTEM & SERVICES<br/>Suit No 311/312, 3rd Floor<br>Commerce House,Link Tank<br/>Sarda Babu Lane,<br>Ranchi-834001</br></td>
		<td style="padding-left:40px;"align="right"><table><tr><td>Phone: </td><td>+91-651-2209923,2209924,2203022</td></tr><tr><td>Mobile No:</td><td></td></tr><tr><td>E-Mail: </td><td> Mukesh.Verma@softaid.net.in</td></tr><tr><td>Service Type: </td><td><%=calltype%></td></tr></table></td>
		</tr>
		</table>
		<br/>
		<table width="100%" style="border-top:1px solid #c6d5e1;border-bottom:1px solid #c6d5e1;border-right:1px solid #c6d5e1;border-left:1px solid #c6d5e1;font-family: verdana,arial,sans-serif;font-size:12px;">
		<tr>
		<td style="padding-left:20px;" valign="top"><table><tr><td>Customer Name:</td><td><%=name%></td></tr><tr><td>Customer Address:</td><td><%=add%></td></tr><tr><td>Phone No.:</td><td><%=pon%></td><td>Mobile No.:</td><td><%=mob%></td></tr><tr><td>Email-Id:</td><td><%=emil%></td></tr></table></td>		
		<td style="padding-right:110px;"align="right"><table><tr><td>Job No:</td><td><%=jobno%></td></tr><tr><td>Date:</td><td><%=td%></td></tr><tr><td>Brand:</td><td><%=brand.trim()%></td></tr><tr><td>Call Priority:</td><td><%=caprs%></td></tr></table></td>
		
		</tr>
		</table>
		<br/>
		<table cellpadding="0" cellspacing="0" border="0" id="table" class="imagetable" style="width:100%" >
		<thead>		
			<tr>
				
				<th><center>Sl.No.</center></th>
				<th><center>Products Name</center></th>
				<th><center>Product Sl.No.</center></th>
				<th><center>Model</center></th>
				<th><center>Problem Reported</center></th>
				<th><center>Status</center></th>
								
			</tr>
			
		</thead>
		<tbody>
		
		
			<tr>				
				<td>1.</td>
				<td><%=product%></td>
				<td><%=slno%></td>
				<td><%=model%></td>
				<td><%=problem%></td>
				<td><%=status%></td>
				
			</tr>
			
		
		</tbody>
		</table>
		<br/>
		<table width="100%" class="imagetable">
		<tr>
		<td align="left" valign="top">RECEIVER'S SIGNATURE<br/><br/>Date:</td><td align="right" valign="top">AUTHORISED SIGNATORY</td>
		</tr>
		<tr>
		<td align="left" COLSPAN=2>Customer Remarks:  <%=crmks%></td>
		
		</tr>
		</table>
		
		<table width="100%">
		<tr>
		<td align="left" style="font-family: verdana,arial,sans-serif;font-size:12px;">SERVICE CHARGE: 630</td><td align="right" style="font-family: verdana,arial,sans-serif;font-size:12px;">INSPECTION CHARGE: 400</td>
		</tr>
		</table>
		
		<table width="100%">
		<tr>
		<td align="center" style="font-family: verdana,arial,sans-serif;font-size:10px;">An Authorised Business Partner For Acer,BG,Bradma,Canon,Elnova,Panasonic,Posiflex,Tally,TVSE,Microsoft & Quick-Heal.
		<br/>An Authorised Service Provider For Acer,Bradma,Canon,Dell,Elnova,Lenovo,TVSE,Microsoft & Quick-Heal
		</br>NOTE - We are not responsible of your Products after 4 months(If you not pickup repaired/Un-repaired)</td>
		</tr>
		</table>
		</div>
			
  <br/>
</div>
<input type="button" onclick="printDiv('printableArea')" value="Print" /> 	         
</center></body>
</html>
