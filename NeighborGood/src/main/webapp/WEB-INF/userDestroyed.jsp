<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account Destroyed</title>
	<%@ include file="nav.jsp"%>
	<link rel="stylesheet" href="css/styles.css">
</head>
<body>

<div class="container-lg">
	<br>
	
	<c:if test="${destroyed}">

	<h1>Account Destroyed Forever</h1>
	
	</c:if>
	</div>
</body>
</html>