<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
		<link href="css/style1.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		
<script type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
</script>

</head>
 
<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="" class="bg-login">
<div class="overlay"></div>
	<div class="main">
		<c:if test="${not empty error}">

				<div
					style="color: #CC0099; padding-top: 10px; padding-right: 10px; padding-left: 10px;">
					Login error : Please try again.<br />It May be cause of
					${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
				</div>
				
		</c:if>
		<form name="f" action="<c:url value='j_spring_security_check' />"	method="post">
    		<h1><lable>E-ZONE CARE CRM</lable></h1>
   		 	<!-- <label for="email"></label> -->
 	 				<input type="text" name='j_username' placeholder="USER NAME" required/>
		    <!-- <label for="password"></label> -->
		    <input type="password" name='j_password' placeholder="PASSWORD" required/>
			<input type="submit" value="Login">
		</form>
	</div>  
			
</body>
</html>