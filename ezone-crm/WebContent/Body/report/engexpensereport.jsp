<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<script language="javascript" type="text/javascript" src="js/tablefilter.js"></script>
<script src="js/tableToExcel.js"></script>
<link rel="stylesheet" href="css/style2.css" />
<link rel="stylesheet" href="css/breadcumbs.css" ></link>


	<link rel="stylesheet" type="text/css" href="././css/jquery.dataTables.css">
	
	
<style type="text/css">
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
		scrollY:        '30vh',
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
	
	<script language="javascript" type="text/javascript">
	

	function brandcode() {
		//alert('Avi');
		if (typeof XMLHttpRequest != "undefined") {
			xmlHttp1 = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			xmlHttp1 = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (xmlHttp1 == null) {
			alert("Browser does not support XMLHTTP Request");
			return;
		}
		var s1 = document.getElementById("bname").value;
		//alert('S1: '+s1);
		//var s = document.getElementById("section").value;
		//var s = document.getElementById("source").value;
		//document.getElementById("newspaperadd").value = s;
		var url = "./Body/master/brandcode.jsp";
		url += "?brand=" + s1; // + "&sec=" + s;
		//url +="?count=" +str+"&date1="+s;
		xmlHttp1.onreadystatechange = codeAdd2;
		xmlHttp1.open("GET", url, true);
		xmlHttp1.send(null);

	}

	function codeAdd2() {
		if (xmlHttp1.readyState == 4 || xmlHttp1.readyState == "complete") {

			document.getElementById("mcode").innerHTML = xmlHttp1.responseText;
			
		}
	};
</script>
<sj:head />

<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.css"/>
<script src="//code.jquery.com/jquery-1.12.4.js"></script> 
<script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>

<script>
	var $easy1 = $.noConflict(true);
	</script>
 <script>
 $(document).ready(function() {
	   
	
	    $easy1('#table').DataTable( {
	       
	    	scrollY:'50vh',
	    	 "scrollX": true,
	        paging:  false,
	        ordering: false,
	        
	       
	    } );

	   
	} );
 
 </script>  
<style>
#ui-datepicker-div {background:#dce6ee;}

#ui-datepicker-div .ui-state-highlight {color: #dce6ee;}

#ui-datepicker-div.ui-datepicker-control {background: blue;}

}
</style>

</head>

<body><center>

<div>
<ul id="breadcrumbs">
<li><a href="#">Report Management</a></li>
<li>Expense Report</li>
</ul>
</div>

<fieldset style="width:70%; border:solid thin;Padding:5px;color:#c6d5e1;">
<legend style="color:red;">Expense Report</legend>

<s:form action="engexpensedetails" namespace="/" method="post">
   
  <table width="100%" style="padding:10px; color:#000;" >
	
      <tr>
      
	   	    
        <td width="175">From Date </td>
        <td width="260"><sj:datepicker name="formbean.frmdate"   buttonImageOnly="true"  displayFormat="yy-mm-dd" showButton="false" changeYear="true" changeMonth="true" cssStyle="border:1px solid #ccc;height:25px;background:#FFFF99;width:120px;"/></td>
        
        <td width="175">To Date </td>
        <td width="260"><sj:datepicker name="formbean.todate"  displayFormat="yy-mm-dd" buttonImageOnly="true"  showButton="false" changeYear="true" changeMonth="true" cssStyle="border:1px solid #ccc;height:25px;background:#FFFF99;width:120px;"/></td>
        
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Company_Call_ID</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:textfield name="formbean.scode" id="scode"  size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>        
       
       	<td width="175">User</td>
        <td width="175"><s:select name="formbean.engname" list="usList1" id="engname" listKey="engname" value="formbean.engname" listValue="engname"  cssStyle=" border:1px solid #ccc;height:25px;background:#FFFF99;width:110px;"></s:select></td>
	    
       </tr>
      
      
                
    </table>
      
       <div align="center" style="width:90%; position:relative;  padding:7px;">
      	<s:submit value="Search" cssClass="butStnd"></s:submit>
       </div>
       
    </s:form>
</fieldset>
<br/>
<s:if test="usList2">
<display:table id="table"  name="usList2" pagesize="10000"  class="display nowrap" requestURI="/engexpensedetails"  defaultorder="ascending"  export="true" style="width:90%">
	
	<display:caption media="html" style="color:red; font-weight:bold; padding-bottom:10px;">
	 Expences Report<br/>
	 on <s:property value="%{formbean.frmdate}"/> to <s:property value="%{formbean.todate}"/> 
	</display:caption>
	
	<display:caption media="excel pdf rtf csv" style="color:red; font-weight:bold; padding-bottom:10px;">
	 Expences Report
	 on <s:property value="%{formbean.frmdate}"/> to <s:property value="%{formbean.todate}"/> 
	</display:caption>
	
	
	<%-- <display:column title="CompanyCallId" media="html" >
    <a href="expviewdetails.jsp?value=<s:property value="scode"/>" style="text-decoration:none;"><span style="color:green;" onclick="return popitup('expviewdetails.jsp?value=<s:property value="%{#attr.table.scode}"/>')"><s:property value="%{#attr.table.scode}"/></span></a>
	</display:column>
	 --%>
	
	<display:column property="cdate"   title="Call_Date"     sortable="false" headerClass="sortable"/>
	
	<display:column property="scode"   title="CompanyCallId"     sortable="false" headerClass="sortable"/>
	
	<display:column property="bname"   title="Brand_Name"     sortable="false" headerClass="sortable"/>
				
	<display:column property="name"   title="Cust_Name"     sortable="false" headerClass="sortable"/>
	
	<display:column property="fname"   title="Engineer_Name"    sortable="false" headerClass="sortable" />
	
	<display:column property="scrno"   title="SCR_No"     sortable="false" headerClass="sortable"/>
	
	<display:column property="address"   title="Call_Location"     sortable="false" headerClass="sortable"/>
	
	<display:column property="edate"   title="Expense_Date"     sortable="false" headerClass="sortable"/>
	
	<display:column property="amount"   title="Exp_Amount (dr)"     sortable="false" headerClass="sortable"/>
	
	<display:column property="amount1"   title="Exp_ Amount(cr)"     sortable="false" headerClass="sortable"/>
	
	<display:column property="username"   title="UserId"    sortable="false" headerClass="sortable" />
	
	</display:table>
	
</s:if>

<br/>	
  
</center></body>
</html>
