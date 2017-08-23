<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Employee Master</title>
<script language="javascript" type="text/javascript" src="js/tablefilter.js"></script>
<link rel="stylesheet" href="css/style2.css" />
<link rel="stylesheet" href="./css/draftbutton.css" />
<link rel="stylesheet" href="./css/printbutton.css" />
<link rel="stylesheet" href="css/breadcumbs.css" ></link>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
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
$(document).keydown(function(e)
		{
			var x = e.which || e.keyCode;
			//alert(x);
			if(x=="115")//F4 key pressed
			{
				window.location="jobworklist";
				//alert();
			}
		}); 
	function Validate() {
		//var a = document.getElementById('scode');
		var b = document.getElementById('name');
		var c = document.getElementById('sname');
		var d = document.getElementById('rmobile');
		var e = document.getElementById('pmobile');
		var f = document.getElementById('category');

		if ((b.value == null) || (b.value == "")) {
			alert("Please Enter Customer/Distributor Name");
			b.focus();
			return false;
		}
		
		if ((c.value == null) || (c.value == ""))
		{
			alert("Please Select Place");
			c.focus();
			return false;
		}
			
		 if ((d.value == null) || (d.value == ""))
		{
			alert("Please Enter Phone No.");
			d.focus();
			return false;
		} 
		
			if ((e.value == null) || (e.value == ""))
		{
			alert("Please Enter personnal Mobile no");
			e.focus();
			return false;
		} 
		
		if ((f.value == null) || (f.value == ""))
		{
			alert("Please Select Category");
			f.focus();
			return false;
		}
		return true;
	}
	
	function isNumber(evt) {
	    evt = (evt) ? evt : window.event;
	    var charCode = (evt.which) ? evt.which : evt.keyCode;
	    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
	        return false;
	    }
	    return true;
	}
	
</script>
<script>
$(document).keypress(function(e) {
	var x;
	var url = "jobworklist";
	//url += "?count=" + "receipt"; 
	if(e.which)
	{
		x=e.which;
	}
	  if(e.altKey)
		{
		  if(String.fromCharCode(x)=="c")
			{
			  window.location= url;
			}
		}
	});
</script>
<script>
function confirmation()
{
	
	//alert();
	var x= '';
	
	
	var r = confirm("Are You sure to delete this company record");
	
	if (r == true) 
	{
		var m=document.getElementById('engcode').value;
		//alert('m: '+m);
		if(m==1)
		{
			alert("Engineer is Already Tag With Transaction data, So Operation Cannot be proceed");
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

<script language="javascript" type="text/javascript">
	var xmlHttp;
	var xmlHttp;
	var x1='';
	function engrecordcheck(a) {
		//alert(a);
		if (typeof XMLHttpRequest != "undefined") {
			xmlHttp = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (xmlHttp == null) {
			alert("Browser does not support XMLHTTP Request");
			return;
		}
		
		var url = "./Body/deletemaster/engrecordcheck.jsp";
		url += "?engcode=" + a; // + "&sec=" + s;
		//url +="?count=" +str+"&date1="+s;
		xmlHttp.onreadystatechange = codeAdd1;
		xmlHttp.open("GET", url, true);
		xmlHttp.send(null);
		//alert('Are You Sure Want To Delete This Data!!!');
		
	}

	function codeAdd1() {
		if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {

			//alert(xmlHttp.responseText);
			x1=xmlHttp.responseText;
			document.getElementById('engcode').value=x1;
			//avi(x);
			//alert(x1);
			//comfirmation(x);
			
		}
		
		
	};
</script>

<script language="javascript" type="text/javascript">
	var xmlHttp1;
	var xmlHttp1;

	function placecode() {
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
		var s1 = document.getElementById("sname").value;
		//alert('S1: '+s1);
		//var s = document.getElementById("section").value;
		//var s = document.getElementById("source").value;
		//document.getElementById("newspaperadd").value = s;
		var url = "./Body/master/placecode.jsp";
		url += "?count=" + s1; // + "&sec=" + s;
		//url +="?count=" +str+"&date1="+s;
		xmlHttp1.onreadystatechange = codeAdd;
		xmlHttp1.open("GET", url, true);
		xmlHttp1.send(null);

	}

	function codeAdd() {
		if (xmlHttp1.readyState == 4 || xmlHttp1.readyState == "complete") {

			//document.getElementById("pcode").innerHTML = xmlHttp1.responseText;
			var x=xmlHttp1.responseText;
			x=x.split("-");
			//alert(x[2]);
			document.getElementById("ccode").value = x[0];
			document.getElementById("city").value = x[1];
			document.getElementById("district").value = x[2];
			document.getElementById("state").value = x[3];
			document.getElementById("pcode").value = x[4];
			//alert(document.getElementById("dist").innerHTML);
			//document.getElementById("section1").innerHTML = xmlHttp.responseText;

		}
	}
</script>

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

<div>
<ul id="breadcrumbs">
<li ><a href="#">System Settings</a></li>
<li >Customer/Distributor Creation</li>
</ul>
</div>

<s:if test="hasActionMessages()">
<div class="welcome">
<s:actionmessage/>
</div>
</s:if>
    
  <fieldset style="width:90%; border:solid thin #c6d5e1;Padding:5px;">
  <legend style="color:red;"><h3>Customer/Distributor Creation</h3></legend>
  
  <s:form action="customercreation" namespace="/" method="post">
  <input type="hidden" name="engcode" id="engcode"/>
  <input type="hidden" name="formbean.id" value="<s:property value="formbean.id"/>"/>
  <input type="hidden" name="formbean.ccode" id="ccode" value="<s:property value="formbean.ccode"/>"/>
  <input type="hidden" name="formbean.scode" id="scode" value="<s:property value="formbean.scode"/>"/>
  
  <table width="90%" style="padding:10px;" >
	
	 <tr>
	 		<td width="12.5%" style="padding-left:15px; padding-right:15px;">Cust./Distributor&nbsp;Name</td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.name" id="name"  size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;" tabindex="1"></s:textfield></td>	 
        
	 		<td width="12.5%" style="padding-left:15px; padding-right:15px;">Place</td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:select name="formbean.sname" list="usList1" id="sname" listKey="sname" value="formbean.sname" listValue="sname" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;width:155px;" onchange="placecode();" tabindex="8"/></td>
        
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;">EmailId</td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.email" id="email"  size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;width:153px" tabindex="10"></s:textfield></td>
                
        </tr>
        <tr>
			
			<td width="12.5%" style="padding-left:15px; padding-right:15px;">Address</td>
            <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.address" id="address"  size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" tabindex="4"></s:textfield></td>   
			
			<td width="12.5%" style="padding-left:15px; padding-right:15px;">City Name</td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.city" id="city"  size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" tabindex="9" readonly="true"></s:textfield></td>
	 
          	<td width="12.5%" style="padding-left:15px; padding-right:15px;">Phone No</td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.rmobile" id="rmobile"  size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" tabindex="13" onkeypress="return isNumber(event)"></s:textfield></td>       
        
        </tr>
        <tr>
        	  
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;">Contact Person</td>
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.contact_person" id="contact_person"  size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" tabindex="7"></s:textfield></td>
        	
        	  
        
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;">District Name</td>
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.district" id="district"  size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" tabindex="11" readonly="true"></s:textfield></td>
		
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;">Mobile(Personal)</td>
      	  	  <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.pmobile" id="pmobile"  size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" tabindex="16" onkeypress="return isNumber(event)"></s:textfield></td>
		
       </tr>
        <tr>
        
            <td width="12.5%" style="padding-left:15px; padding-right:15px;">Category</td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:select name="formbean.category" id="category" list="#{'':'', 'CUSTOMER':'CUSTOMER', 'DISTRIBUTOR':'DISTRIBUTOR' }" cssStyle=" border:1px solid #ccc;height:20px;background:#FFFF99;width:195px;" tabindex="12"></s:select></td>
        	 
        
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;">Postal Code</td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.pcode" id="pcode"  size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" tabindex="15" readonly="true"></s:textfield></td>
       
       		<td width="12.5%" style="padding-left:15px; padding-right:15px;">Mobile(Office)</td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.mobile" id="mobile"  size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" tabindex="17" onkeypress="return isNumber(event)"></s:textfield></td>
     
       
       </tr>
       
       <tr>
       		<td></td>
       		<td></td>
       		<td width="12.5%" style="padding-left:15px; padding-right:15px;">State Name</td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.state" id="state"  size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;width:150px" tabindex="14" readonly="true"></s:textfield></td>	    
       			
	   </tr>
	
            
    </table>
    <br/>
   	  <div align="center" style="width:100%; position:relative;border-bottom:solid thin #c6d5e1;">
      </div>
      <div align="right" style="width:99%;position:relative;padding:7px;">
        
      	<s:submit name="formbean.save" value="Save User" cssClass="butStnd" onclick="return Validate()" ></s:submit>
        
      </div>
      
    </s:form> 
  </fieldset>
	
	<p>&nbsp;</p>
	<s:if test="usList">
	
	<display:table id="table"  name="usList" pagesize="25"  class="imagetable" requestURI=""  defaultsort="1"  export="false" style="width:85%;color:#000">
	    
	 <s:if test="%{#attr.table.id == formbean.id}">
	
		 
    <display:column property="name"   title="Customer Name"  style="background-color:#ecf2f6;"  sortable="false" headerClass="sortable" />
	
	<%-- <display:column property="doj"   title="Date Of Joining" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" /> --%>
	
	<display:column property="email"   title="Email ID"  style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable"/> 
	
    <display:column property="mobile"   title="Office M.No" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="pmobile"   title="Personal M.No." style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column title="Update" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
    <a href="<s:url action="customerupdate" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color:  #fff;text-decoration:none;font-size:12px;" class="classname">Update</a>
    </display:column>
    
    <display:column title="Delete" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
    <a href="<s:url action="customerdelete" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color:  #fff;text-decoration:none;font-size:12px;" class="print" onclick="return confirmation();">Delete</a>
    </display:column>
	</s:if>
	<s:else>
	
 
    <display:column property="name"   title="Customer Name"  style="background-color:#fff;"  sortable="false" headerClass="sortable" />
	
	<%-- <display:column property="doj"   title="Date Of joining"  style="background-color:#fff;"  sortable="false" headerClass="sortable" /> --%>
	
	<display:column property="email"   title="Email ID"  style="background-color:#fff;"   sortable="false" headerClass="sortable"/>
	
	<display:column property="mobile"   title="Office.M.No" style="background-color:#fff;"   sortable="false" headerClass="sortable" />
	
	<display:column property="pmobile"   title="Personal M.No" style="background-color:#fff;"   sortable="false" headerClass="sortable" />
	
	<display:column title="Update" media="html" style="text-align: center;width:8%;background-color:#fff;" >
    <a href="<s:url action="customerupdate" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color:#fff;text-decoration:none;font-size:12px;" class="classname">Update</a>
    </display:column>
    
    <display:column title="Delete" media="html" style="text-align: center;width:8%;background-color:#fff;" >
    <a href="<s:url action="customerdelete" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color: #fff;text-decoration:none;font-size:12px;" class="print" onclick="engrecordcheck('<s:property value="%{#attr.table.scode}"/>');return confirmation();">Delete</a>
    </display:column>
    
	</s:else> 
	   
    </display:table>
	</s:if>
	
  <br/>
    
    <!--<script language="javascript" type="text/javascript">
//<![CDATA[
	setFilterGrid("table");
//]]>
</script>-->
          
</center></body>
</html>
