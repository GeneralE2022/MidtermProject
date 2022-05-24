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

	<div class="container-lg">

		<%@ include file="nav.jsp"%>
		<br>
		<br>
		<div class="row">
			<div class="col">
				<p style="text-align: center;">
				<h2>Create a new Deed</h2>
				</p>
				<br> <br>
			</div>

			<div class="row">
				<div class="col">
					<form action="createDeed.do" method="POST">
						<label for="title"> <strong>Title:</strong></label> <br> <input
							type="text" name="title" size="25" /> <br> <label
							for="description"> <strong>Description:</strong></label> <br>
						<input type="text" name="descrition" size="25" /> <br>
						<!-- <label for="provider"> <strong>Provider:</strong></label> <br> -->
						<input type="hidden" name="provider" size="3"
							value="${sessionScope.loggedInUser.id}" readonly /> <br> <label
							for="subcategory"> <strong>Subcategory:</strong></label> <br>
						<select name="subcategory" id="subcategory-dropdown">

							<option>Home Improvement</option>
							<option>Yardwork</option>
							<option>Yardwork</option>
							<option>Yardwork</option>
							<option value="21">- Weeding</option>
							<option value="22">- Raking</option>
							<option value="23">- Mowing</option>
							<option value="24">- Gardening</option>
							<br>
						</select> <input type="submit" value="Create Deed" />
				</div>
			</div>

		</div>
</body>
</html>