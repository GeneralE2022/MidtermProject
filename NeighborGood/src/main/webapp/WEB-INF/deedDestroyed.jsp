<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="bootstrapHead.jsp" />
<title>Deed Destroyed</title>

</head>
<body>
	<div class="container-lg">
		<%@ include file="nav.jsp"%>
		<div>
			<c:if test="${destroyed}">
				<h2>Deed Destroyed</h2>			
			</c:if>
			<c:if test="${not destroyed }">
				<h2>Deed Destroy Failed</h2>
			</c:if>
		</div>
	</div>
</body>
</html>