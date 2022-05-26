<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="bootstrapHead.jsp" />
<title>Admin Tasks</title>

</head>
<body>

<div class="container-lg">


	<%@ include file="nav.jsp"%>
	<c:if test="${not adminUser.role == 'admin' }">
		<h1>You are not authorized to view this page</h1>
	</c:if>
	
	<c:if test="${adminUser.role == 'admin' }">
		<h1>All Users</h1>
				<c:forEach var="user" items="${users}">
					<ul><strong>Username:</strong> ${user.username} 
						<ul><strong>Status:</strong> 
								<c:if test="${user.active == 0 }"><li>Inactive || <a href="reactivateUser.do?uid=${user.id}">Reactivate this user</a></li></c:if>
								<c:if test="${user.active == 1 }"><li>Active || <a href="deactivateUser.do?uid=${user.id}">Deactivate this user</a></li></c:if>
								<li><a href="destroyUser.do?uid=${user.id}">Destroy this user forever</a></li>
						</ul> 
					</ul>
				</c:forEach>
	

		<h1>All Deeds</h1>
				<div="row">
				<c:forEach var="deed" items="${deeds}">
				<div="col">
				${deed.title}
				
				</div>
				<div="col">
				<a href="runDeedDestroy.do?deedId=${deed.id}">Delete Deed</a><br>
				</div>
				
	
				</c:forEach>	
				</div>
	
	
	
	
	
	
	
	</c:if>
	

		
	


</div> 
</body>
</html>