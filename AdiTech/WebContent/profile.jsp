<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.adiTech.entities.User" %>
<%@ page errorPage="error.jsp" %>
<%
	User user=(User)session.getAttribute("currentUser");
	if(user==null){
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>profile</title>
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
<!-- Navbar Start -->
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
	<a class="navbar-brand" href="index.jsp"><span class="fa fa-adn"></span>AdiTech</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="#"><span
					class="fa fa-bell-o"></span>Learn Code <span class="sr-only">(current)</span></a>
			</li>

			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"><span class="fa fa-list"></span> Category
			</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="#">Project</a> <a
						class="dropdown-item" href="#">Programming language</a>

					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Data Structure</a>
				</div>
			<li class="nav-item"><a class="nav-link" href="#"><span
					class="fa fa-address-book-o"></span>Contact</a></li>
			</li>
			<li class="nav-item"><a class="nav-link more" href="#"><span
					class="fa fa-info-circle"></span>more info</a></li>
			
			
		</ul>
		<ul class="navbar-nav mr-right">
		<li class="nav-item"><a class="nav-link more" href="registration.jsp"><span
					class="fa fa-user-circle"></span><%= user.getName() %></a></li>
			<li class="nav-item"><a class="nav-link more" href="login.jsp"><span
					class="fa fa-sign-out"></span>logout</a></li>
		</ul>
	</div>
</nav>
<!-- Navbar End -->












	<!--java script link -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/myJScript.js"></script>
</body>
</html>