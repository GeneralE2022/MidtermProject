<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account Reactivated</title>
	<%@ include file="nav.jsp"%>
</head>
<body>
	<br>
	
	<c:if test="${reactivated}">

	<h1>Account ${user.username} Reactivated</h1>
	
	</c:if>
</body>
</html>