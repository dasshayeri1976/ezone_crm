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
		
		
	}
	
	function abc(a,b,c,d,e) 
	{
		
		//alert(c);
		document.getElementById("engname1").value =a
		document.getElementById("comcode1").value =b;
		document.getElementById("username").value =c;
		document.getElementById("ctype").value =d;
		document.getElementById("remarks").value =e;
		
		
		
		
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
	//Remove the shortcut
	//shortcut.remove("Ctrl+B");
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
<li >Engineer's Status(Carry In)</li>
</ul>
</div>

<s:if test="hasActionMessages()">
<div class="welcome">
<s:actionmessage/>
</div>
</s:if>
    
  
  	<sj:dialog id="mybuttondialog" autoOpen="false" modal="true"
				title="Status Upgradation" width="550" height="230"
				draggable="false" resizable="false" onCloseTopics="mybuttondialog">


				<fieldset
					style="width: 97%;height:90%; border: solid thin #c6d5e1; Padding: 5px;">
					<legend style="color: red;">Engineer's Status</legend>


					<s:form action="pstatus1" namespace="/" method="post">
						<input type="hidden" name="username" id="username" />
						
						<input type="hidden" name="formbean.comcode" id="comcode1" />
						<input type="hidden" name="formbean.engname" id="engname1" />
						<input type="hidden" name="formbean.user" value="<s:property value="#session.user"/>" />
						
						<table>
							<tr id="sp1">
								<td width="12.5%" style="padding-left:15px; padding-right:15px;">Status:</td>
								<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:select name="formbean.engstatus" id="ctype" list="#{'':'','REPAIR READY':'REPAIR READY','UN-REPAIR READY':'UN-REPAIR READY', 'READY FOR QUOTATION':'READY FOR QUOTATION', 'PENDING FOR PARTS':'PENDING FOR PARTS'}" cssStyle=" border:1px solid #ccc;height:20px;background:#FFFF99;width:250px;"></s:select></td>
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


					<s:form action="sparereturn1" namespace="/" method="post">
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
			
		
	<p>&nbsp;</p>
	
	<div id="abc">
	
	<display:table id="table"  name="usList" pagesize="2000"  class="display nowrap" requestURI=""  defaultsort="1" defaultorder="descending"  export="false" style="width:70%;color:#000">
	
	<display:column property="cdate"   title="Call_Date"   sortable="false" headerClass="sortable" /> 
   
   	<display:column title="Com_Job_Id"    sortable="false" headerClass="sortable">
	<a href="viewdetails.jsp?value=<s:property value="scode"/>" style="text-decoration:none;"><span style="color:green;" onclick="return popitup('viewdetails.jsp?value=<s:property value="%{#attr.table.scode}"/>')"><s:property value="%{#attr.table.scode}"/></span></a>
	</display:column>
	
	<display:column property="bname"   title="Brand Name"   sortable="false" headerClass="sortable" />
	<display:column property="mcode"   title="Model"   sortable="false" headerClass="sortable" />
	<display:column property="pserial"   title="ProSerial"   sortable="false" headerClass="sortable" />
	
		
	<%-- <display:column property="allocation"   title="Allocation"   sortable="false" headerClass="sortable" /> --%>
	
	<display:column property="comcode"   title="Problem Reported"  align="center"  sortable="false" headerClass="sortable" /> 
	<display:column property="remarks"   title="Customer Remarks"  align="center" sortable="false" headerClass="sortable" />
	
	<display:column title="Quotation" media="html" style="text-align: center;width:15%;" >
    	
    	<s:if test="%{#attr.table.approved =='APPROVED' || #attr.table.approved =='NOT APPROVED' }">
			
			<a href="<s:url action="quotationdetails" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param><s:param name="name" value="%{#attr.table.name}"></s:param><s:param name="scode" value="%{#attr.table.scode}"></s:param><s:param name="ccode" value="%{#attr.table.ccode}"></s:param><s:param name="address" value="%{#attr.table.address}"></s:param><s:param name="cust_ref_id" value="%{#attr.table.cust_ref_id}"></s:param></s:url>" style="text-decoration:none;font-size:12px;width:125px;" class="classname"><s:property value="%{'QUOT. '}" /><s:property value="%{#attr.table.approved}" /></a>
		</s:if>
		
		<s:else >
		<a style="text-decoration:none;font-size:12px;" class="print"><s:property value="%{'QUOTATION'}" /></a>
	
		
		</s:else>
    </display:column>   
	
	<s:if test="%{#attr.table.allocation != null }">
	<s:if test="%{#attr.table.allocation =='NA' }">
	<display:column title="Status" style="text-align: center;width:8%;">
	<sj:a openDialog="mybuttondialog" href="#" cssClass="butStnd" onclick="abc('%{#attr.table.allocation}','%{#attr.table.scode}','%{#attr.table.id}','%{#attr.table.engstatus}','%{#attr.table.engremarks}');">NA</sj:a>
	</display:column>
	</s:if>
	<s:else>
	<display:column title="Status" style="text-align: center;width:8%;">
	<sj:a openDialog="mybuttondialog" href="#" cssClass="butStnd"	onclick="abc('%{#attr.table.allocation}','%{#attr.table.scode}','%{#attr.table.id}','%{#attr.table.engstatus}','%{#attr.table.engremarks}');"><s:property value="%{#attr.table.engstatus}" /></sj:a>
	</display:column>
	</s:else>
	</s:if>
	
	<display:column title="SpareDetails" style="text-align: center;width:8%;">
	
	<s:if test="%{#attr.table.catagory =='WITH SPARE'}">
	<sj:a openDialog="mybuttondialog1" href="#" cssClass="classname"	onclick="spare('%{#attr.table.scode}','%{#attr.table.id}');">Spare Details</sj:a>
	</s:if>
	<s:else>
	<s:property value="%{#attr.table.sparedetails}" />
	</s:else>
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
