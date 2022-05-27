<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="bootstrapHead.jsp"/>
<title>Create a new account</title>
<link rel="stylesheet" href="css/styles.css">
</head>
<body>

<div class="container-lg" width=50%>

<%@ include file="nav.jsp"%>
<h1>Register New Account</h1>

	<h3>Enter User Account Information</h3>

	<form action="registration.do" method="POST">
		<label for="firstName"> <strong>*First Name:</strong></label> <br>
		<input type="text" name="firstName" required size="15" /> <br> <br>
		
		<label for="lastName"> <strong>*Last Name:</strong></label> <br>
				<input type="text" name="lastName" required size="15" /> <br> <br>

		<label for="userName"> <strong>*Username:</strong></label> <br>
		<input type="text" name="username"required size="15" /> <br> <br>
		
		<label for="password"> <strong>*Password:</strong></label> <br>
		<input type="password" name="password" required size="15" /> <br> <br>

<br>
	
	<h3>Enter Contact Information</h3>
	
		<label for="homePhoneNumber"> <strong>*Primary Phone Number:</strong></label> <br>
		<input type="text" name="phone" required size="15" /> <br> <br>
		
		<label for="workPhoneNumber"> <strong>Secondary Phone Number:</strong></label> <br>
		<input type="text" name="phone2" size="15" /> <br> <br>
		
		<label for="email"> <strong>*Email Address:</strong></label> <br>
		<input type="text" name="email" required size="20" /> <br> <br>
			
		<label for="streetAddress"> <strong>*Street Address:</strong></label> <br>
		<input type="text" name="street" required size="20" /> <br> <br>
			
		<label for="city"> <strong>*City:</strong></label> <br>
		<input type="text" name="city" required size="15" /> <br> <br>
			
		<label for="state"> <strong>*State (Abbreviation):</strong></label> <br>
		<input type="text" name="state" required size="2" minlength="2" maxlength="2"/> <br> <br>
		
		<label for="zipCode"> <strong>*Zip Code:</strong></label> <br>
		<input type="text" name="zipCode" required size="15" minlength="5" maxlength="15"/> <br> <br>

		<input type="submit" value="Add Contact Information" />

	</form>

</div>
</body>
</html>