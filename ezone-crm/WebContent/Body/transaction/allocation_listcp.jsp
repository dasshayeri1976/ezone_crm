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



</style>
<sj:head/>

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

<script type="text/javascript">
checked=false;
function checkedAll (frm1) {var aa= document.getElementById('frm1'); if (checked == false)
{
checked = true
}
else
{
checked = false
}for (var i =0; i < aa.elements.length; i++){ aa.elements[i].checked = checked;}
}

function createTarget(t){
	
 var left = (screen.width/2)-(700/2);
 var top = (screen.height/2)-(550/2);
 window.open("", t,"status = 1,height = 550,width = 700,resizable = 1,left="+left+",top="+top); 

     return true;
 }
 

</script>
</head>

<body><center>


       
<div>
<ul id="breadcrumbs">
<li ><a href="#">Transaction Management</a></li>
<li >Engineer Allocation On Site Print</li>
</ul>
</div>

<s:if test="hasActionMessages()">
<div class="welcome">
<s:actionmessage/>
</div>
</s:if>

<s:if test="usList">    
<s:form action="printview1" namespace="/" method="post" id="frm1" onsubmit="return createTarget(this.target)" target="formtarget">
		
		
		<div style="height:335px;" id="abc">
		
		<table cellpadding="0" cellspacing="0" border="0" id="table" class="display nowrap" style="width:75%" >
		<thead>
		
			<tr>
				<th><center><input type='checkbox' name='checkall' onclick='checkedAll(frm1);'/></center></th>
				<th><center>CompanyId</center></th>
				<th><center>Name</center></th>
				<th><center>Address</center></th>
				<th><center>Phone</center></th>
				<th><center>Model</center></th>
				<th><center>ProductSlno</center></th>
				<th><center>Problem</center></th>
			</tr>
			
		</thead>
		<tbody>
		<s:iterator value="usList" status="status" >
		
			<tr>
				<td align="center"><input type="checkbox" name="checked" value="<s:property value="id"/>"/></td>
				<td><s:property value="scode" /></td>
				<td><s:property value="name" /></td>
				<td><s:property value="address" /></td>
				<td><s:property value="pon"/></td>
				<td><s:property value="mcode" /></td>
				<td><s:property value="pserial"/></td>
				<td><s:property value="comcode"/></td>
			</tr>
			
		</s:iterator>
		</tbody>
		</table>
		</div>
  				
  				<div style="padding:1px" align="center">
				<s:submit value="Print Priview" cssClass="myButton1"></s:submit>
				</div>
				</s:form>
				
</s:if>	
  <br/>
    
    <!--<script language="javascript" type="text/javascript">
//<![CDATA[
	setFilterGrid("table");
//]]>
</script>-->
          
</center></body>
</html>
