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
<%-- <link rel="stylesheet" type="text/css" media="all" href="./Body/fordatepick/jsDatePick_ltr.min.css" />
<script type="text/javascript" src="./Body/fordatepick/jsDatePick.min.1.3.js"></script> --%>

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

#mybuttondialog3
{
	display: none;
}

#mybuttondialog4
{
	display: none;
}

#mybuttondialog6
{
	display: none;
}

#inspect_btn_dialog7
{
	display: none;
}

#abc
{
	display: none;
}

#mybuttondialog5
{
	display: none;
}


</style>
<sj:head/>
<script language="Javascript">
	function Validate() {
		var a = document.getElementById('scode');
		var b = document.getElementById('name');
		var c = document.getElementById('mobile');
		if ((a.value == null) || (a.value == "")) {
			alert("Please Enter Engineer Code");
			a.focus();
			return false;
		}

		if ((b.value == null) || (b.value == "")) {
			alert("Please Enter Engineer Name");
			b.focus();
			return false;
		}
			
		if ((c.value == null) || (c.value == ""))
		{
			alert("Please Enter Office Mobile No.");
			c.focus();
			return false;
		}
		return true;
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



<script>
$(document).ready(function()
		{
			new JsDatePick
			({
				useMode:2,
				target:"cdate",
				dateFormat:"%Y-%m-%d"
			});
			
			
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
			//x=x.split("-");
			//alert(x);
			//document.getElementById("ccode").value = x[0];
			//document.getElementById("city").value = x[1];
			//document.getElementById("district").value = x[2];
			//document.getElementById("state").value = x[3];
			document.getElementById("fname").value = x;
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
	

function reallocation(a,b,c) {
	//alert(a);
	document.getElementById("id1").value = a;
	document.getElementById("comcode").value = b;
	document.getElementById("catg").value = c;
	
	if (typeof XMLHttpRequest != "undefined") {
		xmlHttp1 = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp1 = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp1 == null) {
		alert("Browser does not support XMLHTTP Request");
		return;
	}
	
	var url = "./Body/transaction/reallocation.jsp";
	url += "?id=" + a; // + "&sec=" + s;
	//url +="?count=" +str+"&date1="+s;
	xmlHttp1.onreadystatechange = codeAdd3;
	xmlHttp1.open("GET", url, true);
	xmlHttp1.send(null);

}

function codeAdd3() {
	if (xmlHttp1.readyState == 4 || xmlHttp1.readyState == "complete") {

		var x=xmlHttp1.responseText;
		x=x.split("|");
		document.getElementById("engn").innerHTML = x[0];
		document.getElementById("paid").innerHTML = x[2];
		try
		{
			$( "#mybuttondialog" ).dialog();
			
			var a = new Array();
			x=x[1].split(",");
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
		catch(e)
		{
			alert(e);
		}
		
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
	      var d=document.getElementById('city').value;
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
			 			document.getElementById('city').focus();
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
  	document.getElementById('pmcode').value="";
  	document.getElementById('pname').value="";
  	document.getElementById('pincode').value="";
  	document.getElementById('city').value="";
  	
  	}
  	};
  	
 
  	
  </script>
  
<script language="javascript" type="text/javascript">

function modelsave(){
	
	
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
	      xmlHttp1.onreadystatechange = stateChange1;
	      xmlHttp1.open("GET", url, true);
	      xmlHttp1.send(null);
	    }
	    }
	    }
	    }
	    }
 
 	function stateChange1(){ 
 		
  	if (xmlHttp1.readyState==4 || xmlHttp1.readyState=="complete"){
  		//alert('Avi');
  	var x=xmlHttp1.responseText;
  		x=x.split("|");
  		//alert(x);
  	document.getElementById("comprin2").innerHTML=x[1];
  	document.getElementById("mcode").innerHTML=x[0];
  	document.getElementById('modelcode').value="";
  	document.getElementById('modelname').value="";
  	document.getElementById('brandname').value="";
  	document.getElementById('productname').value="";
  	
  	}
  	};
  	
  
  	
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
  	document.getElementById('brandcode').value="";
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
  

<script type="text/javascript">

function checkbrand()
{
	 var a=document.getElementById('bname').value;
	 document.getElementById('brandname').value=a;
	
}

function seeList(form) {
    var result2 = "";
    var k=0;
    for (var i = 0; i < form.branch.length; i++) {
        if (form.branch.options[i].selected) {
        	if(k>0)
        	{
                result2 += ","+form.branch.options[i].text;
        	}
        	if(k==0)
        	{
            	result2 = form.branch.options[i].text ;
            	k++;
        	}   
           
        }
    }
     document.form1.checkcode.value= result2;
     alert(result2);
     document.getElementById('branchall').value=result2;
}

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

</script>

<script>
	function accid(a,b) 
	{
		if(b=='WITH SPARE')
		{
		document.getElementById("tsp").style.display = 'block';
		document.getElementById("sp").innerHTML = '';
		}
		else
		{
		document.getElementById("tsp").style.display = 'none';
		document.getElementById("sp").innerHTML = b;
		}
		
		document.getElementById("id").value = a;
		document.getElementById("catagory1").value = b;
		
	}
	
	function accid1(a,b) 
	{
		if(b=='WITH SPARE')
		{
		document.getElementById("tsp1").style.display = 'block';
		document.getElementById("sp1").innerHTML = '';
		}
		else
		{
		document.getElementById("tsp1").style.display = 'none';
		document.getElementById("sp1").innerHTML = b;
		}
		
		document.getElementById("id1").value = a;
		document.getElementById("catg").value = b;
		
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
<script type="text/javascript">
 	function enable()
  	{
  		document.getElementById("Button").disabled = false;
  	}
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
		 $( "#inspect_btn_dialog7" ).dialog("close");
	}

</script>
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
	
		$( "#inspect_btn_dialog7" ).dialog("open");
		
	}
	
	return true;
}
	
</script>
	
<script language="javascript" type="text/javascript">
	

	function engname(a) {
		
		
		if (typeof XMLHttpRequest != "undefined") {
			xmlHttp2 = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			xmlHttp2 = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (xmlHttp2 == null) {
			alert("Browser does not support XMLHTTP Request");
			return;
		}
		
		var url = "./Body/transaction/engname1.jsp";
		url += "?id=" + a; // + "&sec=" + s;
		//url +="?count=" +str+"&date1="+s;
		xmlHttp2.onreadystatechange = codeAdd4;
		xmlHttp2.open("GET", url, true);
		xmlHttp2.send(null);

	}

	function codeAdd4() {
		if (xmlHttp2.readyState == 4 || xmlHttp2.readyState == "complete") {

			
			document.getElementById("engname").innerHTML = xmlHttp2.responseText;
			document.getElementById("engn").innerHTML = xmlHttp2.responseText;
			
			
		}
	};
</script>

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
	    	
	    	scrollY:'55vh',
	    	 "scrollX": true,
	        paging:  false,
	        ordering: false,
	       
	    } );

	} );
 
 </script>
 <script type="text/javascript">
	function disable()
  	{
  		
  		document.getElementById("Button").disabled = true;
 	}
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
function timee()
{
	var d=new Date();
    var date=d.getDate();
    var month=d.getMonth()+1;
    var year=d.getFullYear();
    //alert(date+"-"+month+"-"+year);
    var weekday = new Array(7);
weekday[0] = "Sunday";
weekday[1] = "Monday";
weekday[2] = "Tuesday";
weekday[3] = "Wednesday";
weekday[4] = "Thursday";
weekday[5] = "Friday";
weekday[6] = "Saturday";
var n = weekday[d.getDay()];
    document.getElementById("cdate").value=year+"-"+month+"-"+date;
    document.getElementById("day1").innerHTML=n;	
	
}

</script>
 <script type="text/javascript">
 	function sendValue(a)
 	{
 		//alert(a);
 		document.getElementById('ccode1').value= a;
 		
 	}
 
 
 </script>
 
<link rel="stylesheet" type="text/css" href="css/easyui.css"/>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>

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


</head>
<body onload="disable();"><center>

<s:if test="formbean">




<s:form action="jobworkcreation1" namespace="/" method="post">    
<div>
<ul id="breadcrumbs">
<li ><a href="#">Transaction Management</a></li>
<li >Engineer Allocation(Carry In)<b><s:textfield name="formbean.ccode" id="ccode"  size="13" cssStyle="height:20px;border:0px solid #ccc;background:#FFFF;padding-left:30px;font-size:15px;color:green;" readonly="true"></s:textfield></b></li>
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
		
		 <s:if test="%{formbean.id!=null}">
		        
	      	<td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Call Date</td>
	          <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><sj:datepicker name="formbean.cdate" id="cdate" size="15" buttonImageOnly="true" timepicker="true" timepickerFormat="hh:mm" displayFormat="yy-mm-dd" showButton="false" changeYear="true" changeMonth="true" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" /></td>
	       
		</s:if>
		
		<%-- <s:else>
			<td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top">Call Date</td>
	        <td width="12.5%" style="padding-left:15px; padding-right:15px;" valign="top"><sj:datepicker name="formbean.cdate" id="cdate" size="15" buttonImageOnly="true" timepicker="true" timepickerFormat="hh:mm" displayFormat="yy-mm-dd" showButton="false" value="%{new java.util.Date()}" changeYear="true" changeMonth="true" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99" /></td>
	        
		</s:else>  --%>
       
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
	 
</s:if>
<s:else>       
<div>
<ul id="breadcrumbs">
<li ><a href="#">Transaction Management</a></li>
<li >Engineer Allocation(Carry In)</li>
</ul>
</div>

<s:if test="hasActionMessages()">
<div class="welcome">
<s:actionmessage/>
</div>
</s:if>
</s:else>    
  
 
	<p>&nbsp;</p>
	
	<div id="abc">
	<display:table id="table" class="display nowrap"  name="usList" pagesize="5000"  requestURI=""    export="false" style="width:85%;color:#000;">
	<display:column property="cdate"   title="Call_Date"   sortable="false" headerClass="sortable" />
	<display:column title="Com_Job_Id"  sortable="false" headerClass="sortable">
	<a href="viewdetails.jsp?value=<s:property value="scode"/>" style="text-decoration:none;"><span style="color:green;" onclick="return popitup('viewdetails.jsp?value=<s:property value="%{#attr.table.scode}"/>')"><s:property value="%{#attr.table.scode}"/></span></a>
	</display:column>		
	<display:column property="bname"   title="Brand Name"   sortable="false" headerClass="sortable" />
	<display:column property="mcode"   title="Model"   sortable="false" headerClass="sortable" />
	<display:column property="pserial"   title="ProSerial"   sortable="false" headerClass="sortable" />
	
	
	<display:column title="Allocation" style="text-align: center;width:8%;">
	<s:if test="%{#attr.table.allocation =='NA'}">
	<sj:a openDialog="mybuttondialog" href="#" cssClass="classname"	onclick="accid('%{#attr.table.id}','%{#attr.table.catagory}');engname('%{#attr.table.bname}');">Allocation</sj:a>
	</s:if>
	<s:else>
	<s:property value="%{#attr.table.allocation}" />
	</s:else>
	</display:column>
	<display:column title="Reallocation" style="text-align: center;width:8%;">
	<s:if test="%{#attr.table.allocation !='NA'}">
	<sj:a openDialog="mybuttondialog1" href="#" cssClass="classname"	onclick="engname('%{#attr.table.bname}');reallocation('%{#attr.table.id}','%{#attr.table.scode}','%{#attr.table.catagory}');accid1('%{#attr.table.id}','%{#attr.table.catagory}');">Reallocation</sj:a>
	</s:if>
	<s:else>
	<s:property value="%{#attr.table.allocation}" />
	</s:else>
	</display:column>
	<display:column title="Update" media="html" style="text-align: center;width:8%;" >
    <a href="<s:url action="jobworkupdate1" namespace="/" ><s:param  name="id" value="%{#attr.table.id}"></s:param></s:url>" style="text-decoration:none;font-size:12px;" class="print">Update</a>
    </display:column>
    
	
	<display:column title="Quotation" media="html" style="text-align: center;width:15%;" >
    	
    	<s:if test="%{#attr.table.approved =='APPROVED' || #attr.table.approved =='NOT APPROVED' }">
			
			<a href="<s:url action="quotationdetails" namespace="/" >
			<s:param  name="id" value="%{#attr.table.id}"></s:param>
			<s:param name="name" value="%{#attr.table.name}"></s:param>
			<s:param name="scode" value="%{#attr.table.scode}"></s:param>
			<s:param name="ccode" value="%{#attr.table.ccode}"></s:param>
			<s:param name="address" value="%{#attr.table.address}"></s:param>
			<s:param name="cust_ref_id" value="%{#attr.table.cust_ref_id}"></s:param>
			<s:param name="check" value="%{#attr.table.check}"></s:param>
			
			<s:param name="Scode" value="%{#attr.table.Scode}"></s:param></s:url>" style="text-decoration:none;font-size:12px;width:125px;" class="classname"><s:property value="%{'QUOT. '}" /><s:property value="%{#attr.table.approved}" /></a>
		</s:if>
		
		<s:else >
		
			<a href="<s:url action="quotationdetails" namespace="/" ><s:param name="check" value="%{#attr.table.check}"></s:param><s:param  name="id" value="%{#attr.table.id}"></s:param><s:param name="name" value="%{#attr.table.name}"></s:param><s:param name="scode" value="%{#attr.table.scode}"></s:param><s:param name="ccode" value="%{#attr.table.ccode}"></s:param><s:param name="address" value="%{#attr.table.address}"></s:param><s:param name="cust_ref_id" value="%{#attr.table.cust_ref_id}"></s:param></s:url>" style="text-decoration:none;font-size:12px;" class="print" onclick="sendValue('<s:property value="%{#attr.table.ccode}" />');">Quotation</a>	
		</s:else>
    </display:column>   
			
    
    	
	<s:if test="%{#attr.table.allocation =='NA'}">
	<display:column title="Status" style="text-align: center;width:8%;">
	<sj:a openDialog="mybuttondialog" href="#" cssClass="butStnd" onclick="abc('%{#attr.table.allocation}','%{#attr.table.scode}','%{#attr.table.id}');">NA</sj:a>
	</display:column>
	</s:if>
	<s:else>
	<display:column title="Status" style="text-align: center;width:8%;">
	<sj:a openDialog="mybuttondialog5" href="#" cssClass="butStnd"	onclick="abc('%{#attr.table.allocation}','%{#attr.table.scode}','%{#attr.table.id}');"><s:property value="%{#attr.table.engstatus}" /></sj:a>
	</display:column>
	</s:else>
    	<%-- <s:else>
			
			<display:column title="Status" style="text-align: center;width:8%;">
			<a href="#" style="text-decoration:none;font-size:12px;width:125px;" class="classname"><s:property value="%{'Quotation Approved'}" /></a>
		
			</display:column>
		</s:else> --%>
    
    <s:if test="%{#attr.table.engstatus =='REPAIR READY' || #attr.table.engstatus =='UN-REPAIR READY' || #attr.table.engstatus =='Product Delivered' }">>		
			
	       
	       <display:column title="Bill Print" media="html" style="text-align: center;width:8%;" >
			<a href="quotationprintdetails.jsp?value=<s:property value="%{#attr.table.id}"/>&name=<s:property value="%{#attr.table.name}"/>&scode=<s:property value="%{#attr.table.scode}" />&ccode=<s:property value="%{#attr.table.ccode}" />&address=<s:property value="%{#attr.table.address}" />  " style="text-decoration:none;"><span style="color:#fff;" onclick="return popitup('quotationprintdetails.jsp?value=<s:property value="%{#attr.table.id}"/>&name=<s:property value="%{#attr.table.name}"/>&scode=<s:property value="%{#attr.table.scode}" />&ccode=<s:property value="%{#attr.table.ccode}" />&address=<s:property value="%{#attr.table.address}" /> ')" class="classname">Bill Print</span></a>	
	       </display:column>
		</s:if>
    	
    <s:else>
		<display:column title="Bill Print" media="html" style="text-align: center;width:8%;" >
			
	    	<a href="#"></a>	
	       </display:column>	
			
	</s:else>
	
		<s:elseif test="%{#attr.table.engstatus =='REPAIR READY' || #attr.table.engstatus =='UN-REPAIR READY'  }">>		
			
	       
	       <display:column title="Bill Print" media="html" style="text-align: center;width:8%;" >
	     <a href="quotationprintdetails.jsp?value=<s:property value="%{#attr.table.id}"/>&name=<s:property value="%{#attr.table.name}"/>&scode=<s:property value="%{#attr.table.scode}" />&ccode=<s:property value="%{#attr.table.ccode}" />&address=<s:property value="%{#attr.table.address}" />  " style="text-decoration:none;"><span style="color:#fff;" onclick="return popitup('quotationprintdetails.jsp?value=<s:property value="%{#attr.table.id}"/>&name=<s:property value="%{#attr.table.name}"/>&scode=<s:property value="%{#attr.table.scode}" />&ccode=<s:property value="%{#attr.table.ccode}" />&address=<s:property value="%{#attr.table.address}" /> ')" class="classname">Bill Print</span></a>	
	       </display:column>
		</s:elseif>
		
     
      <s:if test="%{#attr.table.ctype =='CARRY IN'}">
	<display:column title="Print" media="html" style="background-color:#fff;">
        <%-- <a href="printdetails.jsp?value=<s:property value="%{#attr.table.scode}"/>" style="text-decoration:none;"><span style="color:#fff;" onclick="return popitup('printdetails.jsp?value=<s:property value="%{#attr.table.scode}"/>')" class="classname">Print</span></a>--%>	
    	<span style="color:#fff;" class="classname" onclick="confirmation2('<s:property value="%{#attr.table.scode}"/>');">Jobcard Print</span>
    </display:column>
    </s:if>
   
     
    <display:column property="cust_ref_id" title="Cust_Ref_No"  sortable="false" headerClass="sortable" />
    <display:column property="name"   title="CusName"   sortable="false" headerClass="sortable" />
	<display:column property="address"   title="Address"   sortable="false" headerClass="sortable" />
	<display:column property="pon"   title="Phone"   sortable="false" headerClass="sortable" />
	<display:column property="mobile"   title="Mobile"   sortable="false" headerClass="sortable" />
    
			
    </display:table>
    
	</div>
	
  <br/>
  
   <sj:dialog id="mybuttondialog" autoOpen="false" modal="true"
				title="Engineer Allocation" width="500" height="200"
				draggable="false" resizable="false" onCloseTopics="mybuttondialog">


				<fieldset
					style="width: 97%; border: solid thin #c6d5e1; Padding: 5px;">
					<legend style="color: red;">Engineer Allocation</legend>


					<s:form action="engcreationcin" namespace="/" method="post">
						<input type="hidden" name="id" id="id" />
						<input type="hidden" name="formbean.catagory" id="catagory1" />
						<input type="hidden" name="formbean.user" value="<s:property value="#session.user"/>" />

						<table>
							<tr>
								<td width="12.5%" style="padding-left:15px; padding-right:15px;">Engineers</td>
								<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:select name="formbean.engname" list="usList1" id="engname" listKey="engname" value="formbean.engname" listValue="engname" cssStyle="height:20px;border:1px solid #ccc;background:#FFFF99;width:120px;" /></td>
							</tr>
							<tr>
								<td width="12.5%" style="padding-left:15px; padding-right:15px;" >Spare Required</td>
        						<td width="12.5%" style="padding-left:15px; padding-right:15px;" >
        						<div id="sp"></div>
      							<div id="tsp">
       							<select name="formbean.spare"  class="easyui-combogrid" style="width:165px;" data-options="
								panelWidth: 500,
								multiple: true,
								idField: 'productname',
								value:'',
								textField: 'productname',
								url: 'spare.jsp',
								method: 'get',
								columns: [[
								{field:'ck',checkbox:true},
								{field:'itemid',title:'Item ID',width:80},
								{field:'productname',title:'Product',width:120}
				
								]],
								fitColumns: true
								">
								</select>
								</div>
								</td>
							</tr>
						</table>
						
						<div align="right"
							style="width: 95%; position: relative; padding: 10px;">

							<s:submit value="Save" cssClass="myButton" onclick="return elementValue();"></s:submit>
						</div>
					</s:form>
				</fieldset>

			</sj:dialog>
			
			
			 	<sj:dialog id="mybuttondialog5" autoOpen="false" modal="true"
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
	
	
	<sj:dialog id="mybuttondialog6" autoOpen="false" modal="true"
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
				title="Engineer Reallocation" width="500" height="250"
				draggable="false" resizable="false" onCloseTopics="mybuttondialog1">


				<fieldset
					style="width: 97%; border: solid thin #c6d5e1; Padding: 5px;">
					<legend style="color: red;">Engineer Reallocation</legend>


					<s:form action="engcreationcin1" namespace="/" method="post">
						<input type="hidden" name="accid" id="id1" />
						<input type="hidden" name="formbean.catagory" id="catg" />
						<input type="hidden" name="formbean.comcode" id="comcode" />
						<input type="hidden" name="formbean.user" value="<s:property value="#session.user"/>" />
						<div id="paid" style="padding-left:20px;color:blue;"></div><br/><br/>
						
						<table>
							<tr>
								<td width="12.5%" style="padding-left:15px; padding-right:15px;">Engineers</td>
								<td width="12.5%" style="padding-left:15px; padding-right:15px;"><s:select name="formbean.engname" id="engn" list="#{'':''}" cssStyle=" border:1px solid #ccc;height:20px;background:#FFFF99;width:120px;"></s:select></td>
							</tr>
							<tr>
								<td width="12.5%" style="padding-left:15px; padding-right:15px;" >Spare Required</td>
        						<td width="12.5%" style="padding-left:15px; padding-right:15px;" >
        
      							<div id="sp1"></div>
      							<div id="tsp1">
       							<select id="cc" name="formbean.spare"  class="easyui-combogrid" style="width:165px;" data-options="
								panelWidth: 500,
								multiple: true,
								idField: 'productname',
								value:'',
								textField: 'productname',
								url: 'spare.jsp',
								method: 'get',
								columns: [[
								{field:'ck',checkbox:true},
								{field:'itemid',title:'Item ID',width:80},
								{field:'productname',title:'Product',width:120}
				
								]],
								fitColumns: true
								">
								</select>
								</div>
								</td>
							</tr>
						</table>
							
						<div align="right" style="width: 95%; position: relative; padding: 10px;">
							<s:submit value="Save" cssClass="myButton"></s:submit>
						</div>
					</s:form>
				</fieldset>

			</sj:dialog>
			
			<%-- New added dialog for adding inspection details button --%>
	    <sj:dialog
        id="inspect_btn_dialog7"
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
    
    <!--<script language="javascript" type="text/javascript">
//<![CDATA[
	setFilterGrid("table");
//]]>
</script>-->
          
</center></body>
</html>