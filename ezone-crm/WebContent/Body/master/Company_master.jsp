<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Company Master</title>
<script language="javascript" type="text/javascript" src="js/tablefilter.js"></script>
<link rel="stylesheet" href="css/style2.css" />
<link rel="stylesheet" href="./css/draftbutton.css" />
<link rel="stylesheet" href="./css/printbutton.css" />
<link rel="stylesheet" href="css/breadcumbs.css" ></link>
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
	function Validate() {
		//var a = document.getElementById('scode');
		var b = document.getElementById('name');
		var c = document.getElementById('phone');
		var d = document.getElementById('email');
		
		/*if ((a.value == null) || (a.value == "")) {
			alert("Please Enter Company Code");
			a.focus();
			return false;
		}*/

		if ((b.value == null) || (b.value == "")) {
			alert("Please Enter Company Name");
			b.focus();
			return false;
		}
			
		if ((c.value == null) || (c.value == ""))
		{
			alert("Please Enter Phone No");
			c.focus();
			return false;
		}
		
		if ((d.value == null) || (d.value == ""))
		{
			alert("Please Enter Email");
			d.focus();
			return false;
		}
		else {
			if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(d.value) == true) 
			{

			} 
			else {
				alert("You have entered an invalid email address!")
				d.focus();
				return false;
			}
		}
		return true;

	}
	
	function isNumberKey(evt)
	{
	   var charCode = (evt.which) ? evt.which : event.keyCode
	   if (charCode > 31 && (charCode < 48 || charCode > 57))
	      return false;

	   return true;
	}
</script>

<script type="text/javascript">


function confirmation()
{
	
	//alert();
	var x= '';
	
	
	var r = confirm("Are You sure to delete this company record");
	
	if (r == true) 
	{
		var m=document.getElementById('comcode').value;
		//alert('m: '+m);
		if(m==1)
		{
			alert("Brand is Already Tag With this Company, So Please Realease the Brand First to proceed this operation");
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
	var xmlHttp1;
	var xmlHttp1;
	var x1='';
	function comrecordcheck(a) {
		//alert(a);
		if (typeof XMLHttpRequest != "undefined") {
			xmlHttp1 = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			xmlHttp1 = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (xmlHttp1 == null) {
			alert("Browser does not support XMLHTTP Request");
			return;
		}
		
		var url = "./Body/deletemaster/comrecordcheck.jsp";
		url += "?comcode=" + a; // + "&sec=" + s;
		//url +="?count=" +str+"&date1="+s;
		xmlHttp1.onreadystatechange = codeAdd;
		xmlHttp1.open("GET", url, true);
		xmlHttp1.send(null);
		//alert('Are You Sure Want To Delete This Data!!!');
		
	}

	function codeAdd() {
		if (xmlHttp1.readyState == 4 || xmlHttp1.readyState == "complete") {

			//alert(xmlHttp1.responseText);
			x1=xmlHttp1.responseText;
			document.getElementById('comcode').value=x1;
			//avi(x);
			//alert(x);
			//comfirmation(x);
			
		
		}
		
		
	};
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
<li >Company Creation</li>
</ul>
</div>

<s:if test="hasActionMessages()">
<div class="welcome">
<s:actionmessage/>
</div>
</s:if>
    
  <fieldset style="width:80%; border:solid thin #c6d5e1;Padding:5px;">
  <legend style="color:red;"><h3>Company Creation</h3></legend>
  
  <s:form action="companycreation" namespace="/" method="post">
  <input type="hidden" name="comcode" id="comcode"/>
  <input type="hidden" name="formbean.id" value="<s:property value="formbean.id"/>"/>
  <input type="hidden" name="formbean.scode" id="scode" value="<s:property value="formbean.scode"/>"/>
  <table width="80%" style="padding:10px;" >
	
	 <tr>
	    <td width="12.5%" style="padding-left:15px; padding-right:15px;">Company_Name</td>
       	<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.name"  id="name" size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" tabindex="2"></s:textfield></td>
      	<td width="12.5%" style="padding-left:15px; padding-right:15px;">Address_Line1</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.address" id="address"  size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" tabindex="5"></s:textfield></td>     
        <td width="12.5%" style="padding-left:15px; padding-right:15px;">Office_Phoneno</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.pon" id="phone"  size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onkeypress="return isNumberKey(event)" maxlength="10" tabindex="8"></s:textfield></td>
                
	 </tr>
      <tr>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;">Product_Support</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.remarks" id="remarks"  size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" tabindex="3"></s:textfield></td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;">Address_Line2</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.address2" id="address2"  size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" tabindex="6"></s:textfield></td>                
		<td width="12.5%" style="padding-left:15px; padding-right:15px;">Mobile_No.</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.mobile" id="mobile"  size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" tabindex="9"></s:textfield></td>
               			  
       </tr>
       
       <tr>
		<td width="12.5%" style="padding-left:15px; padding-right:15px;">CSM_Name</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.cperson" id="cperson"  size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" tabindex="4"></s:textfield></td>        	    
        <td width="12.5%" style="padding-left:15px; padding-right:15px;">Email_Id</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.email" id="email"  size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" tabindex="7"></s:textfield></td>
        	        
       </tr>
                   
    </table>
    <br/>
   	  <div align="center" style="width:100%; position:relative;border-bottom:solid thin #c6d5e1;">
      </div>
      <div align="right" style="width:99%;position:relative;padding:7px;">
      	<s:submit name="formbean.save" value="Save Company" cssClass="butStnd" onclick="return Validate()" tabindex="10"></s:submit>
      </div>
    </s:form> 
  </fieldset>
	
	<p>&nbsp;</p>
	<s:if test="usList">
	
	<display:table id="table"  name="usList" pagesize="25"  class="imagetable" requestURI=""  defaultsort="1" defaultorder="ascending"  export="false" style="width:85%;color:#000">
	    
	 <s:if test="%{#attr.table.id == formbean.id}">
	

    <display:column property="name"   title="Company Name"  style="background-color:#ecf2f6;"  sortable="false" headerClass="sortable" />
    <display:column property="address"   title="Address Line1"  style="background-color:#ecf2f6;"  sortable="false" headerClass="sortable" />
    <display:column property="address2"   title="Address Line2"  style="background-color:#ecf2f6;"  sortable="false" headerClass="sortable" />
    <display:column property="pon"   title="Office Phoneno" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	<display:column property="cperson"   title="CSM Name" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	<display:column property="mobile"   title="Mobile No." style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	<display:column property="email"   title="Email ID"  style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable"/> 
	<display:column property="remarks"   title="Product Support"  style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable"/>
	
	<display:column title="Update" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
    <a href="<s:url action="companyupdate" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color:  #fff;text-decoration:none;font-size:12px;" class="classname">Update</a>
    </display:column>
    
    <display:column title="Delete" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
    <a href="<s:url action="companydelete" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color:  #fff;text-decoration:none;font-size:12px;" class="print" onclick="comrecordcheck('%{#attr.table.id}');">Delete</a>
    </display:column>
	</s:if>
	<s:else>
		 
 	<display:column property="name"   title="Company Name"  style="background-color:#fff;"  sortable="false" headerClass="sortable" />
	<display:column property="address"   title="Address Line1"  style="background-color:#fff;"  sortable="false" headerClass="sortable" />
    <display:column property="address2"   title="Address Line2"  style="background-color:#fff;"  sortable="false" headerClass="sortable" />
 	<display:column property="pon"   title="Office Ph.No" style="background-color:#fff;"   sortable="false" headerClass="sortable" />   
	<display:column property="cperson"   title="CSM Name"  style="background-color:#fff;"  sortable="false" headerClass="sortable" />
	<display:column property="mobile"   title="Mobile No" style="background-color:#fff;"   sortable="false" headerClass="sortable" />
	<display:column property="email"   title="Email ID"  style="background-color:#fff;"   sortable="false" headerClass="sortable"/>
	<display:column property="remarks"   title="Product Support"  style="background-color:#fff;"   sortable="false" headerClass="sortable"/>
		
	<display:column title="Update" media="html" style="text-align: center;width:8%;background-color:#fff;" >
    <a href="<s:url action="companyupdate" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color:#fff;text-decoration:none;font-size:12px;" class="classname">Update</a>
    </display:column>
    
    <display:column title="Delete" media="html" style="text-align: center;width:8%;background-color:#fff;" >
    <a href="<s:url action="companydelete" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color: #fff;text-decoration:none;font-size:12px;" class="print" onclick="comrecordcheck('<s:property value="%{#attr.table.scode}"/>');return confirmation();">Delete</a>
    </display:column>
    
	</s:else> 
	   
    </display:table>
	</s:if>
	
  <br/> 
   
    <!--<script language="javascript" type="text/javascript">
//<![CDATA[
	setFilterGrid("table");
//]]>+

</script>-->
             
</center></body>
</html>