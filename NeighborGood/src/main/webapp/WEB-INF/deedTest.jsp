<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="bootstrapHead.jsp" />
<title>Deed Test</title>

</head>
<body>
	<%@ include file="nav.jsp"%>
<div>
	<c:choose>
		<c:when test="${newDeedCreated}">
		<h2>${deed.title} </h2>
		<br>
		<p>${deed.description}</p>
		<p>Deed offered by: ${deed.provider.username}</p>
		<p>Subcategory: ${deed.subcategory.title}</p>
		</c:when>
		<c:otherwise>
		No deed to display!
		</c:otherwise>
	</c:choose>
		</div>
		

</body>
</html>