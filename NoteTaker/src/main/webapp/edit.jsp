<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.adil.Note"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>edit page</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container">
	<h1>Update Your Notes</h1>
	<br>
	<%
	int noteId=Integer.parseInt(request.getParameter("note_id").trim());
	Session ses=FactoryProvider.getFactory().openSession();
	Note note=(Note)ses.get(Note.class ,noteId);
	
	
	%>
	<form action="UpdateServlet" method="post">
		<input value="<%=note.getId() %>"type="hidden" name="noteId">
			<div class="form-group">
				<label for="title">Edit title</label> 
				<input type="text" name="editTitle" value="<%=note.getTitle() %>" class="form-control">
				

			</div>
			<div class="form-group">
				<label for="content">Edit Content</label>
				<textarea name="editContent" class="form-control" style="height: 300px;"
					><%=note.getContent() %></textarea>

			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save</button>
				<a href="all_notes.jsp" class="btn btn-outline-primary" role="button">Back</a>
			</div>
		</form>
		</div>
</body>
</html>