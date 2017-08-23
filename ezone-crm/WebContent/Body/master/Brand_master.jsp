<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Brand Master</title>
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
		var c = document.getElementById('sname');
		
		/*if ((a.value == null) || (a.value == "")) {
			alert("Please Enter Brand Code");
			a.focus();
			return false;
		}*/

		if ((b.value == null) || (b.value == "")) {
			alert("Please Enter Brand Name");
			b.focus();
			return false;
		}
		
		if ((c.value == null) || (c.value == "")) {
			alert("Please Select Company Name");
			c.focus();
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
		var m=document.getElementById('trancode').value;
		//alert('m: '+m);
		if(m==1)
		{
			alert("Brand is Already Tag With transaction data, So Operation Cannot be proceed");
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
	function tranrecordcheck(a) {
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
		
		var url = "./Body/deletemaster/tranrecordcheck.jsp";
		url += "?trancode=" + a; // + "&sec=" + s;
		//url +="?count=" +str+"&date1="+s;
		xmlHttp.onreadystatechange = codeAdd1;
		xmlHttp.open("GET", url, true);
		xmlHttp.send(null);
		//alert('Are You Sure Want To Delete This Data!!!');
		
	}

	function codeAdd1() {
		if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {

			//alert(xmlHttp1.responseText);
			x1=xmlHttp.responseText;
			document.getElementById('trancode').value=x1;
			//avi(x);
			//alert(x);
			//comfirmation(x);
			
		
		}
		
		
	};
</script>


<script language="javascript" type="text/javascript">
	var xmlHttp1;
	var xmlHttp1;

	function ccode() {
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
		var url = "./Body/master/ccode.jsp";
		url += "?count=" + s1; // + "&sec=" + s;
		//url +="?count=" +str+"&date1="+s;
		xmlHttp1.onreadystatechange = codeAdd;
		xmlHttp1.open("GET", url, true);
		xmlHttp1.send(null);

	}

	function codeAdd() {
		if (xmlHttp1.readyState == 4 || xmlHttp1.readyState == "complete") {

			//document.getElementById("pcode").innerHTML = xmlHttp1.responseText;
			document.getElementById("pcode").value = xmlHttp1.responseText;
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
<li >Brand Creation</li>

</ul>
</div>

<s:if test="hasActionMessages()">
<div class="welcome">
<s:actionmessage/>
</div>
</s:if>
    
  <fieldset style="width:55%; border:solid thin #c6d5e1;Padding:5px;">
  <legend style="color:red;"><h3>Brand Creation</h3></legend>
  
  <s:form action="brandcreation" namespace="/" method="post">
  <input type="hidden" name="trancode" id="trancode"/>
  <input type="hidden" name="formbean.id" value="<s:property value="formbean.id"/>"/>
  <input type="hidden" name="formbean.pcode" id="pcode" value="<s:property value="formbean.pcode"/>"/>
  <input type="hidden" name="formbean.scode" id="scode" value="<s:property value="formbean.scode"/>"/>
      
  
  <table width="50%" style="padding:10px;" >
	 <tr>
          
        <td width="12.5%" style="padding-left:15px; padding-right:15px;">Brand_Name</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.name" id="name"  size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" tabindex="1" ></s:textfield></td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;">Company_Name</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:select name="formbean.sname" list="usList1" id="sname" listKey="sname" value="formbean.sname" listValue="sname" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;width:100px;" onchange="ccode();" tabindex="2"/></td>
     
     </tr>
      
    </table>
    <br/>
   	  <div align="center" style="width:100%; position:relative;border-bottom:solid thin #c6d5e1;">
      </div>
      <div align="right" style="width:99%;position:relative;padding:7px;">
        
      	<s:submit name="formbean.save" value="Save Brand" cssClass="butStnd" onclick="return Validate()" ></s:submit>
        
      </div>
      
    </s:form> 
  </fieldset>
	
	<p>&nbsp;</p>
	<s:if test="usList">
	
	<display:table id="table"  name="usList" pagesize="25"  class="imagetable" requestURI=""  defaultsort="2" defaultorder="ascending"  export="true" style="width:50%;color:#000">
	    
	 <s:if test="%{#attr.table.id == formbean.id}">
	 
	<display:column property="name"   title="Brand Name" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="sname"   title="Company Name" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column title="Update" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
    <a href="<s:url action="brandupdate" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color:  #fff;text-decoration:none;font-size:12px;" class="classname">Update</a>
    </display:column>
    
    <display:column title="Delete" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
    <a href="<s:url action="branddelete" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color:  #fff;text-decoration:none;font-size:12px;" class="print" onclick="return confirmation();">Delete</a>
    </display:column>
	</s:if>
	<s:else>
		 
	<display:column property="name"   title="Brand Name"  style="background-color:#fff;"  sortable="false" headerClass="sortable" />
	<display:column property="sname"   title="Company Name"  style="background-color:#fff;"  sortable="false" headerClass="sortable" />
		
	<display:column title="Update" media="html" style="text-align: center;width:8%;background-color:#fff;" >
    <a href="<s:url action="brandupdate" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color:#fff;text-decoration:none;font-size:12px;" class="classname">Update</a>
    </display:column>
    
    <display:column title="Delete" media="html" style="text-align: center;width:8%;background-color:#fff;" >
    <a href="<s:url action="branddelete" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color: #fff;text-decoration:none;font-size:12px;" class="print" onclick="tranrecordcheck('<s:property value="%{#attr.table.scode}"/>');return confirmation();">Delete</a>
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