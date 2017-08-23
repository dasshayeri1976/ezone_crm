<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Product Master</title>
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
		
//		if ((a.value == null) || (a.value == "")) {
//			alert("Please Enter Product Code");
//			a.focus();
//			return false;
//		}

		if ((b.value == null) || (b.value == "")) {
			alert("Please Enter Product Name");
			b.focus();
			return false;
		}
		return true;

	}
	
</script>

<script>
function confirmation()
{
	
	//alert();
	var x= '';
	
	
	var r = confirm("Are You sure to delete this company record");
	
	if (r == true) 
	{
		var m=document.getElementById('productcode').value;
		//alert('m: '+m);
		if(m==1)
		{
			alert("Product is Already Tag With Model data, So Operation Cannot be proceed");
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
	function productrecordcheck(a) {
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
		
		var url = "./Body/deletemaster/productrecordcheck.jsp";
		url += "?productcode=" + a; // + "&sec=" + s;
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
			document.getElementById('productcode').value=x1;
			//avi(x);
			//alert(x1);
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
<li >Product Creation</li>
</ul>
</div>

<s:if test="hasActionMessages()">
<div class="welcome">
<s:actionmessage/>
</div>
</s:if>
    
  <fieldset style="width:55%; border:solid thin #c6d5e1;Padding:5px;">
  <legend style="color:red;"><h3>Product Creation</h3></legend>
  
  <s:form action="productcreation" namespace="/" method="post">
  <input type="hidden" name="productcode" id="productcode"/>
  <input type="hidden" name="formbean.id" value="<s:property value="formbean.id"/>"/>
  <input type="hidden" name="formbean.scode" value="<s:property value="formbean.scode"/>"/>
  
  <table width="50%" style="padding:10px;" >
	
	 <tr>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;">Product_Name</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.name" id="name"  size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" tabindex="1"></s:textfield></td>	
        <td width="12.5%" style="padding-left:15px; padding-right:15px;">Short_Name</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.sname" id="sname"  size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" tabinex="2"></s:textfield></td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;">Support_Type</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:select name="formbean.pcode" id="pcode" list="#{'':'', 'CARRY IN':'CARRY IN', 'ON SITE':'ON SITE'}" cssStyle=" border:1px solid #ccc;height:20px;background:#FFFF99;width:110px;" tabindex="3"></s:select></td>
    </tr>
    <tr>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;">Service_harges</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.amount" id="amount"  size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" tabinex="4"></s:textfield></td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;">Inspection_charges</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.icharge" id="icharge"  size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" tabinex="5"></s:textfield></td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
    
     </tr>
           
    </table>
    <br/>
   	  <div align="center" style="width:100%; position:relative;border-bottom:solid thin #c6d5e1;">
      </div>
      <div align="right" style="width:99%;position:relative;padding:7px;">
        
      	<s:submit name="formbean.save" value="Save Product" cssClass="butStnd" onclick="return Validate()" ></s:submit>
        
      </div>
      
    </s:form> 
  </fieldset>
	
	<p>&nbsp;</p>
	<s:if test="usList">
	
	<display:table id="table"  name="usList" pagesize="25"  class="imagetable" requestURI=""  defaultsort="2" defaultorder="ascending"  export="true" style="width:50%;color:#000">
	    
	 <s:if test="%{#attr.table.id == formbean.id}">
	 
    <display:column property="name"   title="Product Name" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="sname"   title="Short_Name" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="pcode"   title="Support Type" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="amount"   title="Service Charge" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="icharge"   title="Inspection Charge" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column title="Update" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
    <a href="<s:url action="productupdate" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color:  #fff;text-decoration:none;font-size:12px;" class="classname">Update</a>
    </display:column>
    
    <display:column title="Delete" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
    <a href="<s:url action="productdelete" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color:  #fff;text-decoration:none;font-size:12px;" class="print" onclick="return confirmation();">Delete</a>
    </display:column>
	</s:if>
	<s:else>
		 
    <display:column property="name"   title="Product Name" style="background-color:#fff;"   sortable="false" headerClass="sortable" />
	
	<display:column property="sname"   title="Short_Name" style="background-color:#fff;"   sortable="false" headerClass="sortable" />
	
	<display:column property="pcode"   title="Support Type" style="background-color:#fff;"   sortable="false" headerClass="sortable" />
	
	<display:column property="amount"   title="Service Charge" style="background-color:#fff;"   sortable="false" headerClass="sortable" />
	
	<display:column property="icharge"   title="Inspection Charge" style="background-color:#fff;"   sortable="false" headerClass="sortable" />
		
	<display:column title="Update" media="html" style="text-align: center;width:8%;background-color:#fff;" >
    <a href="<s:url action="productupdate" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color:#fff;text-decoration:none;font-size:12px;" class="classname">Update</a>
    </display:column>
    
    <display:column title="Delete" media="html" style="text-align: center;width:8%;background-color:#fff;" >
    <a href="<s:url action="productdelete" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color: #fff;text-decoration:none;font-size:12px;" class="print" onclick="productrecordcheck('<s:property value="%{#attr.table.scode}"/>');return confirmation();">Delete</a>
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