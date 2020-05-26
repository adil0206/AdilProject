<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.adiTech.entities.Message" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>login</title>
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
	<!-- navbar -->
	<%@include file="navbar.jsp"%>
	<!-- login -->
	<main class="d-flex align-items-center primary-background"
		style="height: 80vh">
		<div class="container">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header primary-background text-white text-center">

						<h3>login</h3>
					</div>
						<%
							Message msg=(Message)session.getAttribute("msg");
							if(msg!=null){
							%>
								<div class="alert <%=msg.getCssClass() %>" role="alert">
								<%= msg.getContent() %>
								</div>
							
							<%
							session.removeAttribute("msg");
							}
						%>
					<div class="card-body">
						<form action="loginServlet" method="post">
							<div class="form-group">
								<input name="email" required="required" type="email"
									class="form-control" id="user_email"
									aria-describedby="emailHelp" placeholder="Enter email">

							</div>
							<div class="form-group">
								<input name="password" required="required" type="password"
									class="form-control" id="user_password" placeholder="Password">
							</div>

							<div class="container text-center">
								<button type="submit" class="btn btn-outline-dark">login</button>
							</div>

							<div class="container text-center">
								<a href="registration.jsp">create new user</a>
							</div>

						</form>
					</div>
				</div>
			</div>

		</div>
	</main>
















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