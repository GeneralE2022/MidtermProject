<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <link href="styles.css" rel="stylesheet">
  <title>Landing Page</title>
  <h1 class="page-header">neighborgood</h1>
</head>
<body>
<div align=right>
  <form action="login.do" method="POST">
<label for="user">Username</label>
<input type="text" name="user"><br>
<label for="pass">Password</label>
<input type="text" name="pass"><br>
<input type="submit" value="login">
  </form><br>
  <a href="createAccount.do">Create account</a>
  </div>
  </body>
</html>