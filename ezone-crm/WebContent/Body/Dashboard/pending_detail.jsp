<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='sec' uri='http://www.springframework.org/security/tags' %> 
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
		scrollY:        '60vh',
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

function popitup(url) {
	newwindow=window.open(url,'view','height=800,width=1150,resizable=no,menubar=yes,scrollbars=yes');
	x = (screen.availWidth - '1250') / 2;
	y = (screen.avaiHeight - '800') / 2;

	// move to the center of the page
	newwindow.moveTo(x, y);
	if (window.focus) {newwindow.focus();}
	return false;
}

	</script>
</head>

<body><center>

<div>
<ul id="breadcrumbs">
<li ><a href="#">E-ZONE CARE</a></li>
<li >DashBoard</li>
</ul>
</div>

<b>Pending Dashboard</b>
<s:if test="usList">
<div style="padding:10px">
	<table id="example4" class="display" cellspacing="0" width="70%">
		<thead>
		
			<tr>

				<th>Call_Date</th>				
				<th>Call_Type</th>
				<th>Brand_Name</th>
				<th>Product_Name</th>
				<th>Model_Name</th>								
				<th>CompanyCallId</th>
				<th>Cust_Name</th>
				<th>Address</th>
				<th>Complain_Code</th>
				<th>Engineer</th>
				<th>Eng_Status</th>
				<th>Remarks</th>
				<th>Age</th>
				<th>Total Amount</th>
				<th>ActualExpence</th>
				
				
				
				
			</tr>
		</thead>
		<tbody>
		<s:iterator value="usList" status="status" >
		
			<tr>
				
				<td><s:property value="cdate"/></td>
				<td><s:property value="ctype"/></td>
				<td><s:property value="bname"/></td>
				<td><s:property value="fname"/></td>
				<td><s:property value="mcode"/></td>
				<!-- <td><a href="<s:url action="callerdataupdate1" namespace="/" ><s:param  name="leadid" value="accid"></s:param></s:url>" style="text-decoration:none;font-size:12px;"><s:property value="accid" /></a></td>-->
				<td><a href="viewdetails.jsp?value=<s:property value="scode"/>" style="text-decoration:none;"><span style="color:green;" onclick="return popitup('viewdetails.jsp?value=<s:property value="scode"/>')"><s:property value="scode"/></span></a></td>
				<td><s:property value="name"/></td>
				<td><s:property value="address"/></td>
				<td><s:property value="comcode"/></td>
				<td><s:property value="add"/></td>
				<td><s:property value="engstatus"/></td>
				<td><s:property value="remarks"/></td>
				<td><s:property value="allocation"/></td>
				<td><s:property value="expence_details"/></td>
				<td><s:property value="cremarks"/></td>
				
				
				
				
				
				
			</tr>
		
		
		</s:iterator>
			
			
		
		</tbody>
  </table>
  </div>
 </s:if>      

</center>  
</body>
</html>
