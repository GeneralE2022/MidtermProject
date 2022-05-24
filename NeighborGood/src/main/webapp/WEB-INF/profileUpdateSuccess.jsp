<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="bootstrapHead.jsp" />
<title>Profile update successful</title>
</head>
<body>

	<div class="container-lg">

		<%@ include file="nav.jsp"%>


		<div class="container">
			<div class="row">
				<div class="col"></div>
				<div class="col-6">
					<h1>Profile update successful</h1>

					Profile <br> ${updateUser.firstName} <br>
					${updateUser.lastName} <br> Contact <br>
					<h3>
						${updateContact.street}<br> ${updateContact.city}<br>
						${updateContact.state}<br> ${updateContact.zipCode}<br>
						${updateContact.phone}<br> ${updateContact.phone2}<br>
						${updateContact.email}<br>
						</h3>
				</div>
				<div class="col"></div>
			</div>



		</div>
</body>
</html>