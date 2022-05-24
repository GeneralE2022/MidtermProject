<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account Deactivated</title>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<br>
	
	<c:if test="${deactivated}">

	<h1>Account Successfully Deactivated</h1>
	
	</c:if>
</body>
</html>