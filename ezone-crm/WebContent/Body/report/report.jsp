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

<script language="javascript" type="text/javascript">
	

	function modelcode() {
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
		var s1 = document.getElementById("mcode").value;
		//alert('S1: '+s1);
		//var s = document.getElementById("section").value;
		//var s = document.getElementById("source").value;
		//document.getElementById("newspaperadd").value = s;
		var url = "./Body/master/modelcode.jsp";
		url += "?count=" + s1; // + "&sec=" + s;
		//url +="?count=" +str+"&date1="+s;
		xmlHttp1.onreadystatechange = codeAdd1;
		xmlHttp1.open("GET", url, true);
		xmlHttp1.send(null);

	}

	function codeAdd1() {
		if (xmlHttp1.readyState == 4 || xmlHttp1.readyState == "complete") {

			//document.getElementById("pcode").innerHTML = xmlHttp1.responseText;
			var x=xmlHttp1.responseText;
			x=x.split("||");
			//alert(x);
			//document.getElementById("ccode").value = x[0];
			//document.getElementById("city").value = x[1];
			//document.getElementById("district").value = x[2];
			//document.getElementById("state").value = x[3];
			document.getElementById("fname").value = x[0];
			//document.getElementById("amount").value = x[1];
			//document.getElementById("icharge").value = x[2];
			//alert(document.getElementById("dist").innerHTML);
			//document.getElementById("section1").innerHTML = xmlHttp.responseText;

		}
	}
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

div.dataTables_wrapper {
        width: 90%;
        margin: 0 auto;
        
    }
</style>

</head>

<body><center>

<div>
<ul id="breadcrumbs">
<li><a href="#">Report Management</a></li>
<li>All Report</li>
</ul>
</div>

<fieldset style="width:98%; border:solid thin;Padding:5px;color:#c6d5e1;">
<legend style="color:red;" align="center"><h3>Print Report By Selection Option</h3></legend>

<s:form action="reportdetails" namespace="/" method="post">
   
  <table width="100%" style="padding:10px; color:#000;" >
	
      <tr>
      	   	    
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top;" font-size="10px;">From Date </td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><sj:datepicker name="formbean.frmdate"  timepicker="true" timepickerFormat="hh:mm" buttonImageOnly="true"  displayFormat="yy-mm-dd" showButton="false" changeYear="true" changeMonth="true" cssStyle="border:1px solid #ccc;height:25px;background:#FFFF99;width:120px;"/></td>
        
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">To Date </td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><sj:datepicker name="formbean.todate" timepicker="true" timepickerFormat="hh:mm"  displayFormat="yy-mm-dd" buttonImageOnly="true"  showButton="false" changeYear="true" changeMonth="true" cssStyle="border:1px solid #ccc;height:25px;background:#FFFF99;width:120px;"/></td>
        
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Brand</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:select name="formbean.bname" list="usList" id="bname" listKey="bname" value="formbean.bname" listValue="bname" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99;width:120px;" onchange="brandcode();"/></td>
       
         
       </tr>
       
       <tr> 
        
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Model</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:select name="formbean.mcode" id="mcode" list="#{'':''}" cssStyle=" border:1px solid #ccc;height:25px;background:#FFFF99;width:120px;" onchange="modelcode();"></s:select></td>
       
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Product</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:textfield name="formbean.fname" id="fname"  size="25" readonly="true" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>

      	<td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Payout_Type</td>
		<td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:select name="formbean.ptype" id="ptype" list="#{'':'', 'WAR':'WAR', 'HBS':'HBS', 'FOC':'FOC' }" cssStyle=" border:1px solid #ccc;height:25px;background:#FFFF99;width:120px;"></s:select></td>       
		  	
       </tr>
      
       <tr>
		
      <!-- 	<td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top" >Call_Category</td>
		<td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:select name="formbean.catagory" id="catagory" list="#{'':'', 'WITH SPARE':'WITH SPARE', 'WITH OUT SPARE':'WITH OUT SPARE'}" cssStyle=" border:1px solid #ccc;height:25px;background:#FFFF99;width:120px;"></s:select></td>
		
        
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Call_Type</td>
		<td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:select name="formbean.ctype" id="ctype" list="#{'':'', 'ON SITE':'ON SITE', 'CARRY IN':'CARRY IN'}" cssStyle=" border:1px solid #ccc;height:25px;background:#FFFF99;width:120px;"></s:select></td>
		
         -->
         
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Call_Priority</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:select name="formbean.cptype" id="cptype" list="#{'':'', 'URGENT':'URGENT', 'HIGH':'HIGH', 'MEDIUM':'MEDIUM', 'LOW':'LOW'}" cssStyle=" border:1px solid #ccc;height:25px;background:#FFFF99;width:120px;"></s:select></td>
        
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">User</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:select name="formbean.engname" list="usList1" id="engname" listKey="engname" value="formbean.engname" listValue="engname"  cssStyle=" border:1px solid #ccc;height:25px;background:#FFFF99;width:120px;"></s:select></td>
	      	    
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Status </td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:select name="formbean.userstatus" id="userstatus"  list="#{'':'','REPAIR READY':'REPAIR READY','UN-REPAIR READY':'UN-REPAIR READY', 'READY FOR QUOTATION':'READY FOR QUOTATION', 'PENDING FOR PARTS':'PENDING FOR PARTS'}"  cssStyle=" border:1px solid #ccc;height:25px;background:#FFFF99;width:120px;" ></s:select></td>
        
        </tr>
        
                
    </table>
      
       <div align="center" style="width:90%; position:relative;  padding:7px;">
      	<s:submit value="Search" cssClass="butStnd"></s:submit>
       </div>
       
    </s:form>
</fieldset>
<br/>
<s:if test="usList2">
<display:table id="table"  name="usList2" pagesize="10000"  class="display nowrap" requestURI="/reportdetails"  defaultorder="descending" export="true" style="width:90%">
	
	<display:caption media="html" style="color:red; font-weight:bold; padding-bottom:10px;">
	 User Productivity Report<br/>
	 on <s:property value="%{formbean.frmdate}"/> to <s:property value="%{formbean.todate}"/> 
	</display:caption>
	
	<display:caption media="excel pdf rtf csv" style="color:red; font-weight:bold; padding-bottom:10px;">
	 User Productivity Report
	 on <s:property value="%{formbean.frmdate}"/> to <s:property value="%{formbean.todate}"/> 
	</display:caption>
	
	
		
	<display:column property="bname"   title="Brand"     sortable="false" headerClass="sortable"/>
	
	<display:column property="ctype"   title="Call_Type"     sortable="false" headerClass="sortable"/>
		
	<display:column property="cdate"   title="Call_Date"     sortable="false" headerClass="sortable"/>
	
	<display:column property="scode"   title="CompanyCallId"    sortable="false" headerClass="sortable" />
	
	<display:column property="cust_ref_id"   title="CustomerRefNo"    sortable="false" headerClass="sortable" />
	
	<display:column property="ptype"   title="Payout_Type"     sortable="false" headerClass="sortable"/>
	
	<display:column property="name"   title="Name"    sortable="false" headerClass="sortable" />
	
	<display:column property="address"   title="Address "     sortable="false" headerClass="sortable"/>
	
	<display:column property="fname"   title="Product_Name"    sortable="false" headerClass="sortable" />
	
	<display:column property="pserial"   title="Product_Slno"    sortable="false" headerClass="sortable" />
	
	<display:column property="comcode"   title="Complain_Code"    sortable="false" headerClass="sortable" />
	
	<display:column property="engstatus"   title="Eng_Status"   sortable="false" headerClass="sortable" />
	
	<display:column property="remarks"   title="Remarks "     sortable="false" headerClass="sortable"/>
	
	<display:column property="allocation"   title="Age"    sortable="false" headerClass="sortable" />
	
	<display:column property="expencedetails"   title="Expence"    sortable="false" headerClass="sortable" />
	
	<display:column property="cremarks"   title="Actual Expence"    sortable="false" headerClass="sortable" />
	
	<display:column property="username"   title="UserId"    sortable="false" headerClass="sortable" />
	
	</display:table>
	
		
</s:if>

<br/>	
  
</center></body>
</html>
