<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create a new account</title>
</head>
<body>
<h1>Register New Account</h1>

	<h3>Enter User Account Information</h3>

	<form action="addUser.do" method="POST">
		<label for="firstName"> <strong>First Name:</strong></label> <br>
		<input type="text" name="createFirstName" size="25" /> <br> <br>
		
		<label for="lastName"> <strong>Last Name:</strong></label> <br>
				<input type="text" name="lastName" size="25" /> <br> <br>

		<label for="userName"> <strong>Username:</strong></label> <br>
		<input type="text" name="userName" size="25" /> <br> <br>
		
		<label for="password"> <strong>Password:</strong></label> <br>
		<input type="text" name="userName" size="25" /> <br> <br>

		<input type="submit" value="Add User" />

	</form>
	
	<h3>Enter Contact Information</h3>
	
	<form action="addContact.do" method="POST">
		
		<label for="homePhoneNumber"> <strong>Home Phone Number:</strong></label> <br>
		<input type="text" name="homePhoneNumber" size="25" /> <br> <br>
		
		<label for="workPhoneNumber"> <strong>Work Phone Number:</strong></label> <br>
		<input type="text" name="workPhoneNumber" size="25" /> <br> <br>
		
		<label for="email"> <strong>Email Address:</strong></label> <br>
		<input type="text" name="email" size="25" /> <br> <br>
			
		<label for="streetAddress"> <strong>Street Address:</strong></label> <br>
		<input type="text" name="streetAddress" size="25" /> <br> <br>
			
		<label for="city"> <strong>City:</strong></label> <br>
		<input type="text" name="city" size="25" /> <br> <br>
			
		<label for="state"> <strong>State:</strong></label> <br>
		<input type="text" name="weight" size="25" /> <br> <br>
		
		<label for="zipCode"> <strong>Zip Code:</strong></label> <br>
		<input type="text" name="zipCode" size="25" /> <br> <br>
		

		<input type="submit" value="Add Contact Information" />

	</form>


</body>
</html>