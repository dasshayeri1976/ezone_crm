<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Branch Master</title>
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
		var a = document.getElementById('scode');
		var b = document.getElementById('name');
		var c = document.getElementById('address');
		var d = document.getElementById('cperson');
		var e = document.getElementById('email');
		var f = document.getElementById('pon');
		var g = document.getElementById('mobile');
		var h = document.getElementById('city');
		var i = document.getElementById('pcode');

		if ((a.value == null) || (a.value == "")) {
			alert("Please Enter Branch Code");
			a.focus();
			return false;
		}

		if ((b.value == null) || (b.value == "")) {
			alert("Please Enter Branch Name");
			b.focus();
			return false;
		}
		
		
		if ((c.value == null) || (c.value == ""))
		{
			alert("Please Enter Address");
			c.focus();
			return false;
		}
		
		if ((d.value == null) || (d.value == "")) {
			alert("Please Enter Contact Person Name");
			d.focus();
			return false;
		}

		if ((e.value == null) || (e.value == "")) {
			alert("Please Enter Email ID.");
			e.focus();
			return false;
		}
		if ((g.value == null) || (g.value == "")) {
			alert("Please Enter Mobile No.");
			g.focus();
			return false;
		}

		if ((h.value == null) || (h.value == "")) {
			alert("Please Select City Name");
			h.focus();
			return false;
		}

		return true;

	}
	
</script>

<script type="text/javascript">

function seeList(form) {
    var result2 = "";
    var k=0;
    for (var i = 0; i < form.branch.length; i++) {
        if (form.branch.options[i].selected) {
        	if(k>0)
        	{
                result2 += ","+form.branch.options[i].text;
        	}
        	if(k==0)
        	{
            	result2 = form.branch.options[i].text ;
            	k++;
        	}   
           
        }
    }
     document.form1.checkcode.value= result2;
     alert(result2);
     document.getElementById('branchall').value=result2;
}

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
<li >Branch Creation</li>
</ul>
</div>

<s:if test="hasActionMessages()">
<div class="welcome">
<s:actionmessage/>
</div>
</s:if>
    
  <fieldset style="width:80%; border:solid thin #c6d5e1;Padding:5px;">
  <legend style="color:red;">Branch Creation</legend>
  
  <s:form action="branchcreation" namespace="/" method="post">
  <input type="hidden" name="formbean.id" value="<s:property value="formbean.id"/>"/>
  
  <table width="80%" style="padding:10px;" >
	
	 <tr>
      	<td width="12.5%" style="padding-left:15px; padding-right:15px;">Branch_Code</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.scode"  id="scode" size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" readonly="true"></s:textfield></td>

		<td width="12.5%" style="padding-left:15px; padding-right:15px;">City_Name</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:select name="formbean.city" id="city" list="#{'':'', 'DHANBAD':'DHANBAD', 'HAZARIBAG':'HAZARIBAG', 'JAMSHEDPUR':'JAMSHEDPUR','RAMGARH':'RAMGARH', 'RANCHI':'RANCHI' }" cssStyle=" border:1px solid #ccc;height:20px;background:#FFFF99;width:110px;"></s:select></td>
        
        <td width="12.5%" style="padding-left:15px; padding-right:15px;">Phone_No.</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.pon" id="phone"  size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>
        
        
       
      </tr>
      <tr>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;">Branch_Name</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.name" id="name"  size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>

		<td width="12.5%" style="padding-left:15px; padding-right:15px;">District_Name</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.district" id="dictrict"  size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>
                
		<td width="12.5%" style="padding-left:15px; padding-right:15px;">Mobile_No.</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.mobile" id="mobile"  size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>
        		  
       </tr>
       
       <tr>        
        <td width="12.5%" style="padding-left:15px; padding-right:15px;">Address</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.address" id="address"  size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>
		
		<td width="12.5%" style="padding-left:15px; padding-right:15px;">State_Name</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.state" id="state"  size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>	    

		<td width="12.5%" style="padding-left:15px; padding-right:15px;">Postal_Code</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.pcode" id="pcode"  size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>
        	        
       </tr>
       
       <tr> 
        <td width="12.5%" style="padding-left:15px; padding-right:15px;">Contact_Person</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.cperson" id="cperson"  size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>
        
		<td width="12.5%" style="padding-left:15px; padding-right:15px;">EmailId</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.email" id="email"  size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>
           
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
	
	<display:table id="table"  name="usList" pagesize="25"  class="imagetable" requestURI=""  defaultsort="1" defaultorder="descending"  export="false" style="width:85%;color:#000">
	    
	 <s:if test="%{#attr.table.id == formbean.id}">
	 
    <display:column property="name"   title="Branch Name"  style="background-color:#ecf2f6;"  sortable="false" headerClass="sortable" />
	
	<display:column property="cperson"   title="Contact Person" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="email"   title="Email ID"  style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable"/> 
	
    <display:column property="pon"   title="Phone No" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="mobile"   title="Mobile No." style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column title="Update" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
    <a href="<s:url action="branchupdate" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color:  #fff;text-decoration:none;font-size:12px;" class="classname">Update</a>
    </display:column>
    
    <display:column title="Delete" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
    <a href="<s:url action="branchdelete" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color:  #fff;text-decoration:none;font-size:12px;" class="print" onclick="return confirmation();">Delete</a>
    </display:column>
	</s:if>
	<s:else>
		 
    <display:column property="name"   title="Branch Name"  style="background-color:#fff;"  sortable="false" headerClass="sortable" />
	
	<display:column property="cperson"   title="Contact Person"  style="background-color:#fff;"  sortable="false" headerClass="sortable" />
	
	<display:column property="email"   title="Email ID"  style="background-color:#fff;"   sortable="false" headerClass="sortable"/>
	
	<display:column property="pon"   title="Phone No" style="background-color:#fff;"   sortable="false" headerClass="sortable" />
	
	<display:column property="mobile"   title="Mobile No" style="background-color:#fff;"   sortable="false" headerClass="sortable" />
	
	<display:column title="Update" media="html" style="text-align: center;width:8%;background-color:#fff;" >
    <a href="<s:url action="branchupdate" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color:#fff;text-decoration:none;font-size:12px;" class="classname">Update</a>
    </display:column>
    
    <display:column title="Delete" media="html" style="text-align: center;width:8%;background-color:#fff;" >
    <a href="<s:url action="branchdelete" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color: #fff;text-decoration:none;font-size:12px;" class="print" onclick="return confirmation();">Delete</a>
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
