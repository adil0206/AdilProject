<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.adiTech.helper.ConnectionProvider"%>
<%@page import="com.adiTech.dao.PostDao"%>
<%@page import="com.adiTech.entities.Post"%>
<%@page import="java.util.List"%>
 
<div class="row">
	<% 
	PostDao postdao=new PostDao(ConnectionProvider.getConnection());
	List<Post> list=postdao.getAllPost();
	for(Post p:list){
	%>
	<div class="col-md-6 mt-2">
		<div class="card">
			<img class="card-img-top" src="post_pic/<%=p.getPic() %>" alt="image">
			<div class="card-body">
				<h5><%=p.getpTitle() %></h5>
				<p><%=p.getpContent() %></p>
				<pre><%=p.getCode() %></pre>
			</div>
		</div>
	
	</div>
	
	
	<%	
	}
	%>
</div>