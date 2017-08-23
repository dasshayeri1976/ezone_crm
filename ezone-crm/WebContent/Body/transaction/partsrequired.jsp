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

			
			document.getElementById("ctype").innerHTML = xmlHttp1.responseText;
			
			
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
<li ><a href="#">Transaction Management</a></li>
<li >Parts Required</li>
</ul>
</div>

<s:if test="hasActionMessages()">
<div class="welcome">
<s:actionmessage/>
</div>
</s:if>
    
  
  	
	<p>&nbsp;</p>
	
	
	<display:table id="table"  name="usList" pagesize="25"  class="imagetable" requestURI="/pertsreq"  export="true" style="width:65%;color:#000">
	<display:column property="scode"   title="CompanyId"   sortable="false" headerClass="sortable" /> 
	<display:column property="name"   title="Engineer Name"   sortable="false" headerClass="sortable" /> 
	<display:column property="cdate"   title="Complane Date"   sortable="false" headerClass="sortable" /> 
    <display:column property="remarks"   title="Remarks"   sortable="false" headerClass="sortable" />
   		
   
	   
    </display:table>
	
	
  <br/>
    
    <!--<script language="javascript" type="text/javascript">
//<![CDATA[
	setFilterGrid("table");
//]]>
</script>-->
          
</center></body>
</html>
