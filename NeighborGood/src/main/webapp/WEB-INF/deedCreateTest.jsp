<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="bootstrapHead.jsp" />
<title>Deed Create Test</title>

</head>
<body>
	<%@ include file="nav.jsp"%>
<div>
	
	<form action="createDeed.do" method="POST">
	<label for="title"> <strong>Title:</strong></label> <br>
		<input type="text" name="title" size="25" /> <br> 
	<label for="description"> <strong>Description:</strong></label> <br>
		<input type="text" name="descrition" size="25" /> <br> 
	<!-- <label for="provider"> <strong>Provider:</strong></label> <br> -->
		<input type="hidden" name="provider" size="3" value="${sessionScope.loggedInUser.id}" readonly/> <br> 
	<label for="subcategory"> <strong>Subcategory:</strong></label> <br>
		<select name="subcategory" id="subcategory-dropdown">
			<option value="21">Weeding</option>
			<option value="22">Raking</option>
			<option value="23">Mowing</option>
			<option value="24">Gardening</option>
		</select>
	
	<input type="submit" value="Create Deed" />
	
		</div>
		

</body>
</html>