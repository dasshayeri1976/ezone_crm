<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='sec' uri='http://www.springframework.org/security/tags' %> 
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@page import="com.connection.ezonecrm.ConnectionDAO"%>
<%@ page import="java.sql.*"%>
<%@ page session="true"%>
<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title><h3>Jobwork Entry</h3></title>
<script language="javascript" type="text/javascript" src="js/tablefilter.js"></script>
<link rel="stylesheet" href="css/style2.css" />
<link rel="stylesheet" href="./css/draftbutton.css" />
<link rel="stylesheet" href="./css/printbutton.css" />
<link rel="stylesheet" href="css/breadcumbs.css" ></link>


</head>
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

#mybuttondialog3
{
	display: none;
}

#abc
{
	display: none;
}

#inspect_btn_dialog
{
	display:none;

}

</style>

<sj:head jqueryui="true"/>

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
	
<link rel="stylesheet" type="text/css" href="./css/easyui.css"/>
<script type="text/javascript" src="./js/jquery.easyui.min.js"></script>

<script>
		var $easy = $.noConflict(true);
	</script>
	
	
<%--added by Nilesh 31st March --%>	
<script type="text/javascript">
function check_field(){
	
	
	var serial = document.getElementById('pserial').value;
	var brand = document.getElementById('bname').value;
	var model = document.getElementById('mcode').value;
	
	if(serial == null || serial == '')
	{
		alert('Please provide Product Serial No');
		document.getElementById('pserial').focus();				
		return false;
	}
	
	if(brand == null || brand == ''){
		alert('Please provide Brand Name');
		document.getElementById('bname').focus();
		return false;
	}
	if(model == null || model == ''){
		alert('Please provide model');
		document.getElementById('mcode').focus();
		return false;
	}
	
	else{
	
		$( "#inspect_btn_dialog" ).dialog("open");
		
	}
	
	return true;
}
	
</script>



<script>
 $(document).keydown(function(e)
{
	var x = e.which || e.keyCode;
	
	var url="customerlist";
	
	if(x=="115")//F4 key pressed
	{
		window.location=url;
		//alert(url);
	}
}); 

/* $(document).keydown(function(e)
		{
			var x = e.which || e.keyCode;
			//alert(x);
			 if(x=="117")//F6 key pressed
			{
				window.open("descsearch");
			}  
		}); */
</script>

<%--added by Nilesh 31st March --%>
<script type="text/javascript">




// added by Nilesh
function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}


function fetchValueFromHiddenFields()
	{
	
		// alert("fetchValueFromHiddenFields() method called!!");

	   document.getElementById("adapter1").value = document.getElementById("adopter").value;
	   
	   document.getElementById("battery1").value = document.getElementById("battery").value;
   
	   document.getElementById("harddisk1").value = document.getElementById("hdd").value;
	   
	   document.getElementById("odd1").value = document.getElementById("opd").value;
	   
	   document.getElementById("ram1").value = document.getElementById("ram").value;
	   
	   document.getElementById("screen1").value = document.getElementById("screen").value;
	   
	   document.getElementById("keyboard1").value = document.getElementById("keyboard").value;
	   
	   document.getElementById("other1").value = document.getElementById("other_accessories").value;
		   
	   document.getElementById("physical1").value = document.getElementById("physical_damaged").value;
		   
	   document.getElementById("wifi1").value = document.getElementById("wifi_value").value;
	   
	   document.getElementById("bag1").value = document.getElementById("bag_value").value;
   
   	   //document.getElementById("engineername1").value = document.getElementById("engineer_name").value;
   	   	
   	   // added by Nilesh 31st March
   	   document.getElementById("engineername1").value=document.getElementById("engineer_name").value;
   	   
   	   
	}
	
	function closeDialog()
	{
		 $( "#inspect_btn_dialog" ).dialog("close");
	}

</script>

<script type="text/javascript">
	function getInspectedByName()
	{
		if (typeof XMLHttpRequest != "undefined") 
		{
			xmlHttp5 = new XMLHttpRequest();
		} 
		else if (window.ActiveXObject) 
		{
			xmlHttp5 = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (xmlHttp5 == null) 
		{
			alert("Browser does not support XMLHTTP Request");
			return;
		}
		var s11 = document.getElementById('password').value;
		
		var url = "./Body/transaction/getInspectedByName.jsp"; 
		url += "?password=" + s11; 
		xmlHttp5.onreadystatechange = getPass;
		xmlHttp5.open("POST", url, true);
		xmlHttp5.send(null);
	}
	
	function getPass() {
		if (xmlHttp5.readyState == 4 || xmlHttp5.readyState == "complete") 
		{
			var e=xmlHttp5.responseText;
			
			document.getElementById("engineername1").value = e;
			
			document.getElementById("engineer_name").value = document.getElementById("engineername1").value;
			
		}
	};
</script>

<script type="text/javascript">
	function askPass()
	{
		var pass = document.getElementById("password");
		
		if(pass.value == "" || pass.value == null)
			{
				alert("Please enter password");
				pass.focus();
				return false;
			}
		return true;
	}
	


</script>

<%-- <script type="text/javascript">
	function delayFunction()
	{
		  setTimeout(function() { displayCustomerRec(); }, 500);
	}
	
	function displayCustomerRec()
	{
		
		
		if (typeof XMLHttpRequest != "undefined") {
			xmlHttp6 = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			xmlHttp6 = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (xmlHttp6 == null) {
			alert("Browser does not support XMLHTTP Request");
			return;
		}
		
		var s1 = document.getElementById("name").value;
		
		//alert(s1);
		
		
		var url = "./Body/transaction/customerdetails.jsp";
		url += "?customername=" + s1;
		xmlHttp6.onreadystatechange = codeAdd4;
		xmlHttp6.open("GET", url, true);
		xmlHttp6.send(null);
		
	}
	
	function codeAdd4() {
		if (xmlHttp6.readyState == 4 || xmlHttp6.readyState == "complete") {

			var x=xmlHttp6.responseText;
			
			//document.getElementById("address").value = x;
			
			x=x.split("`");
			
			document.getElementById("address").value = x[0];
			
			
			document.getElementById("mobile").value = x[1];
			
			
			document.getElementById("pon").value = x[2];
			
			document.getElementById("email").value = x[3];
			
		}
	}
</script>
 --%>
	
<script language="Javascript">
	function Validate() {
		var a = document.getElementById('scode');
		//var b = document.getElementById('name');
		
		var c = document.getElementById('mobile');
		
		var d = document.getElementById('bname');
		
		var e = document.getElementById('pserial');
		
		var f = document.getElementById('cdate');
		
		var g = document.getElementById('ctype');
		
		var h = document.getElementById('place');
		
		var i = document.getElementById('pon');
		
		
		var j = document.getElementById('pdate');
		
		var k = document.getElementById('mcode');
		
		
		if(j.value != ""){	
			
		
			
			if(j.value < f.value)
			{
				aleart(j.value,f.value);
				
				alert('Delivery Date Must Be > Call Date, Fill-Up Properly');
				j.focus();
				return false;
			}
		
			
			}
		
		
			if ((a.value == null) || (a.value == "")) {
				alert("Please Enter Company Call ID");
				a.focus();
				return false;
			}
	
		/*if ((b.value == null) || (b.value == "")) {
			alert("Please Enter Engineer Name");
			b.focus();
			return false;
		}*/
			
			if ((c.value == null) || (c.value == ""))
			{
				alert("Please Enter Office Mobile No.");
				c.focus();
				return false;
			}
		
		// added by Nilesh 4th April
		
			if ((c.value != null))
					if (c.value.length > 10)
					{
						alert("Mobile No can not exceed 10 digits");
						c.focus();
						return false;
					}
				if (c.value.length < 10)
				{
					alert("Mobile No must have at least 10 digits");
					c.focus();
					return false;
				}
				
		/* if ((i.value != null))
			if (i.value.length > 10)
				{
					alert("Phone No can not exceed 10 digits");
					i.focus();
					return false;
				}
		
			if (i.value.length < 10)
				{
					alert("Phone No must have at least 10 digits");
					i.focus();
					return false;
				} */
		
		
			if ((d.value == null) || (d.value == ""))
			{
				alert("Please Select Brand");
				d.focus();
				return false;
			}
		
			if ((e.value == null) || (e.value == ""))
			{
				alert("Please Enter Product Serial No.");
				e.focus();
				return false;
			}
		
			if ((f.value == null) || (f.value == ""))
			{
				alert("Please Select Call Date");
				f.focus();
				return false;
			}
		
			if ((g.value == null) || (g.value == ""))
			{
			alert("Please Select Call Type");
			g.focus();
			return false;
		}
		
		

			if ((k.value == null) || (k.value == ""))
			{
				alert("Please Select Model");
				k.focus();
				return false;
			}
		
			if ((h.value == null) || (h.value == ""))
			{
				alert("Please Select Place");
				h.focus();
				return false;
			}
		
		return true;
	}
	
</script>

<script type="text/javascript">
	function confirmation2(a)
	{
		
		//alert("Confirmation2 called");
		var x='';

		popitup('printdetails.jsp?value='+ a + "&age=" + 0);

		//return x;
		
	}
</script>

<script language="javascript" type="text/javascript">
	var xmlHttp1;
	var xmlHttp1;

	function placecode() {
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
		var s1 = document.getElementById("place").value;
		//alert('S1: '+s1);
		//var s = document.getElementById("section").value;
		//var s = document.getElementById("source").value;
		//document.getElementById("newspaperadd").value = s;
		var url = "./Body/master/placecode.jsp";
		url += "?count=" + s1; // + "&sec=" + s;
		//url +="?count=" +str+"&date1="+s;
		xmlHttp1.onreadystatechange = codeAdd;
		xmlHttp1.open("GET", url, true);
		xmlHttp1.send(null);

	}

	function codeAdd() {
		if (xmlHttp1.readyState == 4 || xmlHttp1.readyState == "complete") {

			//document.getElementById("pcode").innerHTML = xmlHttp1.responseText;
			var x=xmlHttp1.responseText;
			x=x.split("-");
			//alert(x);
			//document.getElementById("ccode").value = x[0];
			document.getElementById("city").value = x[1];
			document.getElementById("district").value = x[2];
			//document.getElementById("state").value = x[3];
			document.getElementById("pcode").value = x[4];
			//alert(document.getElementById("dist").innerHTML);
			//document.getElementById("section1").innerHTML = xmlHttp.responseText;

		}
	}
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
			document.getElementById("amount").value = x[1];
			document.getElementById("icharge").value = x[2];
			//alert(document.getElementById("dist").innerHTML);
			//document.getElementById("section1").innerHTML = xmlHttp.responseText;

		}
	}
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

function placesave(){
	
	
	  if (typeof XMLHttpRequest != "undefined"){
	      xmlHttp1= new XMLHttpRequest();
	      }
	      else if (window.ActiveXObject){
	      xmlHttp1= new ActiveXObject("Microsoft.XMLHTTP");
	      }
	      if (xmlHttp1==null){
	      alert("Browser does not support XMLHTTP Request");
	      return;
	      }
	      
	      var a=document.getElementById('pmcode').value;
	      //alert(a);
	      var b=document.getElementById('pname').value;
	      var c=document.getElementById('pincode').value;
	      var d=document.getElementById('city1').value;
	      //var s=document.getElementById("datepicker").value;
	      
	    if ((a==null)||(a=="")){
			alert("Please Enter the Placecode");
			document.getElementById('pmcode').focus();
			//return false;
			}
	    else
	    	{
	    	 if ((b==null)||(b==""))
	    	 {
	 			alert("Please Enter the Place Name");
	 			document.getElementById('pname').focus();
	 			//return false;
	 			
	    	 }
	    	 else
	    	 {
	    		 if ((c==null)||(c==""))
		    	 {
		 			alert("Please Select the Pincode");
		 			document.getElementById('pincode').focus();
		 			//return false;
		 			
		    	 } 
	    		 else
	    			 {
	    			 
	    			 if ((d==null)||(d==""))
			    	 {
			 			alert("Please Select the City");
			 			document.getElementById('city1').focus();
			 			//return false;
			 			
			    	 } 
	    	 
	    else
	    {
	      var url="./Body/place/place.jsp";
	      url +="?pmcode=" +a+ "&name=" + b+ "&pin=" + c+ "&city=" + d;
	      xmlHttp1.onreadystatechange = stateChange;
	      xmlHttp1.open("GET", url, true);
	      xmlHttp1.send(null);
	    }
	    }
	    }
	    }
	    }
 
 	function stateChange(){ 
 		
  	if (xmlHttp1.readyState==4 || xmlHttp1.readyState=="complete"){
  		//alert('Avi');
  	var x=xmlHttp1.responseText;
  		x=x.split("|");
  		//alert(x);
  	document.getElementById("comprin1").innerHTML=x[1];
  	document.getElementById("place").innerHTML=x[0];
  	document.getElementById('pmcode').value=x[2];
  	document.getElementById('pname').value="";
  	document.getElementById('pincode').value="";
  	document.getElementById('city').value="";
  	
  	}
  	};
  	
 
  	
  </script>
  
<script language="javascript" type="text/javascript">

function modelsave(){
	
	
	  if (typeof XMLHttpRequest != "undefined"){
	      xmlHttp02= new XMLHttpRequest();
	      }
	      else if (window.ActiveXObject){
	      xmlHttp02= new ActiveXObject("Microsoft.XMLHTTP");
	      }
	      if (xmlHttp02==null){
	      alert("Browser does not support XMLHTTP Request");
	      return;
	      }
	      
	      var a=document.getElementById('modelcode').value;
	      //alert(a);
	      var b=document.getElementById('modelname').value;
	      var c=document.getElementById('brandname').value;
	      var d=document.getElementById('productname').value;
	      //var s=document.getElementById("datepicker").value;
	      
	    if ((a==null)||(a=="")){
			alert("Please Enter the Model code");
			document.getElementById('modelcode').focus();
			//return false;
			}
	    else
	    	{
	    	 if ((b==null)||(b==""))
	    	 {
	 			alert("Please Enter the Model Name");
	 			document.getElementById('modelname').focus();
	 			//return false;
	 			
	    	 }
	    	 else
	    	 {
	    		 if ((c==null)||(c==""))
		    	 {
		 			alert("Please Select the Brand name");
		 			document.getElementById('brandname').focus();
		 			//return false;
		 			
		    	 } 
	    		 else
	    			 {
	    			 
	    			 if ((d==null)||(d==""))
			    	 {
			 			alert("Please Select the Product Name");
			 			document.getElementById('productname').focus();
			 			//return false;
			 			
			    	 } 
	    	 
	    else
	    {
	      var url="./Body/model/model.jsp";
	      url +="?modelcode=" +a+ "&modelname=" + b+ "&brandname=" + c+ "&productname=" + d;
	      xmlHttp02.onreadystatechange = stateChange011;
	      xmlHttp02.open("GET", url, true);
	      xmlHttp02.send(null);
	    }
	    }
	    }
	    }
	    }
 
 	function stateChange011(){ 
 		
  	if (xmlHttp02.readyState==4 || xmlHttp02.readyState=="complete"){
  		alert('Avi');
  	var x=xmlHttp02.responseText;
  		x=x.split("|");
  		//alert(x);
  	document.getElementById("comprin2").innerHTML=x[1];
  	document.getElementById("mcode").innerHTML=x[0];
  	document.getElementById('modelcode').value=x[2];
  	document.getElementById('modelname').value="";
  	document.getElementById('brandname').value="";
  	document.getElementById('productname').value="";
  	
  	}
  	};
  	
  
  	
  </script>
  
  
  
  <script language="javascript" type="text/javascript">

function brandsave(){
	
	
	  if (typeof XMLHttpRequest != "undefined"){
	      xmlHttp1= new XMLHttpRequest();
	      }
	      else if (window.ActiveXObject){
	      xmlHttp1= new ActiveXObject("Microsoft.XMLHTTP");
	      }
	      if (xmlHttp1==null){
	      alert("Browser does not support XMLHTTP Request");
	      return;
	      }
	      
	      var a=document.getElementById('brandcode').value;
	      var b=document.getElementById('brname').value;
	      var c=document.getElementById('companyname').value;
	   
	      
	    if ((a==null)||(a=="")){
			alert("Please Enter the Brand code");
			document.getElementById('brandcode').focus();
			//return false;
			}
	    else
	    	{
	    	 if ((b==null)||(b==""))
	    	 {
	 			alert("Please Enter the Brand Name");
	 			document.getElementById('brname').focus();
	 			//return false;
	 			
	    	 }
	    	 else
	    	 {
	    		 if ((c==null)||(c==""))
		    	 {
		 			alert("Please Select the Company name");
		 			document.getElementById('companyname').focus();
		 			//return false;
		 			
		    	 } 
	    		 
	    	 
	    else
	    {
	      var url="./Body/brand/brand.jsp";
	      url +="?brandcode=" +a+ "&brandname=" + b+ "&companyname=" + c;
	      xmlHttp1.onreadystatechange = stateChange2;
	      xmlHttp1.open("GET", url, true);
	      xmlHttp1.send(null);
	    }
	    }
	    }
	    }
	    
 
 	function stateChange2(){ 
 		
  	if (xmlHttp1.readyState==4 || xmlHttp1.readyState=="complete"){
  		//alert('Avi');
  	var x=xmlHttp1.responseText;
  		x=x.split("|");
  		//alert(x);
  	document.getElementById("comprin3").innerHTML=x[1];
  	document.getElementById("bname").innerHTML=x[0];
  	document.getElementById('brandcode').value=x[2];
  	document.getElementById('brname').value="";
  	document.getElementById('companyname').value="";
  
  	
  	}
  	};
  	
  	function cancelButton1(){
  	    //alert('Cancel Button pressed!');
  	    $('#mybuttondialog1').dialog('close');
  	    document.getElementById("comprin2").innerHTML="";
  	    location.reload();
  	   }
  	
  </script>
  
  <script language="javascript" type="text/javascript">

function complainsave(){
	
	
	  if (typeof XMLHttpRequest != "undefined"){
	      xmlHttp03= new XMLHttpRequest();
	      }
	      else if (window.ActiveXObject){
	      xmlHttp03= new ActiveXObject("Microsoft.XMLHTTP");
	      }
	      if (xmlHttp03==null){
	      alert("Browser does not support XMLHTTP Request");
	      return;
	      }
	      
	      var a=document.getElementById('complaincode').value;
	      
	      //var rp = $('#cc').combobox('getValues');
	      //alert(rp);
	      
	      var b=document.getElementById('complainname').value;
	     
	      
	    if ((a==null)||(a=="")){
			alert("Please Enter the Complain code");
			document.getElementById('complaincode').focus();
			//return false;
			}
	    else
	    	{
	    	 if ((b==null)||(b==""))
	    	 {
	 			alert("Please Enter the Complain Name");
	 			document.getElementById('complainname').focus();
	 			//return false;
	 			
	    	 }
	    	else
	    	{
	      	var url="./Body/complain/complain.jsp";
	      	url +="?complaincode=" +a+ "&complainname=" + b;
	      	xmlHttp03.onreadystatechange = stateChange011;
	      	xmlHttp03.open("GET", url, true);
	      	xmlHttp03.send(null);
	    	}
	    }
	   
	    }
 
 	function stateChange011(){ 
 		
  	if (xmlHttp03.readyState==4 || xmlHttp03.readyState=="complete"){
  		//alert('Avi');
  	var x=xmlHttp03.responseText;
  	x=x.split("|");
		
  	document.getElementById("comprin4").innerHTML=x[0];
  	document.getElementById("complaincode").innerHTML=x[1];
   	document.getElementById('complainname').value="";
    var rp = $easy('#cc').combobox('getValues');
    $easy('#cc').combogrid({url:'value.jsp'}); 
    $easy('#cc').combogrid('setValues', rp);
   
	
	
   	
  	}
  	};
  	
  
  	
  </script>

<script type="text/javascript">

function checkbrand()
{
	 var a=document.getElementById('bname').value;
	 document.getElementById('brandname').value=a;
	
}

function jobid() 
{
	var a=document.getElementById('ctype').value;
	if(a=='CARRY IN')
		{
			//var b=document.getElementById('ccode').value;
			
			var fixed = "EZC/RNC/";
			
			var c=b.substring(0,8);
			var d=b.substring(8);
			var e=c+"/"+d;
			
			
			document.getElementById('scode').value=e;
			document.getElementById('inspect_btn').style.visibility='visible';
		}
	
	else{
		document.getElementById('inspect_btn').style.visibility='hidden';
	}
}

function confirmation(a)
{
	if(a==1)
		{
		var r = confirm("This Sl No is still open with us, if you want to retrive?");
		var x='';
		if (r == true) 
		{
		   x = true;
		   avi();
		} 
		else 
		{
		    x = false;
		}
		}
		
		if(a==2)
		{
		var r = confirm("This Sl No is already register with us, if you want to retrive?");
		var x='';
		if (r == true) 
		{
		    x = true;
		    
		} 
		else 
		{
		    x = false;
		}
		}
		return x;
}

function avi()
{
	  //alert('Avich');
	    if (typeof XMLHttpRequest != "undefined") {
	        xmlHttp001 = new XMLHttpRequest();
	    } else if (window.ActiveXObject) {
	        xmlHttp001 = new ActiveXObject("Microsoft.XMLHTTP");
	    }
	    if (xmlHttp001 == null) {
	        alert("Browser does not support XMLHTTP Request");
	        return;
	    }
	  var a=document.getElementById('pserial').value;
	    
	  var url="./Body/slno/datacheck.jsp";
	    url += "?pserial=" + a;
	    xmlHttp001.onreadystatechange = stateChange005;
	    xmlHttp001.open("GET", url, true);
	    xmlHttp001.send(null);
	    //alert(a);   
	};

	function stateChange005() {
	    if (xmlHttp001.readyState == 4 || xmlHttp001.readyState == "complete") 
	    {
	    	 var s = xmlHttp001.responseText;
	        s=s.split("||");
	        document.getElementById("bname").options[0].text = s[0];
	        document.getElementById("bname").value = s[0];
	        
	      	document.getElementById("ctype").options[0].text = s[1];
	      	document.getElementById("ctype").value = s[1];
	      	
	      	document.getElementById("cdate").value = s[2];
	      	document.getElementById("scode").value = s[3];
	      	document.getElementById("name").value = s[4];
	      	document.getElementById("address").value = s[5];
	      	
	      	document.getElementById("place").options[0].text = s[6];
	      	document.getElementById("place").value = s[6];
	      	
	      	document.getElementById("city").value = s[7];
	      	document.getElementById("district").value = s[8];
	      	document.getElementById("pcode").value = s[9];
	      	document.getElementById("pon").value = s[10];
	      	document.getElementById("mobile").value = s[11];
	      	document.getElementById("email").value = s[12];
	      	
	      	document.getElementById("mcode").options[0].text = s[13];
	      	document.getElementById("mcode").value = s[13];
	      	
	      	document.getElementById("fname").value = s[14];
	      	document.getElementById("pdate").value = s[15];
	      	
	      	document.getElementById("catagory").options[0].text = s[17];
	      	document.getElementById("catagory").value = s[17];
	      	
	      	document.getElementById("cptype").options[0].text = s[18];
	      	document.getElementById("cptype").value = s[18];
	      	
	      	document.getElementById("ptype").options[0].text = s[19];
	      	document.getElementById("ptype").value = s[19];
	      	
	      	document.getElementById("remarks").value = s[20];
	      	
	      	var a = new Array();
			x=s[16].split(",");
			//alert(x[0]);
			if(x.length>1)
			{
			for(i=0;i<x.length;i++)
			{
				a[i]=""+x[i].trim();
			}
			
			
			$('#cc').combogrid('setValues', a);
			}
			else
			{
			a[0]=""+x[0].trim();
			$('#cc').combogrid('setValue', a[0]);	
			}
	      	
	    }
	        
	        
	    };
</script>
<script type="text/javascript">

function delayFunction() {
	
	
    setTimeout(function() { displayCustomerRec(); }, 500);

}

	function displayCustomerRec()
	{
		
		
		if (typeof XMLHttpRequest != "undefined") {
			xmlHttp6 = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			xmlHttp6 = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (xmlHttp6 == null) {
			alert("Browser does not support XMLHTTP Request");
			return;
		}
		
		var s1 = document.getElementById("name").value;
		//alert(s1);
		var url = "./Body/transaction/customerdetails1.jsp";
		url += "?customername=" + s1;
		
		xmlHttp6.onreadystatechange = codeAdd4;
		xmlHttp6.open("GET", url, true);
		xmlHttp6.send(null);
		
	}
	
	function codeAdd4() {
		if (xmlHttp6.readyState == 4 || xmlHttp6.readyState == "complete") {

			var x=xmlHttp6.responseText;
			
			document.getElementById("address").value = x;
			
			x=x.split("`");
			
			document.getElementById("address").value = x[0];
			
			
			document.getElementById("mobile").value = x[1];
			
			
			document.getElementById("pon").value = x[2];
			
			document.getElementById("email").value = x[3];
			//alert(email);
			document.getElementById("place").value = x[4];
			
			document.getElementById("city").value = x[5];
			
			document.getElementById("district").value = x[6];
			
			document.getElementById("pcode").value = x[7];
			
			
		}
	}
	
</script>


<script language="javascript" type="text/javascript">

function checkslno1(){
	
	//alert('Avi');
	  if (typeof XMLHttpRequest != "undefined"){
	      xmlHttp01= new XMLHttpRequest();
	      }
	      else if (window.ActiveXObject){
	      xmlHttp01= new ActiveXObject("Microsoft.XMLHTTP");
	      }
	      if (xmlHttp01==null){
	      alert("Browser does not support XMLHTTP Request");
	      return;
	      }
	      
	      var a=document.getElementById('pserial').value;
	    
	      var url="./Body/slno/slno.jsp";
	      url +="?slcode=" +a;
	      xmlHttp01.onreadystatechange = stateChange1;
	      xmlHttp01.open("GET", url, true);
	      xmlHttp01.send(null);
	   		//alert('Avi');
	    }
 
 	function stateChange1(){ 
 		
  	if (xmlHttp01.readyState==4 || xmlHttp01.readyState=="complete"){
  		//alert('Avi');
  	var x=xmlHttp01.responseText;
  	//alert(x);
  	if(x!=0)
  	{
  	//alert(x)
  	confirmation(x);
  	}
  	else
  	document.getElementById("pserial").style.color='black';	
  	}
  	};
  	
  	function disable()
  	{
  		
  		document.getElementById("Button").disabled = true;
 	}
  	function condition()
  	{
  		d=document.getElementById("adopter").value;
  		if ((d.value == null) || (d.value == ""))
		{
			alert("you must be fill up Inspection Details");
			d.focus();
			return false;
		}
		
  	}

		
 
 	function enable()
  	{
  		document.getElementById("Button").disabled = false;
  	}
  </script>
  
  <script>
  function popitup(url) {
		newwindow=window.open(url,'view','height=800,width=850,resizable=no,menubar=yes,scrollbars=yes');
		x = (screen.availWidth - '1050') / 2;
		y = (screen.avaiHeight - '800') / 2;

		// move to the center of the page
		newwindow.moveTo(x, y);
		if (window.focus) {newwindow.focus();}
		return false;
	}
  </script>
  
 <script type="text/javascript">
 	function genCompanyCallID()
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
		
		//var s11 = document.getElementById('').value;
		
		var url = "./Body/transaction/getCompanyCall.jsp"; 
		
		xmlHttp4.onreadystatechange = getID;
		xmlHttp4.open("GET", url, true);
		xmlHttp4.send(null);
		
 	}
 	
 	
 	function getID() {
		if (xmlHttp4.readyState == 4 || xmlHttp4.readyState == "complete") 
		{
			var e=xmlHttp4.responseText;
			//alert(e);
			//alert("Company Call ID: "+e);
			
			var fix = "EZC/RNC ";
			
			// then 6 digits
			document.getElementById("scode").value = fix + e;
			
			
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

div.dataTables_wrapper {
        width: 90%;
        margin: 0 auto;
        
    }

</style>





<body onload="disable();jobid();"><center>

<sj:dialog
        id="mybuttondialog"
        autoOpen="false"
        modal="true"
        title="Place Adding"
        width="500"
        height="250"
        draggable="false"
        resizable="false"
        onCloseTopics="mybuttondialog"
       

    >
    
   
    <fieldset style="width:96%; border:solid thin #c6d5e1;Padding:5px;">
    <legend style="color:red;">Place Entry</legend>  
    <div class="welcome" id="comprin1" align="center"></div>  
    <table style="padding:5px 0px 5px 15px; color:#000000; width:100%">
    <tr>
    	<td width="12.5%" style="padding-left:15px; padding-right:15px;">Place_Code</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.mcode"  id="pmcode" size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" readonly="true"></s:textfield></td>       
     </tr>
     <tr>   
        <td width="12.5%" style="padding-left:15px; padding-right:15px;">Place_Name</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.name" id="pname"  size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>
     </tr>
     <tr>
       	<td width="12.5%" style="padding-left:15px; padding-right:15px;">Postal_Code</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.pincode" id="pincode"  size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>
      </tr>
      <tr> 
        <td width="12.5%" style="padding-left:15px; padding-right:15px;">City_Name</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:select name="formbean.city" list="usList2" id="city1" listKey="city" value="formbean.city" listValue="city" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;width:100px;" onchange="citycode();"/></td>
       
      </tr>    
    </table>
   
    <div align="right" style="width:95%; position:relative;  padding:10px;">
		
 		<s:submit  value="Save" cssClass="myButton" onclick="placesave();"></s:submit>
 		
 		
      </div>
     </fieldset>
    
    </sj:dialog>
    
    <sj:dialog
        id="mybuttondialog1"
        autoOpen="false"
        modal="true"
        title="Model Adding"
        width="500"
        height="250"
        draggable="false"
        resizable="false"
        onCloseTopics="mybuttondialog1"
       

    >
    
   
    <fieldset style="width:96%; border:solid thin #c6d5e1;Padding:5px;">
    <legend style="color:red;">Model Entry</legend>  
    <div class="welcome" id="comprin2" align="center"></div>  
    <table style="padding:5px 0px 5px 15px; color:#000000; width:100%">
    <tr>
    	<td width="12.5%" style="padding-left:15px; padding-right:15px;">Model_Code</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.modelcode"  id="modelcode" size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" readonly="true"></s:textfield></td>       
     </tr>
     <tr>   
        <td width="12.5%" style="padding-left:15px; padding-right:15px;">Model_Name</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.modelname" id="modelname"  size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>
     </tr>
     <tr>
       	<td width="12.5%" style="padding-left:15px; padding-right:15px;">Brand_Name</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.brandname" id="brandname"  size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" readonly="true"></s:textfield></td>
      </tr>
      <tr> 
        <td width="12.5%" style="padding-left:15px; padding-right:15px;">Product_Name</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:select name="formbean.productname" list="usList5" id="productname" listKey="productname" value="formbean.productname" listValue="productname" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;width:100px;" /></td>
       
      </tr>    
    </table>
   
    <div align="right" style="width:95%; position:relative;  padding:10px;">
		
 		<s:submit  value="Save" cssClass="myButton" onclick="modelsave();"></s:submit>
 		
 		
      </div>
     </fieldset>
    
    </sj:dialog>
    
    <sj:dialog
        id="mybuttondialog2"
        autoOpen="false"
        modal="true"
        title="Brand Adding"
        width="500"
        height="220"
        draggable="false"
        resizable="false"
        onCloseTopics="mybuttondialog2"
       

    >
    
   
    <fieldset style="width:96%; border:solid thin #c6d5e1;Padding:5px;">
    <legend style="color:red;">Brand Entry</legend>  
    <div class="welcome" id="comprin3" align="center"></div>  
    <table style="padding:5px 0px 5px 15px; color:#000000; width:100%">
    <tr>
    	<td width="12.5%" style="padding-left:15px; padding-right:15px;">Brand_Code</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.brandcode"  id="brandcode" size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" readonly="true"></s:textfield></td>       
     </tr>
     <tr>   
        <td width="12.5%" style="padding-left:15px; padding-right:15px;">Brand_Name</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.brandname" id="brname"  size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>
     </tr>
     <tr>
       	<td width="12.5%" style="padding-left:15px; padding-right:15px;">Company_Name</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:select name="formbean.companyname" list="usList7" id="companyname" listKey="companyname" value="formbean.companyname" listValue="companyname" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;width:100px;" /></td>
      </tr>
        
    </table>
   
    <div align="right" style="width:95%; position:relative;  padding:10px;">
		
 		<s:submit  value="Save" cssClass="myButton" onclick="brandsave();"></s:submit>
 		
 		
      </div>
     </fieldset>
    
    </sj:dialog>
    
    <sj:dialog
        id="mybuttondialog3"
        autoOpen="false"
        modal="true"
        title="Problem Adding"
        width="500"
        height="220"
        draggable="false"
        resizable="false"
        onCloseTopics="mybuttondialog3"
       

    >
    
   
    <fieldset style="width:96%; border:solid thin #c6d5e1;Padding:5px;">
    <legend style="color:red;">Problem Entry</legend>  
    <div class="welcome" id="comprin4" align="center"></div>  
    <table style="padding:5px 0px 5px 15px; color:#000000; width:100%">
    <tr>
    	<td width="12.5%" style="padding-left:15px; padding-right:15px;">Complain_code</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.complaincode"  id="complaincode" size="10" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" readonly="true"></s:textfield></td>       
     </tr>
     <tr>   
        <td width="12.5%" style="padding-left:15px; padding-right:15px;">Complain_Name</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.complainname" id="complainname"  size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>
     </tr>
    
    </table>
   
    <div align="right" style="width:95%; position:relative;  padding:10px;">
		
 		<s:submit  value="Save" cssClass="myButton" onclick="complainsave();"></s:submit>
 		
 		
      </div>
     </fieldset>
    
    </sj:dialog>
    
    <%-- New added dialog for adding inspection details button --%>
	    <sj:dialog
        id="inspect_btn_dialog"
        autoOpen="false"
        modal="true"
        title="Fill-Up Inspection Details"
        width="470"
        height="450"
        draggable="false"
        resizable="false"
        onCloseTopics="inspect_btn_dialog"
  
    >
    
   
    <fieldset style="width:80%; border:solid thin #c6d5e1;margin-top:2px">
    <legend style="color:red;">Inspection Details</legend>  
    <div class="welcome" id="comprin4" align="center"></div>  
    <table style="color:#000000; width:80%">
    
     <tr>
     	  <td width="12.5%" style="padding-left:15px; padding-right:15px;">Adopter</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.adopter" id="adopter" size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>       
     
      
     </tr>
     <tr>
     	  <td width="12.5%" style="padding-left:15px; padding-right:15px;">Battery</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.battery" id="battery"  size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>
     
     
     </tr>
     <tr>
     	<td width="12.5%" style="padding-left:15px; padding-right:15px;">HDD</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.hdd"  id="hdd" size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99"/></td>         
     	
     	
     </tr>
     
     <tr>
     	<td width="12.5%" style="padding-left:15px; padding-right:15px;">ODD</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.opd"  id="opd" size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>       
     	
     </tr>
     
     <tr>
     	<td width="12.5%" style="padding-left:15px; padding-right:15px;">RAM</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.ram"  id="ram" size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>       
     	
     	
     
     </tr>
     
     <tr>
     	<td width="12.5%" style="padding-left:15px; padding-right:15px;">Screen</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.screen"  id="screen" size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>       
     	
     
     </tr>
     
     <tr>
     	<td width="12.5%" style="padding-left:13px; padding-right:15px;">Keyboard</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.keyboard"  id="keyboard" size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>       
     	
     </tr>
    
    <tr>
    	<td width="12.5%" style="padding-left:10px; padding-right:10px;">Other&nbsp;Accessories</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.otheraccessories"  id="other_accessories" size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>       
    
    </tr>
    
    <tr>
    	<td width="12.5%" style="padding-left:10px; padding-right:10px;">Physical&nbsp;Damaged</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:textfield name="formbean.physicaldamaged"  id="physical_damaged" size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99"></s:textfield></td>       
     	
    
    </tr>
    
    <tr>
    	<td width="12.5%" style="padding-left:15px; padding-right:15px;">Wifi</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;">
        	<s:select label="Select Yes or No"
        		list="#{'1':'Yes','0':'No' }"
        		name="formbean.wifi_yes_no"
				id="wifi_value"        	
        		value="1"
        	 />
        </td>       
     	
    
    </tr>
    
    <tr>
    	<td width="12.5%" style="padding-left:15px; padding-right:15px;">Bag</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;">
        	<s:select label="Select Yes or No"
        		list="#{'1':'Yes','0':'No' }"
        		name="formbean.bag_yes_no"
        		id="bag_value" 
        		value="1"
        	 />
        	
        </td>       
    
    </tr>
    
    <%--added by Nilesh 31st March --%>
     <tr>
    	 <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Password</td>
		  <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">
		  			
		  		<s:password name="formbean.password"  id="password" size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onfocusout="getInspectedByName();"></s:password>	
		  </td>	
    
    </tr>
    
    <tr>
    	 <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Inspected By</td>
		  <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">
		  			
		  		<s:textfield name="formbean.engineer_name"  id="engineer_name" size="30" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" readonly="true"></s:textfield>	
		  </td>	
    
    </tr>
    
    </table>
   
    <div align="right" style="width:95%; position:relative;  padding:10px;">
		
 		<input type="button" id="saveButton"  value="Save" Class="myButton" onclick="askPass();fetchValueFromHiddenFields();closeDialog();enable();" /><!-- closeDialog(); askPass();fetchValueFromHiddenFields(); -->
 		
 		
      </div>
     </fieldset>
    
    </sj:dialog>
    

<s:form action="jobworkcreation" namespace="/" method="post">    
<div>
<ul id="breadcrumbs">
<li ><a href="#">System Settings</a></li>
<li >Jobwork Entry <b><s:textfield name="formbean.ccode" id="ccode"  size="13" cssStyle="height:20px;border:0px solid #ccc;background:#FFFF;padding-left:30px;font-size:15px;color:green;" readonly="true"></s:textfield></b></li>
</ul>
</div>

<s:if test="hasActionMessages()">
<div class="welcome">
<s:actionmessage/>
</div>

</s:if>
    
  <fieldset style="width:80%; border:solid thin #c6d5e1;Padding:5px;">
  <legend style="color:red;">Jobwork Entry</legend>
  
  
  <input type="hidden" name="formbean.id" value="<s:property value="formbean.id"/>"/>
  <input type="hidden" name="formbean.category" value="<s:property value="formbean.category"/>"/>
  
   <%-- added by Nilesh  --%>
  
   <input type="hidden" name="formbean.adapter1" id="adapter1" />
   <input type="hidden" name="formbean.battery1" id="battery1" />
   <input type="hidden" name="formbean.harddisk1" id="harddisk1" />
   <input type="hidden" name="formbean.odd1" id="odd1" />
   <input type="hidden" name="formbean.ram1" id="ram1" />
   <input type="hidden" name="formbean.screen1" id="screen1" />
   <input type="hidden" name="formbean.keyboard1" id="keyboard1" />
   <input type="hidden" name="formbean.other1" id="other1" />
   <input type="hidden" name="formbean.physical1" id="physical1" />
   <input type="hidden" name="formbean.wifi1" id="wifi1" />
   <input type="hidden" name="formbean.bag1" id="bag1" />
   <input type="hidden" name="formbean.engineername1" id="engineername1" />
   
   <%--added by Nilesh 31st March --%>
   <input type="hidden" name="formbean.password1" id="password1" />	
  
  <table width="80%" style="padding:10px;" >
	
	 <tr>
   <s:if test="%{formbean.pserial==null}">
	 	<td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Pro_Serial No</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:textfield name="formbean.pserial" id="pserial" onPaste="return true" size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" onkeyup="genCompanyCallID();"></s:textfield></td>       
   </s:if>
 <s:else>
  <s:iterator value="formbean.pserial" status="status">
   	<td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Pro_Serial No</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:textfield name="formbean.pserial" id="pserial" onPaste="return true" size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>       
   </s:iterator>
   </s:else>    
	 	<td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Brand</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:select name="formbean.bname" list="usList6" id="bname" listKey="bname" value="formbean.bname" listValue="bname" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;width:120px;" onchange="brandcode();"/> <%-- Nilesh, 4th april, I removed checkslno1() --%>
        <sj:a openDialog="mybuttondialog2" href="#"><img src="images/index.jpg" width="15" height="15" title="Click here to add new Brand"  onclick="checkbrand();"/></sj:a></td>
        
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Call Type</td>
		<td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:select name="formbean.ctype" id="ctype" list="usList8"  listKey="ctype" value="formbean.ctype" listValue="ctype" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;width:120px;"  onchange="jobid();"></s:select></td>
		      
		<%-- modified by Nilesh, 5th April --%>      
		
		 <s:if test="%{formbean.cdate!=null}">
		        
	      	<td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Call Date</td>
	        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><sj:datepicker name="formbean.cdate" id="cdate" size="15" buttonImageOnly="true" timepicker="true" timepickerFormat="hh:mm" displayFormat="yy-mm-dd" showButton="false"  changeYear="true" changeMonth="true" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" /></td>
	        
		</s:if>
		
		<s:else>
			<td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Call Date</td>
	        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><sj:datepicker name="formbean.cdate" id="cdate" size="15" buttonImageOnly="true" timepicker="true" timepickerFormat="hh:mm" displayFormat="yy-mm-dd" showButton="false" value="%{new java.util.Date()}" changeYear="true" changeMonth="true" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" /></td>
	        
		</s:else> 
       
        </tr>
        <tr>
        
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Company_Call_ID</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:textfield name="formbean.scode" id="scode"  size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>        
       
        
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Cus_Name</td>
       <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><sj:autocompleter name="formbean.name" id="name" list="usList9"  listValue="name" size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" forceValidOption="false" onchange="delayFunction();" ></sj:autocompleter></td>
          
        
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Address</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:textfield name="formbean.address" id="address"  size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>
        
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Place</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:select name="formbean.place" list="usList1" id="place" listKey="place" value="formbean.place" listValue="place" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;width:120px;" onchange="placecode();"/>
        <sj:a openDialog="mybuttondialog" href="#"><img src="images/index.jpg" width="15" height="15" title="Click here to add new Place"  /></sj:a></td>
              
           
        </tr>
        <tr>
        
        	<%--added by Nilesh, 31st March --%>
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Customer&nbsp;Reference&nbsp;ID</td>
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:textfield name="formbean.cust_ref_id" id="cust_ref_id" size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;"/></td>
        
          
        <%-- <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">City</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:textfield name="formbean.city" id="city"  size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" readonly="true"></s:textfield></td> --%>
               
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">District</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:textfield name="formbean.district" id="district"  size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" readonly="true"></s:textfield></td>
               
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">PinCode</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:textfield name="formbean.pcode" id="pcode"  size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" readonly="true"></s:textfield></td>
        
        <%--product field will be added here --%>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Product</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:textfield name="formbean.fname" id="fname"  size="20" readonly="true" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>
        
       </tr>
        <tr> 
        
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">City</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:textfield name="formbean.city" id="city"  size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" readonly="true"></s:textfield></td>
        
        <%-- <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Mobile</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:textfield name="formbean.mobile" id="mobile"  size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td> --%>
       
        
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Email</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:textfield name="formbean.email" id="email"  size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>
		
		<td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Model</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:select name="formbean.mcode" id="mcode" list="usList4" listKey="mcode" value="formbean.mcode" listValue="mcode" cssStyle=" border:1px solid #ccc;height:20px;background:#FFFF99;width:110px;" onchange="modelcode();"></s:select>
        <sj:a openDialog="mybuttondialog1" href="#"><img src="images/index.jpg" width="15" height="15" title="Click here to add new Model"  onclick="checkbrand();"/></sj:a></td>

		<%-- <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Product</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:textfield name="formbean.fname" id="fname"  size="20" readonly="true" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td> --%>
       
       	<%--phone field will be here --%>
         <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Phone</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:textfield name="formbean.pon" id="pon"  size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>
              		
		
       </tr>
       	       
        <tr>
        
        <%--modified by Nilesh, 31st March --%>
        <%-- <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">S_Charge</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:textfield name="formbean.amount" id="amount"  size="5"  cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield>&nbsp;<s:textfield name="formbean.icharge" id="icharge"  size="9" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" placeholder="  I_Charge"></s:textfield></td> --%>
        
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Mobile</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:textfield name="formbean.mobile" id="mobile"  size="20" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" ></s:textfield></td>
       
       <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Delivery&nbsp;Date</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><sj:datepicker name="formbean.pdate" id="pdate" size="15" buttonImageOnly="true" timepicker="true" timepickerFormat="hh:mm" displayFormat="yy-mm-dd" showButton="false" changeYear="true" changeMonth="true" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" /></td>
	     
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top" >Prb_Reported</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top" >
        
      	
	  <s:if test="%{formbean.id!=null}">
       <select id="cc" name="formbean.comcode"  class="easyui-combogrid" style="width:125px;" data-options="
			panelWidth: 200,
			multiple: true,
			idField: 'productname',
			value:'<s:property value="formbean.comcode"/>',
			textField: 'productname',
			url: 'value.jsp',
			method: 'get',
			columns: [[
				{field:'ck',checkbox:true},
				{field:'productname',title:'Product',width:120}
				
			]],
			fitColumns: true
		">
	</select>
	</s:if>
	<s:else>
	 <select id="cc" name="formbean.comcode"  class="easyui-combogrid" style="width:125px;" data-options="
			panelWidth: 200,
			multiple: true,
			idField: 'productname',
			textField: 'productname',
			url: 'value.jsp',
			method: 'get',
			columns: [[
				{field:'ck',checkbox:true},
				{field:'productname',title:'Product',width:120}
				
			]],
			fitColumns: true
		">
	</select>
	</s:else>
	<sj:a openDialog="mybuttondialog3" href="#"><img src="images/index.jpg" width="15" height="15" title="Click here to add new problem"  /></sj:a>
	</td>
    
      <!-- 
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top" >Call_Category</td>
		<td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:select name="formbean.catagory" id="catagory" list="#{'':'', 'WITH SPARE':'WITH SPARE', 'WITH OUT SPARE':'WITH OUT SPARE'}" cssStyle=" border:1px solid #ccc;height:20px;background:#FFFF99;width:120px;" readonly="true"></s:select></td>
	 -->
		
		      
        </tr>
                
        <tr>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Call_Priority</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:select name="formbean.cptype" id="cptype" list="#{'':'', 'URGENT':'URGENT', 'HIGH':'HIGH', 'MEDIUM':'MEDIUM', 'LOW':'LOW'}" cssStyle=" border:1px solid #ccc;height:20px;background:#FFFF99;width:120px;"></s:select></td>
		
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Payout_Type</td>
		<td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:select name="formbean.ptype" id="ptype" list="#{'':'', 'WAR':'WAR', 'NEW':'NEW', 'FOC':'FOC' }" cssStyle=" border:1px solid #ccc;height:20px;background:#FFFF99;width:120px;"></s:select></td>
		
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Customer_Remarks</td>
        <td width="12.5%" style="padding-left:15px; padding-right:15px;" colspan="3" valign="top"><s:textarea name="formbean.remarks" cols="60" rows="3" id="remarks" cssStyle="border:1px solid #ccc;background:#FFFF99"/></td>
          
       
        </tr>
        
        <%--added by Nilesh, 30th March --%>
        <%-- <tr>
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Customer&nbsp;Reference&nbsp;ID</td>
        	  <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><s:textfield name="formbean.cust_ref_id" id="cust_ref_id" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;width:139px;"/></td>
        </tr> --%>
        
        
    </table>
    <br/>
   	  <div align="center" style="width:100%; position:relative;border-bottom:solid thin #c6d5e1;">
      </div>
      <div align="right" style="width:99%;position:relative;padding:7px;">
        
        <input type="button" name="" id="inspect_btn" value="Inspection Details" Class="butStnd" style="margin-right:20px" onclick="return check_field();"/>
		
        
      	<s:submit name="formbean.save" id="Button" value="Save Jobwork" cssClass="butStnd" onclick="return Validate();condition();" ></s:submit>
        
      </div>
      
    
  	</fieldset>
	 </s:form>
	<p>&nbsp;</p>
	
	<s:if test="usList">
	
	
	<div id="abc">
	<display:table id="table" class="display nowrap"  name="usList" pagesize="5000"  requestURI=""    export="false" style="width:85%;color:#000;">
	    
	 <s:if test="%{#attr.table.id == formbean.id}">
	
	<display:column property="cdate"   title="Call_Date"  style="background-color:#ecf2f6;"  sortable="false" headerClass="sortable" /> 
   
   <%-- <display:column property="ctype"   title="Call_Type"  style="background-color:#ecf2f6;"  sortable="false" headerClass="sortable" /> --%>
	
	
	<%--added by Nilesh 31st March --%>
	
	<display:column property="ccode"   title="Jobwork_Id" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<display:column property="scode"   title="Com_Job_Id"  style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable"/>
	
	<display:column property="cust_ref_id"   title="Cust_Ref_Id"  style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable"/>
			
    <display:column property="name"   title="CusName" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	<display:column property="address"   title="Address" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	<%-- <display:column property="distance"   title="Distance(K.M)" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" /> --%>
	
	<display:column property="pon"   title="Phone" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	<display:column property="mobile"   title="Mobile" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	
	<display:column property="mcode"   title="Model" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	<display:column property="pserial"   title="ProSerial" style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable" />
	
	
	<display:column title="Update" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
    <a href="<s:url action="jobworkupdate" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color:  #fff;text-decoration:none;font-size:12px;" class="classname">Update</a>
    
    </display:column>
   <sec:authorize ifAnyGranted='ROLE_ADMIN'> 
    <display:column title="Delete" media="html" style="text-align: center;width:8%;background-color:#ecf2f6;" >
    	<a href="<s:url action="jobworkdelete" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color:  #fff;text-decoration:none;font-size:12px;" class="print" onclick="return confirmation();">Delete</a>
    </display:column>
   </sec:authorize>
   <s:if test="%{#attr.table.ctype =='CARRY IN' && #attr.table.ctype =='ALL'}">
    <display:column title="Print" media="html" style="background-color:#ecf2f6;">
        <a href="viewdetails.jsp?value=<s:property value="%{#attr.table.scode}"/>" style="text-decoration:none;"><span style="color:#fff;" onclick="return popitup('viewdetails.jsp?value=<s:property value="%{#attr.table.scode}"/>')" class="classname">Print</span></a>
	</display:column>
	</s:if>
	<s:else>
	<display:column title="Print" media="html" style="background-color:#ecf2f6;">
  	</display:column>
	</s:else>
	
  	</s:if>
	<s:else>
	
	
	<display:column property="cdate"   title="Call_Date"  style="background-color:#fff;"  sortable="false" headerClass="sortable" /> 

    <%-- <display:column property="ctype"   title="Call_Type"  style="background-color:#fff;"  sortable="false" headerClass="sortable" /> --%>
	
	<%--added by Nilesh, 31st March --%>
	
	<display:column property="ccode"   title="Jobwork_Id" style="background-color:#fff;"   sortable="false" headerClass="sortable" />
	<display:column property="scode"   title="ComJob_Id"  style="background-color:#fff;"   sortable="false" headerClass="sortable"/>
	<display:column property="cust_ref_id"   title="Cust_Ref_Id"  style="background-color:#ecf2f6;"   sortable="false" headerClass="sortable"/>
			
    <display:column property="name"   title="CusName" style="background-color:#fff;"   sortable="false" headerClass="sortable" />
	<display:column property="address"   title="Address" style="background-color:#fff;"   sortable="false" headerClass="sortable" />
	
	<%-- <display:column property="distance"   title="Distance(K.M)" style="background-color:#fff;"   sortable="false" headerClass="sortable" /> --%>
	
	<display:column property="pon"   title="Phone" style="background-color:#fff;"   sortable="false" headerClass="sortable" />
	<display:column property="mobile"   title="Mobile" style="background-color:#fff;"   sortable="false" headerClass="sortable" />
	
	
	<display:column property="mcode"   title="Model" style="background-color:#fff;"   sortable="false" headerClass="sortable" />
	<display:column property="pserial"   title="ProSerial" style="background-color:#fff;"   sortable="false" headerClass="sortable" />
		
	<display:column title="Update" media="html" style="text-align: center;width:8%;background-color:#fff;" >
    <a href="<s:url action="jobworkupdate" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color:#fff;text-decoration:none;font-size:12px;" class="classname">Update</a>
    </display:column>
    
    <sec:authorize ifAnyGranted='ROLE_ADMIN'>
    <display:column title="Delete" media="html" style="text-align: center;width:8%;background-color:#fff;" >
    <a href="<s:url action="jobworkdelete" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="color: #fff;text-decoration:none;font-size:12px;" class="print" onclick="return confirmation();">Delete</a>
    </display:column>
    </sec:authorize>
    
    <s:if test="%{#attr.table.ctype =='CARRY IN'}">
	<display:column title="Print" media="html" style="background-color:#fff;">
        <%-- <a href="printdetails.jsp?value=<s:property value="%{#attr.table.scode}"/>" style="text-decoration:none;"><span style="color:#fff;" onclick="return popitup('printdetails.jsp?value=<s:property value="%{#attr.table.scode}"/>')" class="classname">Print</span></a>--%>	
    	<span style="color:#fff;" class="classname" onclick="confirmation2('<s:property value="%{#attr.table.scode}"/>');">Print</span>
    </display:column>
    </s:if>
    <s:else>
    <display:column title="Print" media="html" style="background-color:#fff;">
 	</display:column>
    </s:else>
	
	</s:else> 
	   
    </display:table>
    </div>
	</s:if>
	
	
  <br/>
    
    <!--<script language="javascript" type="text/javascript">
//<![CDATA[
	setFilterGrid("table");
//]]>
</script>-->

          
</center></body>
</html>
