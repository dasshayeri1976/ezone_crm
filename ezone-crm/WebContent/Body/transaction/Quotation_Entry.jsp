<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='sec' uri='http://www.springframework.org/security/tags' %> 
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Quotation Master</title>
<script language="javascript" type="text/javascript" src="js/tablefilter.js"></script>
<link rel="stylesheet" href="css/style2.css" />
<link rel="stylesheet" href="./css/draftbutton.css" />
<link rel="stylesheet" href="./css/printbutton.css" />
<link rel="stylesheet" href="css/breadcumbs.css" ></link>

<script src="./js/dynamictable.js"></script>
<script src="./js/shortcut.js"></script>

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
	font-size:13px;
	
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
	font-size:13px;
}
</style>

<script>
function confirmation()
{
	
	//alert();
	var x= '';
	
	
	var r = confirm("Are You sure to delete this company record");
	
	if (r == true) 
	{
		var m=document.getElementById('placecode').value;
		//alert('m: '+m);
		if(m==1)
		{
			alert("Place is Already Tag With Transaction data, So Operation Cannot be proceed");
			x= false;
		}
		else
			x=true;
	} 
	else 
	{
	    x = false;
	}
	
	return x;
	
}

</script>


<script type="text/javascript">
function isNumber(evt) {
	    evt = (evt) ? evt : window.event;
	    var charCode = (evt.which) ? evt.which : evt.keyCode;
	    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
	        return false;
	    }
	    return true;
	}
	
</script>

<!-- Added by Nilesh 20th March -->
<script type="text/javascript">
	function calTotal()
	{
		 
		 // get quantity
		 //var qty = document.getElementsByName("formbean.qty");
		 
		 var qty = document.getElementsByName("formbean.qty_nos")
		 
		 // get rate
		 //var rate = document.getElementsByName("formbean.rate");
		 var rate = document.getElementsByName("formbean.rate_nos");
		 
		 var total = 0.00;
		
		 // get total field ref
		 var t = document.getElementById('total');
		 
		 // get amount
		 //var amt = document.getElementsByName("formbean.amount");
		 
		 var amt = document.getElementsByName("formbean.amount_nos");
		 
		 for(var i=0,j=0,k=0;i < qty.length && j< rate.length && k< qty.length ; i++,j++,k++)
			 {
			 
			 	amt[k].value = parseFloat(qty[i].value) * parseFloat(rate[j].value);
			 	
			 	total = parseFloat(total) + parseFloat(qty[i].value) * parseFloat(rate[j].value);
			 	
			 	t.value = total;
			 	
			 	if(isNaN(parseFloat(amt[k].value)))
				{
			 		amt[k].value = 0.00;
			 		t.value = 0.00;
				}
			 	
			 	
			 }
		 
	}
	function calTotal1()
	{
		//alert();
		var x=document.getElementsByClassName("bb");
		var y=document.getElementsByClassName("cc");
		var z=document.getElementsByClassName("dd");
		//alert(y[0].value);
		for(var i=0;i<x.length;i++)
		{
			z[i].value=Number(x[i].value)*Number(y[i].value);
		}
	}
	function approvedTotal1(aa)
	{
		//alert();
		var x=document.getElementsByClassName("dd");//amount
		var y=document.getElementsByClassName("ee");//dropdown
		var total=0;
		 for(var i12=0;i12<x.length;i12++)
		{
			if(y[i12].value=="APPROVED")
			{
				total=total+Number(x[i12].value);
			}
		}
		document.getElementById("approved_amt").value=total;
	}
</script>

<!-- Added by Nilesh, 28th March -->
<script type="text/javascript">
	function approveTotal(selectedValue)
	{
		// array of combo boxes
		alert();
		var approveSel = document.getElementsByName("formbean.approved_nos");
		
		// array of quantities 
		
		var qty = document.getElementsByName("formbean.qty_nos");
		 
		// array of rates
		 var rate = document.getElementsByName("formbean.rate_nos");
		 
		 // array of amounts
		 var amt = document.getElementsByName("formbean.amount_nos");
		 
		 var total = 0.00;
		 
		 
		 // store total approved amount
		 var appTotal = document.getElementById("approved_amt");
		
	     var sum;
		 
		 var tableRef = document.getElementById("dataTable");
		 
		 var rows = tableRef.rows;
		//alert(selectedValue);
	
		 for(var i = 0; i < approveSel.length; i++)
		 {
			 if(approveSel[i].value=="APPROVED")
			{
				total=total+Number(amt[i].value);
				
			}
			 appTotal.value=total;
		 }
		
	}
</script>


<script type="text/javascript">
	function genSerial()
	{
		
				 var serials = document.getElementsByName("formbean.slno");
				 
				 for(i=1;i < serials.length;i++)
					 {
					 	serials[i].value = i+1;
					 	
					 }
				 
	}
</script>

<script type="text/javascript">
    // added by Nilesh 23rd March
	function getCusCode()
	{
		if (typeof XMLHttpRequest != "undefined") 
		{
			xmlHttp1 = new XMLHttpRequest();
		}
		else if (window.ActiveXObject) 
		{
			xmlHttp1 = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (xmlHttp1 == null) 
		{
			alert("Browser does not support XMLHTTP Request");
			return;
		}
		
		
		var url = "./Body/transaction/cuscode.jsp";
		
		var cusName = document.getElementById('name').value;
		
		url += "?cusname=" + cusName;

		xmlHttp1.onreadystatechange = codeAdd01;
		xmlHttp1.open("GET", url, true);
		xmlHttp1.send(null);
		
	}
	
	function codeAdd01() {
		if (xmlHttp1.readyState == 4 || xmlHttp1.readyState == "complete") {

			var x=xmlHttp1.responseText;
			
			document.getElementById('acode').value = x;
			
		}
	};
	
</script>

<script type="text/javascript">
var rowIndex;
	//added by Nilesh 23rd March
	function dynamicRowId(x)
	{
		 rowIndex = $(x).closest('tr').index();
		 alert("Row Index is: " + parseInt(rowIndex)); 		
	}
	
</script>

<%--added by Nilesh 28th March --%>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		 var todaydate = new Date();
		   var day = todaydate.getDate();
		   var month = todaydate.getMonth() + 1;
		   var year = todaydate.getFullYear();
		   var datestring = year + "-" + month + "-" + day;
		   document.getElementById("edate").value = datestring;
		
		
	});
	
	
</script>

<script type="text/javascript">

	function checkForApproved()
	{
		
		// get array of combo boxes
		var approveSel = document.getElementsByName("formbean.approved_nos");
		
		for(var i = 0; i < approveSel.length; i++)
		 {
			 if(approveSel[i].value=="APPROVED")
			{
				 
				// ajax call to update data in jobwork_entry table
				//sendAjaxValue();
				
				
			}
		 }
		
	}
	


	function sendAjaxValue()
	{
		
		alert("ajax");
		if (typeof XMLHttpRequest != "undefined") 
		{
			xmlHttp2 = new XMLHttpRequest();
		}
		else if (window.ActiveXObject) 
		{
			xmlHttp2 = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (xmlHttp2 == null) 
		{
			alert("Browser does not support XMLHTTP Request");
			return;
		}
		
		
		var url = "./Body/transaction/quotationApproved.jsp";
		
		var cus_ref_id = document.getElementById('cust_ref_id').value;
		
		url += "?refid=" + cus_ref_id;

		xmlHttp2.onreadystatechange = codeAdd02;
		xmlHttp2.open("GET", url, true);
		xmlHttp2.send(null);
		
	}
	
	function codeAdd02() {
		if (xmlHttp2.readyState == 4 || xmlHttp2.readyState == "complete") {

			var x=xmlHttp2.responseText;
			
			document.getElementById('testAjax').innerHTML = x;
			
		}
	};
		
	
</script>

<%-- added by Nilesh, 11th April --%>
<script type="text/javascript">
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

<%-- added by Nilesh, 12th April --%>
<script type="text/javascript">
	function copyValueFromHiddenFields()
	{
		//alert("Avi");
		var v = document.getElementsByClassName("aa");
		var w = document.getElementsByClassName("bb");
		var x = document.getElementsByClassName("cc");
		var y = document.getElementsByClassName("dd");
		var z = document.getElementsByClassName("ee");
		//alert(z.length);
		var count1=0;
		for(var i=0;i<z.length;i++)
		{
			//alert(z[i].value);
			//count=count+Number(x[i].value);
			//document.getElementsByClassName("contra1")=x[i].value;
			//document.getElementsByClassName("credithidden")=y[i].value;
			document.getElementsByClassName("aa1")[i].value=v[i].value;
			document.getElementsByClassName("bb1")[i].value=w[i].value;
			document.getElementsByClassName("cc1")[i].value=x[i].value;
			document.getElementsByClassName("dd1")[i].value=y[i].value;
			document.getElementsByClassName("ee1")[i].value=z[i].value;
			//alert(document.getElementsByClassName("credithidden")[i].value);
		}
	}
	function redirectto()
	{
		var sw= document.getElementById("check").value;
		if(sw == "a")
		{
			window.location.href="englist";
		}
		else
		{
			window.location.href="englistcin";
		}
	}
	
	/* function redirectto1()
	{
		window.location.href="englistcin";
	} */
</script>

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
#ui-datepicker-div {background:#dce6ee;}

#ui-datepicker-div .ui-state-highlight {color: #dce6ee;}

#ui-datepicker-div.ui-datepicker-control {background: blue;}


.ui-dialog-titlebar{ 
    background: #FFCC66 repeat-x;
    color:#fff;      
}

#abc
{
	display: none;
}

div.dataTables_wrapper {
        width: 90%;
        margin: 0 auto;
        
    }
  
</style>

<sj:head jqueryui="true"/>

<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.css"/>
<script src="//code.jquery.com/jquery-1.12.4.js"></script> 
<script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
<%
	String test=(String) session.getAttribute("check");
	//System.out.println("session got "+test);
%>	
<script>
function hello()
{
	var p="<%= test %>";
	//alert(p);
	document.getElementById("check").value=p;
}
</script>
</head>
<s:if test="%{formbean==null}">
</s:if>
<s:else>
<body onload="hello();"><center>
</s:else>


<div>
<ul id="breadcrumbs">
<li ><a href="#">System Settings</a></li>
<li >Quotation Entry</li>
</ul>
</div>

<s:if test="hasActionMessages()">
<div class="welcome">
<s:actionmessage/>
</div>
</s:if>
    
  <fieldset style="width:68%; border:solid thin #c6d5e1; text-align:center;Padding:5px;">
  <legend style="color:red;"><h3>Quotation Entry</h3></legend>
  
  <s:form action="quotationcreation" namespace="/" method="post">
  
  <%-- hidden field to store customer code --%>
    <input type="hidden" name="formbean.acode" id="acode"  />
  <input type="hidden" name="formbean.check" id="check" value="<s:property value="formbean.check"/>"/>
  <input type="hidden" name="formbean.id" value="<s:property value="formbean.id"/>"/>
  
  <table width="84%" style="padding:10px;" align="center" border="0">
	
	 <tr>	   	       
        <%-- <td  width="12.5%" style="padding-left:20px; padding-right:15px;" valign="top">&nbsp;Customer&nbsp;/Distributor&nbsp;Name</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">
        	<s:select name="formbean.name" list="usList9" id="name" listKey="name" value="formbean.name" listValue="name" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;width:100px;" onchange="getCusCode();"/>
        </td> --%>	
        
        <td  width="12.5%" style="padding-left:15px; padding-right:1px;" valign="top">Customer&nbsp;Name</td>
        <td width="12.5%" style="padding-left:15px; padding-right:1px;" valign="top">
        	<s:textfield name="formbean.name" id="name" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;width:176px;" readonly="true" />
        </td>
        
		
        <td width="12.5%" align="right" style="padding-left:216px; padding-right:20px;">Entry_Date</td>        
       	<td width="12.5%" style="padding-left:13px; padding-right:15px">
        <sj:datepicker name="formbean.edate" id="edate" size="13" buttonImageOnly="true" displayFormat="yy-mm-dd" showButton="true" changeYear="true" changeMonth="true" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></sj:datepicker>
        
        </td>
        
    </tr>
        
        <tr>
        	  <td width="12.5%" style="padding-left:15px; padding-right:1px; valign="top">Cust_Address</td>
        	  <td width="12.5%" style="padding-left:15px; padding-right:1px;">
        		<s:textfield name="formbean.address" id="address" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;width:176px;" readonly="true" />
        	</td>
        		
       	  <td align="right" width="12.5%" style="padding-left:15px; padding-right:1px;">Serial No.</td>
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;">
        	  	<s:textfield name="formbean.slnum" id="slnum" size="13" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;" readonly="true"></s:textfield>  	
        	  </td>	
        	
        </tr>
        <tr>
        	<td width="12.5%" style="padding-left:15px; padding-right:1px;" valign="top">Company&nbsp;Job&nbsp;Id</td>
        	<td width="12.5%" style="padding-left:15px; padding-right:1px;">
        		<s:textfield name="formbean.ccode" id="ccode" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;width:176px;" readonly="true" ></s:textfield>
        	</td>
                	
        	<td  align="right" width="12.5%" style="padding-left:20px; padding-right:15px; valign="top"">Customer&nbsp;Ref&nbsp;Id</td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;">
        		<s:textfield name="formbean.cust_ref_id" id="cust_ref_id" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;width:100px;" ></s:textfield>
        	</td>
        </tr>
        
        <tr>
        	<td width="12.5%" style="padding-left:15px; padding-right:1px;" valign="top">Prb_Reported</td>
        	<td width="12.5%" style="padding-left:35px; padding-right:1px;" valign="top">
        	<s:textfield name="formbean.Comcode" cols="60" rows="3" id="Comcode" cssStyle="border:1px solid #ccc;background:#FFFF99;width:200px;" readonly="true" ></s:textfield>
        	</td>
        	<sec:authorize ifAnyGranted='ROLE_ADMIN'>
        	<td  align="right" width="12.5%" style="padding-left:20px; padding-right:15px; valign="top"">Mobile&nbsp;No.</td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;">
        		<s:textfield name="formbean.mobile" id="mobile" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;width:100px;" ></s:textfield>
        	</td>
        	</sec:authorize>
        	<sec:authorize ifAnyGranted='ROLE_RECEPTION'>
        	<td  align="right" width="12.5%" style="padding-left:20px; padding-right:15px; valign="top"">Mobile&nbsp;No.</td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;">
        		<s:textfield name="formbean.mobile" id="mobile" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;width:100px;" ></s:textfield>
        	</td>
        	</sec:authorize>
       	</tr>
        
        <tr>	
        	<td width="12.5%" style="padding-left:15px; padding-right:1px;" valign="top">Service_Remarks</td>
        	<td width="12.5%" style="padding-left:35px; padding-right:1px;" valign="top">
            <s:textarea name="formbean.remarks" cols="60" rows="3" id="remarks" cssStyle="border:1px solid #ccc;background:#FFFF99;width:200px;" readonly="true" ></s:textarea>
            </td>
        </tr>	
        
    </table>
    
						<p align="left">
							<br /> <span style="padding-left: 254px; color: #FF0000;">Please
								tick out the check box for Delete the row</span>
						</p>
						<br />
						
						<div style="width: 831px; height: 170px; overflow-y: auto;"
							align="center">
							<table>
							<tr>
							<td valign="top">
							<sec:authorize ifAnyGranted='ROLE_ADMIN'>
        		
							<table id="dataTable" width="450px" class="imagetable" >
								<tr>
									<th></th>
									<th>Sl.No</th>
									<th>Particulars</th>
									<th>Qty</th>
									<th>Rate</th>
									<th>Amount</th>
									<th>Approved</th>
									
								</tr>
								<s:if test="%{formbean.id==null}">
								<tr>
									<td><input type="checkbox" name="chk" /></td>
									
									<td>
										<s:textfield name="formbean.slno" value="1" id="slno" readonly="true" cssStyle="width:40px"></s:textfield>
									</td>
									
									<td>
										<s:textfield name="formbean.particular_nos" id="particulars" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;width:250px;"></s:textfield>
									</td>
									
									<td>
										<s:textfield name="formbean.qty_nos" id="qty" cssStyle="text-align:right;height:20px;border:1px solid #ccc;background:#FFFF99;width:100px;" onkeypress="return isNumber(event)"></s:textfield>
									</td>
									
									<td>
										<s:textfield name="formbean.rate_nos" id="rate" cssStyle="text-align:right;height:20px;border:1px solid #ccc;background:#FFFF99;width:100px;" onkeyup="calTotal();"></s:textfield>
									</td>
									
									<td>
										<s:textfield name="formbean.amount_nos" size="30" id="amount" cssStyle="text-align:right;height:20px;border:1px solid #ccc;background:#FFFF99;width:100px;" readonly="true"></s:textfield>
									</td>
									
									<td>
										<s:select name="formbean.approved_nos" id="approved" list="#{'PENDING':'PENDING','NA':'NOT APPROVED','APPROVED':'APPROVED','REJECTED':'REJECTED'}" cssStyle=" border:1px solid #ccc;height:20px;background:#FFFF99;width:120px;" onchange="approveTotal(this.value);"></s:select>
									</td>
									
								</tr>
								</s:if>
								<s:else>
  	   							<%int i=0; %> 
  	   							<s:iterator value="formbean.particular_nos" status="status" >
  	   							<tr>
									<td><input type="checkbox" name="chk" /></td>
									
									<td>
										<input type="text" name="slno" value="<%=i+1 %>" id="slno" readonly="true" style="width:40px" />
									</td>
									
									<td>
										<s:textfield name="formbean.particular_nos[%{#status.count-1}]" cssClass="aa" id="particulars" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;width:250px;"></s:textfield>
										 <%-- added by Nilesh, 12th April --%>
										  <input type="hidden" name="formbean.particular_nos1" class="aa1" id="particular_nos1" />
																		
									</td>
									
									<td>
										<s:textfield name="formbean.qty_nos[%{#status.count-1}]" id="qty" cssClass="bb" cssStyle="text-align:right;height:20px;border:1px solid #ccc;background:#FFFF99;width:100px;" onkeypress="return isNumber(event)"></s:textfield>
										  <input type="hidden" name="formbean.qty_nos1" id="qty_nos1" class="bb1"/>
										  
									</td>
									
									<td>
										<s:textfield name="formbean.rate_nos[%{#status.count-1}]" id="rate" cssClass="cc" cssStyle="text-align:right;height:20px;border:1px solid #ccc;background:#FFFF99;width:100px;" onkeyup="calTotal1();"></s:textfield>
										<input type="hidden" name="formbean.rate_nos1" id="rate_nos1" class="cc1"/>
										  
									</td>
									
									<td>
										<s:textfield name="formbean.amount_nos[%{#status.count-1}]" size="30" cssClass="dd" id="amount" cssStyle="text-align:right;height:20px;border:1px solid #ccc;background:#FFFF99;width:100px;" readonly="true"></s:textfield>
										<input type="hidden" name="formbean.amount_nos1" id="amount_nos1" class="dd1"/>
											
									</td>
									
								
									<td>
										<s:select name="formbean.approved_nos[%{#status.count-1}]" cssClass="ee" id="approved" list="#{'PENDING':'PENDING','NA':'NOT APPROVED','APPROVED':'APPROVED','REJECTED':'REJECTED'}" cssStyle=" border:1px solid #ccc;height:20px;background:#FFFF99;width:120px;" onchange="approvedTotal1(this.value);"></s:select>
										<input type="hidden" name="formbean.approved1" id="approved1" class="ee1"/>
									</td>
									
								</tr>
  	   							 <%i++; %>
  	   							</s:iterator>
  	   							</s:else>
							</table>
							</sec:authorize>
							
							<sec:authorize ifAnyGranted='ROLE_RECEPTION'>
        		
							<table id="dataTable" width="450px" class="imagetable" >
								<tr>
									<th></th>
									<th>Sl.No</th>
									<th>Particulars</th>
									<th>Qty</th>
									<th>Rate</th>
									<th>Amount</th>
									<th>Approved</th>
									
								</tr>
								<s:if test="%{formbean.id==null}">
								<tr>
									<td><input type="checkbox" name="chk" /></td>
									
									<td>
										<s:textfield name="formbean.slno" value="1" id="slno" readonly="true" cssStyle="width:40px"></s:textfield>
									</td>
									
									<td>
										<s:textfield name="formbean.particular_nos" id="particulars" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;width:250px;"></s:textfield>
									</td>
									
									<td>
										<s:textfield name="formbean.qty_nos" id="qty" cssStyle="text-align:right;height:20px;border:1px solid #ccc;background:#FFFF99;width:100px;" onkeypress="return isNumber(event)"></s:textfield>
									</td>
									
									<td>
										<s:textfield name="formbean.rate_nos" id="rate" cssStyle="text-align:right;height:20px;border:1px solid #ccc;background:#FFFF99;width:100px;" onkeyup="calTotal();"></s:textfield>
									</td>
									
									<td>
										<s:textfield name="formbean.amount_nos" size="30" id="amount" cssStyle="text-align:right;height:20px;border:1px solid #ccc;background:#FFFF99;width:100px;" readonly="true"></s:textfield>
									</td>
									
									<td>
										<s:select name="formbean.approved_nos" id="approved" list="#{'PENDING':'PENDING','NA':'NOT APPROVED','APPROVED':'APPROVED','REJECTED':'REJECTED'}" cssStyle=" border:1px solid #ccc;height:20px;background:#FFFF99;width:120px;" onchange="approveTotal(this.value);"></s:select>
									</td>
									
								</tr>
								</s:if>
								<s:else>
  	   							<%int i=0; %> 
  	   							<s:iterator value="formbean.particular_nos" status="status" >
  	   							<tr>
									<td><input type="checkbox" name="chk" /></td>
									
									<td>
										<input type="text" name="slno" value="<%=i+1 %>" id="slno" readonly="true" style="width:40px" />
									</td>
									
									<td>
										<s:textfield name="formbean.particular_nos[%{#status.count-1}]" cssClass="aa" id="particulars" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;width:250px;"></s:textfield>
										 <%-- added by Nilesh, 12th April --%>
										  <input type="hidden" name="formbean.particular_nos1" class="aa1" id="particular_nos1" />
																		
									</td>
									
									<td>
										<s:textfield name="formbean.qty_nos[%{#status.count-1}]" id="qty" cssClass="bb" cssStyle="text-align:right;height:20px;border:1px solid #ccc;background:#FFFF99;width:100px;" onkeypress="return isNumber(event)"></s:textfield>
										  <input type="hidden" name="formbean.qty_nos1" id="qty_nos1" class="bb1"/>
										  
									</td>
									
									<td>
										<s:textfield name="formbean.rate_nos[%{#status.count-1}]" id="rate" cssClass="cc" cssStyle="text-align:right;height:20px;border:1px solid #ccc;background:#FFFF99;width:100px;" onkeyup="calTotal1();"></s:textfield>
										<input type="hidden" name="formbean.rate_nos1" id="rate_nos1" class="cc1"/>
										  
									</td>
									
									<td>
										<s:textfield name="formbean.amount_nos[%{#status.count-1}]" size="30" cssClass="dd" id="amount" cssStyle="text-align:right;height:20px;border:1px solid #ccc;background:#FFFF99;width:100px;" readonly="true"></s:textfield>
										<input type="hidden" name="formbean.amount_nos1" id="amount_nos1" class="dd1"/>
											
									</td>
									
								
									<td>
										<s:select name="formbean.approved_nos[%{#status.count-1}]" cssClass="ee" id="approved" list="#{'PENDING':'PENDING','NA':'NOT APPROVED','APPROVED':'APPROVED','REJECTED':'REJECTED'}" cssStyle=" border:1px solid #ccc;height:20px;background:#FFFF99;width:120px;" onchange="approvedTotal1(this.value);"></s:select>
										<input type="hidden" name="formbean.approved1" id="approved1" class="ee1"/>
									</td>
									
								</tr>
  	   							 <%i++; %>
  	   							</s:iterator>
  	   							</s:else>
							</table>
							</sec:authorize>
							
							<sec:authorize ifAnyGranted='ROLE_SERVICE'>
        		
							<table id="dataTable" width="450px" class="imagetable" >
								<tr>
									<th></th>
									<th>Sl.No</th>
									<th>Particulars</th>
									<th>Qty</th>
									<th>Approved</th>
									
								</tr>
								<s:if test="%{formbean.id==null}">
								<tr>
									<td>
										<input type="checkbox" name="chk" />
									</td>
									
									<td>
										<s:textfield name="formbean.slno" value="1" id="slno" readonly="true" cssStyle="width:40px"></s:textfield>
									</td>
									
									<td>
										<s:textfield name="formbean.particular_nos" id="particulars" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;width:250px;"></s:textfield>
									</td>
									
									<td>
										<s:textfield name="formbean.qty_nos" id="qty" cssStyle="text-align:right;height:20px;border:1px solid #ccc;background:#FFFF99;width:100px;" onkeypress="return isNumber(event)"></s:textfield>
									</td>
																	
									
									<td>
										<s:select name="formbean.approved_nos" id="approved" disabled="true" list="#{'PENDING':'PENDING','NA':'NOT APPROVED','APPROVED':'APPROVED','REJECTED':'REJECTED'}" cssStyle=" border:1px solid #ccc;height:20px;background:#FFFF99;width:120px;" onchange="approveTotal(this.value);" ></s:select>
									</td>
									
								</tr>
								</s:if>
								<s:else>
  	   							<%int i=0; %> 
  	   							<s:iterator value="formbean.particular_nos" status="status" >
  	   							<tr>
									<td><input type="checkbox" name="chk" /></td>
									
									<td>
										<input type="text" name="slno" value="<%=i+1 %>" id="slno" readonly="true" style="width:40px" />
									</td>
									
									<td>
										<s:textfield name="formbean.particular_nos[%{#status.count-1}]" cssClass="aa" id="particulars" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;width:250px;"></s:textfield>
										 <%-- added by Nilesh, 12th April --%>
										  <input type="hidden" name="formbean.particular_nos1" class="aa1" id="particular_nos1" />
																		
									</td>
									
									<td>
										<s:textfield name="formbean.qty_nos[%{#status.count-1}]" id="qty" cssClass="bb" cssStyle="text-align:right;height:20px;border:1px solid #ccc;background:#FFFF99;width:100px;" onkeypress="return isNumber(event)"></s:textfield>
										  <input type="hidden" name="formbean.qty_nos1" id="qty_nos1" class="bb1"/>
										  
									</td>
									
																		
								
									<td>
										<s:select name="formbean.approved_nos[%{#status.count-1}]" cssClass="ee" id="approved" list="#{'PENDING':'PENDING','NA':'NOT APPROVED','APPROVED':'APPROVED','REJECTED':'REJECTED'}" cssStyle=" border:1px solid #ccc;height:20px;background:#FFFF99;width:120px;" onchange="approvedTotal1(this.value);" disabled="true"></s:select>
										<input type="hidden" name="formbean.approved1" id="approved1" class="ee1"/>
									</td>
									
								</tr>
  	   							 <%i++; %>
  	   							</s:iterator>
  	   							</s:else>
							</table>
							</sec:authorize>
							
							</td>
							<td valign="top">
							<div align="center">
							<div id="ctype2"></div>
							
							</div>
							</td>
							</tr>
							</table>
						</div>


						<div style="width: 80%; position: relative; padding: 10px;">
							
							<table width="100%">
							<tr>
							
								<td style="text-align:center;color:#000066;padding-left:29px;" width="80" valign="top">Customer&nbsp;Remarks</td>
							</tr>
							
							<tr>
								<sec:authorize ifAnyGranted='ROLE_SERVICE'>	
								<td  colspan="5" style="padding-left: 29px;" width="80" style="color:#000066;" valign="top">
								<center>
									<s:textarea name="formbean.cus_remarks" id="remarks" cssStyle="background:#b3ffb3;" cols="60" rows="2"/>
								</center>
								</td>
								</sec:authorize>
								<sec:authorize ifNotGranted='ROLE_SERVICE'>	
								<td style="padding-left: 29px;" width="80" style="color:#000066;" valign="top">
									<s:textarea name="formbean.cus_remarks" id="remarks" cssStyle="background:#b3ffb3;" cols="60" rows="2"/>
								</td>
								</sec:authorize>
								<sec:authorize ifNotGranted='ROLE_SERVICE'>
								<td width="90" style="color: #000066;padding-left:27px;" valign="top"><b>Total</b></td>
								<td width="260" style="padding-left:0px;" valign="top">
									<s:textfield size="18" name="formbean.total" cssStyle="border:1px solid #ccc;color:#000066;text-align: right;" id="total" readonly="true"></s:textfield>
								</td>
								
								<td width="90" style="color: #000066;padding-left:27px;text-align:right;" valign="top"><b>Approved&nbsp;Total</b></td>
								<td width="260" style="padding-left:0px;" valign="top">
									<s:textfield size="18" name="formbean.approved_amt" id="approved_amt" cssStyle="border:1px solid #ccc;color:#000066;text-align: right;"></s:textfield>
								</td>
								</sec:authorize>
							</tr>
							
							</table>
							<br/>
							
							<sec:authorize ifAnyGranted='ROLE_ADMIN'>
							<div style="align:right">
								<input type="button" value="Add" class="myButton"
									onclick="addRow('dataTable');genSerial();" /> <input type="button"
									value="Delete" class="myButton"
									onclick="deleteRow('dataTable');genSerial();calTotal();approveTotal();return addtotal();" />
								<%-- <s:submit value="save" cssClass="myButton"
									onclick="return elementValue();"></s:submit> --%>
							</div>
							</sec:authorize>
							
							<sec:authorize ifAnyGranted='ROLE_RECEPTION'>
							<div style="align:right">
								<input type="button" value="Add" class="myButton"
									onclick="addRow('dataTable');genSerial();" /> <input type="button"
									value="Delete" class="myButton"
									onclick="deleteRow('dataTable');genSerial();calTotal();approveTotal();return addtotal();" />
								<%-- <s:submit value="save" cssClass="myButton"
									onclick="return elementValue();"></s:submit> --%>
							</div>
							</sec:authorize>
							
						</div>
    
    <br/>
   	  <div align="center" style="width:100%; position:relative;border-bottom:solid thin #c6d5e1;">
      </div>
      
      <div align="right" style="width:99%;position:relative;padding:7px;">
        		<sec:authorize ifAnyGranted='ROLE_ADMIN'>
      			<s:submit name="formbean.save" value="Save" cssClass="butStnd" onclick="copyValueFromHiddenFields();checkForApproved();"></s:submit>
        		</sec:authorize>
        		<sec:authorize ifAnyGranted='ROLE_RECEPTION'>
      			<s:submit name="formbean.save" value="Save" cssClass="butStnd" onclick="copyValueFromHiddenFields();checkForApproved();"></s:submit>
        		</sec:authorize>
        		<input type="button" value="Exit" onclick="redirectto();" class="butStnd"/>
      		</div>
      
    </s:form> 
  </fieldset>
	
	<p>&nbsp;</p>
	<s:if test="usList">
	<sec:authorize ifAnyGranted='ROLE_ADMIN'>
	<display:table id="table"  name="usList" pagesize="25"  class="imagetable" requestURI=""  defaultsort="2" defaultorder="descending"  export="true" style="width:80%;color:#000">
	    
	 <s:if test="%{#attr.table.id == formbean.id}">
  	
	<%-- <display:column property="name"   title="Customer/Distributor Name" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" /> --%>
	<display:column property="name"   title="Customer/Distributor Name" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="edate"   title="Entry Date" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="slnum"   title="Voucher No" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="total"   title="Total Amount" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column title="Update" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
    <a href="<s:url action="quotationupdate" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color:  #fff;text-decoration:none;font-size:12px;" class="classname">Update</a>
    </display:column>
    
    <display:column title="Delete" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
    <a href="<s:url action="quotationdelete" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color:  #fff;text-decoration:none;font-size:12px;" class="print" onclick="return confirmation();">Delete</a>
    </display:column>
    
   	 <display:column title="Jobcard Print" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
    	<a href="jobcardprintdetails.jsp?value=<s:property value="%{#attr.table.id}"/>&voucher=<s:property value="%{#attr.table.slnum}"/> style="text-decoration:none;"><span style="color:#fff;" onclick="return popitup('jobcardprintdetails.jsp?value=<s:property value="%{#attr.table.id}"/>&voucher=<s:property value="%{#attr.table.slnum}"/>')" class="classname">Print</span></a>
    	
    </display:column> 
  
    
	</s:if>
	<s:else>
		 
	<display:column property="name"   title="Customer/Distributor Name" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="edate"   title="Entry Date" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="slnum"   title="Voucher No" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="total"   title="Total Amount" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column title="Update" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
    <a href="<s:url action="quotationupdate" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color:  #fff;text-decoration:none;font-size:12px;" class="classname">Update</a>
    </display:column>
    
    <display:column title="Delete" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
    <a href="<s:url action="quotationdelete" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color:  #fff;text-decoration:none;font-size:12px;" class="print" onclick="return confirmation();">Delete</a>
    </display:column>
    
   	 <display:column title="Jobcard Print" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
		<a href="jobcardprintdetails.jsp?value=<s:property value="%{#attr.table.id}"/>&voucher=<s:property value="%{#attr.table.slnum}"/>" style="text-decoration:none;"><span style="color:#fff;" onclick="return popitup('jobcardprintdetails.jsp?value=<s:property value="%{#attr.table.id}"/>&voucher=<s:property value="%{#attr.table.slnum}"/>')" class="classname">Print</span></a>
    </display:column>
    
    
	</s:else> 
	   
    </display:table>
    </sec:authorize>
    
    <sec:authorize ifAnyGranted='ROLE_RECEPTION'>
	<display:table id="table"  name="usList" pagesize="25"  class="imagetable" requestURI=""  defaultsort="2" defaultorder="descending"  export="true" style="width:80%;color:#000">
	    
	 <s:if test="%{#attr.table.id == formbean.id}">
  	
	<%-- <display:column property="name"   title="Customer/Distributor Name" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" /> --%>
	<display:column property="name"   title="Customer/Distributor Name" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="edate"   title="Entry Date" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="slnum"   title="Voucher No" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="total"   title="Total Amount" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column title="Update" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
    <a href="<s:url action="quotationupdate" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color:  #fff;text-decoration:none;font-size:12px;" class="classname">Update</a>
    </display:column>
    
    <display:column title="Delete" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
    <a href="<s:url action="quotationdelete" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color:  #fff;text-decoration:none;font-size:12px;" class="print" onclick="return confirmation();">Delete</a>
    </display:column>
    
   	 <display:column title="Jobcard Print" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
    	<a href="jobcardprintdetails.jsp?value=<s:property value="%{#attr.table.id}"/>&voucher=<s:property value="%{#attr.table.slnum}"/> style="text-decoration:none;"><span style="color:#fff;" onclick="return popitup('jobcardprintdetails.jsp?value=<s:property value="%{#attr.table.id}"/>&voucher=<s:property value="%{#attr.table.slnum}"/>')" class="classname">Print</span></a>
    	
    </display:column> 
  
    
	</s:if>
	<s:else>
		 
	<display:column property="name"   title="Customer/Distributor Name" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="edate"   title="Entry Date" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="slnum"   title="Voucher No" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="total"   title="Total Amount" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column title="Update" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
    <a href="<s:url action="quotationupdate" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color:  #fff;text-decoration:none;font-size:12px;" class="classname">Update</a>
    </display:column>
    
    <display:column title="Delete" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
    <a href="<s:url action="quotationdelete" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color:  #fff;text-decoration:none;font-size:12px;" class="print" onclick="return confirmation();">Delete</a>
    </display:column>
    
   	 <display:column title="Jobcard Print" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
		<a href="jobcardprintdetails.jsp?value=<s:property value="%{#attr.table.id}"/>&voucher=<s:property value="%{#attr.table.slnum}"/>" style="text-decoration:none;"><span style="color:#fff;" onclick="return popitup('jobcardprintdetails.jsp?value=<s:property value="%{#attr.table.id}"/>&voucher=<s:property value="%{#attr.table.slnum}"/>')" class="classname">Print</span></a>
    </display:column>
    
    
	</s:else> 
	   
    </display:table>
    </sec:authorize>
	</s:if>
	
  <br/>
 
   
    <!--<script language="javascript" type="text/javascript">
//<![CDATA[
	setFilterGrid("table");
//]]>
</script>-->
          
   
</center></body>
</html>



