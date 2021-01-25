<%@page import="com.entities.Note"%>
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
	<title>Update Note</title>
</head>
<body>
<div class="container-fluid">
		<%@include file="navbar.jsp"%>

	</div>
	<div>
	<h3 class="text-center mt-5">Update your note details</h3>
	</div>
	<div class="container mt-4">
		<form action="UpdateServlet" method="post">
		
			
		
			<div class="mb-3">
				<label for="title" class="form-label">Note Title</label> 
				
				<input
					type="text" class="form-control" id="title"
					placeholder="Enter title" name="title" 
					
					<%
					 Session se=HibernateHelper.getFactory().openSession();
					 int note_id=Integer.parseInt(request.getParameter("note_id"));
						
					 Note note=se.get(Note.class,note_id);
					 
					%>
					value="<%= note.getTitle() %>"
					<%
					 se.close();
					%>
					
					required>
					
					<input value="<%= note.getNote_id()%>" name="noteId"  type="hidden">

			</div>
			<div class="mb-3">
				<label for="exampleFormControlTextarea1" class="form-label">
					Note Content</label>
				<textarea class="form-control" id="exampleFormControlTextarea1" rows="7" name="content" required>
				<%= note.getDescription() %>
				</textarea>
			</div>
			<button type="submit" class="btn btn-success btn-lg">save note</button>
		</form>
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