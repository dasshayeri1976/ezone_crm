<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='sec' uri='http://www.springframework.org/security/tags' %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	
	<meta name="viewport" content="initial-scale=1.0, maximum-scale=2.0">
	<title>E-ZONE CARE</title>
	<link rel="stylesheet" type="text/css" href="././css/jquery.dataTables.css">
	<link rel="stylesheet" href="css/breadcumbs.css" ></link>
	
	
	
	
	<script type="text/javascript" language="javascript" src="http://code.jquery.com/jquery-1.12.3.min.js">
	</script>
	<script type="text/javascript" language="javascript" src="./js/jquery.dataTables.js">
	</script>
	
	<script type="text/javascript" language="javascript" src="./js/shCore.js">
	</script>
	<script type="text/javascript" language="javascript" src="./js/demo.js">
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
<script language="javascript" type="text/javascript">
	

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

<script language="javascript" type="text/javascript">
	

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
</head>

<body onload="brandcode();modelcode();"><center>

<div>
<ul id="breadcrumbs">
<li ><a href="#">E-ZONE CARE</a></li>
<li >DashBoard</li>
</ul>
</div>

<fieldset style="width:70%; border:solid thin;Padding:5px;color:#c6d5e1;">
<legend style="color:red;">DashBoard Query</legend>

<s:form action="dashboarddetails" namespace="/" method="post">
   
  <table width="100%" style="padding:10px; color:#000;" >
	
      <tr>
      
	   	       
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Brand</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:select name="formbean.bname" list="usList1" id="bname" listKey="bname" value="formbean.bname" listValue="bname" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99;width:120px;" onchange="brandcode();"/></td>
        
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Model</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:select name="formbean.mcode" id="mcode" list="#{'':''}" cssStyle=" border:1px solid #ccc;height:25px;background:#FFFF99;width:110px;" onchange="modelcode();"></s:select></td>
       
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Product</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:textfield name="formbean.fname" id="fname"  size="20" readonly="true" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>
       
         <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:submit value="Search" cssClass="butStnd"></s:submit></td>
       </tr>
      
      
        
                
    </table>
     
       
    </s:form>
</fieldset>

<s:if test="usList">
<div style="padding:10px">
	<table id="example3" class="display" cellspacing="0" width="70%">
		<thead>
		
			<tr>
				
				<th>Brand</th>
				<th>Model</th>
				<th>Product</th>
				<th>Total</th>
				<th>Action Not Taken</th>
				<th>Pending</th>
				<th>Pending For Parts</th>
				<th>Close</th>
				<th>Total Amount</th>
				<th>Expence's Amount</th>
				<th>Balance</th>
				
				
				
				
			</tr>
		</thead>
		<tbody>
		<s:iterator value="usList" status="status" >
	
			<tr>
				
				<td style="color:red"><s:property value="brandname"/></td>
				<td style="color:red"><s:property value="mcode"/></td>
				<td style="color:red"><s:property value="pcode"/></td>
				<td style="color:red"><s:property value="accid"/></td>
				<!-- <td><a href="<s:url action="callerdataupdate1" namespace="/" ><s:param  name="leadid" value="accid"></s:param></s:url>" style="text-decoration:none;font-size:12px;"><s:property value="accid" /></a></td>-->
				<td style="color:blue"><a href="<s:url action="callerdashboardlist0" namespace="/" ><s:param  name="brandname" value="brandname"></s:param><s:param  name="mcode" value="mcode"></s:param><s:param  name="pcode" value="pcode"></s:param></s:url>" style="text-decoration:none;font-size:12px;"><s:property value="brandcode"/></a></td>
				<td style="color:blue"><a href="<s:url action="callerdashboardlist" namespace="/" ><s:param  name="brandname" value="brandname"></s:param><s:param  name="mcode" value="mcode"></s:param><s:param  name="pcode" value="pcode"></s:param></s:url>" style="text-decoration:none;font-size:12px;"><s:property value="add"/></a></td>
				<td style="color:orange"><a href="<s:url action="callerdashboardlist1" namespace="/" ><s:param  name="brandname" value="brandname"></s:param><s:param  name="mcode" value="mcode"></s:param><s:param  name="pcode" value="pcode"></s:param></s:url>" style="text-decoration:none;font-size:12px;"><s:property value="address"/></a></td>
				<td style="color:blue"><a href="<s:url action="callerdashboardlist2" namespace="/" ><s:param  name="brandname" value="brandname"></s:param><s:param  name="mcode" value="mcode"></s:param><s:param  name="pcode" value="pcode"></s:param></s:url>" style="text-decoration:none;font-size:12px;"><s:property value="address2"/></a></td>
				<td style="color:red"><s:property value="allocation"/></td>
				<td style="color:red"><s:property value="amount"/></td>
				<td style="color:red"><s:property value="bname"/></td>
				
				
				
				
				
				
			</tr>
		
			
		</s:iterator>
			
			
		
		</tbody>
  </table>
  </div>
  <!--<input type="button" onClick="tableToExcel('example', 'W3C Example Table')" value="Export to Excel">-->
</s:if>        


</center>  
</body>
</html>
