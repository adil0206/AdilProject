<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="com.adil.Note"%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>all notes</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>
		<br>
		<div class="container">
		<h1 class="text-uppercase">all notes</h1>
		
		<div class="row">
			<div class="col-12">
				<%
					Session ses = FactoryProvider.getFactory().openSession();
					
					Query q = ses.createQuery("from Note");
					List<Note> list = q.list();
					for (Note note : list) {
						
				%>
				<div class="card mt-3">
					
					<div class="card-body">
						<p><b class="float-right"><%=note.getAddedDate() %></b></p>
						<img class="rounded float-left" src="img/notepad.png"  style="max-width:100px;"alt="image">
						<h5 class="card-title mx-5"><%=note.getTitle() %></h5>
						<p class="card-text mx-5"><%=note.getContent() %></p>
						
						<div class="container text-center mt-2">
						<a href="DeleteServlet?note_id=<%=note.getId() %>" class="btn btn-danger">Delete</a>
						<a href="edit.jsp?note_id=<%=note.getId() %>" class="btn btn-info">Update</a>
						</div>
					</div>
				</div>

				<%
					}
					ses.close();
				%>

			</div>
	    </div>
	</div>
</div>
</body>
</html>







