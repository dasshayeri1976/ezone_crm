<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@page import="com.connection.account.ConnectionDAO"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page session="true"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<script language="javascript" type="text/javascript" src="js/tablefilter.js"></script>
<link rel="stylesheet" href="css/style2.css" />
<link rel="stylesheet" href="./css/draftbutton.css" />
<link rel="stylesheet" href="./css/printbutton.css" />
<link rel="stylesheet" href="css/breadcumbs.css" ></link>
<script language="javascript" type="text/javascript" src="js/dynamictable.js"></script>

<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.css"/>
<script src="//code.jquery.com/jquery-1.12.4.js"></script> 
<script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
<script>
		var $easy1 = $.noConflict(true);
	</script>
<script>
 $(document).ready(function() {
	   
	 $("#ram").css({ 'display': "block" });
	    $easy1('#table').DataTable( {
	       
	    	 "scrollX": true,
	        paging:  false,
	        ordering: false,       
	    } );
	} );
 </script>

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

<script language="Javascript">
	
	var xm=10;
	
	function Validate() {
		var a = document.getElementById('name');
		var b = document.getElementById('classy');
		var c = document.getElementById('p_text');
		var d = document.getElementById('sc_name');
		//var e = document.getElementById('status');

		if ((a.value == null) || (a.value == "")) 
		{
			alert("Please Enter Name");
			a.focus();
			return false;
		}
		else
		{
					
			
			if(xm==0)
			{
				alert('Avi');
				a.focus();
				return false;
			}
			
		}	
		

		if ((b.value == null) || (b.value == "")) {
			
			alert("Please Enter UserName");
			
			b.focus();
			return false;
		}
		
		
		if ((c.value == null) || (c.value == ""))
		{
			alert("Please Enter Password");
			c.focus();
			return false;
		}
		
		if ((d.value == null) || (d.value == "")) {
			alert("Please Enter the Roll");
			d.focus();
			return false;
		}

		if ((e.value == null) || (e.value == "")) {
			alert("Please Enter Status");
			e.focus();
			return false;
		}
		

		
		return true;

	}
	
	
</script>

<script type="text/javascript">


function confirmation()
{
	var r = confirm("Are You sure to delete this client record");
	var x='';
	if (r == true) 
	{
	    x = true;
	} 
	else 
	{
	    x = false;
	} 
	return x;
}
</script>

<script language="javascript" type="text/javascript">
	function checkName() {
		//alert(a);
		if (typeof XMLHttpRequest != "undefined") {
			xmlHttp001 = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			xmlHttp001 = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (xmlHttp001 == null) {
			alert("Browser does not support XMLHTTP Request");
			return;
		}
		var s1 =document.getElementById("name").value;
		//alert('S1: '+s1);
		//var s = document.getElementById("section").value;
		//var s = document.getElementById("source").value;
		//document.getElementById("newspaperadd").value = s;
		var url = "./Body/master/checkname.jsp";
		url += "?count=" + s1; // + "&sec=" + s;
		//url +="?count=" +str+"&date1="+s;
		xmlHttp001.onreadystatechange = codeAdd03;
		xmlHttp001.open("GET", url, true);
		xmlHttp001.send(null);
		
	};

	function codeAdd03() {
		if (xmlHttp001.readyState == 4 || xmlHttp001.readyState == "complete") 
		{

			
			var x1=xmlHttp001.responseText;
			//alert(x);
			if(x1==1)
			{
			xm=0;
			alert("Please Register Your Name First");
			document.getElementById("name").value='';
			document.getElementById("name").focus();
			}

		}
	};
</script>
<script>
function disp()
{
	var x=document.getElementById("classy").value;
	//alert(x);
	if(x=="")
	{
		document.getElementById("for_asset_lia").style.display="none";
		document.getElementById("for_in_ex").style.display="none";
		document.getElementById("det").innerHTML="In_Balance_Sheet";
	}
	if(x=="A")
	{
		document.getElementById("for_asset_lia").style.display="block";
		document.getElementById("cat").value="Balance Sheet";
		document.getElementById("for_in_ex").style.display="none";
		document.getElementById("det").innerHTML="For_Assets";
	}
	if(x=="L")
	{
		document.getElementById("for_asset_lia").style.display="block";
		document.getElementById("cat").value="Balance Sheet";
		document.getElementById("for_in_ex").style.display="none";
		document.getElementById("det").innerHTML="For_Liability";
	}
	if(x=="I")
	{
		document.getElementById("for_in_ex").style.display="block";
		document.getElementById("for_asset_lia").style.display="none";
		document.getElementById("det").innerHTML="For_Income_Account";
	}
	if(x=="E")
	{
		document.getElementById("for_in_ex").style.display="block";
		document.getElementById("for_asset_lia").style.display="none";
		document.getElementById("det").innerHTML="For_Expenditure_Account";
	}
}
</script>
<sj:head/>


<link rel="stylesheet" type="text/css" href="./css/easyui.css"/>
<script type="text/javascript" src="./js/jquery.easyui.min.js"></script>


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

<body onload="disp();"><center>

<div>
<ul id="breadcrumbs">
<li ><a href="#">System Settings</a></li>
<li >Sales Memo Entry(M.R.P)</li>
</ul>
</div>

<s:if test="hasActionMessages()">
<div class="welcome">
<s:actionmessage/>
</div>
</s:if>
    
  <fieldset style="width:40%; border:solid thin #c6d5e1;Padding:5px;">
  <legend style="color:red;"><h3>ENTRY OF CASH/CREDIT MEMO FOR SALES(M.R.P)</h3></legend>
  
  <s:form action="materialgroupcreation" namespace="/" method="post" autocomplete="off">
  <input type="hidden" name="formbean.id" value="<s:property value="formbean.id"/>"/>
  
  <table cellpadding="5" width="50%" style="padding:5px">  
 
  		
       	
       	<tr>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><label>Name&nbsp;Of&nbsp;Area</label></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="nameofarea" id="nameofarea" cssClass="nameofarea" list="usList"  listValue="company" size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
        
          <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
   
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><label>Day</label></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.day" id="day" list="usList"  listValue="company" size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
        </tr>
        
        
         	<tr>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><label>Salesman&nbsp;Name</label></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.salesmanname" id="salesmanname" list="usList"  listValue="company" size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
            
            <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
       <td width="12.5%" style="padding-left:15px; padding-right:15px;"><label>Data</label></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.date" id="date" list="usList"  listValue="company" size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
        </tr>
       
         	<tr>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><label>Retailer&nbsp;Name</label></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.retailername" id="retailername" cssClass="salesname" list="usList"  listValue="company" size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
            <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
       <td width="12.5%" style="padding-left:15px; padding-right:15px;"><label>Memo.&nbsp;no</label></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.memeono" id="memono" cssClass="sunit" list="usList"  listValue="company" size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
        </tr>
      
         <tr>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><label>Address</label></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.address" id="address" cssClass="companyname" list="usList"  listValue="company" size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
             <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        
       </tr>
         
         
       
       </table>
   
  
   
   
 
        
   
   
   
 
   
   
   <fieldset style="width:30%; border:solid thin #c6d5e1;Padding:5px;">
    <legend style="color:red;"><h3>press alt-A for Account creation</h3></legend>
	<table cellspacing="0" border="0" width="50%" id='table1'>
	
	<!-- <tr  style="background-color:#4292b2;color:white;" align="center">        
    
        <th  width="2%"></th>
        <th width="9%" style="font-size:11.2px" align="center" colspan="2">LIST PRICE</th>
        <th width="9%" style="font-size:11.2px">M.R.P.</th>     
       <th width="9%" style="font-size:11.2px" colspan="3">OPENING STOCK</th>
        <th width="9%" style="font-size:11.2px">SALE (L)</th>
         <th width="9%" style="font-size:11.2px">SALE VAN</th>
         <th width="9%" style="font-size:11.2px">SALE (L)</th>
        <th width="9%" style="font-size:11.2px">SALE VAN</th>
       <th width="9%" style="font-size:11.2px">DIST.</th>
        <th width="9%" style="font-size:11.2px">PRICE</th> 
        
    </tr> -->
	<tr  style="background-color:#4292b2;color:white;" align="center">        
    
        <th  width="2%"></th>
        <th width="9%" style="font-size:11.2px">Name Of Items</th>
        <th width="9%" style="font-size:11.2px">  CASE</th>     
        <th width="9%" style="font-size:11.2px">PCS</th>
        <th width="9%" style="font-size:11.2px">F/P</th>
        <th width="9%" style="font-size:11.2px">M.R.P</th>     
        <th width="9%" style="font-size:11.2px">RATE</th>
        <th width="9%" style="font-size:11.2px">DIS/CS</th>
        <th width="9%" style="font-size:11.2px">DIS.%</th>
        <th width="9%" style="font-size:11.2px">AMMOUNT</th>
        
    </tr>
      <s:if test="%{formbean==null}">
    <tr>
    
        <td  width="2%"><input type="checkbox" name="chk"/></td>
        
        
        <td width="9%" style="font-size:14px"><s:textfield name="formbean.sln" id="sln"  cssClass="sln" size="50" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;" ></s:textfield></td>
		
		
        <td width="9%" style="font-size:14px"><s:textfield name="formbean.bpartno" id="bpartno" cssClass="bpartno" size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onfocusout="PersonViewModel(this);setcpartcode();setcdesccode();setcmakecode();"></s:textfield></td>	    

		
        <td width="9%" style="font-size:14px"><s:textfield name="formbean.stock" id="stock" cssClass="stock"  size="8" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>
        
        
        <td width="9%" style="font-size:14px"><s:textfield name="formbean.basics" id="basics" cssClass="basics"  size="14" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onkeyup="unitratte();"></s:textfield></td>
        	 
        
        <td width="9%" style="font-size:14px"><s:textfield name="formbean.qty" id="qty" cssClass="qty" size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onfocusout="PersonViewModel(this);amountt();"></s:textfield></td>
        
         <td width="9%" style="font-size:14px"><s:textfield name="formbean.basics1" id="basics1" cssClass="basics1"  size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onkeyup="unitratte();"></s:textfield></td>
        	 
        
        <td width="9%" style="font-size:14px"><s:textfield name="formbean.qty1" id="qty1" cssClass="qty1" size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onfocusout="PersonViewModel(this);amountt();"></s:textfield></td>
        	 
   	   <td width="9%" style="font-size:14px"><s:textfield name="formbean.basics11" id="basics11" cssClass="basics11"  size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onkeyup="unitratte();"></s:textfield></td>
        	 
        
        <td width="9%" style="font-size:14px"><s:textfield name="formbean.qty111" id="qty111" cssClass="qty111" size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onfocusout="PersonViewModel(this);amountt();"></s:textfield></td>
       	 
       
       </tr>
    </s:if>
    <s:else>
     <s:iterator value="formbean.bpartno" status="status">
     	 <tr>
    
        <td  width="2%"><input type="checkbox" name="chk"/></td>
        
         <td width="5%"><s:textfield name="formbean.spccode[%{#status.count-1}]" id="spccode" cssClass="spccode" size="20"  cssStyle="display:none;height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield><input type="hidden" name="formbean.spccode1" id="spccode1" class="spccode1"></input></td>               
        
        <td width="9%" style="font-size:14px"><s:textfield name="formbean.sln[%{#status.count-1}]" id="sln" cssClass="sln" size="6" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;" ></s:textfield><input type="hidden" name="formbean.sln1" id="sln1" class="sln1"></input></td>
		
		
        <td width="9%" style="font-size:14px"><s:textfield name="formbean.bpartno[%{#status.count-1}]" id="bpartno" cssClass="bpartno" size="25" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onfocusout="PersonViewModel(this);setcpartcode();setcdesccode();setcmakecode();"></s:textfield><input type="hidden" name="formbean.bpartno11" id="bpartno11" class="bpartno11"></input></td>	    

		
        <td width="9%" style="font-size:14px"><s:textfield name="formbean.stock[%{#status.count-1}]" id="stock" cssClass="stock"  size="25" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>
        
        
        <td width="9%" style="font-size:14px"><s:textfield name="formbean.basics[%{#status.count-1}]" id="basics" cssClass="basics"  size="22" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onkeyup="unitratte();"></s:textfield></td>
        	 
        
        <td width="9%" style="font-size:14px"><s:textfield name="formbean.qty[%{#status.count-1}]" id="qty" cssClass="qty" size="18" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onfocusout="PersonViewModel(this);amountt();"></s:textfield><input type="hidden" name="formbean.qty11" id="qty11" class="qty11"></input></td>
        	 
       	 	 	 	        
       </tr>
     </s:iterator>
    </s:else>   
       
      
	</table>
	
	    <div align="center" style="width:100%; position:relative;border-bottom:solid thin #c6d5e1;"></div>
   	  
       <div align="right" style="width:99%;position:relative;  padding:6px;">
       <input type="button" value="add" Class="butStnd" onclick="addRow('table1');genSerial();incr();"/>
       <input type="button" value="delete" Class="butStnd" onclick="deleteRow('table1');"/>
	
	
       
      
      </div>
      
       <table cellpadding="5" width="50%" style="padding:5px"> 
      
        <tr>
           <td width="12.5%" style="padding-left:15px; padding-right:15px;" ></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
           <td width="12.5%" style="padding-left:15px; padding-right:15px;" ></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
           <td width="12.5%" style="padding-left:15px; padding-right:15px;" ></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
          	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	   	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
       
        
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"  colspan="7"><label>Total&nbsp;Ammount</label></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"  colspan="7"><sj:autocompleter name="formbean.address" id="address" cssClass="companyname" list="usList"  listValue="company" size="10" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></sj:autocompleter></td>
        </tr>
        
   <tr>
   
   <td width="12.5%" style="padding-left:15px; padding-right:15px;" align="right"><label>Packing</label></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;" align="right"><sj:autocompleter name="formbean.packing" id="packing" cssClass="packing" list="usList"  listValue="company" size="10" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></sj:autocompleter></td>
      
        
           <td width="12.5%" style="padding-left:15px; padding-right:15px;"><label>Case</label></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.case" id="case" cssClass="case" list="usList"  listValue="company" size="10" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
          	 <td width="12.5%" style="padding-left:15px; padding-right:15px;"><label>Pcs</label></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.pcs" id="pcs" cssClass="pcs" list="usList"  listValue="company" size="10" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
         <td width="12.5%" style="padding-left:15px; padding-right:15px;"><label>Total</label></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.total" id="total" cssClass="total" list="usList"  listValue="company" size="10" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
          
        	   	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"  colspan="7"><label>Total&nbsp;Discount</label></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;" colspan="7"><sj:autocompleter name="formbean.discount" id="discount" cssClass="discount" list="usList"  listValue="company" size="10" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></sj:autocompleter></td>
        </tr>
	
        </table>
  </fieldset>
   <fieldset style="width:15%; border:solid thin #c6d5e1;Padding:5px;">
  	<table cellspacing="0" border="0" width="20%">
  	<tr>
  	
  	  	  <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	
        	 <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	 
        	 <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	 
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	 
        		
        		 
        	
        	
        
   <td width="12.5%" style="padding-left:15px; padding-right:15px;" ><label>Gross&nbsp;Amount</label></td>
  	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.gamount" id="gamount" list="usList"  listValue="company" size="15" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
            
     </tr>
     	<tr>
  		  
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        		 <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	 
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        		 <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	 
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	
        	
        
  	<td width="12.5%" style="padding-left:15px; padding-right:15px;" ><label>Discount</label></td>
  	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.discount" id="discount" list="usList"  listValue="company" size="15" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
            
     </tr>
     	     	<tr>
  	 
        	  
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        		 <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	 
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        		 <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	 
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	
        	
        		 
        	
        
  	<td width="12.5%" style="padding-left:15px; padding-right:15px;" ><label>Sub&nbsp;Total</label></td>
  	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.total" id="total" list="usList"  listValue="company" size="15" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
            
     </tr>
          	<tr>
  	 	 
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        		 <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	 
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        		 <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	 
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	
        	 
        	 
        
  	<td width="12.5%" style="padding-left:15px; padding-right:15px;" ><label>SGST@</label></td>
  	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.discount" id="discount" list="usList"  listValue="company" size="15" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
            
     </tr>
          	<tr>
  	 	 
        	   
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        		 <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	 
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        		 <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	 
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	
        	
        
  	<td width="12.5%" style="padding-left:15px; padding-right:15px;" ><label>CGST@</label></td>
  	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.discount" id="discount" list="usList"  listValue="company" size="15" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
            
     </tr>
          	<tr>
  	 	  
        	 	 <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	 
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        		 <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	 
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	
        	 <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	 
        	 
        
  	<td width="12.5%" style="padding-left:15px; padding-right:15px;" ><label>IGST@</label></td>
  	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.discount" id="discount" list="usList"  listValue="company" size="15" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
            
     </tr>
  <tr>
   
        	 
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	
  	<td width="12.5%" style="padding-left:15px; padding-right:15px;" ><label>Total&nbsp;on&nbsp;Rs.</label></td>
  	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.totalamtrs" id="totalamtrs" list="usList"  listValue="company" size="15" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
     	 
        	 
     	<td width="12.5%" style="padding-left:15px; padding-right:15px;" ><label>Gst&nbsp;Amount</label></td>
  	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.gstamount" id="gstamount" list="usList"  listValue="company" size="15" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
          <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
  <td width="12.5%" style="padding-left:100px;" align="right" ><label>Rounded&nbsp;Off</label></td>  
  	<td width="12.5%" style="padding-left:100px; " valign="top"><div style="width:100px"><s:radio theme="simple" name="formbean.gstamount" id="gstamount" list="#{'1':'yes','0':'No'}"  cssStyle="height:12px;border:1px solid #ccc;background:#FFFF99; width:15px"  tabindex="5"></s:radio></div></td>
    
<td width="12.5%" style="padding-left:150px;" ><label>Add</label></td>
  	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.add" id="add" list="usList"  listValue="company" size="15" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
    
      </tr>
    <tr>
            <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	   <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	   <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	   <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	   <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        		
  	<td width="12.5%" style="padding-left:15px; padding-right:15px;" ><label>Net&nbsp;Amount</label></td>
  	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.netamount" id="netamount" list="usList"  listValue="company" size="15" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
    
    </tr>
  	
  	</table>
  </fieldset>
  
  
   <div align="right" style="width:99%;position:relative;  padding:7px;">
    <s:submit name="formbean.save" value="Save" cssClass="butStnd" onclick="change1();" ></s:submit>
  </div>
   	 
   	  
     
      
      
      

      
    </s:form>
  </fieldset>
  
 
  
	
	<%-- <p>&nbsp;</p>
	<s:if test="usList1">
	<div id="ram">
	<display:table id="table"  name="usList1" pagesize="25"  class="imagetable" requestURI=""     export="true" style="width:75%;color:#000">
	    
	 <s:if test="%{#attr.table.id == formbean.id}">
	
	<display:column property="desc1"   title="Description" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="shortname"   title="Short Name"  style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable"/>
	
	<display:column property="company"   title="Company" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column title="Update" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
    <a href="<s:url action="materialgroupupdate" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color:  #fff;text-decoration:none;font-size:12px;" class="classname">Update</a>
    </display:column>
    
    <display:column title="Delete" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
    <a href="<s:url action="materialgroupdelete" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color:  #fff;text-decoration:none;font-size:12px;" class="print" onclick="return confirmation();">Delete</a>
    </display:column>
	</s:if>
	<s:else>
	
	<display:column property="desc1"   title="Description" style="background-color:#fff;"   sortable="false" headerClass="sortable" />
	
	<display:column property="shortname"   title="Short Name"  style="background-color:#fff;"   sortable="false" headerClass="sortable"/>
	
	<display:column property="company"   title="Company" style="background-color:#fff;"   sortable="false" headerClass="sortable" />
	
	<display:column title="Update" media="html" style="text-align: center;width:8%;background-color:#fff;" >
    <a href="<s:url action="materialgroupupdate" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color:#fff;text-decoration:none;font-size:12px;" class="classname">Update</a>
    </display:column>
    
    <display:column title="Delete" media="html" style="text-align: center;width:8%;background-color:#fff;" >
    <a href="<s:url action="materialgroupdelete" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color: #fff;text-decoration:none;font-size:12px;" class="print" onclick="return confirmation();">Delete</a>
    </display:column>
    
	</s:else> 
	   
    </display:table>
    </div>
	</s:if>
	 --%>
  <br/>
  
 
    
    <!--<script language="javascript" type="text/javascript">
//<![CDATA[
	setFilterGrid("table");
//]]>
</script>-->
          
   
</center></body>
</html>
