<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<link href="styles.css" rel="stylesheet">
<title>Landing Page</title>
<h1 class="page-header">neighborgood</h1>
</head>
<body>

	<div align=right>
		<form action="login.do" method="POST">
			<%-- Error messages --%>
			<input type="text" name="userName"> 
			<input type="password" name="password" /> 
			<input type="submit" value="Log In">
		</form>

		<br> <a href="createAccount.do">Create account</a>
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