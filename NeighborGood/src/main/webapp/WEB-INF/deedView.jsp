<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="bootstrapHead.jsp" />
<title>Deed Test</title>
<link rel="stylesheet" href="css/styles.css">
</head>
<body>
	<div class="container-lg">
		<%@ include file="nav.jsp"%>
		<br>
		
		<div class="container">
  			<div class="row">
   			 <div class="col-sm">
     
   			 </div>
    <div class="col-sm">
      <c:choose>
				<c:when test="${not empty deed}">
					<div align="left">
						<h5 align="center">Deed Title: ${deed.title}</h5>
						<h6 align="center">Deed Subcategory: ${deed.subcategory.title}</h6>

						<ul>
							<li>Description: ${deed.description}</li>
							
							<c:if test="${sessionScope.loggedInUser.id != null }">
							<li>Offered by: ${deed.provider.username} </li>
							<li>Claim status: 
								<c:if test="${empty deedTransaction.recipient}"><strong>unclaimed</strong><a href="claimDeed.do?deedId=${deed.id}">(claim this deed!)</a></c:if>
								<c:if test="${not empty deedTransaction.recipient}">claimed by <strong>${deedTransaction.recipient.username}</strong></c:if></li>
								
								
							<li>Contact: <c:if test="${deed.provider.active == 1 }">${deed.provider.contact.phone}</c:if><c:if test="${deed.provider.active == 0 }">
								(Provider currently not offering services.)</c:if></li>
								</c:if>
							
							<c:if test="${empty deedTransaction.providedDate }">
								<li><a href="deedComplete.do?dtid1=${deedTransaction.id }">Mark a deed as completed</a></li>
							</c:if>
							
							<c:if test="${not empty deedTransaction.providedDate }">
								<li>Completed on: ${deedTransaction.providedDate}</li>
							</c:if>
							
						</ul>
											
						
						<c:if test="${sessionScope.loggedInUser.id == deed.provider.id}">
							<a href="requestDeedUpdate.do?deedId=${deed.id}">Modify this deed posting</a>
							<a href="runDeedDestroy.do?deedId=${deed.id}">Delete this deed posting</a>
						</c:if>
						
					</div>
				</c:when>
				<c:otherwise>
			No deed to display :(
			</c:otherwise>
			</c:choose>
    </div>
    <div class="col-sm">
      
    </div>
  </div>
</div>
		
		
			

		</div>
</body>
</html>