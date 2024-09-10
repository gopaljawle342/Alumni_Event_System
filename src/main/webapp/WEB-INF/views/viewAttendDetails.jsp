<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Take Attendance</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/dashboard.css'/>" />
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
	
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	<jsp:include page="sidebar.jsp"></jsp:include>

	<div class="content">
		<div id="take-attendance" class="form-section">
			<h1>Take Attendance</h1>
			<h5 class="text-success">TOTAL EVENTS
				COMPLETED:&nbsp${elist.size()}</h5>
			<div class="mb-3">
				<label for="eventSelect" class="form-label">Select Event</label> 
				<select class="form-select" id="eventSelect" onChange="getStudent()">
					<c:if test="${elist.size()==0 }">
						<option>No Completed Event...</option>
					</c:if>
					<option>Select Event</option>
					<c:forEach var="event" items="${elist }">
						<option value="${event.getId()}">${event.getEname()}</option>
					</c:forEach>
					<!-- Add more events here -->
				</select>
			</div>
				
			<div class="mb-3">
				<label for="status" class="form-label">Attendance Status</label> 
				<select class="form-select" id="status" onChange="getStudent()")>
					<option value="0">Absent </option>
					<option value="1">Present </option>
					
				</select>
			</div>


			<h2 class="mt-5">Student Attendance</h2>
			<table class="table table-dark" id="studentTable">
				<thead>
					<tr>
						<th>Sr.No</th>
						<th>Full Name</th>
						<th>Email</th>
						<th>Attendance</th>
					</tr>
				</thead>
				<tbody id="studentBodyTable">
					
				</tbody>
			</table>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script src="<c:url value='/resources/js/viewattendance.js' />" ></script>
</body>
</html>