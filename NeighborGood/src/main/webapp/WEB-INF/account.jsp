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
			<form action="updateProfile.do" method="POST">

			<div class="container">
				<div class="row">
					<div class="col">
						<h2>
							<br> <br>
							<c:out value="${sessionScope.loggedInUser.username}" />'s Account Details
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
						
					</div>
					<div class="col">
					<input type="text" name="existingId" value="${sessionScope.loggedInUser.id }" readonly></div>
				</div>

				<div class="row">
					<div class="col">
						<h4>First name:</h4>
					</div>
					<div class="col">
						<h4>${sessionScope.loggedInUser.firstName }</h4>
					</div>
					<div class="col">
							<input type="text" name="firstName" value="${sessionScope.loggedInUser.firstName }">
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
						<input type="text" name="lastName"
							value="${sessionScope.loggedInUser.lastName }">
					</div>
				</div>
				
				<div class="row">
					<div class="col">
						<h4>User name:</h4>
					</div>
					<div class="col">
						<h4>${sessionScope.loggedInUser.username }</h4>
					</div>
					<div class="col">
						<input type="text" name="username"
							value="${sessionScope.loggedInUser.username }" readonly>
					</div>
				</div>
				
				<div class="row">
					<div class="col">
						<h4>Password:</h4>
					</div>
					<div class="col">
						<h4>${sessionScope.loggedInUser.password }</h4>
					</div>
					<div class="col">
						<input type="password" name="password"
							value="${sessionScope.loggedInUser.password }" readonly>
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
					<h4>${sessionScope.loggedInUserContact.street}</h4>
					</div>
					<div class="col">
						<input type="text" name="street" value="${sessionScope.loggedInUserContact.street}">
					</div>
				</div>

				<div class="row">
					<div class="col">
						<h4>City:</h4>
					</div>
					<div class="col">
						<h4>${sessionScope.loggedInUserContact.city}</h4>
					</div>
					<div class="col">
						<input type="text" name="city" value="${sessionScope.loggedInUserContact.city}">
					</div>
				</div>

				<div class="row">
					<div class="col">
						<h4>State:</h4>
					</div>
					<div class="col">
						<h4>${sessionScope.loggedInUserContact.state}</h4>
					</div>
					<div class="col">
						<input type="text" name="state" value="${sessionScope.loggedInUserContact.state}">
					</div>
				</div>

				<div class="row">
					<div class="col">
						<h4>Zip code:</h4>
					</div>
					<div class="col">
						<h4>${sessionScope.loggedInUserContact.zipCode}</h4>
					</div>
					<div class="col">
						<input type="text" name="zipCode" value="${sessionScope.loggedInUserContact.zipCode}">
					</div>
				</div>

				<div class="row">
					<div class="col">
						<h4>Primary phone:</h4>
					</div>
					<div class="col">
						<h4>${sessionScope.loggedInUserContact.phone}</h4>
					</div>
					<div class="col">
						<input type="text" name="phone" value="${sessionScope.loggedInUserContact.phone}">
					</div>
				</div>

				<div class="row">
					<div class="col">
						<h4>Secondary phone:</h4>
					</div>
					<div class="col">
						<h4>${sessionScope.loggedInUserContact.phone2}</h4>
					</div>
					<div class="col">
						<input type="text" name="phone2" value="${sessionScope.loggedInUserContact.phone2}">
					</div>
				</div>

				<div class="row">
					<div class="col">
						<h4>Email:</h4>
					</div>
					<div class="col">
						<h4>${sessionScope.loggedInUserContact.email}</h4>
					</div>
					<div class="col">
						<input type="text" name="email" value="${sessionScope.loggedInUserContact.email}"> <br> <input
							type="submit" value="Update">
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