<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>registration</title>
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
<!-- google font -->
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
		rel="stylesheet">
</head>
<body>
	<%@include file="navbar.jsp"%>
	<!-- registration -->
	<main class="d-flex align-items-center primary-background"
		style="height: 80vh;">
		<div class="container">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header primary-background text-center text-white">
						<h3>sign up</h3>
					</div>
					<div class="card-body">
						<form id="reg-form" action="registerurl" method="post">
							<div class="form-group">
								<input type="text" name="user_name" class="form-control"
									id="user_name" aria-describedby="emailHelp"
									placeholder="Enter name">

							</div>

							<div class="form-group">
								<input type="email" name="user_email" class="form-control"
									id="user_email" aria-describedby="emailHelp"
									placeholder="Enter email">

							</div>

							<div class="form-group">
								<input type="password" name="user_password" class="form-control"
									id="user_password" placeholder="Password">
							</div>
							<div class="form-group">
								<label>Select Gender :</label> <input type="radio" name="gender"
									value="male" checked="checked">Male <input type="radio"
									name="gender" value="female">Female
							</div>
							<div>
								<textarea name="about" class="form-control" rows="2" cols="3"
									placeholder="Something about yourself..."></textarea>
							</div>
							<div class="form-check">
								<input type="checkbox" name="check" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">agree terms and condition</label>
							</div>
							<br>
							<div class="container text-center" id="loader" style="display:none;">
							<i class="fa fa-circle-o-notch fa-spin fa-2x"></i>
							<h4>Please wait...</h4>
							</div>
							<button id="submit-btn" type="submit" class="btn btn-outline-dark">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>











<!--jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
<!-- ajax CDN -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
<!-- Bootstrap CDN -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
<!-- Java Script -->
	<script type="text/javascript" src="js/myJScript.js"></script>
<!-- Sweet Alert CDN -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			console.log("loaded...")
			$('#reg-form').on('submit', function(event) {
				event.preventDefault();
				let form = new FormData(this);
				$('#submit-btn').hide();
				$('#loader').show();
				//send RegisterServlet
				$.ajax({
					url : "registerurl",
					type : 'POST',
					data : form,
					success : function(data, textStatus, jqXHR) {
						console.log(data)
						$('#submit-btn').show();
						$('#loader').hide();
						
						if(data.trim()==='done'){
						swal("Registration Successful !  ").then((value) => {
						  window.location.href="login.jsp"
						});
						}
						else{
							swal(data);
						}
					},
					error : function(jqXHR, textStatus, errorthrown) {
						$('#submit-btn').show();
						$('#loader').hide();
						swal("Something went wrong ! please try again ");
					},
					processData : false,
					contentType : false
				});
			});
		});
	</script>
</body>
</html>













