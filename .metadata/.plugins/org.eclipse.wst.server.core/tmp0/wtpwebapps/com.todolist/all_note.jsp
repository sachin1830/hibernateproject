<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.HibernateHelper"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<title>all notes</title>
</head>
<body>
	<div class="container-fluid">
		<%@include file="navbar.jsp"%>
	</div>
	<div class="container">
	
	<h1 class="mt-4">All Notes:</h1>
	
	<%
	
		Session s=HibernateHelper.getFactory().openSession();
		Query q=s.createQuery("from Note");
		
		List<Note> list=q.list();
		
		for(Note note:list)
		{
			
	%>
		<div class="card m-4" style="width: ;">
			<img src="img/notes.png" class="card-img-top p-2" alt="Not found" style="max-width: 100px">
			<div class="card-body">
				<h5 class="card-title"><%= note.getTitle()%></h5>
				<p class="card-text"><%= note.getDescription() %></p>
				<a href="DeleteNote?note_id=<%= note.getNote_id()%>" class="btn btn-danger">Delete</a>
				<a href="update_data.jsp?note_id=<%= note.getNote_id() %>" class="btn btn-primary">Update</a>
			</div>
		</div>
	
	
		<%} %>
		
		<%
		s.close();
		%>
		
		
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"
		integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js"
		integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj"
		crossorigin="anonymous"></script>
</body>
</html>