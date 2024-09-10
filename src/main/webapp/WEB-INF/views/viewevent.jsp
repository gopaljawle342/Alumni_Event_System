<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Organize Event</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
<!-- Custom CSS -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/dashboard.css'/>" />
	
	
	<!-- DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"/>


    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
</head>
<body>
	<!-- Include Header and Sidebar -->
	<jsp:include page="Header.jsp"></jsp:include>
	<jsp:include page="sidebar.jsp"></jsp:include>

	<div class="content row shadow">
		<div id="organize-event" class=" ">
		
		<h2 id="msg"></h2>
			<h2>View Event</h2>
			
			
			<table class="table table-dark mt-4" id="eventTable">
				<thead>
					<tr>
						<th>ID</th>
						<th>Title</th>
						<th>Date</th>
						<th>Organizer</th>
						<th>Location</th>
						<th>Description</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody id="eventTableBody">
				<% int c=0; %>
				<c:forEach var="event" items="${elist}">
					<tr>
						<td><%=++c %></td>
						<td>${event.getEname() }</td>
						<td>${event.getDate() }</td>
						<td>${event.getDm().getName() }</td>
						<td>${event.getPm().getName() }</td>
						<td>${event.getDescription() }</td>
						<td>
							<a href="event/${event.getId()}" class="btn btn-warning btn-sm">Update</a>
                            <button class="btn btn-danger btn-sm" id="${event.getId()}" onClick="deleteEvent(this.id)">Delete</button>
                        </td>
					</tr>
				</c:forEach>
					<!-- Add more events as needed -->
				</tbody>
			</table>
		</div>
	</div>

	<!-- Bootstrap JS, Popper.js, and jQuery -->
	<script src="<c:url value='/resources/js/event.js' />"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<!-- Custom JS -->
	<script src="<c:url value='/resources/js/DashBoard.js'/>"></script>
</body>
</html>
