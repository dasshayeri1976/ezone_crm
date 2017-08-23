<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='sec' uri='http://www.springframework.org/security/tags' %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	
	<meta name="viewport" content="initial-scale=1.0, maximum-scale=2.0">
	<title>AIM Technosoft</title>
	<link rel="stylesheet" type="text/css" href="././css/jquery.dataTables.css">
	<link rel="stylesheet" href="css/breadcumbs.css" ></link>
	
	
	
	
	<script type="text/javascript"  src="http://code.jquery.com/jquery-1.12.3.min.js">
	</script>
	<script type="text/javascript"  src="./js/jquery.dataTables.js">
	</script>
	
	<script type="text/javascript"  src="./js/shCore.js">
	</script>
	<script type="text/javascript" src="./js/demo.js">
	</script>
	
	
	<script type="text/javascript" language="javascript" src="./js/tableToExcel.js">
	</script>
	<script type="text/javascript" language="javascript" class="init">
	
$(document).ready(function() {
	$('#example').DataTable( {
		scrollY:        '20vh',
		"scrollX": true,
		paging:  false,
		
	} );
} );

$(document).ready(function() {
	$('#example1').DataTable( {
		scrollY:        '20vh',
		"scrollX": true,
		paging:  false,
		
	} );
} );

$(document).ready(function() {
	$('#example2').DataTable( {
		scrollY:        '20vh',
		"scrollX": true,
		paging:  false,
		
	} );
} );

$(document).ready(function() {
	$('#example3').DataTable( {
		scrollY:        '50vh',
		"scrollX": true,
		paging:  false,
		"searching": false,
		
	} );
} );

$(document).ready(function() {
	$('#example4').DataTable( {
		scrollY:        '60vh',
		"scrollX": true,
		paging:  false,
		
	} );
} );

$(document).ready(function() {
	$('#example5').DataTable( {
		scrollY:        '60vh',
		"scrollX": true,
		paging:  false,
		
	} );
} );

	</script>
<script type="javascript" type="text/javascript">
	

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

<script type="javascript" type="text/javascript">
	

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
<style>
img.ui-datepicker-trigger {position:absolute; margin-top:6px; margin-left:-22px;}
#ui-datepicker-div {background:#dce6ee;}

#ui-datepicker-div .ui-state-highlight {color: #dce6ee;}

#ui-datepicker-div.ui-datepicker-control {background: blue;}


.ui-dialog-titlebar{ 
    background: #FFCC66 repeat-x;
    color:#fff;      
}
</style>
</head>

<body onload="brandcode();modelcode();">

<div>
<ul id="breadcrumbs">
<li ><a href="#">AIM Technosoft</a></li>
<li >DashBoard</li>
</ul>
</div>
<fieldset style="width:70%; border:solid thin;Padding:5px;color:#c6d5e1;">
<legend style="color:red;">Sales(CRM) Services</legend>

<s:form action="dashboarddetails" namespace="/" method="post">
   
  <table style="width:100%;padding:10px; color:#000;" >
	
      <tr>
      
	   	<td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Serial&nbsp;No:</td>
        <td width="12.5%" style="padding-left:0px; padding-right:15px;"><s:textfield name="formbean.enquiryno"  id="enquiryno" size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>
        	
         <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
       	 <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	      
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Last&nbsp;Serial&nbsp;No:</td>
        <td width="12.5%" style="padding-left:0px; padding-right:15px;"><s:textfield name="formbean.enquiryno"  id="enquiryno" size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>
        
        </tr>
            
 		<tr>
	   	<td width="12.5%" style="padding-left:15px; padding-right:0px;"><label>Customer&nbsp;Name:</label></td>
        <td width="12.5%" style="padding-left:0px; padding-right:15px;"><s:textfield name="formbean.enquiryslno"  id="enquiryslno" size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>
     
     	<td width="12.5%" style="padding-left:15px; padding-right:0px;"><label>Model:</label></td>
        <td width="12.5%" style="padding-left:0px; padding-right:15px;"><s:textfield name="formbean.enquiryslno"  id="enquiryslno" size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>
     	 	      
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Date:</td>
      	<td width="12.5%" style="padding-left:0px; padding-right:15px;"><sj:datepicker name="formbean.sstdate" id="sstdate" timepicker="false" timepickerFormat="hh:mm"  displayFormat="yy-mm-dd" buttonImageOnly="true"  showButton="false" changeYear="true" changeMonth="true"  cssStyle="border:1px solid #ccc;height:25px;background:#FFFF99;width:190px;"/></td>
        
        </tr>
 		<tr>	
      		
     		
        	<td width="12.5%" style="padding-left:15px; padding-right:0px;"><label>Address:</label></td>
        	<td width="12.5%" style="padding-left:0px; padding-right:15px;"><s:textfield name="formbean.enquiryslno"  id="enquiryslno" size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>
     
     	    <td width="12.5%" style="padding-left:15px; padding-right:0px;"><label>Product</label></td>
        	<td width="12.5%" style="padding-left:0px; padding-right:15px;"><s:textfield name="formbean.enquiryslno"  id="enquiryslno" size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>
     
     		<td width="12.5%" style="padding-left:15px; padding-right:0px;"><label>Mobile&nbsp;No:</label></td>
        	<td width="12.5%" style="padding-left:0px; padding-right:15px;"><s:textfield name="formbean.enquiryslno"  id="enquiryslno" size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>
        </tr>
        
        <tr>	
      		
        	<td width="12.5%" style="padding-left:15px; padding-right:0px;"><label>City:</label></td>
        	<td width="12.5%" style="padding-left:0px; padding-right:15px;"><s:textfield name="formbean.enquiryslno"  id="enquiryslno" size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>
    		
    		<td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Prod&nbsp;Serial&nbsp;No:</td>
        	<td width="12.5%" style="padding-left:0px; padding-right:15px;"><s:textfield name="formbean.enquiryno"  id="enquiryno" size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>
        
        	<td width="12.5%" style="padding-left:15px; padding-right:0px;"><label>E-mail&nbsp;ID:</label></td>
        	<td width="12.5%" style="padding-left:0px; padding-right:15px;"><s:textfield name="formbean.enquiryslno"  id="enquiryslno" size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>
        	
       </tr>
        
	   <tr>
	 	    <td width="12.5%" style="padding-left:15px; padding-right:0px;"><label>Pin:</label></td>
        	<td width="12.5%" style="padding-left:0px; padding-right:15px;"><s:textfield name="formbean.enquiryslno"  id="enquiryslno" size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>
    		
    		
	 		<td width="12.5%" rowspan="2" style="padding-left:15px; padding-right:0px;"><label>Remarks:</label></td>
        	<td width="30.5%" colspan="3" rowspan="2" style="padding-left:0px; padding-right:15px;"><s:textarea name="formbean.problems"  id="problems" rows="10" cols="70" cssStyle="border:1px solid #ccc;background:#FFFF99"></s:textarea></td>
     
     		
	 
	 </tr>   
	 <tr>
	 
	 		<td width="12.5%" style="padding-left:15px; padding-right:0px;"><label>State:</label></td>
        	<td width="12.5%" style="padding-left:0px; padding-right:15px;"><s:textfield name="formbean.enquiryslno"  id="enquiryslno" size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>
	 
	 </tr> 
	  </table>

  
  <table id="table" style="border:0px;width:100%;cell-padding:0px" >  
	<tr bgcolor="#4292b2" style="color:white">
	<th width="1.5%" ><label>SL&nbsp;No</label></th>
	<th width="10.5%" ><label>Particulars</label></th>
	<th width="10.5%" ><label>Problem Report</label></th>
	<th width="10.5%" ><label>Status</label></th>
	<th width="10.5%" ><label>Attended By</label></th>
	</tr>
	
	<s:if test="%{formbean==null}">
<tr>
	<td width="1.5%" ><s:textfield name="formbean.ysl"  id="ysl" size="5" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>
	<td width="12.5%" ><s:textfield name="formbean.ysl"  id="ysl" size="38" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>
	<td width="12.5%" ><s:textfield name="formbean.partcode1"  id="partcode1" size="38" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99" onfocusout="PersonViewModel(this);getPartdetails1();" ></s:textfield></td>
	<td width="12.5%" ><s:textfield name="formbean.mpartno"  id="mpartno" size="38" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>
	<td width="12.5%" ><s:textfield name="formbean.groupdesc"  id="groupdesc" size="38" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>
</tr>
	</s:if>
	
	<s:else>
	<%int i=0; %>
	<s:iterator value="formbean.ysl" status="status">
<tr>
	<td width="12.5%" ><s:textfield name="formbean.ysl[%{#status.count-1}]"  id="ysl" cssClass="ysl" size="5" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield><input type="hidden" name="formbean.yslh" class="yslh" id="yslh"></input></td>
	<td width="12.5%" ><s:textfield name="formbean.ysl[%{#status.count-1}]"  id="ysl" cssClass="ysl" size="38" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield><input type="hidden" name="formbean.yslh" class="yslh" id="yslh"></input></td>
	<td width="12.5%" ><s:textfield name="formbean.partcode1[%{#status.count-1}]" cssClass="partcode1" id="partcode1" size="38" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"  onfocusout="PersonViewModel(this);getPartdetails();"></s:textfield><input type="hidden" name="formbean.partcodeh" class="partcodeh" id="partcodeh"></input></td>
	<td width="12.5%" ><s:textfield name="formbean.mpartno[%{#status.count-1}]" cssClass="mpartno" id="mpartno" size="38" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield><input type="hidden" name="formbean.mpartnoh" class="mpartnoh" id="mpartnoh"></input></td>
	<td width="12.5%" ><s:textfield name="formbean.groupdesc[%{#status.count-1}]" cssClass="groupdesc" id="groupdesc" size="38" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield><input type="hidden" name="formbean.groupdesch" class="groupdesch" id="groupdesch"></input></td>
</tr>
	<%i++; %>
	</s:iterator>
	</s:else>
	</table>
  	
      	 <%-- <s:submit name="formbean.save" value="Save" cssClass="butStnd" onclick="return Validate();" ></s:submit>
 --%>
		 <div align="center" style="width:98%; position:relative;border-bottom:solid thin #c6d5e1;"></div>
 
       <div align="right" style="width:90%;position:relative;  padding:7px;">
        <input type="button" name="add" Class="butStnd" value="Add Row"  onclick="addRow('table');"></input>
      	<input type="button" name="delete" Class="butStnd" value="Delete Row"  onclick="deleteRow('table');"></input>
      	<s:submit name="formbean.save" value="Submit" cssClass="butStnd" onclick="getValue();"></s:submit>
        
      </div>
</s:form>  	
</fieldset>

	<p>&nbsp;</p>
	<s:if test="usList2">
	
	<display:table id="table"  name="usList2" pagesize="25"  class="imagetable" requestURI=""     export="true" style="width:95%;color:#000">
	    
	 <s:if test="%{#attr.table.id == formbean.id}">
	
	<display:column property="pname"   title="Principal Name" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="enquirydate"   title="Enquiry Date"  style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable"/>
	
	<display:column property="rate1"   title="Rate" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="enquiryno"   title="Enquiry No." style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="enquiryslno"   title="Enquiry Sl." style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="customername"   title="Customer Name" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="attn"   title="Attn" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="post"   title="Post" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="dueon"   title="Due On" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="totalamount"   title="Total Amount" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	
	<display:column property="remarks"   title="Remarks" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column title="Update" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
    <a href="<s:url action="etopupdate" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param><s:param  name="voucherno" value="%{#attr.table.voucherno}"></s:param></s:url>" style="color:  #fff;text-decoration:none;font-size:12px;" class="classname">Update</a>
    </display:column>
    
    <display:column title="Delete" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
    <a href="<s:url action="etopdelete" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param><s:param  name="voucherno" value="%{#attr.table.voucherno}"></s:param></s:url>" style="color:  #fff;text-decoration:none;font-size:12px;" class="print" onclick="return confirmation();">Delete</a>
    </display:column>
	</s:if>
	<s:else>
		 
	
	<display:column property="pname"   title="Principal Name" style="background-color:#fff;"   sortable="false" headerClass="sortable" />
	
	<display:column property="enquirydate"   title="Enquiry Date"  style="background-color:#fff;"   sortable="false" headerClass="sortable"/>
	
	<display:column property="rate1"   title="Rate" style="background-color:#fff;"   sortable="false" headerClass="sortable" />
	
	<display:column property="enquiryno"   title="Enquiry No." style="background-color:#fff;"   sortable="false" headerClass="sortable" />
	
	<display:column property="enquiryslno"   title="Enquiry Sl." style="background-color:#fff;"   sortable="false" headerClass="sortable" />
	
	<display:column property="customername"   title="Customer Name" style="background-color:#fff;"   sortable="false" headerClass="sortable" />
	
	<display:column property="attn"   title="Attn" style="background-color:#fff;"   sortable="false" headerClass="sortable" />
	
	<display:column property="post"   title="Post" style="background-color:#fff;"   sortable="false" headerClass="sortable" />
	
	<display:column property="dueon"   title="Due On" style="background-color:#fff;"   sortable="false" headerClass="sortable" />
	
	<display:column property="totalamount"   title="Total Amount" style="background-color:#fff;"   sortable="false" headerClass="sortable" />
	
	
	<display:column property="remarks"   title="Remarks" style="background-color:#fff;"   sortable="false" headerClass="sortable" />
	
	<display:column title="Update" media="html" style="text-align: center;width:8%;background-color:#fff;" >
    <a href="<s:url action="etopupdate" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param><s:param  name="voucherno" value="%{#attr.table.voucherno}"></s:param></s:url>" style="color:#fff;text-decoration:none;font-size:12px;" class="classname">Update</a>
    </display:column>
    
    <display:column title="Delete" media="html" style="text-align: center;width:8%;background-color:#fff;" >
    <a href="<s:url action="etopdelete" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param><s:param  name="voucherno" value="%{#attr.table.voucherno}"></s:param></s:url>" style="color: #fff;text-decoration:none;font-size:12px;" class="print" onclick="return confirmation();">Delete</a>
    </display:column>
    
	</s:else> 
	   
    </display:table>
	</s:if>
	
  <br/>
        
 
</body>
</html>
