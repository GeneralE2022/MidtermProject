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

		  	<div class="row row-cols-3">
		  	<div class="col">
			</div>
			
			<div class="col">
				<a href="home.do"> <img src="../img/logo1.png" alt="logo" width="525"></a>
			</div>


		<div class="col">
			<c:choose>
				<c:when test="${empty sessionScope.loggedInUser }">
					<div align=right>
						<form action="login.do" method="POST">
							<input type="text" name="username" placeholder="User name">
							<br> <input type="password" name="password"
								placeholder="Password" /> <br> <input type="submit"
								value="Log In">
						</form>
						<br> <a href="registration.do">Create account</a>
					</div>
				</c:when>
			</c:choose>
			
		</div>
	</div>
	</div>
	<br>
	<br>

	<c:if test="${newUserCreated}">
		<div class="col">
					<br>
					<div class="d-flex justify-content-center">
					<h3>Registration successful!<br> Your user name is:
						${newUser.username} <br> Your street is: ${newContact.street}</h3>
					</div>
				<br>
		</div>
	</c:if>


	<div class="container-lg">

		<div class="row">
			<div class="col">
				<h3>Yardwork</h3>
			</div>
			<div class="col">
				<h3>Home Improvement</h3>
			</div>
			<div class="col">
				<h3>Pet Care</h3>
			</div>
			<div class="col">
				<h3>Repair/Maintenance</h3>
			</div>

			<div class="row">

				<c:forEach var="deed" items="${deeds}">
					<div class="row">
						<h4>
							<a href="deedView.do?deedId=${deed.id }">${deed.title}</a>
						</h4>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
</body>
<footer>
	<p style="text-align: center;">All Rights Reserved Dismal Justice
		2022</p>
</footer>
</html>