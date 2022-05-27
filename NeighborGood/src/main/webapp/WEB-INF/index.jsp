<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<jsp:include page="bootstrapHead.jsp" />
<title>Landing Page</title>
<link rel="stylesheet" href="css/styles.css">
</head>
<body>

	<div class="container-lg">

		<%@ include file="nav.jsp"%>
		<br>

		  	<div class="row row-cols-3">
		  	<div class="col-3">
			</div>
			
			<div class="col-6">
				<img src="img/logo-current-trans.gif" alt="logo" width="475" class="logo">
			</div>

		<div class="col-3">
		<br>
		<br>
			<c:choose>
				<c:when test="${empty sessionScope.loggedInUser }">
					<div align=right>
						<form action="login.do" method="POST">
							<input type="text" required name="username" placeholder="User name" size="60">
							<br> <input type="password" required name="password" 
								placeholder="Password" size="60"/> <br> <input type="submit"
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

			<div class="row row-cols-4">
			
		  	<div class="col">
		  	<h3>Home improvement</h3><br>
		  	
				<c:forEach var="deed" items="${deeds}">
					<div class="row">
					<c:if test="${deed.subcategory.id == 11}">
						<h5>
							${deed.subcategory.title }: <a href="deedView.do?deedId=${deed.id }">${deed.title}</a>
						</h5>
					</c:if>
					
					<c:if test="${deed.subcategory.id == 12}">
						<h5>
							${deed.subcategory.title }: <a href="deedView.do?deedId=${deed.id }">${deed.title}</a>
						</h5>
					</c:if>
					
					<c:if test="${deed.subcategory.id == 13}">
						<h5>
							${deed.subcategory.title }: <a href="deedView.do?deedId=${deed.id }">${deed.title}</a>
						</h5>
					</c:if>
					
					<c:if test="${deed.subcategory.id == 14}">
						<h5>
							${deed.subcategory.title }: <a href="deedView.do?deedId=${deed.id }">${deed.title}</a>
						</h5>
					</c:if>
					</div>
				</c:forEach>
			</div>
				
			<div class="col">
		  	<h3>Yard work</h3><br>
		  	
				<c:forEach var="deed" items="${deeds}">
					<div class="row">
					<c:if test="${deed.subcategory.id == 21}">
						<h5>
							${deed.subcategory.title }: <a href="deedView.do?deedId=${deed.id }">${deed.title}</a>
						</h5>
					</c:if>
					
					<c:if test="${deed.subcategory.id == 22}">
						<h5>
							${deed.subcategory.title }: <a href="deedView.do?deedId=${deed.id }">${deed.title}</a>
						</h5>
					</c:if>
					
					<c:if test="${deed.subcategory.id == 23}">
						<h5>
							${deed.subcategory.title }: <a href="deedView.do?deedId=${deed.id }">${deed.title}</a>
						</h5>
					</c:if>
					
					<c:if test="${deed.subcategory.id == 24}">
						<h5>
							${deed.subcategory.title }: <a href="deedView.do?deedId=${deed.id }">${deed.title}</a>
						</h5>
					</c:if>
					
					<c:if test="${deed.subcategory.id == 25}">
						<h5>
							${deed.subcategory.title }: <a href="deedView.do?deedId=${deed.id }">${deed.title}</a>
						</h5>
					</c:if>
					</div>
				</c:forEach>
			</div>
			
			<div class="col">
		  	<h3>Maintenance / Repair</h3><br>
		  	
				<c:forEach var="deed" items="${deeds}">
					<div class="row">
					<c:if test="${deed.subcategory.id == 31}">
						<h5>
							${deed.subcategory.title }: <a href="deedView.do?deedId=${deed.id }">${deed.title}</a>
						</h5>
					</c:if>
					
					<c:if test="${deed.subcategory.id == 32}">
						<h5>
							${deed.subcategory.title }: <a href="deedView.do?deedId=${deed.id }">${deed.title}</a>
						</h5>
					</c:if>
					
					<c:if test="${deed.subcategory.id == 33}">
						<h5>
							${deed.subcategory.title }: <a href="deedView.do?deedId=${deed.id }">${deed.title}</a>
						</h5>
					</c:if>
					
					</div>
				</c:forEach>
			</div>
				
			<div class="col">
		  	<h3>Pet Care</h3><br>
		  	
				<c:forEach var="deed" items="${deeds}">
					<div class="row">
					<c:if test="${deed.subcategory.id == 41}">
						<h5>
							${deed.subcategory.title }: <a href="deedView.do?deedId=${deed.id }">${deed.title}</a>
						</h5>
					</c:if>
					
					<c:if test="${deed.subcategory.id == 42}">
						<h5>
							${deed.subcategory.title }: <a href="deedView.do?deedId=${deed.id }">${deed.title}</a>
						</h5>
					</c:if>
					
					<c:if test="${deed.subcategory.id == 43}">
						<h5>
							${deed.subcategory.title }: <a href="deedView.do?deedId=${deed.id }">${deed.title}</a>
						</h5>
					</c:if>
					
					</div>
				</c:forEach>
			</div>
				
				
				
				
				
			</div>
		</div>
		
		<br>
		<br>
		<br>
		<br>
		
<!-- Optional: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
		
</body>
<footer>
	<p style="text-align: center;">All Rights Reserved Dismal Justice
		2022</p>
</footer>
</html>





