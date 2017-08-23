<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	
	<meta name="viewport" content="initial-scale=1.0, maximum-scale=2.0">
	<title>AIM Technosoft</title>
	<link rel="stylesheet" type="text/css" href="././css/jquery.dataTables.css">
	<link rel="stylesheet" href="css/breadcumbs.css" ></link>
		
<script>
function getfromcustomer()
{
	//alert();
	
	if (typeof XMLHttpRequest != "undefined")
    {
            cname = new XMLHttpRequest();
    } else if (window.ActiveXObject)
    {
            cname = new ActiveXObject("Microsoft.XMLHTTP");
    }
    if (cname == null)
    {
            alert("Browser does not support XMLHTTP Request");
            return;
    }
   
    var cu=document.getElementById("customername").value;
    var url = "./Body/Shayeri/getcompany.jsp";
    url += "?count=" + cu; // + "&sec=" + s;
   // alert(url);
    //url +="?count=" +str+"&date1="+s;
    cname.onreadystatechange = codecname;
    cname.open("POST", url, true);
    cname.send(null);
}
function codecname()
{
        if (cname.readyState == 4 || cname.readyState == "complete")
        {
                var x1=cname.responseText;
                x1=x1.trim();
                var x2=x1.split("concat");
                document.getElementById("address").value=x2[0];
                document.getElementById("mobileno").value=x2[1];
                document.getElementById("email").value=x2[2];
                document.getElementById("pincode").value=x2[3];
                document.getElementById("state").value=x2[4];
                document.getElementById("city").value=x2[5];
                
        }
};

function getfrommodelmaster()
{
	//alert();
	var mod=document.getElementById("model").value;
	if (typeof XMLHttpRequest != "undefined")
    {
            cname = new XMLHttpRequest();
    } else if (window.ActiveXObject)
    {
            cname = new ActiveXObject("Microsoft.XMLHTTP");
    }
    if (cname == null)
    {
            alert("Browser does not support XMLHTTP Request");
            return;
    }
   

    var url = "./Body/Shayeri/getmodel.jsp";
    url += "?count1=" + mod; // + "&sec=" + s;
    //alert(url);
    //url +="?count=" +str+"&date1="+s;
    cname.onreadystatechange = codecname1;
    cname.open("POST", url, true);
    cname.send(null);
}
function codecname1()
{
        if (cname.readyState == 4 || cname.readyState == "complete")
        {
                var x1=cname.responseText;
                x1=x1.trim();
                var x2=x1.split("concat");
                document.getElementById("productid").value=x2[0];
                document.getElementById("product").value=x2[1];
        }
};
</script>
<script>
function getValue()
{
	var s=document.getElementsByClassName("slno");
	var sh=document.getElementsByClassName("slnoh");
	var p=document.getElementsByClassName("particulars");
	var ph=document.getElementsByClassName("particularsh");
	var r=document.getElementsByClassName("report");
	var rh=document.getElementsByClassName("reporth");
	var s=document.getElementsByClassName("status");
	var sh=document.getElementsByClassName("statush");
	var a=document.getElementsByClassName("attendedby");
	var ah=document.getElementsByClassName("attendedbyh");
	alert(r[0].value);
	for(var i=0;i<p.length;i++)
	{
		//sh[i].value=y[i].value;
		ph[i].value=p[i].value;
		rh[i].value=mp[i].value;
		sh[i].value=gd[i].value;
		ah[i].value=q[i].value; 
	}
	return false;
}
</script>
<sj:head/>
<script src="./js/dynamictable.js"></script>

</head>

<body><center>

<div>
<ul id="breadcrumbs">
<li ><a href="#">AIM Technosoft</a></li>
<li >Sales(CRM) Services</li>
</ul>
</div>
<fieldset style="width:90%; border:solid thin;Padding:5px;color:#c6d5e1;">
<legend style="color:red;"><h3>Sales(CRM) Services</h3></legend>

<s:form action="salescrmservicescreation" namespace="" method="post">
   
  <table style="width:100%;border:0px; padding:10px; color:#000;">
	
      <tr>
      
	   	<td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Serial&nbsp;No:</td>
        <td width="12.5%" style="padding-left:0px; padding-right:15px;"><s:textfield name="formbean.custid" readonly="true"  id="custid" size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>
        	
         <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
       	 <td width="12.5%" style="padding-left:15px; padding-right:15px;"></td>
        	      
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Date:</td>
      	<td width="12.5%" style="padding-left:0px; padding-right:15px;"><sj:datepicker name="formbean.date1" placeholder="Pick Date from Icon" timepicker="false" timepickerFormat="hh:mm"  displayFormat="yy-mm-dd" buttonImageOnly="true"  showButton="false" changeYear="true" changeMonth="true" cssStyle="border:1px solid #ccc;height:25px;background:#FFFF99;width:182px;"/></td>
        
        </tr>
            
 		<tr>
	   	<td width="12.5%" style="padding-left:15px; padding-right:0px;"><label>Customer&nbsp;Name:</label></td>
        <td width="12.5%" style="padding-left:0px; padding-right:60px;" valign="top"><sj:autocompleter name="formbean.customername" id="customername" placeholder="Enter Customer Name" list="usList4"  listValue="customername" size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onfocusout="getfromcustomer();"></sj:autocompleter></td>
      
        <td width="12.5%" style="padding-left:15px; padding-right:0px;"><label>Model:</label></td>
        <td width="12.5%" style="padding-left:0px; padding-right:15px;"><sj:autocompleter name="formbean.model" id="model" placeholder="Enter Model Name" list="usList5"  listValue="model" size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onfocusout="getfrommodelmaster();"></sj:autocompleter></td>
     	 	      
        <td width="12.5%" style="padding-left:15px; padding-right:0px;"><label>Mobile&nbsp;No:</label></td>
        <td width="12.5%" style="padding-left:0px; padding-right:15px;"><s:textfield name="formbean.mobileno"  id="mobileno" size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>
       
        </tr>
 		<tr>	
      		
     		
        	<td width="12.5%" style="padding-left:15px; padding-right:0px;"><label>Address:</label></td>
        	<td width="12.5%" style="padding-left:0px; padding-right:15px;"><s:textfield name="formbean.address"  id="address" size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>
     
     	    <td width="12.5%" style="padding-left:15px; padding-right:0px;"><label>Product</label></td>
        	<td width="12.5%" style="padding-left:0px; padding-right:15px;"><s:textfield name="formbean.product"  id="product" size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>
     
     		 <td width="12.5%" style="padding-left:15px; padding-right:0px;"><label>E-mail&nbsp;ID:</label></td>
        	 <td width="12.5%" style="padding-left:0px; padding-right:15px;"><s:textfield name="formbean.email"  id="email" size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>
        </tr>
        
        <tr>	
      		
        	<td width="12.5%" style="padding-left:15px; padding-right:0px;"><label>City:</label></td>
        	<td width="12.5%" style="padding-left:0px; padding-right:15px;"><s:textfield name="formbean.city"  id="city" size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>
    		
    		<td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Prod&nbsp;Serial&nbsp;No:</td>
        	<td width="12.5%" style="padding-left:0px; padding-right:15px;"><s:textfield name="formbean.productid"  id="productid" size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>
        
            <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Payout&nbsp;Type:</td>
        	<td width="12.5%" style="padding-left:0px; padding-right:15px;"><s:select name="formbean.payouttype" list="#{'WAR':'WAR','WW':'WW','AMC':'AMC'}" id="payouttype" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99;width:203px;" onchange="brandcode();"/></td>
       </tr>
        
	   <tr>
	 	    <td width="12.5%" style="padding-left:15px; padding-right:0px;"><label>Pin:</label></td>
        	<td width="12.5%" style="padding-left:0px; padding-right:15px;"><s:textfield name="formbean.pincode"  id="pincode" size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>
    		
    		
	 		<td width="12.5%" rowspan="2" style="padding-left:15px; padding-right:0px;"><label>Remarks:</label></td>
        	<td width="30.5%" colspan="3" rowspan="2" style="padding-left:0px; padding-right:15px;"><s:textarea name="formbean.remarks"  id="remarks" placeholder="Enter Remarks" rows="2" cols="72" cssStyle="border:1px solid #ccc;background:#FFFF99"></s:textarea></td>
     
     		
	 
	 </tr>   
	 <tr>
	 
	 		<td width="12.5%" style="padding-left:15px; padding-right:0px;"><label>Place:</label></td>
        	<td width="12.5%" style="padding-left:0px; padding-right:15px;"><s:textfield name="formbean.state"  id="state" size="30" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>
	 
	 </tr> 
	  </table>

  
  <table id="table1" style="border:2px;width:92%;cell-padding:0px" >  
		<tr bgcolor="#4292b2" style="color:white">
			<th width="1.5%"><label></label></th>
			<th width="3.5%" ><label>SL&nbsp;No</label></th>
			<th width="6%" ><label>Particulars</label></th>
			<th width="6%" ><label>Problem Report</label></th>
			<th width="6%" ><label>Status</label></th>
			<th width="6%" ><label>Attended By</label></th>
		</tr>

	<s:if test="%{formbean}">
		<tr>
			<td width="1.5%"><input type="checkbox"></input></td>
			<td width="3.5%" ><s:textfield name="formbean.slno"  id="slno" size="5" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>
			<td width="6%" ><s:textfield name="formbean.particulars"  id="particulars" size="40" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>
			<td width="6%" ><s:textfield name="formbean.report"  id="report" size="40" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>
			<td width="6%" ><s:textfield name="formbean.status"  id="status" size="40" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>
			<td width="6%" ><s:textfield name="formbean.attendedby"  id="attendedby" size="40" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>
			
		</tr>
	</s:if>
	
	<s:else>
	<%int i=0; %>
	<s:iterator value="formbean.slno" status="status">
		<tr>
			<td width="1.5%"><input type="checkbox"></input></td>
			<td width="3.5%" ><s:textfield name="formbean.slno[%{#status.count-1}]"  id="slno" cssClass="slno" size="5" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield><input type="hidden" name="formbean.slnoh" class="slnoh" id="slnoh"></input></td>
			<td width="6%" ><s:textfield name="formbean.particulars[%{#status.count-1}]" cssClass="particulars" id="particulars" size="40" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield><input type="hidden" name="formbean.particualrsh" class="particularsh" id="particularsh"></input></td>
			<td width="6%" ><s:textfield name="formbean.report[%{#status.count-1}]" cssClass="report" id="report" size="40" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield><input type="hidden" name="formbean.reporth" class="reporth" id="reporth"></input></td>
			<td width="6%" ><s:textfield name="formbean.status[%{#status.count-1}]" cssClass="status" id="status" size="40" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield><input type="hidden" name="formbean.statush" class="statush" id="statush"></input></td>
			<td width="6%" ><s:textfield name="formbean.attendedby[%{#status.count-1}]" cssClass="attendedby" id="attendedby" size="40" cssStyle="height:25px;border:1px solid #ccc;background:#FFFF99"></s:textfield><input type="hidden" name="formbean.attendedbyh" class="attendedbyh" id="attendedbyh"></input></td>
		</tr>
	<%i++; %>
	</s:iterator>
	</s:else>
 </table>     
 		<div align="right" style="width:92%;position:relative;  padding:7px;">
        <input type="button" name="add" Class="butStnd" value="Add Row"  onclick="addRow('table1');"></input>
      	<input type="button" name="delete" Class="butStnd" value="Delete Row"  onclick="deleteRow('table1');"></input>
      	<s:submit name="formbean.save" value="Submit" cssClass="butStnd" onclick="getValue();"></s:submit>
        
      </div>
</s:form>  	
</fieldset>

	<p>&nbsp;</p>
	<s:if test="usList1">
	
	<display:table id="table"  name="usList1" pagesize="25"  class="imagetable" requestURI=""     export="true" style="width:95%;color:#000">
	    
	 <s:if test="%{#attr.table.id == formbean.id}">
	
	<display:column property="slno"   title="Sl No" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	<display:column property="customername"   title="Customer Name"  style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable"/>
	<display:column property="address"   title="Address" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	<display:column property="email"   title="Email Id" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	<display:column property="mobileno"   title="Mobile No" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	<display:column property="model"   title="Model" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	<display:column property="product"   title="Product" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	<display:column property="payouttype"   title="Payout Type" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column title="Update" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
    <a href="<s:url action="salescrmservicesupdate" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param><s:param  name="voucherno" value="%{#attr.table.voucherno}"></s:param></s:url>" style="color:  #fff;text-decoration:none;font-size:12px;" class="classname">Update</a>
    </display:column>
    
    <display:column title="Delete" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
    <a href="<s:url action="salescrmservicesdelete" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param><s:param  name="voucherno" value="%{#attr.table.voucherno}"></s:param></s:url>" style="color:  #fff;text-decoration:none;font-size:12px;" class="print" onclick="return confirmation();">Delete</a>
    </display:column>
	</s:if>
	<s:else>
		 
	
	<display:column property="slno"   title="Sl No" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	<display:column property="customername"   title="Customer Name"  style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable"/>
	<display:column property="address"   title="Address" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	<display:column property="email"   title="Email Id" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	<display:column property="mobileno"   title="Mobile No" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	<display:column property="model"   title="Model" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	<display:column property="product"   title="Product" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	<display:column property="payouttype"   title="Payout Type" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column title="Update" media="html" style="text-align: center;width:8%;background-color:#fff;" >
    <a href="<s:url action="salescrmservicesupdate" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param><s:param  name="voucherno" value="%{#attr.table.voucherno}"></s:param></s:url>" style="color:#fff;text-decoration:none;font-size:12px;" class="classname">Update</a>
    </display:column>
    
    <display:column title="Delete" media="html" style="text-align: center;width:8%;background-color:#fff;" >
    <a href="<s:url action="salescrmservicesdelete" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param><s:param  name="voucherno" value="%{#attr.table.voucherno}"></s:param></s:url>" style="color: #fff;text-decoration:none;font-size:12px;" class="print" onclick="return confirmation();">Delete</a>
    </display:column>
    
	</s:else> 
	   
    </display:table>
	</s:if>
<br/>
        
 
</body>
</html>
