<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="bootstrapHead.jsp" />
<title>Profile update successful</title>
<link rel="stylesheet" href="css/styles.css">
</head>
<body>

	<div class="container-lg">

		<%@ include file="nav.jsp"%>

		<div class="container">
			<div class="row">
				<div class="col"></div>
				<div class="col-6">
					<h1>Profile update successful</h1>

					<h3>
					<a href="accountRedirect.do">View your Profile</a>
					</h3>

				</div>
			</div>
		</div>



	</div>
</body>
</html>