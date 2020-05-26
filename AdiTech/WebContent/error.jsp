<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Something! went wrong</title>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<!-- CSS -->
<link rel="stylesheet" href="css/style.css" type="text/css">
<!-- font -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container text-center m-6 p-5">
	<img alt="error" src="img/err.png" style="width:90px">
	<h1 class="display-4">Something ! went wrong try again...</h1>
	<%= exception %>
	<br>
	<a href="index.jsp" class="btn btn-outline-dark">home</a>
	</div>
	
</body>
</html>













