<%@page import="java.util.ArrayList"%>
<%@page import="com.adiTech.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.adiTech.entities.User"%>
<%@ page import="com.adiTech.entities.Category"%>
<%@ page import="com.adiTech.entities.Message"%>
<%@ page import="com.adiTech.dao.PostDao"%>

<%@ page errorPage="error.jsp"%>
<%
	User user = (User) session.getAttribute("currentUser");
	if (user == null) {
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

				<li class="nav-item"><a href="#!" class="nav-link more"
					data-toggle="modal" data-target="#post-modal"><span
						class="fa fa-share-square-o"></span>Post</a></li>


			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link more" href="#!"
					data-toggle="modal" data-target="#profile-modal"><span
						class="fa fa-user-circle"></span><%=user.getName()%></a></li>
				<li class="nav-item"><a class="nav-link more" href="login.jsp"><span
						class="fa fa-sign-out"></span>logout</a></li>
			</ul>
		</div>
	</nav>
	<!-- Navbar End -->
	<%
		Message msg = (Message) session.getAttribute("msg");
		if (msg != null) {
	%>
	<div class="alert <%=msg.getCssClass()%>" role="alert">
		<%=msg.getContent()%>
	</div>

	<%
		session.removeAttribute("msg");
		}
	%>
	<!-- Start body -->
	<main>
		<div class="container">
			<div class="row">
				<div class="col-md-4 mt-4">
					<div class="list-group">
						<a href="#" class="list-group-item primary-background text-white">
							All Post </a>
							<%
							PostDao dao=new PostDao(ConnectionProvider.getConnection());
							ArrayList<Category>list1=dao.getCategories();
							for(Category cat:list1){
							%>
							<a href="#" class="list-group-item list-group-item-action"><%=cat.getName() %></a>
							<% 
							}
							%> 
							 
							
					</div>
				</div>
				<div class="col-md-8">
				<!-- post -->
				<div class="container mt-4 text-center" id="post-loader">
					<i class="fa fa-spinner fa-spin fa-3x" aria-hidden="true"></i>
					<h3 class="mt-2">Loading...</h3>
				</div>
				<div class="container-fluid" id="post-container">
					
				</div>
				</div>
			</div>
		</div>

	</main>


	<!-- End body -->

	<!-- Profile Modal -->
	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white text-center">
					<h5 class="modal-title" id="exampleModalLabel">AdiTech</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="img/<%=user.getProfile()%>" class="img-fluid"
							style="border-radius: 100px; max-width: 150px;"> <br>
						<h5 class="modal-name mt-3" id="modalName"><%=user.getName()%></h5>

						<!-- user Details -->
						<div id="profile-details">
							<table class="table table-sm">

								<tbody>
									<tr>
										<th scope="row">ID</th>

										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Email</th>

										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">Gender</th>

										<td><%=user.getGender().toUpperCase()%></td>
									</tr>
									<tr>
										<th scope="row">About</th>

										<td><%=user.getAbout()%></td>
									</tr>
									<tr>
										<th scope="row">Registered on</th>
										<td><%=user.getDatetime()%></td>

									</tr>
								</tbody>
							</table>
						</div>
						<!-- End of user Details -->
						<!-- Profile Edit -->
						<div id="profile-edit" style="display: none;">
							<h4 style="color: #919294;" class="mt-2">Please Edit
								Carefully</h4>
							<form action="editServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<th scope="row">ID</th>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<th scope="row">Name</th>
										<td><input type="text" class="form-control"
											name="user_name" value="<%=user.getName()%>"></td>
									</tr>
									<tr>
										<th scope="row">Email</th>
										<td><input type="email" class="form-control"
											name="user_email" value="<%=user.getEmail()%>"></td>
									</tr>
									<tr>
										<th scope="row">Password</th>
										<td><input type="password" class="form-control"
											name="user_password" value="<%=user.getPassword()%>"></td>
									</tr>
									<tr>
										<th scope="row">Gender</th>
										<td><%=user.getGender().toUpperCase()%></td>
									</tr>
									<tr>
										<th scope="row">About</th>
										<td><textarea name="user_about" rows="3"
												class="form-control"><%=user.getAbout()%></textarea></td>
									</tr>
									<tr>
										<th scope="row">New Profile</th>
										<td><input type="file" name="user_profile"
											class="form-control"></td>
									</tr>
								</table>
								<div class="container">
									<button type="submit" class="btn btn-outline-dark">Save</button>
								</div>
							</form>

						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">close</button>
					<button id="edit-profile-btn" type="button"
						class="btn btn-outline-dark">edit</button>

				</div>
			</div>
		</div>
	</div>
	<!-- End of Profile -->
	<!-- Start Post modal -->
	<!-- Modal -->
	<div class="modal fade" id="post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white">
					<h5 class="modal-title" id="exampleModalLabel">Post</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="post-form" action="postServlet" method="post">
						<div class="form-group">
							<select class="form-control" name="cid">
								<option selected disabled>---select category---</option>
								<%
									PostDao postdao = new PostDao(ConnectionProvider.getConnection());
									ArrayList<Category> list = postdao.getCategories();
									for (Category c : list) {
								%>
								<option value="<%=c.getCid()%>"><%=c.getName()%></option>
								<%
									}
								%>
							</select>
						</div>
						<div class="form-group">
							<input class="form-control" type="text" name="post-title"
								placeholder="add title">
						</div>
						<div class="form-group">
							<textarea name="post-content" class="form-control" rows="3"
								placeholder="add content here"></textarea>
						</div>
						<div class="form-group">
							<textarea name="post-code" class="form-control" rows="5"
								placeholder="add code here"></textarea>
						</div>
						<div class="form-group">
							<input type="file" name="post-pic">
						</div>

						<div class="container text-center">

							<button type="submit" class="btn btn-outline-dark ">Post</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
	<!-- End Post modal -->
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript" src="js/myJScript.js"></script>

	<script>
		$(document).ready(function() {
			let editStatus = false;
			$('#edit-profile-btn').click(function() {
				if (editStatus == false) {
					$('#profile-details').hide();
					$('#profile-edit').show();
					editStatus = true;
					$(this).text("back");
				} else {
					$('#profile-details').show();
					$('#profile-edit').hide();
					editStatus = false;
					$(this).text("edit");
				}
			});
		});
	</script>
	<script>
		$(document).ready(function(e) {
			$('#post-form').on('submit', function(event) {
				event.preventDefault();
				console.log("submited");
				let form = new FormData(this);
				$.ajax({
					url : "postServlet",
					type : 'post',
					data : form,
					success : function(data, textStatus, jqXHR) {
						console.log(data);
						if (data.trim() == 'Successful') {
							swal("Post", "Successfully your post", "success");
						} else {
							swal("Error!", "Something! went wrong", "error");
						}
					},

					error : function(jqXHR, textStatus, data) {
						swal("Error!", "Something! went wrong", "error");
					},
					processData : false,
					contentType : false
				})
			});
		});
	</script>
	<!-- Post Loader using ajax -->
	<script>
		$(document).ready(function(e){
			$.ajax({
				url:"post_page.jsp",
				success: function(data,textStatus,jqHXR){
					console.log(data);
					$('#post-loader').hide();
					$('#post-container').html(data);
				}
			})
			
		});
	</script>
</body>
</html>













