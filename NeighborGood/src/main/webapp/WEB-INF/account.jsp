<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="bootstrapHead.jsp" />
<title>Insert title here</title>

</head>
<body>
	<%@ include file="nav.jsp"%>

	<c:choose>
		<c:when test="${not empty sessionScope.loggedInUser }">


			<div class="container">
				<div class="row">
					<div class="col">
						<h2>
							<br> <br>
							<c:out value="${sessionScope.loggedInUser.username}" />
							's Account Details
						</h2>
					</div>
					<div class="col"></div>
					<div class="col">Update your info:</div>
				</div>

				<div class="row">
					<div class="col">
						<h4>Account ID:</h4>
					</div>
					<div class="col">
						<h4>${sessionScope.loggedInUser.id}</h4>
					</div>
					<div class="col"></div>
				</div>

				<div class="row">
					<div class="col">
						<h4>First name:</h4>
					</div>
					<div class="col">
						<h4>${sessionScope.loggedInUser.firstName }</h4>
					</div>
					<div class="col">
						<form action="update.do" method="POST">
							<input type="text" name="firstname">
					</div>
				</div>

				<div class="row">
					<div class="col">
						<h4>Last name:</h4>
					</div>
					<div class="col">
						<h4>${sessionScope.loggedInUser.lastName }</h4>
					</div>
					<div class="col">
						<input type="text" name="lastname">
					</div>
				</div>
			</div>

			<div class="container">
				<div class="row">
					<div class="col">
						<br>
						<h2>Contact information</h2>
					</div>
					<div class="col"></div>
					<div class="col"></div>
				</div>

				<div class="row">
					<div class="col">
						<h4>Address:</h4>
					</div>
					<div class="col">
						<h4>***insert***</h4>
					</div>
					<div class="col">
						<input type="text" name="street">
					</div>
				</div>

				<div class="row">
					<div class="col">
						<h4>City:</h4>
					</div>
					<div class="col">
						<h4>***insert***</h4>
					</div>
					<div class="col">
						<input type="text" name="city">
					</div>
				</div>

				<div class="row">
					<div class="col">
						<h4>State:</h4>
					</div>
					<div class="col">
						<h4>***insert***</h4>
					</div>
					<div class="col">
						<input type="text" name="state">
					</div>
				</div>

				<div class="row">
					<div class="col">
						<h4>Zip code:</h4>
					</div>
					<div class="col">
						<h4>***insert***</h4>
					</div>
					<div class="col">
						<input type="text" name="zipcode">
					</div>
				</div>

				<div class="row">
					<div class="col">
						<h4>Primary phone:</h4>
					</div>
					<div class="col">
						<h4>***insert***</h4>
					</div>
					<div class="col">
						<input type="text" name="phone1">
					</div>
				</div>

				<div class="row">
					<div class="col">
						<h4>Secondary phone:</h4>
					</div>
					<div class="col">
						<h4>***insert***</h4>
					</div>
					<div class="col">
						<input type="text" name="phone2">
					</div>
				</div>

				<div class="row">
					<div class="col">
						<h4>Email:</h4>
					</div>
					<div class="col">
						<h4>***insert***</h4>
					</div>
					<div class="col">
						<input type="text" name="email"> <br>
						<input type="submit" value="Update">
						</form>
					</div>
				</div>

			</div>


		</c:when>

		<c:otherwise>
			<h3>Not logged in.</h3>
		</c:otherwise>
	</c:choose>

	<br>
	<br>

	<a href="logout.do">Log out (TODO: place into nav bar)</a>

</body>
</html>