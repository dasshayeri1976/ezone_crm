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
 
 <script language="javascript" type="text/javascript">	
	function change2()
{
	//alert("hello");
	
	
	var y=document.getElementsByClassName("nameofitems");
	var x=document.getElementsByClassName("nameofitems1");
	
	 var n=document.getElementsByClassName("case4");
	var m=document.getElementsByClassName("case5"); 
	
	var p=document.getElementsByClassName("pcs4");
	var o=document.getElementsByClassName("pcs5"); 
	
	var r=document.getElementsByClassName("fp");
	var q=document.getElementsByClassName("fp1"); 
	
	var t=document.getElementsByClassName("mrp4");
	var s=document.getElementsByClassName("mrp5");
	
	 var v=document.getElementsByClassName("rate");
	var u=document.getElementsByClassName("rate4"); 
	
	var b=document.getElementsByClassName("discs");
	var a=document.getElementsByClassName("discs4"); 
	
	var d=document.getElementsByClassName("dis");
	var c=document.getElementsByClassName("dis4"); 
	
	var f=document.getElementsByClassName("amount4");
	var e=document.getElementsByClassName("amount5");
	
	alert(y.length);
	

	for(var i=0;i<=y.length;i++)
		{
		x[i].value=y[i].value;
		m[i].value=n[i].value;
		o[i].value=p[i].value;
		q[i].value=r[i].value;
		s[i].value=t[i].value;
		u[i].value=v[i].value;
		a[i].value=b[i].value;
		c[i].value=d[i].value;
		e[i].value=f[i].value;
		
		
		
		
		}
	
	
	
}
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
<li >Sales Memo Entry</li>
</ul>
</div>

<s:if test="hasActionMessages()">
<div class="welcome">
<s:actionmessage/>
</div>
</s:if>
    
  <fieldset style="width:40%; border:solid thin #c6d5e1;Padding:5px;">
  <legend style="color:red;">ENTRY OF CASH/CREDIT MEMO FOR SALES(OUTSIDE)</legend>
  
  <s:form action="salesmemocreation1" namespace="/" method="post" autocomplete="off">
  <input type="hidden" name="formbean.id" value="<s:property value="formbean.id"/>"/>
  
  <table cellpadding="5" width="50%" style="padding:5px">  
 
  		
       	
       	<tr>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><label>Name&nbsp;Of&nbsp;Area</label></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.nameofarea" id="nameofarea" cssClass="nameofarea"  size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
        
          <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
   
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><label>Date</label></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><sj:datepicker name="formbean.date" id="date" size="20" buttonImageOnly="true" displayFormat="yy-mm-dd" showButton="false"  changeYear="true" changeMonth="true" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onclick="view();"/></td></tr>
        
        
         	<tr>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><label>Salesman&nbsp;Name</label></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.salesmanname" id="salesmanname"  size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
            
            <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
      </tr>
       
         	<tr>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><label>Retailer&nbsp;Name</label></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.retailername" id="retailername" cssClass="retailername" size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
            <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
            <td width="12.5%" style="padding-left:15px; padding-right:15px;"><label>Memo.&nbsp;no</label></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.memo" id="memo"  size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
            
       
        </tr>
      
         <tr>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><label>Address</label></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.address" id="address" cssClass="address"  size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
             <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        
       </tr>
         
         
       
       </table>
   
  
   
   
 
        
   
   
   
 
   
   
   <fieldset style="width:30%; border:solid thin #c6d5e1;Padding:5px;">
    <legend style="color:red;"><h3>press alt-A for Account creation</h3></legend>
	<table cellspacing="0" border="0" width="50%" id='table111'>
	
	<!--  <tr  style="background-color:#4292b2;color:white;" align="center">        
    
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
       -->  
    
	 <tr style="background-color:#4292b2;color:white;" align="center">        
    
        <th  width="2%"></th>
        <th width="9%" style="font-size:11.2px">Name Of Items</th>
        <th width="9%" style="font-size:11.2px">  CASE</th>     
        <th width="9%" style="font-size:11.2px">PCS</th>
        <th width="9%" style="font-size:11.2px">F/P</th>
        <th width="9%" style="font-size:11.2px">M.R.P</th>     
        <th width="9%" style="font-size:11.2px">RATE</th>
        <th width="9%" style="font-size:11.2px">DIS/CS</th>
        <th width="9%" style="font-size:11.2px">DIS.%</th>
        <th width="9%" style="font-size:11.2px">AMOUNT</th>
        
    </tr>
      <s:if test="%{formbean==null}">
    <tr>
    
        <td  width="2%"><input type="checkbox" name="chk"/></td>
        
        
        <td width="9%" style="font-size:14px"><s:textfield name="formbean.nameofitems" id="nameofitems"  cssClass="nameofitems" size="50" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;" ></s:textfield></td>
		
		
        <td width="9%" style="font-size:14px"><s:textfield name="formbean.case4" id="case4" cssClass="case4" size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onfocusout="PersonViewModel(this);setcpartcode();setcdesccode();setcmakecode();"></s:textfield></td>	    

		
        <td width="9%" style="font-size:14px"><s:textfield name="formbean.pcs4" id="pcs4" cssClass="pcs4"  size="8" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>
        
        
        <td width="9%" style="font-size:14px"><s:textfield name="formbean.fp" id="fp" cssClass="fp"  size="14" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onkeyup="unitratte();"></s:textfield></td>
        	 
        
        <td width="9%" style="font-size:14px"><s:textfield name="formbean.mrp4" id="mrp4" cssClass="mrp4" size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onfocusout="PersonViewModel(this);amountt();"></s:textfield></td>
        
         <td width="9%" style="font-size:14px"><s:textfield name="formbean.rate" id="rate" cssClass="rate"  size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onkeyup="unitratte();"></s:textfield></td>
        	 
        
        <td width="9%" style="font-size:14px"><s:textfield name="formbean.discs" id="discs" cssClass="discs" size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onfocusout="PersonViewModel(this);amountt();"></s:textfield></td>
        	 
   	   <td width="9%" style="font-size:14px"><s:textfield name="formbean.dis" id="dis" cssClass="dis"  size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onkeyup="unitratte();"></s:textfield></td>
        	 
        
        <td width="9%" style="font-size:14px"><s:textfield name="formbean.amount4" id="amount4" cssClass="amount4" size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onfocusout="PersonViewModel(this);amountt();"></s:textfield></td>
       	 
       
       </tr>
    </s:if>
    <s:else>
     <s:iterator value="formbean.nameofitems" status="status">
     	 <tr>
    
    
    
        <td  width="2%"><input type="checkbox" name="chk"/></td>
        
        
        <td width="9%" style="font-size:14px"><s:textfield name="formbean.nameofitems[%{#status.count-1}]" id="nameofitems"  cssClass="nameofitems" size="50" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;" ></s:textfield><input type="hidden" name="formbean.nameofitems1" id="nameofitems1" class="nameofitems1"></input></td>
		
		
        <td width="9%" style="font-size:14px"><s:textfield name="formbean.case4[%{#status.count-1}]" id="case4" cssClass="case4" size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onfocusout="PersonViewModel(this);setcpartcode();setcdesccode();setcmakecode();"></s:textfield><input type="hidden" name="formbean.case5" id="case5" class="case5"></input></td>	    

		
        <td width="9%" style="font-size:14px"><s:textfield name="formbean.pcs4[%{#status.count-1}]" id="pcs4" cssClass="pcs4"  size="8" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield><input type="hidden" name="formbean.pcs5" id="pcs5" class="pcs5"></input></td>
        
        
        <td width="9%" style="font-size:14px"><s:textfield name="formbean.fp[%{#status.count-1}]" id="fp" cssClass="fp"  size="14" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onkeyup="unitratte();"></s:textfield><input type="hidden" name="formbean.fp1" id="fp1" class="fp1"></input></td>
        	 
        
        <td width="9%" style="font-size:14px"><s:textfield name="formbean.mrp4[%{#status.count-1}]" id="mrp4" cssClass="mrp4" size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onfocusout="PersonViewModel(this);amountt();"></s:textfield><input type="hidden" name="formbean.mrp5" id="mrp5" class="mrp5"></input></td>
        
         <td width="9%" style="font-size:14px"><s:textfield name="formbean.rate[%{#status.count-1}]" id="rate" cssClass="rate"  size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onkeyup="unitratte();"></s:textfield><input type="hidden" name="formbean.rate4" id="rate4" class="rate4"></input></td>
        	 
        
        <td width="9%" style="font-size:14px"><s:textfield name="formbean.discs[%{#status.count-1}]" id="discs" cssClass="discs" size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onfocusout="PersonViewModel(this);amountt();"></s:textfield><input type="hidden" name="formbean.discs4" id="discs4" class="discs4"></input></td>
        	 
   	   <td width="9%" style="font-size:14px"><s:textfield name="formbean.dis[%{#status.count-1}]" id="dis" cssClass="dis"  size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onkeyup="unitratte();"></s:textfield><input type="hidden" name="formbean.dis4" id="dis4" class="dis4"></input></td>
        	 
        
        <td width="9%" style="font-size:14px"><s:textfield name="formbean.amount4[%{#status.count-1}]" id="amount4" cssClass="amount4" size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onfocusout="PersonViewModel(this);amountt();"></s:textfield><input type="hidden" name="formbean.amount5" id="amount5" class="amount5"></input></td>
       	 
      
    
    <%-- 
        <td  width="2%"><input type="checkbox" name="chk"/></td>
        
         <td width="5%"><s:textfield name="formbean.nameofitems[%{#status.count-1}]" id="nameofitems" cssClass="nameofitems" size="50"  cssStyle="display:none;height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield><input type="hidden" name="formbean.nameofitems1" id="nameofitems1" class="nameofitems1"></input></td>               
        
        <td width="9%" style="font-size:14px"><s:textfield name="formbean.case4[%{#status.count-1}]" id="case4" cssClass="case4" size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;" ></s:textfield><input type="hidden" name="formbean.case5" id="case5" class="case5"></input></td>
		
		
        <td width="9%" style="font-size:14px"><s:textfield name="formbean.pcs4[%{#status.count-1}]" id="pcs4" cssClass="pcs4" size="8" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onfocusout="PersonViewModel(this);setcpartcode();setcdesccode();setcmakecode();"></s:textfield><input type="hidden" name="formbean.pcs5" id="pcs5" class="pcs5"></input></td>	    

		
        <td width="9%" style="font-size:14px"><s:textfield name="formbean.fp[%{#status.count-1}]" id="fp" cssClass="fp"  size="14" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ><input type="hidden" name="formbean.fp1" id="fp1" class="fp1"></s:textfield></td>
        
        
        <td width="9%" style="font-size:14px"><s:textfield name="formbean.mrp4[%{#status.count-1}]" id="mrp4" cssClass="mrp4"  size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onkeyup="unitratte();"></s:textfield><input type="hidden" name="formbean.mrp5" id="mrp5" class="mrp5"></input></td>
        	 
        
        <td width="9%" style="font-size:14px"><s:textfield name="formbean.rate[%{#status.count-1}]" id="rate" cssClass="rate" size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onfocusout="PersonViewModel(this);amountt();"></s:textfield><input type="hidden" name="formbean.rate4" id="rate4" class="rate4"></input></td>
          <td width="9%" style="font-size:14px"><s:textfield name="formbean.discs[%{#status.count-1}]" id="discs" cssClass="discs" size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onfocusout="PersonViewModel(this);amountt();"></s:textfield><input type="hidden" name="formbean.discs4" id="discs4" class="discs4"></td>
        	 
   	   <td width="9%" style="font-size:14px"><s:textfield name="formbean.dis[%{#status.count-1}]" id="dis" cssClass="dis"  size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onkeyup="unitratte();"></s:textfield><input type="hidden" name="formbean.dis4" id="dis4" class="dis4"></td>
        	 
        
        <td width="9%" style="font-size:14px"><s:textfield name="formbean.amount4[%{#status.count-1}]" id="amount4" cssClass="amount4" size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onfocusout="PersonViewModel(this);amountt();"></s:textfield><input type="hidden" name="formbean.amount5" id="amount5" class="amount5"></td>
       	 
    --%>    	 
       	 	 	 	        
       </tr>
     </s:iterator>
    </s:else>   
       
      
	</table> 
	
	     <div align="center" style="width:100%; position:relative;border-bottom:solid thin #c6d5e1;"></div>
   	  
       <div align="right" style="width:99%;position:relative;  padding:6px;">
       <input type="button" value="add" Class="butStnd" onclick="addRow('table111');genSerial();incr();"/>
       <input type="button" value="delete" Class="butStnd" onclick="deleteRow('table111');"/>
	
	
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
        	<%-- <td width="12.5%" style="padding-left:15px; padding-right:15px;"  colspan="7"><sj:autocompleter name="formbean.totalamt" id="totalamt" cssClass="totalamt"  size="10" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></sj:autocompleter></td>
 --%>      <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.totalamt" id="totalamt" cssClass="totalamt"  size="10" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>
          
      
        </tr>
        
   <tr>
   
   <td width="12.5%" style="padding-left:15px; padding-right:15px;" align="right"><label>Packing</label></td>
        	<%-- <td width="12.5%" style="padding-left:15px; padding-right:15px;" align="right"><sj:autocompleter name="formbean.packing" id="packing" cssClass="packing"  size="10" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" ></sj:autocompleter></td>
    --%>   <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.packing" id="packing" cssClass="packing"  size="10" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>
          	
        
           <td width="12.5%" style="padding-left:15px; padding-right:15px;"><label>Case</label></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.casee" id="casee" cssClass="casee"  size="10" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>
          	
          	
          	 <td width="12.5%" style="padding-left:15px; padding-right:15px;"><label>Pcs</label></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.pcss" id="pcss" cssClass="pcss" size="10" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>
        
            <td width="12.5%" style="padding-left:15px; padding-right:15px;"><label>Total</label></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.total" id="total" cssClass="total"   size="10" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>
          
        	   	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"  colspan="7"><label>Total&nbsp;Discount</label></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;" colspan="7"><sj:autocompleter name="formbean.discount" id="discount" cssClass="discount"  size="10" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></sj:autocompleter></td>
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
  	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.gamount" id="gamount"  size="15" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
            
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
  	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.discount1" id="discount1"  size="15" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
            
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
  	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.subtotal" id="subtotal" cssClass="subtotal"  size="15" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
            
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
  	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.sgst" id="sgst"  cssClass="sgst"  size="15" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
            
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
  	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.cgst" id="cgst" cssclass="cgst"  size="15" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
            
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
  	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.igst" id="igst" csslass="igst"  size="15" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
            
     </tr>
  <tr>
   
        	 
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	
  	<td width="12.5%" style="padding-left:15px; padding-right:15px;" ><label>Total&nbsp;on&nbsp;Rs.</label></td>
  	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.totalamtrs" id="totalamtrs"  size="15" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
     	 
        	 
     	<td width="12.5%" style="padding-left:15px; padding-right:15px;" ><label>Gst&nbsp;Amount</label></td>
  	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.gstamount" id="gstamount"  size="15" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
          <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
  <td width="12.5%" style="padding-left:100px;" align="right" ><label>Rounded&nbsp;Off</label></td>  
  	<td width="12.5%" style="padding-left:100px; " valign="top"><div style="width:100px"><s:radio theme="simple" name="formbean.roundoff" id="roundoff"  cssClass="roundoff" list="#{'1':'yes','0':'No'}"  cssStyle="height:12px;border:1px solid #ccc;background:#FFFF99; width:15px"  tabindex="5"></s:radio></div></td>
    
<td width="12.5%" style="padding-left:150px;" ><label>Add</label></td>
  	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.add" id="add"  size="15" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
    
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
  	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.netamount" id="netamount"  size="15" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false"></s:textfield></td>
    
    </tr>
  	
  	</table>
  </fieldset>
  
  
   <div align="right" style="width:99%;position:relative;  padding:7px;">
    <s:submit name="formbean.save" value="Save" cssClass="butStnd" onclick="change2();" ></s:submit>
  </div>
   	 
   	  
     
      
      
      

      
    </s:form>
  </fieldset>
  
 
  
	
	 <p>&nbsp;</p>
	<s:if test="usList1">
	<div id="ram">
	<display:table id="table111"  name="usList1" pagesize="25"  class="imagetable" requestURI=""     export="true" style="width:75%;color:#000">
	    
	 <s:if test="%{#attr.table111.id == formbean.id}">
	
	<display:column property="nameofarea"   title="Name of Area" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="salesmanname"   title="Salesman Name"  style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable"/>
	
	<display:column property="retailername"   title="Retailer Name" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="memo"   title="Memo no" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	
	<display:column title="Update" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
    <a href="<s:url action="salesmemoupdate1" namespace="/" ><s:param  name="id" value="%{#attr.table111.id}"></s:param></s:url>" style="color:  #fff;text-decoration:none;font-size:12px;" class="classname">Update</a>
    </display:column>
    
    <display:column title="Delete" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
    <a href="<s:url action="salesmemodelete1" namespace="/" ><s:param  name="id" value="%{#attr.table111.id}"></s:param></s:url>" style="color:  #fff;text-decoration:none;font-size:12px;" class="print" onclick="return confirmation();">Delete</a>
    </display:column>
	</s:if>
	<s:else>
	
	<display:column property="nameofarea"   title="Name of Area" style="background-color:#fff;"   sortable="false" headerClass="sortable" />
	
	<display:column property="salesmanname"   title="Salesman Name"  style="background-color:#fff;"   sortable="false" headerClass="sortable"/>
	
	<display:column property="retailername"   title="Retailer Name" style="background-color:#fff;"   sortable="false" headerClass="sortable" />
	<display:column property="memo"   title="Memo No" style="background-color:#fff;"   sortable="false" headerClass="sortable" />
	
	
	<display:column title="Update" media="html" style="text-align: center;width:8%;background-color:#fff;" >
    <a href="<s:url action="salesmemoupdate1" namespace="/" ><s:param  name="id" value="%{#attr.table111.id}"></s:param></s:url>" style="color:#fff;text-decoration:none;font-size:12px;" class="classname">Update</a>
    </display:column>
    
    <display:column title="Delete" media="html" style="text-align: center;width:8%;background-color:#fff;" >
    <a href="<s:url action="salesmemodelete1" namespace="/" ><s:param  name="id" value="%{#attr.table111.id}"></s:param></s:url>" style="color: #fff;text-decoration:none;font-size:12px;" class="print" onclick="return confirmation();">Delete</a>
    </display:column>
    
	</s:else> 
	   
    </display:table>
    </div>
	</s:if>
	 
  <br/>
  
 
    
    <!--<script language="javascript" type="text/javascript">
//<![CDATA[
	setFilterGrid("table");
//]]>
</script>-->
          
   
</center></body>
</html>
