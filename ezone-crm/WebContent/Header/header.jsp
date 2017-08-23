<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='sec' uri='http://www.springframework.org/security/tags' %> 
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@page import="com.connection.ezonecrm.ConnectionDAO"%>
<%@ page import="java.sql.*"%>
<%@ page session="true"%>
<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>AIM Technosoft</title>

<link rel="stylesheet" href="./css/style.css" type="text/css" />
<script type="text/javascript" src="./js/packed.js"></script>
<script type="text/javascript" src="./js/tinydropdown.js"></script>



<sj:head />

<%
	String a1 = (String) session.getAttribute("user");
	
	try
	{
		if(a1.compareTo("null")==0)
		response.sendRedirect("login.jsp");
	}
	catch(Exception e)
	{
		response.sendRedirect("login.jsp");
	}
	
	String a3 = "", a4="",a5="",a6="";
	String sql = "select * from logins where USERNAME ='" + a1 + "'";

	Connection conn = ConnectionDAO.getConnectionObject();
	Statement stm = ConnectionDAO.createStatement(conn);
	try {

		ResultSet rs = stm.executeQuery(sql);
		while (rs.next()) {

			a3 = rs.getString(6);
			
		}
		
	sql = "select * from user where USERNAME ='" + a1 + "'";
	rs = stm.executeQuery(sql);
		while (rs.next()) {

			a6 = rs.getString(2);
			
		}
		
		if(a6.compareTo("ROLE_ADMIN")==0)
		sql="select count(*) from parts_required where status='"+"P"+"'";	
		else
		sql="select count(*) from parts_required where status='"+"P"+"' and user='"+a1+"'";	
			    
		rs = stm.executeQuery(sql);
				while (rs.next()) {

					a4 = rs.getString(1);
					
				}
			
			   if(a4.compareTo("0")==0)
				   a4="";
			   
		if(a6.compareTo("ROLE_ADMIN")==0)
		sql="select count(*) from parts_required where engstatus='"+"P"+"'";
		else
			sql="select count(*) from parts_required where engstatus='"+"P"+"' and senderid='"+a1+"'";
			    
		rs = stm.executeQuery(sql);

				while (rs.next()) {

						a5 = rs.getString(1);
							
				}
					
				if(a5.compareTo("0")==0)
				a5="";
	
	
	} catch (SQLException e) {
		e.printStackTrace();
	}

	ConnectionDAO.closeConnection(conn);
	System.out.printf("UserName: " + a3);
%>
</head>
<body >
	<table width="100%">
		<tr>
			<td>

				<div align="center" >
					<p class="style3">
					
					AIM Technosoft </p>

				</div>
			</td>
		</tr>
	</table>
	<table width="100%" >
		<tr>
			<td valign="bottom">
				<div align="right" class="style6">
					Welcome&nbsp; <span style="color: red"><%=a3 %></span><a href="logout" style="text-decoration: none"> <span style="color: green;"><strong>Logout</strong></span></a>
				</div>
			</td>
		</tr>
	</table>
	<div class="nav1">
		<ul id="menu" class="menu">

				<sec:authorize ifAnyGranted='ROLE_ADMIN'>

				<li><a href="#">Master Management</a>				
					<ul>
						<li><a href="companylist">Company Master</a></li>
						<li><a href="brandlist">Brand Master</a></li>
						<li><a href="statelist">State Master</a></li>
						<li><a href="districtlist">District Master</a></li>
						<li><a href="citylist">City Master</a></li>
						<li><a href="placelist">Place Master</a></li>
						<li><a href="engineerlist">Employee Master</a></li>
						<li><a href="productlist">Product Master</a></li>
						<li><a href="modellist">Model Master</a></li>
						<li><a href="complainlist">Complain Master</a></li>
						<li><a href="sparelist">Spare Master</a></li>
						<!-- added by Nilesh -->
						<!-- <li><a href="routelist">Route Master</a></li> -->
						<li><a href="customerlist">Customer/Distributor Master</a></li>
					</ul>
				</li>
				<li><a href="#">Transaction Management</a>
					<ul>
						<li><a href="jobworklist">Service Call-Log Entry</a></li>
						<li><a href="englist">Engineer Allocation Entry</a></li>
						<!-- <li><a href="quotationlist">Quotation Entry</a></li>
						 <li><a href="englistc">Engineer Allocation List (On Site)</a></li> -->
					</ul>
				</li>					
				
				
				
				<li><a href="#">Engineer Management</a>
					<ul>
						<li><a href="englistcin">Call Log (Carry In)</a></li>
						<!-- <li><a href="englistcem">On Site</a></li> -->
					</ul>
				</li>
					
				<li><a href="#">Request Management<div style="position:relative;top:-20px;left:140px;color:red"><%=a4 %></div></a>
					<ul>
						<li><a href="pertsreq">Parts Request </a></li>
						
					</ul>
				</li>
				
				<li><a href="#">Receive Management<div style="position:relative;top:-20px;left:135px;color:red"><%=a5 %></div></a>
					<ul>
						<li><a href="pertsrec">Parts Request </a></li>
						<li><a href="salescrmrequirements">Sales(CRM) Requirements</a></li>
						<li><a href="salescrmserviceslist">Sales(CRM) Services</a></li>
					</ul></li>
						
				<li><a href="#">System Management</a>
				
				<ul>
					<li><a href="calculator">Calculator</a></li>
					<li><a href="userlist">User Profile </a></li>						
				</ul></li>
				
				<li><a href="#">Report Management</a>
				<ul>					
					<li><a href="report">Report Details</a></li>
					<li><a href="sparereturnreport">Spare Report</a></li>
					<li><a href="expensereport">Expense Report</a></li>
					<li><a href="search">Search JobId</a></li>
				</ul></li>
				
				
					<li><a href="#">Dashboard</a>
				
				<ul>
									
				<!-- <li><a href="dashboard">Dashboard</a></li> -->
					
				</ul></li>
				</sec:authorize>
				
				<sec:authorize ifAnyGranted='ROLE_RECEPTION'>
				
				<li><a href="#">Master Management</a>				
				<ul>
					<li><a href="companylist">Company Master</a></li>
					<li><a href="brandlist">Brand Master</a></li>
					<li><a href="statelist">State Master</a></li>
					<li><a href="districtlist">District Master</a></li>
					<li><a href="citylist">City Master</a></li>
					<li><a href="placelist">Place Master</a></li>
					<li><a href="engineerlist">Employee Master</a></li>
					<li><a href="productlist">Product Master</a></li>
					<li><a href="modellist">Model Master</a></li>
					<li><a href="complainlist">Complain Master</a></li>
					<li><a href="sparelist">Spare Master</a></li>
					<li><a href="customerlist">Customer/Distributor Master</a></li>
				</ul></li>
				
				<li><a href="#">Transaction Management</a>
					<ul>
						<li><a href="jobworklist">Service Call-Log Entry</a></li>
						<li><a href="englist">Engineer Allocation Entry</a></li>
												
					</ul></li>
					
				<!-- <li><a href="#">Print Management</a>
					
					<ul>
						<li><a href="englistcp1">Carry In Print</a></li>
						<li><a href="englistcp">On Site Print</a></li>						
					</ul>
				</li> -->
				
				<li><a href="#">Engineer Management</a>
					<ul>
						<li><a href="englistcin">Call Log (Carry In)</a></li>
						<!-- <li><a href="englistcem">On Site</a></li> -->
					</ul>
				</li>
					
				<li><a href="#">Request Management<div style="position:relative;top:-20px;left:140px;color:red"><%=a4 %></div></a>
					<ul>
						<li><a href="pertsreq">Parts Request </a></li>
						
					</ul>
				</li>
				
				<li><a href="#">Receive Management<div style="position:relative;top:-20px;left:135px;color:red"><%=a5 %></div></a>
					<ul>
						<li><a href="pertsrec">Parts Request </a></li>
					</ul></li>
									
				<li><a href="#">Report Management</a>
				<ul>					
					<li><a href="report">Report Details</a></li>
					<li><a href="sparereturnreport">Spare Report</a></li>
					<li><a href="expensereport">Expense Report</a></li>
					<li><a href="search">Search JobId</a></li>
				</ul></li>				
					<li><a href="#">Dashboard </a>
				<ul>
									
				<!-- <li><a href="dashboard">Dashboard</a></li> -->
					
				</ul></li>
				</sec:authorize>
				
				<sec:authorize ifAnyGranted='ROLE_SERVICE'>
				 
				<!-- <li><a href="#">Print Management</a>
					<ul>
						<a href="englistcp1">Carry In Print</a></li>
						<li><a href="englistcp">On Site Print</a></li>						
					</ul>
				</li> -->
				
				<li><a href="#">Engineer Management</a>
					<ul>
						<li><a href="englistcin">Carry In</a></li>
						<!-- <li><a href="englistcem">Carry Out</a></li>  -->
											
					</ul>
				</li>
									
				<li><a href="#">Receive Management<div style="position:relative;top:-20px;left:135px;color:red"><%=a5 %></div></a>
					<ul>
						<li><a href="pertsrec">Parts Request</a></li>
											
					</ul>
				</li>
				
				<li><a href="#">Report Management</a>
					<ul>					
						<li><a href="report">Report Details</a></li>
						<li><a href="sparereturnreport">Spare Report</a></li>
						<li><a href="expensereport">Expense Report</a></li>
						<li><a href="search">Search JobId</a></li>
					</ul>
				</li>
				
				<li><a href="#">Dashboard</a>
				<ul>
					
					<li><a href="dashboard">Dashboard</a></li>
					
				</ul></li>
				</sec:authorize>			
		</ul>
	</div>

	<script type="text/javascript">
		var dropdown = new TINY.dropdown.init("dropdown", {
			id : 'menu',
			active : 'menuhover'
		});
	</script>

</body>
</html>
