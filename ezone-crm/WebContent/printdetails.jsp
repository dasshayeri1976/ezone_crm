<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.OutputStream"%>
<%@page import="com.connection.ezonecrm.ConnectionDAO"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<script language="javascript" type="text/javascript"
	src="js/tablefilter.js"></script>
<link rel="stylesheet" href="css/style2.css" />
<link rel="stylesheet" href="css/draftbutton.css" />
<link rel="stylesheet" href="css/printbutton.css" />
<link rel="stylesheet" href="css/breadcumbs.css"></link>

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
	font-family: verdana, arial, sans-serif;
	font-size: 11px;
	color: #333333;
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
	font-family: verdana, arial, sans-serif;
	font-size: 11px;
	color: #000;
	border-width: 1px;
	border-top: 1px solid #c6d5e1;
	border-bottom: 1px solid #c6d5e1;
	border-right: 1px solid #c6d5e1;
	border-left: 1px solid #c6d5e1;
	border-collapse: collapse;
}

table.imagetable th {
	background: url(images/header-bg.gif);
	border-width: 1px;
	padding: 4px 6px 6px;
	color: #fff;
	border-top: 1px solid #c6d5e1;
	border-bottom: 1px solid #c6d5e1;
	border-right: 1px solid #c6d5e1;
	border-left: 1px solid #c6d5e1;
	border-style: solid;
}

table.imagetable td {
	text-decoration: none;
	border-width: 1px;
	padding: 4px 6px 6px;
	border-top: 1px solid #c6d5e1;
	border-bottom: 1px solid #c6d5e1;
	border-right: 1px solid #c6d5e1;
	border-left: 1px solid #c6d5e1;
	border-style: solid;
	background-color: #ffffff;
}

ul.list1 {
	margin-bottom: 20px;
	padding-left: 73px;
	text-align: left;
}

ul.list1 li {
	list-style-type: unset;
	position: relative;
	padding-left: 20px;
}

ul.list1 li:after {
	content: '';
	height: .4em;
	width: .4em;
	background: #000000;
	display: block;
	position: absolute;
	transform: rotate(45deg);
	top: 0.35em;
	left: 0;
}
</style>
<sj:head />

<style>
#ui-datepicker-div {
	background: #dce6ee;
}

#ui-datepicker-div .ui-state-highlight {
	color: #dce6ee;
}

#ui-datepicker-div.ui-datepicker-control {
	background: blue;
}

.ui-dialog-titlebar {
	background: #FFCC66 repeat-x;
	color: #fff;
}
</style>

</head>
<body>
	<center>
		<%
			java.util.Date dt = new java.util.Date();
			//final String td = (dt.getYear() + 1900) + "-" + (dt.getMonth() + 1)+ "-" + dt.getDate();
			final String td = dt.getDate() + "/" + (dt.getMonth() + 1) + "/" + (dt.getYear() + 1900);
			String user = (String) request.getParameter("value");
			//System.out.println("user :"+user);
			String adopter = "", battery = "", hdd = "", opd = "", ram = "", screen = "", keyboard = "",
					other_accessories = "", physical_damaged = "", wifi_value = "";
			String bag_value = "", inspected_by = "";
			String calltype = "", name = "", add = "", pon = "", mob = "", jobno = "", brand = "", caprs = "",
					emil = "", crmks = "";

			// added by Nilesh, 3rd April
			String job_id = "", call_date = "", product_name = "", model_no = "", product_serial_no = "", problem = "",
					cust_ref_no = "", cus_remarks = "", purchase_date = "";

			Connection conn = ConnectionDAO.getConnectionObject();
			Statement stm = ConnectionDAO.createStatement(conn);
			String sql = "select * from jobwork_entry where companycall_id='" + user + "'";

			try {

				ResultSet rs = stm.executeQuery(sql);

				while (rs.next()) {
					calltype = rs.getString(3);

					job_id = rs.getString(6); // ok
					name = rs.getString(7); // ok

					add = rs.getString(8); //ok 
					pon = rs.getString(13); // ok (5h April)
					mob = rs.getString(14); // ok
					emil = rs.getString(15); // ok
					call_date = rs.getString(4); // ok

					brand = rs.getString(2);
					caprs = rs.getString(23);

					product_name = rs.getString(17); // ok
					model_no = rs.getString(16); // ok
					product_serial_no = rs.getString(18); // ok
					problem = rs.getString(20); // ok

					// added by Nilesh, 4th April
					adopter = rs.getString(42); // ok
					battery = rs.getString(43); // ok
					hdd = rs.getString(44); // ok
					opd = rs.getString(45); // ok
					ram = rs.getString(46); // ok
					screen = rs.getString(47); // ok
					keyboard = rs.getString(48); // ok
					other_accessories = rs.getString(49); // ok
					physical_damaged = rs.getString(50); // ok

					cust_ref_no = rs.getString(55); // ok, 5th April

					cus_remarks = rs.getString(25); // ok, 5th April

					purchase_date = rs.getString(19);

					wifi_value = rs.getString(51);
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

					jobno = rs.getString(6);
					brand = rs.getString(2);
					caprs = rs.getString(23);

					crmks = rs.getString(25);

					inspected_by = rs.getString(53); //ok , 5th April

				}
			} catch (Exception e) {

			}
			ConnectionDAO.closeConnection(conn);
		%>
		<input type="button" onclick="printDiv('printableArea')"
			value=" Print" />
		<div id="printableArea">

			<table height="20%" width="100%">
			<tr></tr>
				<tr>
					<td width="18%"><img src="Image/E_zone_logo.png" height="40px"
						width="40px" style="margin-top: -45px; padding-left: 10px;" /></td>
				<td width="60%" style="text-align: center"><p
							style="font-family: Arial, Helvetica, sans-serif; font-size: 20px; margin-top: -10px;margin-bottom: 35px;">E
							ZONE CARE</p>
						<p style="margin-top: -30px;font-size: 12px;">T-44,3rd Floor,Roshpa Tower,Main
							Road,Ranchi-834&nbsp;001(Jharkhand)
						<br />
						Phone:0651-6900067
							Email:services@ezonecare.in&nbsp;Web.: ezonecare.in</p>
					<td style="padding-top: 0px;" width="50%""text-align:right">
						<p style="margin-top: 24px;font-size: 12px;" font-family:verdana,arial,sans-serif;font-size:5px;>
							The Complete Laptop Reparing Solution<br />Repair Your Laptop with Warranty
						</p>
						
					</td>
				</tr>
			</table>

			<table  height="30%" width="100%"
				style="border-top: 1px solid #c6d5e1; border-bottom: 1px solid #c6d5e1; border-right: 1px solid #c6d5e1; border-left: 1px solid #c6d5e1; font-family: verdana, arial, sans-serif; font-size: 12px;">
				
							<tr>
								<td>Customer&nbsp;Name:</td>
								<td><%=name%></td>
								<td>Job&nbsp;No:</td>
								<td colspan="3"><b><%=jobno%></b></td>
								
							</tr>
							<tr>
								<td>Customer&nbsp;Address:</td>
								<td><%=add%></td>
								<td align="left">Job&nbsp;Date:</td>
								<td><%=td%></td>
								<td></td>
							</tr>
							<tr>
								<td>Mobile&nbsp;No.:</td>
								<td><%=mob%></td>
								
								<td>Customer&nbsp;Ref.No:</td>
								<td  colspan="3"><%=cust_ref_no%></td>
							</tr>
							<tr>
								<td>Email-Id:</td>
								<td colspan="5"><%=emil%></td>
								
							</tr>
						</table>

					
			
		

			<table  height="30%" width="100%"
				style="margin-top:-10px; border-top: 1px solid #c6d5e1; border-bottom: 1px solid #c6d5e1; border-right: 1px solid #c6d5e1; border-left: 1px solid #c6d5e1; font-family: verdana, arial, sans-serif; font-size: 12px;">
				<div style="height: 100%;" align="center">
					<h5 style="margin-top: 4px;"><%=product_name%>
						DETAILS
					</h5>
					
				
								<tr>
									<td>Model&nbsp;Name:</td>
									<td><%=model_no%></td>
									<td>Product&nbsp;Sl.No. :</td>
									<td><%=product_serial_no%></td>
									<td>ODD :</td>
									<td colspan="3"><%=opd%></td>
								</tr>
								<tr>
									<td>Adaptor :</td>
									<td><%=adopter%></td>
									<td>Battery :</td>
									<td><%=battery%></td>
									<td>Screen :</td>
									<td colspan="3"><%=screen%></td>
								</tr>
								<tr>
									<td>HDD :</td>
									<td><%=hdd%></td>
									<td>ODD :</td>
									<td><%=opd%></td>
									<td>Wi-fi :</td>
									<td><%=wifi_value%></td>
									<td>Bag&nbsp;:</td>
									<td><%=bag_value%></td>
								</tr>
								<tr>
									<td>R.A.M :</td>
									<td><%=ram%></td>
									<td>Keyboard :</td>
									<td><%=keyboard%></td>
									<td>Physical&nbsp;Damaged&nbsp;:</td>
									<td colspan="3"><%=physical_damaged%></td>
								</tr>
								<tr>
									<td>Other&nbsp;Accessories&nbsp;:</td>
									<td><%=other_accessories%></td>
									<td>Problem :</td>
									<td colspan="5"><%=problem%></td>
								</tr>
								<tr>
									<td>Inspected&nbsp;By&nbsp;:</td>
									<td><%=inspected_by%></td>
									<td>Customer&nbsp;Remarks&nbsp;:</td>
									<td colspan="5"><%=cus_remarks%></td>
								</tr>
							</table>

									

			<div
				style="height: 100%; width: auto; margin: 15px 0 10px 0; border-radius: 10px; -moz-border-radius: 10px; -webkit-border-radius: 10px; border-top: 1px solid #000; border-bottom: 6px solid #000; border-left: 3px solid #000; border-right: 3px solid #000; text-align: center;"
				align="left">
				<h4 align="center"
					style="margin-top: -13px; background: #ffffff; display: inline-block; padding: 0 5px;">Terms
					& Conditions</h4>

				<table width="20%"
					style="border-top: 1px solid #c6d5e1; margin-top: -10px; border-bottom: -10px solid #c6d5e1; border-right: 1px solid #c6d5e1; border-left: 1px solid #c6d5e1;">

					<ul class="list1" style="margin-top: -20px;" >
						<li
							style="font-family: verdana, arial, sans-serif; font-size: 10px;">Please
							Check your Laptop items throughly before handover to E-Zone Care.</li>
						<li
							style="font-family: verdana, arial, sans-serif; font-size: 10px;">E-Zone
							Care is not liable for your Data losses.</li>
						<li
							style="font-family: verdana, arial, sans-serif; font-size: 10px;">E-Zone
							Care is not responsible for your PCB being dead during repairing
							process.</li>
						<li
							style="font-family: verdana, arial, sans-serif; font-size: 10px;">Warranty
							of PCB/Laptop is covered from the date of repair.</li>
						<li
							style="font-family: verdana, arial, sans-serif; font-size: 10px;">E-Zone
							Care is not liable for your laptop/PCB, Loss/Damage if not taken
							back from the date of receiving.</li>
						<li
							style="font-family: verdana, arial, sans-serif; font-size: 10px;">It
							is mandatory to return Job Sheet at the time of delivery.</li>
					</ul>

				</table>

				<table height="5%" width="100%" class="imagetable">
				<tr>
					<td  ><table>
				<%-- 			<tr>
								<td>Date&nbsp;Of&nbsp;Delivery :</td>
								<td><%=purchase_date%></td>
							</tr> --%>
							<tr>
								<td><b>Customer Signature</b></td>
								
							</tr>
						</table></td>

					<td ><table>
							<tr>
								<td>Received by__________________________</td>
								<td></td>
							</tr>
						</table></td>

					<td style="font-size: 12px;" align="right"><table height="10px">
							<td><h5>
									<b>For&nbsp;E-Zone&nbsp;Care
								</h5>
								</b></td>
						</table></td>
				</tr>
			</table>

			</div>

			<!--   Second copy -->


			<table height="20%" width="100%">
				<tr>
					<td width="18%"><img src="Image/E_zone_logo.png" height="40px"
						width="40px" style="margin-top: -5px; padding-left: 10px;" /></td>
					<td width="60%" style="text-align: center"><p
							style="font-family: Arial, Helvetica, sans-serif; font-size: 20px; margin-top: -15px;margin-bottom: 35px;">E
							ZONE CARE</p>
							
						<p style="margin-top: -30px;font-size: 12px;">T-44,3rd Floor,Roshpa Tower,Main
							Road,Ranchi-834&nbsp;001(Jharkhand)</p>
						<br />
						<p style="margin-top: -30px;font-size: 12px;">Phone:0651-6900067
							Email:services@ezonecare.in&nbsp;Web.: ezonecare.in</p>
					<td style="padding-top: 0px;" width="50%""text-align:right">
						<p style="margin-top: 24px;font-size: 12px;" font-family:verdana,arial,sans-serif;font-size:5px;>
							The Complete Laptop Reparing Solution<br />
						</p>
						<p style="margin-top: -15px;font-size: 12px;" font-family:verdana,arial,sans-serif;font-size:5px;>Repair
							Your Laptop with Warranty</p>
					</td>
				</tr>
			</table>

			<table  height="30%" width="100%"
				style="border-top: 1px solid #c6d5e1; border-bottom: 1px solid #c6d5e1; border-right: 1px solid #c6d5e1; border-left: 1px solid #c6d5e1; font-family: verdana, arial, sans-serif; font-size: 12px;">
				
							<tr>
								<td>Customer&nbsp;Name:</td>
								<td><%=name%></td>
								<td>Job&nbsp;No:</td>
								<td colspan="3"><b><%=jobno%></b></td>
								
							</tr>
							<tr>
								<td>Customer&nbsp;Address:</td>
								<td><%=add%></td>
								<td align="left">Job&nbsp;Date:</td>
								<td><%=td%></td>
								<td></td>
							</tr>
							<tr>
								<td>Mobile&nbsp;No.:</td>
								<td><%=mob%></td>
								
								<td>Customer&nbsp;Ref.No:</td>
								<td  colspan="3"><%=cust_ref_no%></td>
							</tr>
							<tr>
								<td>Email-Id:</td>
								<td colspan="5"><%=emil%></td>
								
							</tr>
						</table>

				<table  height="30%" width="100%"
				style="margin-top:10px; border-top: 1px solid #c6d5e1; border-bottom: 1px solid #c6d5e1; border-right: 1px solid #c6d5e1; border-left: 1px solid #c6d5e1; font-family: verdana, arial, sans-serif; font-size: 12px;">
				<div style="height: 100%;" align="center">
					<h5 style="margin-top: 4px;"><%=product_name%>
						DETAILS
					</h5>
					
				
								<tr>
									<td>Model&nbsp;Name:</td>
									<td><%=model_no%></td>
									<td>Product&nbsp;Sl.No. :</td>
									<td><%=product_serial_no%></td>
									<td>ODD :</td>
									<td colspan="3"><%=opd%></td>
								</tr>
								<tr>
									<td>Adaptor :</td>
									<td><%=adopter%></td>
									<td>Battery :</td>
									<td><%=battery%></td>
									<td>Screen :</td>
									<td colspan="3"><%=screen%></td>
								</tr>
								<tr>
									<td>HDD :</td>
									<td><%=hdd%></td>
									<td>ODD :</td>
									<td><%=opd%></td>
									<td>Wi-fi :</td>
									<td><%=wifi_value%></td>
									<td>Bag&nbsp;:</td>
									<td><%=bag_value%></td>
								</tr>
								<tr>
									<td>R.A.M :</td>
									<td><%=ram%></td>
									<td>Keyboard :</td>
									<td><%=keyboard%></td>
									<td>Physical&nbsp;Damaged&nbsp;:</td>
									<td colspan="3"><%=physical_damaged%></td>
								</tr>
								<tr>
									<td>Other&nbsp;Accessories&nbsp;:</td>
									<td><%=other_accessories%></td>
									<td>Problem :</td>
									<td colspan="5"><%=problem%></td>
								</tr>
								<tr>
									<td>Inspected&nbsp;By&nbsp;:</td>
									<td><%=inspected_by%></td>
									<td>Customer&nbsp;Remarks&nbsp;:</td>
									<td colspan="5"><%=cus_remarks%></td>
								</tr>
							</table>
		<div
			style=" height:100%; width: auto; margin: 15px 0 10px 0; border-radius: 10px; -moz-border-radius: 10px; -webkit-border-radius: 10px; border-top: 1px solid #000; border-bottom: 6px solid #000; border-left: 3px solid #000; border-right: 3px solid #000; text-align: center;"
			align="left">
			<h4 align="center"
				style="margin-top: -13px; background: #ffffff; display: inline-block; padding: 0 5px;">Terms
				& Conditions</h4>

			<table width="20%"
				style="border-top: 1px solid #c6d5e1; margin-top: -10px; border-bottom: -10px solid #c6d5e1; border-right: 1px solid #c6d5e1; border-left: 1px solid #c6d5e1;">

				<ul class="list1" style="margin-top: -20px;">
					<li
						style="font-family: verdana, arial, sans-serif; font-size: 10px;">Please
						Check your Laptop items throughly before handover to E-Zone Care.</li>
					<li
						style="font-family: verdana, arial, sans-serif; font-size: 10px;">E-Zone
						Care is not liable for your Data losses.</li>
					<li
						style="font-family: verdana, arial, sans-serif; font-size: 10px;">E-Zone
						Care is not responsible for your PCB being dead during repairing
						process.</li>
					<li
						style="font-family: verdana, arial, sans-serif; font-size: 10px;">Warranty
						of PCB/Laptop is covered from the date of repair.</li>
					<li
						style="font-family: verdana, arial, sans-serif; font-size: 10px;">E-Zone
						Care is not liable for your laptop/PCB, Loss/Damage if not taken
						back from the date of receiving.</li>
					<li
						style="font-family: verdana, arial, sans-serif; font-size: 10px;">It
						is mandatory to return Job Sheet at the time of delivery.</li>
				</ul>

			</table>

			<table height="5%" width="100%" class="imagetable">
				<tr>
					<td style="padding-left: 0px;"><table>
							<tr>
								<td><b>Customer Signature</b></td>
								
							</tr>
						</table></td>

					<td style="padding-left: 0px;"><table>
							<tr>
								<td>Received by__________________________</td>
								<td></td>
							</tr>
						</table></td>

					<td style="padding-right: 0px;" align="right"><table height="10px">
							<td><h5>
									<b>For&nbsp;E-Zone&nbsp;Care
								</h5>
								</b></td>
						</table></td>
				</tr>
			</table>

		</div>
		</div>

	</center>
</body>
</html>