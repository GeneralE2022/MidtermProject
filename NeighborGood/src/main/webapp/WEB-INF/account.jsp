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

<div class="container-lg">


	<%@ include file="nav.jsp"%>
<a href="requestCreateDeed.do">Create new deed</a>
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
					<input type="text" name="existingId" value="${loggedInUser.id }" readonly></div>
				</div>

				<div class="row">
					<div class="col">
						<h4>First name:</h4>
					</div>
					<div class="col">
						<h4>${loggedInUser.firstName }</h4>
					</div>
					<div class="col">
							<input type="text" name="firstName" value="${loggedInUser.firstName }">
					</div>
				</div>

				<div class="row">
					<div class="col">
						<h4>Last name:</h4>
					</div>
					<div class="col">
						<h4>${loggedInUser.lastName }</h4>
					</div>
					<div class="col">
						<input type="text" name="lastName"
							value="${loggedInUser.lastName }">
					</div>
				</div>
				
				<div class="row">
					<div class="col">
						<h4>User name:</h4>
					</div>
					<div class="col">
						<h4>${loggedInUser.username }</h4>
					</div>
					<div class="col">
						<input type="text" name="username"
							value="${loggedInUser.username }" readonly>
					</div>
				</div>
				
				<div class="row">
					<div class="col">
						<h4>Password:</h4>
					</div>
					<div class="col">
						<h4>${loggedInUser.password }</h4>
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
					<h4>${loggedInUser.contact.street}</h4>
					</div>
					<div class="col">
						<input type="text" name="street" value="${loggedInUser.contact.street}">
					</div>
				</div>

				<div class="row">
					<div class="col">
						<h4>City:</h4>
					</div>
					<div class="col">
						<h4>${loggedInUser.contact.city}</h4>
					</div>
					<div class="col">
						<input type="text" name="city" value="${loggedInUser.contact.city}">
					</div>
				</div>

				<div class="row">
					<div class="col">
						<h4>State:</h4>
					</div>
					<div class="col">
						<h4>${loggedInUser.contact.state}</h4>
					</div>
					<div class="col">
						<input type="text" name="state" value="${loggedInUser.contact.state}">
					</div>
				</div>

				<div class="row">
					<div class="col">
						<h4>Zip code:</h4>
					</div>
					<div class="col">
						<h4>${loggedInUser.contact.zipCode}</h4>
					</div>
					<div class="col">
						<input type="text" name="zipCode" value="${loggedInUser.contact.zipCode}">
					</div>
				</div>

				<div class="row">
					<div class="col">
						<h4>Primary phone:</h4>
					</div>
					<div class="col">
						<h4>${loggedInUser.contact.phone}</h4>
					</div>
					<div class="col">
						<input type="text" name="phone" value="${loggedInUser.contact.phone}">
					</div>
				</div>

				<div class="row">
					<div class="col">
						<h4>Secondary phone:</h4>
					</div>
					<div class="col">
						<h4>${loggedInUser.contact.phone2}</h4>
					</div>
					<div class="col">
						<input type="text" name="phone2" value="${loggedInUser.contact.phone2}">
					</div>
				</div>

				<div class="row">
					<div class="col">
						<h4>Email:</h4>
					</div>
					<div class="col">
						<h4>${loggedInUser.contact.email}</h4>
					</div>
					<div class="col">
						<input type="text" name="email" value="${loggedInUser.contact.email}"> <br> <input
							type="submit" value="Update">
						</form>
						

					</div>
				</div>

			</div>
			
			<div><!-- List of user's deeds -->
			<h2>Your Deeds</h2>
			<c:forEach var="deed" items="${deeds}">
					<div class="row">
						<h4>
							<a href="deedView.do?deedId=${deed.id}">${deed.title}</a>
						</h4>
					</div>
				</c:forEach>
			<h2>Deeds Received</h2>
			<c:forEach var="deed" items="${deedsR}">
					<div class="row">
						<h4>
							<a href="deedView.do?deedId=${deed.id}">${deed.title}</a>
						</h4>
					</div>
				</c:forEach>
			<h2>Deeds Completed</h2>
			</div>


		<h5>Would you like to deactivate your account?</h5>	<br>
		<a href="deactivateAccount.do?deactivateId=${sessionScope.loggedInUser.id}">Click here to deactivate your account.</a>				
					
						

		</c:when>

		<c:otherwise>
			<h3>Not logged in.</h3>7
		</c:otherwise>
	</c:choose>

	<br>
	<br>

	<!-- <a href="logout.do">Log out (TODO: place into nav bar)</a> -->
</div> 
</body>
</html>