<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<link href="styles.css" rel="stylesheet">
<jsp:include page="bootstrapHead.jsp" />
<title>Landing Page</title>
</head>
<body>

	<div class="container-lg">

		<%@ include file="nav.jsp"%>
		<br>
		<h1 class="page-header">neighborgood</h1>

		<c:if test="${newUserCreated}">
			<br>
			<h3>
				<center>
					Registration successful!<br> Your user name is:
					${newUser.username} <br> Your street is: ${newContact.street}
				</center>
			</h3>
			<br>
		</c:if>

		<c:choose>
			<c:when test="${empty sessionScope.loggedInUser }">
				<div align=right>
					<form action="login.do" method="POST">
						<input type="text" name="username" placeholder="User name"> <br>
						<input type="password" name="password" placeholder="Password" /> <br>
						<input type="submit" value="Log In">
					</form>
			</c:when>
		</c:choose>
		<br> <a href="registration.do">Create account</a>
	</div>
	<br>
	<br>

	<div class="container-lg">
	
		<div class="row">
			<div class="col"><h3>Yardwork</h3></div>
			<div class="col"><h3>Home Improvement</h3></div>
			<div class="col"><h3>Pet Care</h3></div>
			<div class="col"><h3>Repair/Maintenance</h3></div>

		<div class="row">
		
			<c:forEach var="deed" items="${deeds}">
				<div class="col"><h4><a href="">${deed.title}</a></h4></div>
			</c:forEach>

				<%-- <a href="getToken.do?token=${crypto.id}">${crypto.name}</a> --%>
				
			</div>
		</div>
		
</body>
<footer>
	<p style="text-align:center;">All Rights Reserved Dismal Justice 2022</p>
</footer>
</html>