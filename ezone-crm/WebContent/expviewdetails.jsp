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
	<title>Ezone Care</title>
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
				<th>Brand_Name</th>		
				<th>Call_Date</th>
				<th>CompanyCallId</th>
				<th>Customer_Name</th>
				<th>Eng_Name</th>
				<th>SCR_No</th>
				<th>Location</th>
				<th>Expence_Date</th>
				<th>ActualExpence</th>
				<th>Expense_Amount</th>
								
			</tr>
		</thead>
		<tbody>
		
<% 

		String user=(String)request.getParameter("value");
		//System.out.println("user :"+user);
		
		Connection conn = ConnectionDAO.getConnectionObject();
		Statement stm = ConnectionDAO.createStatement(conn);
//		String sql = "select brand,call_type,call_date,companycall_id,customer_name,address,phone_no,model_code,product_name,complain_code,eng_status,eng_remarks,datediff(now(),call_date),expence_given,real_expence,tdate from jobwork_history where companycall_id='"+user+"'";

  //      String sql="select jobwork_entraiy.brand,jobwork_entry.call_date,jobwork_entry.companycall_id,jobwork_entry.customer_name,expance_table.engname,jobwork_entry.srcno,expance_table.description,expance_table.expence_date,expance_table.dramount,expance_table.cramount from jobwork_entry, expance_table where jobwork_entry.companycall_id = expance_table.companycall_id";

        String sql="select * from expencedetails";
  
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
