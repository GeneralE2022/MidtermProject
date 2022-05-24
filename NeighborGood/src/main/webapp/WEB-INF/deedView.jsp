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
	<div class="container-lg">
		<%@ include file="nav.jsp"%>
		<div>
			<c:choose>
				<c:when test="${not empty deed}">
					<div align="center">
						<h2>${deed.title}</h2>
						<h4>ID: ${deed.id}</h4>

						<ul>
							<li>${deed.description}</li>
							<li>Deed offered by: ${deed.provider.username}</li>
							<li>Subcategory: ${deed.subcategory.title}</li>
						</ul>
						<c:if test="${sessionScope.loggedInUser.id == deed.provider.id}">
							<a href="requestDeedUpdate.do?deedId=${deed.id}">Modify this
								deed posting</a>
							<a href="requestDeedRemove.do?deedId=${deed.id}">Delete this
								deed posting</a>
						</c:if>
					</div>
				</c:when>
				<c:otherwise>
			No deed to display :(
			</c:otherwise>
			</c:choose>

		</div>
	</div>
</body>
</html>