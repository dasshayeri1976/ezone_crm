<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Route Slab Master</title>
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
		var c = document.getElementById('pcode');
		var d = document.getElementById('sname');
		
//		if ((a.value == null) || (a.value == "")) {
//			alert("Please Enter Place Code");
//			a.focus();
//			return false;
//		}

		if ((b.value == null) || (b.value == "")) {
			alert("Please Enter Place Name");
			b.focus();
			return false;
		}
		
	if ((c.value == null) || (c.value == "")) {
			alert("Please Fill-Up PIN No Code");
			c.focus();
			return false;
		}
		
		if ((d.value == null) || (d.value == "")) {
			alert("Please Enter City Name");
			d.focus();
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

<script language="javascript" type="text/javascript">
	var xmlHttp;
	var xmlHttp;
	var x1='';
	function placerecordcheck(a) {
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
		
		var url = "./Body/deletemaster/placerecordcheck.jsp";
		url += "?placecode=" + a; // + "&sec=" + s;
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
			document.getElementById('placecode').value=x1;
			//avi(x);
			//alert(x1);
			//comfirmation(x);
			
		
		}
		
		
	};
</script>


<script language="javascript" type="text/javascript">
	var xmlHttp1;
	var xmlHttp1;

	function citycode() {
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
		var url = "./Body/master/";
		url += "?count=" + s1; // + "&sec=" + s;
		//url +="?count=" +str+"&date1="+s;
		xmlHttp1.onreadystatechange = codeAdd;
		xmlHttp1.open("GET", url, true);
		xmlHttp1.send(null);

	}

	function codeAdd() {
		if (xmlHttp1.readyState == 4 || xmlHttp1.readyState == "complete") {

			//document.getElementById("pcode").innerHTML = xmlHttp1.responseText;
			document.getElementById("city").value = xmlHttp1.responseText;
			//alert(document.getElementById("dist").innerHTML);
			//document.getElementById("section1").innerHTML = xmlHttp.responseText;

		}
		
		
	}
	
		
</script>

<!-- 8th March,2017 Added by Nilesh -->
<script type="text/javascript">
function showdraft2()
{
	if (typeof XMLHttpRequest != "undefined") 
	{
		xmlHttp3 = new XMLHttpRequest();
	} 
	else if (window.ActiveXObject) 
	{
		xmlHttp3 = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp3 == null) 
	{
		alert("Browser does not support XMLHTTP Request");
		return;
	}
	var s11 = document.getElementById('name').value;
	
	var url = "./Body/master/fromroutecode.jsp"; 
	url += "?count=" + s11; 
	xmlHttp3.onreadystatechange = codeAdd5;
	xmlHttp3.open("GET", url, true);
	xmlHttp3.send(null);
	
}

function codeAdd5() {
	if (xmlHttp3.readyState == 4 || xmlHttp3.readyState == "complete") 
	{
		var e=xmlHttp3.responseText;
	
		document.getElementById("acode").value=e; // assign response to the input field in the Route_master.jsp page
		
	}
};
</script>

<!-- 9th March,2017 Added by Nilesh -->
<script type="text/javascript">
	function showdraft3()
	{
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
		var s11 = document.getElementById('fname').value;
		
		var url = "./Body/master/toroutecode.jsp"; 
		url += "?count=" + s11; 
		xmlHttp2.onreadystatechange = codeAdd6;
		xmlHttp2.open("GET", url, true);
		xmlHttp2.send(null);
		
	}
	
	function codeAdd6() {
		if (xmlHttp2.readyState == 4 || xmlHttp2.readyState == "complete") 
		{
			var e2=xmlHttp2.responseText;
		
			document.getElementById("bcode").value=e2; // assign response to the input field in the Route_master.jsp page
			
			
		}
	};
</script>

<script type="text/javascript">
	function Validate()
	{
		var fromPlaceField = document.getElementById('name').value;
		var toPlaceField = document.getElementById('fname').value;
		
		if(fromPlaceField == toPlaceField)
			{
				alert('Same destination selected,please select again');
				return false;
			}
		return true;
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
<li >Route Slab creation</li>
</ul>
</div>

<s:if test="hasActionMessages()">
<div class="welcome">
<s:actionmessage/>
</div>
</s:if>
    
  <fieldset style="width:55%; border:solid thin #c6d5e1;Padding:5px;">
  <legend style="color:red;"><h3>Route Slab Creation</h3></legend>
  
  <s:form action="routecreation" namespace="/" method="post">
  
  
  <input type="hidden" name="formbean.id" value="<s:property value="formbean.id"/>"/>
  <input type="hidden" name="formbean.acode" id="acode"  /> <%--acode stores From place code --%>
  <input type="hidden" name="formbean.bcode" id="bcode"  /> <%--bcode stores To place code --%>
  
  <table width="50%" style="padding:10px;" >
	
	 <tr>	   	       
        <td width="12.5%" style="padding-left:15px; padding-right:15px;">From&nbsp;Place</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><%-- <sj:autocompleter name="formbean.name" id="name" list="usList1"  listValue="name" size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onkeyup="showdraft2();" ></sj:autocompleter> --%>	
		
		<s:select name="formbean.name" list="usList1" id="name" listKey="name" value="formbean.name" listValue="name" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;width:100px;" onchange="showdraft2();" tabindex="3"/>
		
	 </td>
		
		        
        <td width="12.5%" style="padding-left:15px; padding-right:15px;">To Place</td>
        
        <td width="12.5%" style="padding-left:15px; padding-right:15px;">
        <%-- <sj:autocompleter name="formbean.fname" id="fname" list="usList2"  listValue="fname" size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onkeyup="showdraft3();" ></sj:autocompleter> --%>
        
        <s:select name="formbean.fname" list="usList2" id="fname" listKey="fname" value="formbean.fname" listValue="fname" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;width:100px;" onchange="showdraft3();" tabindex="4"/>
		
        
        </td>
 
        </tr>
        
        <tr>
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;">Distance&nbsp;In&nbsp;K.M</td>
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;">
        	  	<s:textfield name="formbean.distance" id="distance"  size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99"></s:textfield>
        	  </td>	
        	
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;">Effective&nbsp;Date</td>
        
       			 <td width="12.5%" style="padding-left:15px; padding-right:15px;">
       			 <sj:datepicker name="formbean.edate" id="edate" size="9" buttonImageOnly="true" displayFormat="yy-mm-dd" showButton="false" changeYear="true" changeMonth="true" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" tabindex="3" />
        	  </td>
        	
        </tr>
        
        <tr>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;">Mode&nbsp;Of&nbsp;Transport</td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;">Own&nbsp;Vehicle</td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;">Company&nbsp;Vehicle</td>
        	<td width="12.5%" style="padding-left:15px; padding-right:15px;">Public&nbsp;Transport</td>
        	
        	
        </tr>
		        
        
        <tr> 

         <td width="12.5%" style="padding-left:15px; padding-right:15px;">Approved&nbsp;Rate</td>
        	  <%--
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;">
        	  	<s:textfield name="formbean.amount" id="amount"  size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99"></s:textfield>
        	  </td>	
        	  --%>	
        		
        	  <!-- added 9th March,2017 Nilesh -->	
       		  <td width="12.5%" style="padding-left:15px; padding-right:15px;">
        	  	<s:textfield name="formbean.ownvehicle" id="ownvehicle"  size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onkeypress="return isNumber(event)"></s:textfield>
        	  </td>	
       		  <td width="12.5%" style="padding-left:15px; padding-right:15px;">
        	  	<s:textfield name="formbean.companyvehicle" id="companyvehicle"  size="13" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onkeypress="return isNumber(event)"></s:textfield>
        	  </td>	
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;">
        	  	<s:textfield name="formbean.publictransport" id="publictransport"  size="13" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onkeypress="return isNumber(event)"></s:textfield>
        	  </td>	
      
        </tr>
      
    </table>
    <br/>
   	  <div align="center" style="width:100%; position:relative;border-bottom:solid thin #c6d5e1;">
      </div>
      
      <div align="right" style="width:99%;position:relative;padding:7px;">
        
      			<s:submit name="formbean.save" value="Save" cssClass="butStnd" onclick="return Validate();" ></s:submit>
        
      		</div>
      
    </s:form> 
  </fieldset>
	
	<p>&nbsp;</p>
	<s:if test="usList">
	
	<display:table id="table"  name="usList" pagesize="25"  class="imagetable" requestURI=""  defaultsort="2" defaultorder="ascending"  export="true" style="width:50%;color:#000">
	    
	 <s:if test="%{#attr.table.id == formbean.id}">
	 
  	
	<display:column property="name"   title="Place(From)" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="fname"   title="Place(To)" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="distance"   title="Distance in K.M." style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="ownvehicle"   title="Approved Rate(Own Vehicle)" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="companyvehicle"   title="Approved Rate(Company Vehicle)" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="publictransport"   title="Approved Rate(Public Transport)" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	
	<display:column property="edate"   title="Effective Date" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column title="Update" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
    <a href="<s:url action="routeupdate" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color:  #fff;text-decoration:none;font-size:12px;" class="classname">Update</a>
    </display:column>
    
    <display:column title="Delete" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
    <a href="<s:url action="routedelete" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color:  #fff;text-decoration:none;font-size:12px;" class="print" onclick="return confirmation();">Delete</a>
    </display:column>
	</s:if>
	<s:else>
		 
		<display:column property="name"   title="Place(From)" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
		<display:column property="fname"   title="Place(To)" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
		<display:column property="distance"   title="Distance in K.M." style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
		<display:column property="ownvehicle"   title="Approved Rate(Own Vehicle)" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
		<display:column property="companyvehicle"   title="Approved Rate(Company Vehicle)" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
		<display:column property="publictransport"   title="Approved Rate(Public Transport)" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
		<display:column property="edate"   title="Effective Date" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
		
		<display:column title="Update" media="html" style="text-align: center;width:8%;background-color:#fff;" >
    		<a href="<s:url action="routeupdate" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color:#fff;text-decoration:none;font-size:12px;" class="classname">Update</a>
    	</display:column>
    
    	<display:column title="Delete" media="html" style="text-align: center;width:8%;background-color:#fff;" >
    		<a href="<s:url action="routedelete" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color: #fff;text-decoration:none;font-size:12px;" class="print" onclick="placerecordcheck('<s:property value="%{#attr.table.scode}"/>');return confirmation();">Delete</a>
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