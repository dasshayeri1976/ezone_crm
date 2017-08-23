<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='sec' uri='http://www.springframework.org/security/tags' %> 
<%@ page import="java.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.OutputStream" %>
<%@page import="com.connection.ezonecrm.ConnectionDAO" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	
	<meta name="viewport" content="initial-scale=1.0, maximum-scale=2.0">
	<title>E-ZONE CARE</title>
	<link rel="stylesheet" type="text/css" href="././css/jquery.dataTables.css">
	<link rel="stylesheet" href="css/breadcumbs.css" ></link>
	
	
	
	
	<script type="text/javascript" language="javascript" src="http://code.jquery.com/jquery-1.12.3.min.js">
	</script>
	<script type="text/javascript" language="javascript" src="./js/jquery.dataTables.js">
	</script>
	
	<script type="text/javascript" language="javascript" src="./js/shCore.js">
	</script>
	<script type="text/javascript" language="javascript" src="./js/demo.js">
	</script>
	
	
	<script type="text/javascript" language="javascript" src="./js/tableToExcel.js">
	</script>
	<script type="text/javascript" language="javascript" class="init">
	
$(document).ready(function() {
	$('#example').DataTable( {
		scrollY:        '20vh',
		"scrollX": true,
		paging:  false,
		
	} );
} );

$(document).ready(function() {
	$('#example1').DataTable( {
		scrollY:        '20vh',
		"scrollX": true,
		paging:  false,
		
	} );
} );

$(document).ready(function() {
	$('#example2').DataTable( {
		scrollY:        '20vh',
		"scrollX": true,
		paging:  false,
		
	} );
} );

$(document).ready(function() {
	$('#example3').DataTable( {
		scrollY:        '75vh',
		"scrollX": true,
		paging:  false,
		
	} );
} );

$(document).ready(function() {
	$('#example4').DataTable( {
		scrollY:        '60vh',
		"scrollX": true,
		paging:  false,
		
	} );
} );

$(document).ready(function() {
	$('#example5').DataTable( {
		scrollY:        '60vh',
		"scrollX": true,
		paging:  false,
		
	} );
} );

	</script>
</head>

<body>


<b>History Dashboard</b>

<div style="padding:10px">
<table id="example3" class="display" cellspacing="0" width="70%">
		<thead>
			<tr>
				<th>Brand</th>
				<th>Call_Type</th>
				<th>Call_Date</th>
				<th>CompanyCallId</th>
				<th>Cust_Ref_No</th>
				<th>Name</th>
				<th>Address</th>
				<th>Product_Name</th>
				<th>Complain_Code</th>
				<th>Eng_Status</th>
				<th>Remarks</th>
				<th>Age</th>
				<th>Expence</th>
				<th>ActualExpence</th>
				<th>Transaction_Date</th>
				
				
				
			</tr>
		</thead>
		<tbody>
		
<% 

		String user=(String)request.getParameter("value");
		//System.out.println("user :"+user);
		
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
		String sql = "select brand,call_type,call_date,companycall_id,customer_ref_id,customer_name,address,phone_no,model_code,product_name,complain_code,eng_status,eng_remarks,datediff(now(),call_date),expence_given,real_expence,tdate from jobwork_history where companycall_id='"+user+"'";
		try {
			
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) 
			{
				//System.out.println("user :"+rs.getString(2));
				
			%>
			<tr>
			<td><%= rs.getString(1) %></td>
			<td><%= rs.getString(2) %></td>
			<td><%= rs.getString(3) %></td>
			<td><%= rs.getString(4) %></td>
			<td><%= rs.getString(5) %></td>
			<td><%= rs.getString(6) %></td>
			<td><%= rs.getString(9) %></td>
			<td><%= rs.getString(10) %></td>
			<td><%= rs.getString(11) %></td>
			<td><%= rs.getString(12) %></td>
			<td><%= rs.getString(13) %></td>
			<td><%= rs.getString(14) %></td>
			<td><%= rs.getString(15) %></td>
			<td><%= rs.getString(16) %></td>
			<td><%= rs.getString(17) %></td>
			</tr>
		
<%}
	}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	ConnectionDAO.closeConnection(conn);
%>
</tbody>
</table>
  </div>
  <!--<input type="button" onClick="tableToExcel('example', 'W3C Example Table')" value="Export to Excel">-->



</center>  
</body>
</html>
