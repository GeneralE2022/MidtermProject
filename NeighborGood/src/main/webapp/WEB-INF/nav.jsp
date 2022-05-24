<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar sticky-top bg-white">

	<div class="d-flex justify-content-start">
		<a href="home.do" class="btn btn-primary">Welcome</a>
	</div>
	
	<c:choose>
		<c:when test="${not empty sessionScope.loggedInUser }">
			<a href="account.do" class="btn btn-success">Account</a>
			<a href="logout.do" class="btn btn-primary">Log Out</a>


		</c:when>
	</c:choose>


</nav>