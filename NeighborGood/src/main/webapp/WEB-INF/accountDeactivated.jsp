<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account Deactivated</title>
	<link rel="stylesheet" href="css/styles.css">
	<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
<div class="container-lg">
	<%@ include file="nav.jsp"%>
	<br>
	
	<c:if test="${deactivated}">

	<h1 align="center">Account Deactivated</h1>
	<a href="adminOnly.do"><h2 align="center">Back to Admin Panel</h2></a>
	
	</c:if>
	
	
	</div>
</body>
</html>