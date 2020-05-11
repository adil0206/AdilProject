<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>add notes</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>


	<!-- This is form details -->
	<div class="container">
		<h1>Please fill your details</h1>
		<form action="SaveNoteServlet" method="post">
			<div class="form-group">
				<label for="title">Add title</label> <input type="text" name="title"
					class="form-control" id="addNotes" placeholder="Enter here"
					required="required">

			</div>
			<div class="form-group">
				<label for="content">Add Content</label>
				<textarea name="content" class="form-control" style="height: 300px;"
					placeholder="Enter your content here" required="required"></textarea>

			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Add</button>
				<a href="index.jsp" class="btn btn-outline-primary" role="button">Home</a>
			</div>
		</form>
	</div>
</body>
</html>