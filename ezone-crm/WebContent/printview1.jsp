<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>

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

%>
<div id="printableArea">

<s:if test="usList">    

		
		
		<div style="height:100%;" align="center">
		<table width="100%">
		<tr>
		<td><h5>COMPUTER SYSTEM & SERVICES</h5></td>
		<!--<td><h5>CRM DEMO</h5></td>-->
		<td><h5>JOB CARD (ON SITE)</h5></td>
		<td align="right"><h5>CallDate: <%=td%></h5></td>
		</tr>
		</table>
		
		<s:iterator value="usList" status="status" >
		
		<table width="100%" class="imagetable">
		<tr>
		<td>Engineer Name: <s:property value="allocation"/></td>
		<td align="right">Job No: <s:property value="scode"/> </td>
		</tr>
		</table>
		
		<table cellpadding="0" cellspacing="0" border="0" id="table" class="gridtable" style="width:100%" >
		<thead>
		
			<tr>
				
				<th><center>CompanyId</center></th>
				<th><center>Name</center></th>
				<th><center>Address</center></th>
				<th><center>Place</center></th>
				<th><center>City</center></th>
				<th><center>Pin</center></th>
				<th><center>Phone</center></th>
				<th><center>Mobile No</center></th>
				
			</tr>
			
		</thead>
		<tbody>
		
		
			<tr>
				
				<td><s:property value="scode" /></td>
				<td><s:property value="name" /></td>
				<td><s:property value="address" /></td>
				<td><s:property value="place"/></td>
				<td><s:property value="city" /></td>
				<td><s:property value="pcode"/></td>
				<td><s:property value="pon"/></td>
				<td><s:property value="pon1"/></td>
			</tr>
			
		
		</tbody>
		</table>
		
		<table cellpadding="0" cellspacing="0" border="0" id="table" class="gridtable" style="width:100%" >
		<thead>
		
			<tr>
				
				<th><center>Brand Name</center></th>
				<th><center>Model</center></th>
				<th><center>Products Name</center></th>
				<th><center>SerialNo.</center></th>
				<th><center>Call Priority</center></th>
				<th><center>ProblemReported</center></th>
				<th><center>Status</center></th>
			</tr>
			
		</thead>
		<tbody>
		
		
			<tr>
				
				<td><s:property value="bname" /></td>
				<td><s:property value="mcode" /></td>
				<td><s:property value="fname" /></td>
				<td><s:property value="pserial"/></td>
				<td><s:property value="cptype" /></td>
				<td><s:property value="comcode"/></td>
				<td><s:property value="comcode"/></td>
			</tr>
			
		
		</tbody>
		</table>
		
		<table width="100%" class="imagetable">
		<tr>
		<td>Customer Remarks: <s:property value="remarks"/></td>
		</tr>
		</table>
		
		<table width="100%" class="imagetable">
		<tr>
		<td>Spare Details: <s:property value="spare"/></td>
		</tr>
		</table>
		<br/>
		</hr>
		</s:iterator>
		
		<p>---------------------------------------------------xxxxxxxxxxxxxxxxxxxxxxxxxx-------------------------------------------------</p>
		
		<s:iterator value="usList" status="status" >
		
		<table width="100%" class="imagetable">
		<tr>
		<td>Engineer Name: <s:property value="allocation"/></td>
		<td align="right">Job No: <s:property value="scode"/> </td>
		</tr>
		</table>
		
		<table cellpadding="0" cellspacing="0" border="0" id="table" class="gridtable" style="width:100%" >
		<thead>
		
			<tr>
				
				<th><center>CompanyId</center></th>
				<th><center>Name</center></th>
				<th><center>Address</center></th>
				<th><center>Place</center></th>
				<th><center>City</center></th>
				<th><center>Pin</center></th>
				<th><center>Phone</center></th>
				<th><center>Mobile No</center></th>
				
			</tr>
			
		</thead>
		<tbody>
		
		
			<tr>
				
				<td><s:property value="scode" /></td>
				<td><s:property value="name" /></td>
				<td><s:property value="address" /></td>
				<td><s:property value="place"/></td>
				<td><s:property value="city" /></td>
				<td><s:property value="pcode"/></td>
				<td><s:property value="pon"/></td>
				<td><s:property value="pon1"/></td>
			</tr>
			
		
		</tbody>
		</table>
		
		<table cellpadding="0" cellspacing="0" border="0" id="table" class="gridtable" style="width:100%" >
		<thead>
		
			<tr>
				
				<th><center>Brand Name</center></th>
				<th><center>Model</center></th>
				<th><center>Products Name</center></th>
				<th><center>SerialNo.</center></th>
				<th><center>Call Priority</center></th>
				<th><center>ProblemReported</center></th>
				<th><center>Status</center></th>
			</tr>
			
		</thead>
		<tbody>
		
		
			<tr>
				
				<td><s:property value="bname" /></td>
				<td><s:property value="mcode" /></td>
				<td><s:property value="fname" /></td>
				<td><s:property value="pserial"/></td>
				<td><s:property value="cptype" /></td>
				<td><s:property value="comcode"/></td>
				<td><s:property value="comcode"/></td>
			</tr>
			
		
		</tbody>
		</table>
		
		<table width="100%" class="imagetable">
		<tr>
		<td>Customer Remarks: <s:property value="remarks"/></td>
		</tr>
		</table>
		
		<table width="100%" class="imagetable">
		<tr>
		<td>Spare Details: <s:property value="spare"/></td>
		</tr>
		</table>
		<br/>
		</hr>
		</s:iterator>
 			
				
</div>				
</s:if>	
 <br/>
</div>
<input type="button" onclick="printDiv('printableArea')" value="print a div!" /> 	         
</center></body>
</html>
