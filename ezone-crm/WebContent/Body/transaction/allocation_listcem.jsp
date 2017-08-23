<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Jobwork Entry</title>
<script language="javascript" type="text/javascript" src="js/tablefilter.js"></script>
<link rel="stylesheet" href="css/style2.css" />
<link rel="stylesheet" href="./css/draftbutton.css" />
<link rel="stylesheet" href="./css/printbutton.css" />
<link rel="stylesheet" href="css/breadcumbs.css" ></link>
<script src="./js/dynamictable.js"></script>
<script src="./js/shortcut.js"></script>



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

table.imagetable tr:nth-child(odd) td{background:#fff
}
table.imagetable tr:nth-child(even) td{background:#ecf2f6
}

#mybuttondialog
{
	display: none;
}

#mybuttondialog1
{
	display: none;
}

#mybuttondialog2
{
	display: none;
}

</style>
<sj:head/>
<script>

function confirmation()
{
	var r = confirm("Are You sure to delete this engineer record");
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

function addtotal() 
{
	//alert('Avi');
	
	var y = document.getElementsByName("formbean.amount1");
	var sum=0;
	//alert(x.length);
	for (i = 0; i < y.length; i++) 
	{
		
		var q=y[i].value;
		var tot = q;
		sum=sum+Number(tot);
		
		
			
	}
	//alert("Total: "+sum);
	document.getElementById("total").value=sum;
	
	
	return true;
	
}

function check(elem,a) 
{
	//$('input[type="checkbox"]:checked').each(function(){
        //alert(this.id);
    //});
	//document.getElementsByClassName("example");

	
	var chk_arr =  document.getElementsByClassName("source"+a);
	var chklength = chk_arr.length;             
	
	for(k=0;k< chklength;k++)
	{
		if (chk_arr[k] != elem)
	    chk_arr[k].checked = false;
	}
	
}


function popitup(url) {
	newwindow=window.open(url,'view','height=800,width=1150,resizable=no,menubar=yes,scrollbars=yes');
	x = (screen.availWidth - '1250') / 2;
	y = (screen.avaiHeight - '800') / 2;

	// move to the center of the page
	newwindow.moveTo(x, y);
	if (window.focus) {newwindow.focus();}
	return false;
}  
   
</script>

<script language="javascript" type="text/javascript">
	

	function spare(a,b) {
		//alert(a);
		document.getElementById("id").value = b;
		
		if (typeof XMLHttpRequest != "undefined") {
			xmlHttp1 = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			xmlHttp1 = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (xmlHttp1 == null) {
			alert("Browser does not support XMLHTTP Request");
			return;
		}
		
		var url = "./Body/transaction/spare.jsp";
		url += "?id=" + a; // + "&sec=" + s;
		//url +="?count=" +str+"&date1="+s;
		xmlHttp1.onreadystatechange = codeAdd;
		xmlHttp1.open("GET", url, true);
		xmlHttp1.send(null);

	}

	function codeAdd() {
		if (xmlHttp1.readyState == 4 || xmlHttp1.readyState == "complete") {

			
			document.getElementById("ctype1").innerHTML = xmlHttp1.responseText;
			
			
		}
	};
</script>
<script>
	function expance(a,b,c) 
	{
		
		document.getElementById("engname").value =a
		document.getElementById("comcode").value =b;
		document.getElementById("accid").value =c;
		
		if (typeof XMLHttpRequest != "undefined") {
			xmlHttp2 = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			xmlHttp2 = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (xmlHttp2 == null) {
			alert("Browser does not support XMLHTTP Request");
			return;
		}
		
		var url = "./Body/transaction/expence.jsp";
		url += "?id=" + b; // + "&sec=" + s;
		//url +="?count=" +str+"&date1="+s;
		xmlHttp2.onreadystatechange = codeAdd01;
		xmlHttp2.open("GET", url, true);
		xmlHttp2.send(null);

	}

	function codeAdd01() {
		if (xmlHttp2.readyState == 4 || xmlHttp2.readyState == "complete") {

			
			document.getElementById("ctype2").innerHTML = xmlHttp2.responseText;
			
			
		}
	};
	
	function abc(a,b,c) 
	{
		
		//alert(c);
		document.getElementById("engname1").value =a
		document.getElementById("comcode1").value =b;
		document.getElementById("username").value =c;
		
		
	}
	
	
	//Remove the shortcut
	//shortcut.remove("Ctrl+B");
</script>

<!-- Added 15th March, Nilesh -->
<script type="text/javascript">
	function fetchDistance1()
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
		
		var s1=document.getElementsByName("formbean.name");
		
		var x=s1.length;
		var val = new Array(x);

		for(i=0;i<s1.length;i++)
		val[i]=s1[i].value;
		
		val.join(',')
		
		var url = "./Body/master/fromroutecode.jsp";
		url += "?fromPlaceName=" + val.join(',');

		xmlHttp3.onreadystatechange = codeAdd02;
		xmlHttp3.open("GET", url, true);
		xmlHttp3.send(null);
		
	}
	
	function codeAdd02() {
		if (xmlHttp3.readyState == 4 || xmlHttp3.readyState == "complete") {

			var x1=xmlHttp3.responseText;
			var x2=x1.split(", ");
			
			for(i=0;i<x2.length;i++)
			{
				
						alert("value got "+x2[i].trim());
						document.getElementsByName("formbean.fromplace")[i].value=x2[i].trim();		
			}

		}
	};
	
</script>

<script type="text/javascript">
	function fetchDistance2()
	{
		if (typeof XMLHttpRequest != "undefined") 
		{
			xmlHttp4 = new XMLHttpRequest();
		}
		else if (window.ActiveXObject) 
		{
			xmlHttp4 = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (xmlHttp4 == null) 
		{
			alert("Browser does not support XMLHTTP Request");
			return;
		}
			
			var s2 = document.getElementsByName("formbean.fname");
			
			var x=s2.length;
			var val = new Array(x);

			for(i=0;i<s2.length;i++)
			val[i]=s2[i].value;
			
			val.join(',')
			
			// code to convert place code to place name
			
			 var url = "./Body/master/toroutecode.jsp";
			url += "?toPlaceName=" + val.join(','); // + "&sec=" + s;
			xmlHttp4.onreadystatechange = codeAdd03;
			xmlHttp4.open("GET", url, true);
			xmlHttp4.send(null);
	}
	
	function codeAdd03() {
		if (xmlHttp4.readyState == 4 || xmlHttp4.readyState == "complete") {

			var x1=xmlHttp4.responseText;
			var x2=x1.split(", ");
			
			for(i=0;i<x2.length;i++)
			{
				
						alert("value got "+x2[i].trim());
						document.getElementsByName("formbean.toplace")[i].value=x2[i].trim();		
			}

		}
	};
</script>

<style>
#ui-datepicker-div {background:#dce6ee;}

#ui-datepicker-div .ui-state-highlight {color: #dce6ee;}

#ui-datepicker-div.ui-datepicker-control {background: blue;}


.ui-dialog-titlebar{ 
    background: #FFCC66 repeat-x;
    color:#fff;      
}

#abc
{
	display: none;
}

div.dataTables_wrapper {
        width: 90%;
        margin: 0 auto;
        
    }
    
</style>

<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.css"/>
<script src="//code.jquery.com/jquery-1.12.4.js"></script> 
<script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
<script>
		var $easy1 = $.noConflict(true);
	</script>
 <script>
 $(document).ready(function() {
	   
	 $("#abc").css({ 'display': "block" });
	    $easy1('#table').DataTable( {
	       
	    	 "scrollY": '60vh',
	    	 "scrollX": true,
	        paging:  false,
	        ordering: false,
	        
	       
	    } );

	   
	} );
 
 </script>

</head>

<body><center>


       
<div>
<ul id="breadcrumbs">
<li ><a href="#">Transaction Management</a></li>
<li >Engineer's Status(ON SITE)</li>
</ul>
</div>

<s:if test="hasActionMessages()">
<div class="welcome">
<s:actionmessage/>
</div>
</s:if>
    
  
  	<sj:dialog id="mybuttondialog" autoOpen="false" modal="true"
				title="Status Upgradation" width="550" height="290"
				draggable="false" resizable="false" onCloseTopics="mybuttondialog">

				<fieldset
					style="width: 97%;height:93%; border: solid thin #c6d5e1; Padding: 5px;">
					<legend style="color: red;">Engineer's Status</legend>


					<s:form action="pstatus" namespace="/" method="post">
						<input type="hidden" name="username" id="username" />
						<input type="hidden" name="formbean.comcode" id="comcode1" />
						<input type="hidden" name="formbean.engname" id="engname1" />
						<input type="hidden" name="formbean.user" value="<s:property value="#session.user"/>" />
						
						<table>
							<tr id="sp1">
								<td width="12.5%" style="padding-left:15px; padding-right:15px;">Status:</td>
								<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:select name="formbean.engstatus" id="ctype" list="#{'':'','CALL CANCEL':'CALL CANCEL', 'READY FOR QUOTATION':'READY FOR QUOTATION', 'PENDING FOR PARTS':'PENDING FOR PARTS','TECHINICAL REASON':'TECHINICAL REASON','NOT ATTEND':'NOT ATTEND','CLOSE':'CLOSE'}" cssStyle=" border:1px solid #ccc;height:20px;background:#FFFF99;width:250px;"></s:select></td>
								<%--								
								 list="#{'':'', 'PENDING':'PENDING', 'PENDING FOR PARTS':'PENDING FOR PARTS','CLOSE':'CLOSE'}" cssStyle=" border:1px solid #ccc;height:20px;background:#FFFF99;width:250px;"></s:select></td>
								 --%>
							</tr>
							<tr>
								<td width="12.5%" style="padding-left:15px; padding-right:15px;">SCR No</td>
								<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.userid" id="userid"  size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>
							</tr>
							<tr>
								<td width="12.5%" style="padding-left:15px; padding-right:15px;">SRC DOC UPLOAD</td>
								<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:file name="upload" label="File"/></td>
							</tr>
							
							<tr id="sp1">
								<td width="12.5%" style="padding-left:15px; padding-right:15px;">Remarks</td>
								<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textarea name="formbean.remarks" cols="40" rows="4" id="remarks" cssStyle=" border:1px solid #ccc"/></td>
							</tr>
							
						</table>
							
						<div align="middle" style="width: 95%; position: relative; padding: 10px;">
							<s:submit value="Save" cssClass="myButton"></s:submit>
						</div>
					</s:form>
				</fieldset>

	</sj:dialog>
		
 	<sj:dialog id="mybuttondialog1" autoOpen="false" modal="true"
				title="Engineer Reallocation" width="550" height="500"
				draggable="false" resizable="false" onCloseTopics="mybuttondialog1">


				<fieldset
					style="width: 97%;height:97%; border: solid thin #c6d5e1; Padding: 5px;">
					<legend style="color: red;">Spare Details</legend>


					<s:form action="sparereturn" namespace="/" method="post">
						<input type="hidden" name="id" id="id" />
						<input type="hidden" name="formbean.user" value="<s:property value="#session.user"/>" />

						<div align="center">
						<div id="ctype1"></div>
						</div>
							
						<div align="middle" style="width: 95%; position: relative; padding: 10px;">
							<s:submit value="Save" cssClass="myButton"></s:submit>
						</div>
					</s:form>
				</fieldset>

		</sj:dialog>
			
		<sj:dialog id="mybuttondialog2" autoOpen="false" modal="true"
				title="Expence Details Adding" width="1200" height="500"
				draggable="false" resizable="false" onCloseTopics="mybuttondialog2">


				<fieldset
					style="width: 97%; border: solid thin #c6d5e1; Padding: 5px;">
					<legend style="color: red;">Expence Details Entry</legend>


					<s:form action="expencereturn" namespace="/" method="post">
						<input type="hidden" name="accid" id="accid" />
						<input type="hidden" name="formbean.comcode" id="comcode" />
						<input type="hidden" name="formbean.engname" id="engname" />
						<input type="hidden" name="formbean.user" value="<s:property value="#session.user"/>" />
						
						<!-- added 15th March, Nilesh -->
						<input type="hidden" name="formbean.id" value="<s:property value="formbean.id"/>"/>
  						<input type="hidden" name="formbean.acode" id="acode"  /> <%--acode stores From place code --%>
  						<input type="hidden" name="formbean.bcode" id="bcode"  /> <%--bcode stores To place code --%>
						<input type="hidden" name="formbean.distancekm1" id="distancekm1"  /> 
						<input type="hidden" name="formbean.ownvehicle1" id="ownvehicle1"  /> 
						<input type="hidden" name="formbean.companyvehicle1" id="companyvehicle1"  /> 
						<input type="hidden" name="formbean.publictransport1" id="publictransport1"  /> 
						
						<!-- end of added 15th March -->
						
						<p align="left">
							<br /> <span style="padding: 20px; color: #FF0000;">Please
								tick out the check box for Delete the row</span>
						</p>
						<br />
						
						<%-- added 15th March, Nilesh  --%>
						<p align="left">
							<br/> <span style="padding: 20px; color: #FF0000;">Distance(KM)</span><span style="padding: 20px; color: #FF0000;"><div id="distanceDiv"></div></span>
							<span style="padding: 20px; color: #FF0000;">Approved Rate(Own Vehicle)</span><span style="padding: 20px; color: #FF0000;"><div id="ownVhDiv"></div></span>
							<span style="padding: 20px; color: #FF0000;">Approved Rate(Company Vehicle)</span><span style="padding: 20px; color: #FF0000;"><div id="comVhDiv"></div></span>
							<span style="padding: 20px; color: #FF0000;">Approved Rate(Public Transport)</span><span style="padding: 20px; color: #FF0000;"><div id="pubVhDiv"></div></span>
							
						</p>
						
						<%-- <p align="left">
							<br/> 
							<span style="padding: 20px; color: #FF0000;">Approved Rate(Own Vehicle)</span>
							<span style="padding: 20px; color: #FF0000;">Approved Rate(Company Vehicle)</span>
							<span style="padding: 20px; color: #FF0000;">Approved Rate(Public Transport)</span>
						</p> --%>
						
						<%--end of added 15th march --%>
						
						<div style="width: 1200px; height: 275px; overflow-y: hidden;"
							align="left">
							<table >
							<tr>
							<td valign="top">
							<table id="dataTable" width="450px" class="imagetable" align="center">
								<tr>
									<th></th>
									<th>From&nbsp;Place</th>
									<th></th>
									<th>To Place</th>
									<th></th>
									<th>Description</th>
									<th>Amount</th>
									
								</tr>
								<tr>
									<td><input type="checkbox" name="chk" /></td>
									<td>
										<s:select name="formbean.name" list="usList1" id="name" listKey="name" value="formbean.name" listValue="name" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;width:100px;" onchange="fetchDistance1();"/>
									</td>
									
									<td>
										<input type="text" name="formbean.fromplace" id="placeCode1" placeholder="From Place Code here"  />
									</td>
									
									<td>
										<s:select name="formbean.fname" list="usList2" id="fname" listKey="fname" value="formbean.fname" listValue="fname" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;width:100px;" onchange="fetchDistance2();"/>
									</td>
									
									<td>
										<input type="text" name="formbean.toplace" id="placeCode2" placeholder="To Place Code here"  />
									</td>
									
									<td><input type="text" name="formbean.quantity" style="border: 1px solid #ccc;" size="40" /></td>
									<td><input type="text" name="formbean.amount1" style="border: 1px solid #ccc;" size="10"  onkeyup= "return addtotal();" /></td>
									
								</tr>

							</table>
							</td>
							<td valign="top">
							<div align="center">
							<div id="ctype2"></div>
							</div>
							</td>
							</tr>
							</table>
						</div>

						<div align="left"
							style="width: 95%; position: relative; padding: 10px;">
							
							<table>
							<tr>
								<td width="80" style="color: #000066;padding-left:290px;" valign="top">Total</td>
								<td width="260"><s:textfield size="10" name="formbean.total" cssStyle="border:1px solid #ccc;color:#000066;" id="total"></s:textfield></td>
								
							
							</tr>
							</table>
							<br/>
							<input type="button" value="Add" class="myButton"
								onclick="addRow('dataTable');" /> <input type="button"
								value="Delete" class="myButton"
								onclick="deleteRow('dataTable');return addtotal();" />
							<s:submit value="Save" cssClass="myButton"
								onclick="return elementValue();"></s:submit>
							

						</div>
					</s:form>
				</fieldset>

			</sj:dialog>
	<p>&nbsp;</p>
	
	<div id="abc">
	<display:table id="table"  name="usList" pagesize="1000"  class="display nowrap" requestURI=""  defaultsort="1" defaultorder="descending"  export="false" style="width:85%;color:#000">
	<display:column property="cdate"   title="Call_Date"   sortable="false" headerClass="sortable" /> 
    <display:column property="catagory"   title="Call_Catagory"   sortable="false" headerClass="sortable" />
	<display:column title="Com_Job_Id"    sortable="false" headerClass="sortable">
	<a href="viewdetails.jsp?value=<s:property value="scode"/>" style="text-decoration:none;"><span style="color:green;" onclick="return popitup('viewdetails.jsp?value=<s:property value="%{#attr.table.scode}"/>')"><s:property value="%{#attr.table.scode}"/></span></a>
	</display:column>
			
    <display:column property="name"   title="CusName"   sortable="false" headerClass="sortable" />
	<display:column property="address"   title="Address"   sortable="false" headerClass="sortable" />
	<display:column property="distance"   title="Distance"   sortable="false" headerClass="sortable" />
	<display:column property="pon"   title="Phone"   sortable="false" headerClass="sortable" />
	
	
	<display:column property="mcode"   title="Model"   sortable="false" headerClass="sortable" />
	<display:column property="pserial"   title="ProSerial"   sortable="false" headerClass="sortable" />
	<display:column property="allocation"   title="Allocation"   sortable="false" headerClass="sortable" />
	
	<display:column title="Status" style="text-align: center;width:8%;">
	<sj:a openDialog="mybuttondialog" href="#" cssClass="butStnd"	onclick="abc('%{#attr.table.allocation}','%{#attr.table.scode}','%{#attr.table.id}');"><s:property value="%{#attr.table.engstatus}" /></sj:a>
	</display:column>
	
	<display:column title="SpareDetails" style="text-align: center;width:8%;">
	<s:if test="%{#attr.table.catagory =='WITH SPARE'}">
	<sj:a openDialog="mybuttondialog1" href="#" cssClass="classname"	onclick="spare('%{#attr.table.scode}','%{#attr.table.id}');">Spare Details</sj:a>
	</s:if>
	<s:else>
	<s:property value="%{#attr.table.sparedetails}" />
	</s:else>
	</display:column>
	
	<display:column title="ExpenceDetails" style="text-align: center;width:8%;">
	
	<sj:a openDialog="mybuttondialog2" href="#" cssClass="classname" onclick="expance('%{#attr.table.allocation}','%{#attr.table.scode}','%{#attr.table.id}');">Expence</sj:a>
	
	</display:column>
	
	
	
	   
    </display:table>
	</div>
	
  <br/>
    
    <!--<script language="javascript" type="text/javascript">
//<![CDATA[
	setFilterGrid("table");
//]]>
</script>-->
          
</center></body>
</html>
