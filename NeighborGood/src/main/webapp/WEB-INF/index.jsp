<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<link href="styles.css" rel="stylesheet">
<jsp:include page="bootstrapHead.jsp"/>
<title>Landing Page</title>
</head>
<body>
<%@ include file="nav.jsp"%>
<br>
<h1 class="page-header">neighborgood</h1>

<c:if test="${newUserCreated}">
<br>
<h3><center>Registration successful!<br>
Your user name is: ${newUser.username}
<br>
Your street is: ${newContact.street}</center>
</h3> 
<br> 
</c:if>

	<div align=right>
		<form action="login.do" method="POST">
			<%-- Error messages --%>
			<input type="text" name="username"> 
			<input type="password" name="password" /> 
			<input type="submit" value="Log In">
		</form>

		<br> <a href="registration.do">Create account</a>
	</div>
	<br>
	<br>


	<table width=800px>

		<thead>
			<tr>
				<th>Yardwork</th>
				<th>Home Improvement</th>
				<th>Pet Care</th>
				<th>Repair/Maintenance</th>
			</tr>
		</thead>
		<c:forEach var="subcategory" items="${subcategories}">

		</c:forEach>
		<tr>
			<td>
		</tr>
	</table>














</body>
<footer>
	<center>All Rights Reserved Dismal Justice 2022</center>
</footer>
</html>