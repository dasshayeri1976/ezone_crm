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
<legend style="color:red;">Report</legend>

<s:form action="searchr" namespace="/" method="post">
   
  <table width="100%" style="padding:10px; color:#000;" >
	
      <tr>
      
	   	    
        <td width="175">CompanyCallId </td>
        <td width="260"><s:textfield name="formbean.scode" id="scode"  size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>
        
        <td width="175">Name</td>
        <td width="260"><s:textfield name="formbean.name" id="name" onPaste="return true" size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>
        
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Pro_Serial_No</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:textfield name="formbean.pserial" id="pserial" onPaste="return true" size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>        
       
       	<td width="175">Mobile</td>
        <td width="175"><s:textfield name="formbean.pon" id="pon" onPaste="return true" size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>
	    
	    
	    <td width="175">Customer_Ref_No</td>
        <td width="260"><s:textfield name="formbean.cust_ref_id" id="cust_ref_id" onPaste="return true" size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>
        
	    
       </tr>
      
      
                
    </table>
      
       <div align="center" style="width:90%; position:relative;  padding:7px;">
      	<s:submit value="Search" cssClass="butStnd"></s:submit>
       </div>
       
    </s:form>
</fieldset>
<br/>
<s:if test="usList">
	
	<display:table id="table"  name="usList" pagesize="10000"  class="imagetable" requestURI="/searchr"  defaultorder="ascending"  export="true" style="width:90%">
	
	<display:caption media="html" style="color:red; font-weight:bold; padding-bottom:10px;">
	 Detail Report<br/>
	 on <s:property value="%{formbean.frmdate}"/> to <s:property value="%{formbean.todate}"/> 
	</display:caption>
	
	<display:caption media="excel pdf rtf csv" style="color:red; font-weight:bold; padding-bottom:10px;">
	 Detail Report
	 on <s:property value="%{formbean.frmdate}"/> to <s:property value="%{formbean.todate}"/> 
	</display:caption>
	
	<display:column property="cdate"   title="Call_Date"   sortable="false" headerClass="sortable" /> 
    <display:column property="catagory"   title="Call_Catagory"   sortable="false" headerClass="sortable" />
	<display:column property="scode" title="Com_Job_Id"    sortable="false" headerClass="sortable"/>
	<display:column property="cust_ref_id" title="Customer_Ref_No"    sortable="false" headerClass="sortable">

	<a href="viewdetails.jsp?value=<s:property value="scode"/>" style="text-decoration:none;"><span style="color:green;" onclick="return popitup('viewdetails.jsp?value=<s:property value="%{#attr.table.scode}"/>')"><s:property value="%{#attr.table.scode}"/></span></a>
	</display:column>
			
    <display:column property="name"   title="CusName"   sortable="false" headerClass="sortable" />
	<display:column property="address"   title="Address"   sortable="false" headerClass="sortable" />
	<display:column property="pon"   title="Phone"   sortable="false" headerClass="sortable" />
	
	
	<display:column property="mcode"   title="Model"   sortable="false" headerClass="sortable" />
	<display:column property="pserial"   title="ProSerial"   sortable="false" headerClass="sortable" />
	<display:column property="allocation"   title="Allocation"   sortable="false" headerClass="sortable" />
	
	<display:column property="userstatus"   title="Status"   sortable="false" headerClass="sortable" />
		
	</display:table>
	
</s:if>

<br/>	
  
</center></body>
</html>
