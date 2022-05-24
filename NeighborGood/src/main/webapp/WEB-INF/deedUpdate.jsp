<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="bootstrapHead.jsp" />
<title>Deed Test</title>

</head>
<body>
	<%@ include file="nav.jsp"%>
	<div>
		<form action="runDeedUpdate.do?deedId=${deedBeingUpdated.id}" method="POST">
		<input type="text" name="deedId" size="25" value="${deedBeingUpdated.id}" hidden readonly/> <br> 
	<label for="title"> <strong>Title:</strong></label> <br>
		<input type="text" name="title" size="25" value="${deedBeingUpdated.title}"/> <br> 
	<label for="description"> <strong>Description:</strong></label> <br>
		<input type="text" size="100" type="text" name="description" value="${deedBeingUpdated.description}"></textarea> <br> 
	<!-- <label for="provider"> <strong>Provider:</strong></label> <br> -->
		<input type="hidden" name="provider" size="3" value="${sessionScope.loggedInUser.id}" readonly/> <br> 
	<label for="subcategory"> <strong>Subcategory:</strong></label> <br>
		<select name="subcategory" id="subcategory-dropdown">
			
			<option disabled selected>Choose subcategory</option>
			<optgroup label="Home Improvement">
			<option value="11"> - Plumbing</option>
			<option value="12"> - Electric</option>
			<option value="13"> - Window & Door</option>
			<option value="14"> - Cleaning</option></optgroup>
			<optgroup label="Yardwork">
			<option value="21"> - Weeding</option>
			<option value="22"> - Raking</option>
			<option value="23"> - Mowing</option>
			<option value="24"> - Gardening</option></optgroup>
			<optgroup label="Repair / Maintenance">
			<option value="31"> - Automotive</option>
			<option value="32"> - Appliance</option>
			<option value="33"> - Computer</option></optgroup>
			<optgroup label="Petcare">
			<option value="41"> - Walking</option>
			<option value="42"> - Sitting</option>
			<option value="43"> - Grooming</option></optgroup>
		</select>
	
	<input type="submit" value="Save Changes" />
		
	</div>
</body>
</html>