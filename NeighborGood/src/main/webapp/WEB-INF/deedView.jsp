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
		<br>
		<div>
			<c:choose>
				<c:when test="${not empty deed}">
					<div align="left">
						<h5>Deed Subcategory: ${deed.subcategory.title}</h5>
						<h6>Deed Title: ${deed.title}</h6>
						<h6>Deed ID: ${deed.id}</h6>

						<ul>
							<li>Description: ${deed.description}</li>
							
							<c:if test="${sessionScope.loggedInUser.id != null }">
							<li>Offered by: ${deed.provider.username} </li>
							<li>Claim status: 
								<c:if test="${empty deedTransaction.recipient}"><strong>unclaimed</strong></c:if>
								<c:if test="${not empty deedTransaction.recipient}">claimed by <strong>${deedTransaction.recipient.username}</strong></c:if></li>
								
								
							<li>Contact: <c:if test="${deed.provider.active == 1 }">${deed.provider.contact.phone}</c:if><c:if test="${deed.provider.active == 0 }">
								(Provider currently not offering services.)</c:if></li>
								</c:if>
								
												

						</ul>
											
						
						<c:if test="${sessionScope.loggedInUser.id == deed.provider.id}">
							<a href="requestDeedUpdate.do?deedId=${deed.id}">Modify this
								deed posting</a>
							<a href="runDeedDestroy.do?deedId=${deed.id}">Delete this
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