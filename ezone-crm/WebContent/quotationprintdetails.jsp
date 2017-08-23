<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
    
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.OutputStream" %>
<%@page import="com.connection.ezonecrm.ConnectionDAO" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DecimalFormat" %>

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script language="javascript">
            function printDiv(divName) 
            {
                 
            	 
            	
            	var printContents = document.getElementById(divName).innerHTML;
                  var originalContents = document.body.innerHTML;
                 
                  document.body.innerHTML = printContents;
 
                  window.print();
 

                  document.body.innerHTML = originalContents;
            }
 function popup()
 {
	// document.getElementById("popup").style.display="block";
	
	  if (typeof XMLHttpRequest != "undefined") 
		{
			xmlHttp6 = new XMLHttpRequest();
		} 
		else if (window.ActiveXObject) 
		{
			xmlHttp6 = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (xmlHttp6 == null) 
		{
			alert("Browser does not support XMLHTTP Request");
			return;
		}
		
		var s11 = document.getElementById('jobno').innerHTML;
		//alert(s11);
		var url = "finalbill1.jsp"; 
		url += "?count=" +s11;
		//alert(url);
		xmlHttp6.onreadystatechange = getstatus;
		xmlHttp6.open("GET", url, true);
		xmlHttp6.send(null);
 }
 
 function getstatus() 
 {
		if (xmlHttp6.readyState == 4 || xmlHttp6.readyState == "complete") 
		{
			var e=xmlHttp6.responseText;
			//alert(e);
			var x=e.split(",");
			
			//alert(x[1]);
			if(x[1] == 'Product Delivered'){
				//alert("if");
			
				$(".overlay, #popup").hide();
				document.getElementById("bill1").innerHTML= x[0];
				document.getElementById("bill2").innerHTML= x[0];
			}
			else
				{
				//alert("else")
				document.getElementById("popup").style.display="block";
				}
	
			
		}
	};
    

 function closeyes(x)
 {

	$(".overlay, #popup").hide();
    
    if (typeof XMLHttpRequest != "undefined") 
	{
		xmlHttp4 = new XMLHttpRequest();
	} 
	else if (window.ActiveXObject) 
	{
		xmlHttp4 = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp4 == null) 
	{
		alert("Browser does not support XMLHTTP Request");
		return;
	}
	
	var s11 = document.getElementById('jobno').innerHTML;
	//alert(s11);
	var url = "finalbill.jsp"; 
	url += "?count=" +x+","+s11;
	//alert(url);
	xmlHttp4.onreadystatechange = getID;
	xmlHttp4.open("GET", url, true);
	xmlHttp4.send(null);
 }
 
 function getID() 
 {
		if (xmlHttp4.readyState == 4 || xmlHttp4.readyState == "complete") 
		{
			var e=xmlHttp4.responseText;
			//alert(e.trim());
			document.getElementById("bill1").innerHTML= e;
			document.getElementById("bill2").innerHTML= e;
			
		}
	};
 
</script>

<style type="text/css">
hr.style16 { 
	border-top: 1px dashed #8c8b8b;
	border-bottom: none;
	border-left: none;
	border-right: none;
	width: 25%;
	display: inline-block;
} 
hr.style16:before, hr.style16:after { 
	content: '\002702';
	display: inline-block;
	position: relative;
	top: -14px;
	padding: 0 5px;
	background: #ffffff; 
	color: #8c8b8b; 
	font-size: 18px;
}
hr.style16:before { 
  left: -20%;
}
hr.style16:after { 
  left: 20%;
}
@page {
    size: auto;   /* auto is the initial value */
    margin: 0;  /* this affects the margin in the printer settings */
}
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
<style>
.overlay {position: absolute; top: 0; bottom: 0; left: 0; right: 0; background: rgba(0,0,0,0.5); z-index: 1;}
#popup
{
	width:200px;
	left:0px;
	right:0px;
	margin:110px auto 0;
	font-weight:bold;
	background-color:#ebedef;
	border-radius:3px;
	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	box-shadow:0px 0px 10px 0px #424242;
	padding:15px 10px; 
	box-sizing:border-box;
	font-family:helvetica;
	position:absolute;
	z-index: 9;
}
.bu
{
	background-color: #4CAF50;
    border: none;
    color: white;
    padding: 1px 1px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px 2px;
    cursor: pointer; 
}
.bu:hover
{
	background-color: darkred;
	color:white
}
</style>

</head>

<body onload="popup();"><center>

<div class="overlay"></div>
<div id="popup">
	<label>Product Delivered?</label><br></br>
	<input type="button" value="Yes" onclick="closeyes(this.value);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="No" onclick="closeyes(this.value);"/>
</div>

<div style="z-index:1">
  
<%
			java.util.Date dt = new java.util.Date();
			//final String td = (dt.getYear() + 1900) + "-" + (dt.getMonth() + 1)+ "-" + dt.getDate();
			final String td = dt.getDate() + "/" + (dt.getMonth() + 1) + "/" + (dt.getYear() + 1900);
			String user = (String) request.getParameter("scode");
			System.out.println("user :"+user);
			String adopter = "", battery = "", hdd = "", opd = "", ram = "", screen = "", keyboard = "",
					other_accessories = "", physical_damaged = "", wifi_value = "";
			String bag_value = "", inspected_by = "";
			String calltype = "", name = "", add = "", pon = "", mob = "", jobno = "", brand = "", caprs = "",
					emil = "", crmks = "",modelno="";
            int billno=0;
            String bill="";
            String sql="";
			// added by Nilesh, 3rd April
			String job_id = "", call_date = "", product_name = "", model_no = "", product_serial_no = "", problem = "",
					cust_ref_no = "", cus_remarks = "", purchase_date = "";
            
			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn);
			 sql = "select * from jobwork_entry where companycall_id='" + user + "'";
			//System.out.println("company call id: "+user);
			//System.out.println(sql);
			try {
				
				ResultSet rs = stm.executeQuery(sql);
				
				while (rs.next()) {
					calltype = rs.getString(3);
					emil = rs.getString(15);
					jobno = rs.getString(6);
					modelno=rs.getString(16);
					job_id = rs.getString(6); // ok
					name = rs.getString(7); // ok
					cust_ref_no = rs.getString(55);
					add = rs.getString(8); //ok 
					pon = rs.getString(13); // ok (5h April)
					mob = rs.getString(14); // ok
				
					call_date = rs.getString(4); // ok
					

					brand = rs.getString(2);
					caprs = rs.getString(23);

					product_name = rs.getString(17); // ok
					model_no = rs.getString(16); // ok
					product_serial_no = rs.getString(18); // ok
					problem = rs.getString(20); // ok

				
					adopter = rs.getString(42); // ok
					battery = rs.getString(43); // ok
					hdd = rs.getString(44); // ok
					opd = rs.getString(45); // ok
					ram = rs.getString(46); // ok
					screen = rs.getString(47); // ok
					keyboard = rs.getString(48); // ok
					other_accessories = rs.getString(49); // ok
					physical_damaged = rs.getString(50); // ok

					 // ok, 5th April

					cus_remarks = rs.getString(25); // ok, 5th April

					purchase_date = rs.getString(19);

					wifi_value = rs.getString(51);
					billno=rs.getInt(57);
					
					
					if (wifi_value.equals("0")) {
						wifi_value = "No"; // ok
					} else {
						wifi_value = "Yes";
					}

					bag_value = rs.getString(52);
					if (bag_value.equals("0")) {
						bag_value = "No";
					} else {
						bag_value = "Yes"; // ok
					}

					
					brand = rs.getString(2);
					caprs = rs.getString(23);

					crmks = rs.getString(25);

					inspected_by = rs.getString(53); //ok , 5th April

				}
				 
				// System.out.println("bill no: "+bill);
				
				
				//sql="update jobwork_entry set "
				
				
				
			} catch (Exception e) {

			}
			
			
			
			ConnectionDAO.closeConnection(conn);
		%>

<input type="button" onclick="printDiv('printableArea')" value="print" />
<div id="printableArea">
<table width="100%">
		  <tr>
		    <td width="18%"><img src="Image/E_zone_logo.png" height="80px" width="80px" style="margin-top:0px;padding-left: 10px;" /></td>
		    <td width="65%" style="text-align:center"><p style="font-family:Arial, Helvetica, sans-serif; font-size:22px;margin-top:-6px;">E ZONE CARE</p>
		   
			<p style="margin-top:-12px;">T-44,3rd Floor,Roshpa Tower,Main Road,Ranchi-834&nbsp;001(Jharkhand)<br />Phone:0651-6900067 Email:services@ezonecare.in&nbsp;Web.: ezonecare.in</p>
			</td>
		    <td style="padding-top: 0px;" width="17%">
		    <p style="margin-top:12px;font-size:12px;">The Complete Laptop<br />Reparing Solution</p>
		    <p style="margin-top:-12px;font-size:12px;">Repair Your Laptop<br />with Warranty</p>
		    </td>
		  </tr>
 
</table>
<p style="margin-top:-40px;" align="center"><h3 align="center">Bill</h3></p>
<table  height="30%" width="80%"
				style="border-top: 1px solid #c6d5e1; border-bottom: 1px solid #c6d5e1; border-right: 1px solid #c6d5e1; border-left: 1px solid #c6d5e1; font-family: verdana, arial, sans-serif; font-size: 12px;margin-left:76px;">
				
							<tr>
								<td>Customer&nbsp;Name:</td>
								<td><%=name%></td>
								<td>Job&nbsp;No:</td>
								<td colspan="5" id="jobno"><b><%=jobno%></b></td>
								
							</tr>
							<tr>
								<td>Customer&nbsp;Address:</td>
								<td><%=add%></td>
								<td>Job&nbsp;Date:</td>
								<td  colspan="5"><%=td%></td>
								
							</tr>
							<tr>
								<td>Mobile&nbsp;No.:</td>
								<td><%=mob%></td>
								
								<td>Customer&nbsp;Ref.No:</td>
								<td  colspan="5"><%=cust_ref_no%></td>
							</tr>
							<tr>
								<td>Email-Id:</td>
								<td><%=emil%></td>
								<td>Bill-No:</td>
								<td id="bill1"></td>
								<td>Model-No:</td>
								<td><%=modelno%></td>
								
							</tr>
						</table>
						<br />


<% 

		int i=1;
		
		String particulars="",qty="",rate="",amount="";
		double totalAmt=0;
		String deci="";
		String a="";
		DecimalFormat decimalFormat = new DecimalFormat("0.00");
		 conn = ConnectionDAO.getConnectionObject();
		stm = ConnectionDAO.createStatement(conn);
		
		
	%>


<table cellpadding="0" cellspacing="0" border="0" id="table" class="imagetable" style="width:80%" align="center" >
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
			
			String systemCallid =(String)request.getParameter("scode");
			 sql="select particulars,qty,rate,amount from quotation_details where systemcall_id='"+systemCallid+"' and approved='APPROVED' ";
			
			//System.out.println(sql);
			
			ResultSet rs= stm.executeQuery(sql);
			
			try
			{
			
			 while(rs.next())	
			{
				particulars= rs.getString(1);
				qty= rs.getString(2);
				rate= rs.getString(3);
				amount= rs.getString(4);
	 		   
			%>
				<tr>	
							
					<td><font size="3"><%=i %></font></td>
					
					
					<td><font size="3"><%=particulars %></font></td>
					
					<td align="right"><font size="3"><%=qty %></font></td>
					
					<td align="right"><font size="3"><%=rate %></font></td>
					
					<td align="right"><font size="3"><%=amount %></font></td>
					
					<%
						i++;
					%>
		<%
			 } 
			 while(i>0 && i<4)
				{
			
		%>
		
		<tr>	
						
						<td style="height:13px"></td>
						<td style="height:13px"></td>
						<td style="height:13px"></td>
						<td style="height:13px"></td>
						<td style="height:13px"></td>
		</tr>
						
			<%
				i++;	
			
				}
			%>	
			
		
					
					<%
			}
						catch(SQLException e)
						{
						}	
					%>
					
			</tr>	
			
			
			<%
				sql="select sum(amount) from quotation_details where systemcall_id='"+systemCallid+"' and approved='APPROVED';";
				rs = stm.executeQuery(sql);
				try
				{
					 while(rs.next())	
						{
						 	totalAmt = rs.getDouble(1);
						}
					 
				}
				catch(SQLException e)
				{
				}
			%>
						
		
			<tr>
				
				<td style="height:13px"></td>		
				<td style="height:13px"></td>
				<td style="height:13px"></td>
				<td style="height:13px"></td>
				<td style="height:13px"></td>
				
						
			</tr>
			
			<tr>
				<td align="left">				
				</td>
				<td align="center" style="padding-left:190px">				
				</td>
				<td align="right" >
						
				</td>
				<td><b>Total</b></td>
				<td align="right"><font size="3"><b>Rs. <%=decimalFormat.format(totalAmt) %></b></font></td>
				
				</tr>
								
		</tbody>

		</table>
		
		<div align="right" style="margin-top:10px;margin-right:100px;">
			<b>For E ZONE CARE</b>
		</div>
		
		<div align="right" style="margin-top:10px;margin-right:100px;">
			<b>Authorized Signatory</b>
		</div>
		
		<br/>
		<hr class="style16" /><hr class="style16" /><hr class="style16" /><hr class="style16" />
		
		<table width="100%">
		  <tr>
		    <td width="18%"><img src="Image/E_zone_logo.png" height="80px" width="80px" style="margin-top:-10px;padding-left: 10px;" /></td>
		    <td width="65%" style="text-align:center"><p style="font-family:Arial, Helvetica, sans-serif; font-size:22px;">E ZONE CARE</p>
		   
			<p style="margin-top:-12px;">T-44,3rd Floor,Roshpa Tower,Main Road,Ranchi-834&nbsp;001(Jharkhand)<br />Phone:0651-6900067 Email:services@ezonecare.in&nbsp;Web.: ezonecare.in</p>
			</td>
		    <td style="padding-top: 0px;" width="17%">
		    <p style="margin-top:-12px;font-size:12px;">The Complete Laptop<br />Reparing Solution</p>
		    <p style="margin-top:-12px;font-size:12px;">Repair Your Laptop<br />with Warranty</p>
		    </td>
		  </tr>
</table> 

<p style="margin-top:-40px;" align="center"><h3 align="center">Bill</h3></p>

<table  height="30%" width="80%"
				style="border-top: 1px solid #c6d5e1; border-bottom: 1px solid #c6d5e1; border-right: 1px solid #c6d5e1; border-left: 1px solid #c6d5e1; font-family: verdana, arial, sans-serif; font-size: 12px;margin-left:76px;">
				
							<tr>
								<td>Customer&nbsp;Name:</td>
								<td><%=name%></td>
								<td>Job&nbsp;No:</td>
								<td colspan="5"><b><%=jobno%></b></td>
								
							</tr>
							<tr>
								<td>Customer&nbsp;Address:</td>
								<td><%=add%></td>
								<td>Job&nbsp;Date:</td>
								<td  colspan="5"><%=td%></td>
								
							</tr>
							<tr>
								<td>Mobile&nbsp;No.:</td>
								<td><%=mob%></td>
								
								<td>Customer&nbsp;Ref.No:</td>
								<td  colspan="5"><%=cust_ref_no%></td>
							</tr>
							<tr>
								<td>Email-Id:</td>
								<td><%=emil%></td>
								<td>Bill-No:</td>
								<td id="bill2"><%=billno%></td>
								<td>Model-No:</td>
								<td><%=modelno%></td>
								
							</tr>
						</table>
						<br />
		
<table table-border="0" style="width:100%" >
<tr>
</tr>
</table>	

<table cellpadding="0" cellspacing="0" border="0" id="table" class="imagetable" style="width:80%" align="center" >
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
			
			systemCallid =(String)request.getParameter("scode");
			sql="select particulars,qty,rate,amount from quotation_details where systemcall_id='"+systemCallid+"' and approved='APPROVED' ";
			i=1;
			//System.out.println(sql);
			
			rs= stm.executeQuery(sql);
			
			try
			{
			
			 while(rs.next())	
			{
				particulars= rs.getString(1);
				qty= rs.getString(2);
				rate= rs.getString(3);
				amount= rs.getString(4); 
			  
			%>
		
		
				<tr>	
							
					<td ><font size="3"><%=i %></font></td>
					
					
					<td ><font size="3"><%=particulars %></font></td>
					
					<td align="right"><font size="3"><%=qty %></font></td>
					
					<td align="right"><font size="3"><%=rate %></font></td>
					
					<td align="right"><font size="3"><%=amount %></font></td>
					
				
					<%
						i++;
					%>
					
		<%
			 } 
			 while(i>0 && i<4)
				{
			
		%>
		
		<tr>	
						
						<td style="height:13px"></td>
						<td style="height:13px"></td>
						<td style="height:13px"></td>
						<td style="height:13px"></td>
						<td style="height:13px"></td>
		</tr>
						
			<%
				i++;	
			
				}
			%>	
			
		
					
					<%
			}
						catch(SQLException e)
						{
						}	
					%>
					
			</tr>	
			
			
			<%
				sql="select sum(amount) from quotation_details where systemcall_id='"+systemCallid+"' and approved='APPROVED';";
				rs = stm.executeQuery(sql);
				try
				{
					 while(rs.next())	
						{
						 	totalAmt = rs.getDouble(1);
						}
					 String aa=decimalFormat.format(totalAmt);
					 //decimalFormat.format(totalAmt);
				}
				catch(SQLException e)
				{
					System.out.println("error on "+e);
				}
			%>
						
		
			<tr>
				
				<td style="height:13px"></td>		
				<td style="height:13px"></td>
				<td style="height:13px"></td>
				<td style="height:13px"></td>
				<td style="height:13px"></td>
				
						
			</tr>
			
			<tr>
				<td align="left">				
				</td>
				<td align="center" style="padding-left:190px">				
				</td>
				<td align="right" >
						
				</td>
				<td><b>Total</b></td>
				<td align="right"><font size="3"><b>Rs. <%=decimalFormat.format(totalAmt) %></b></font></td>
				
				</tr>
								
		</tbody>

		</table>
		
		<div align="right" style="margin-top:10px;margin-right:100px;">
			<b>For E ZONE CARE</b>
		</div>
		
		<div align="right" style="margin-top:10px;margin-right:100px;">
			<b>Authorized Signatory</b>
		</div>
		
			
		</tbody>
		</table>
		
</div>		
<br />
<input type="button" onclick="printDiv('printableArea')" value="print" />
</center>
</div>
</body>
</html>