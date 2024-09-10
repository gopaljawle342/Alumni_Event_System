<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Users</title>
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
</head>
<body>
	<!-- Include Header and Sidebar -->
	<jsp:include page="Header.jsp"></jsp:include>
	<jsp:include page="sidebar.jsp"></jsp:include>

	<div class="content">
		<div id="user" class="form-section">


			<div id="add-student-form" class="mx-auto row">
				<!-- Add User Form -->
				<h3>Add Student</h3>
				<form:form action="student" method="POST" id="student-form"
					cssClass="col-lg-6 col-md-8 col-10 mx-auto" modelAttribute="UserModel">
					<div class="d-flex col-12">
						<div cssClass="mb-2 col-6">
							<form:label path="firstname" cssClass="form-label">First Name</form:label>
							<form:input type="text" path="firstname" id="firstname"
								cssClass="form-control" required="true"
								placeholder="Enter user name" />
						</div>
						<div cssClass="mb-2 col-6">
							<form:label path="lastname" cssClass="form-label">Last Name</form:label>
							<form:input type="text" path="lastname" id="lastname"
								cssClass="form-control" required="true"
								placeholder="Enter user name" />
						</div>
					</div>
					<div cssClass="mb-2">
						<form:label path="userEmail" cssClass="form-label">Email</form:label>
						<form:input type="email" path="email" id="userEmail"
							cssClass="form-control" required="true" placeholder="Enter email" />
					</div>
					<div cssClass="mb-2">
						<form:label path="password" cssClass="form-label">Password</form:label>
						<form:input type="password" path="password" id="password"
							cssClass="form-control" required="true"
							placeholder="Enter Password" />
					</div>
					<div cssClass="mb-2">
						<form:label path="contact" cssClass="form-label">Contact</form:label>
						<form:input type="text" path="contact" id="contact"
							cssClass="form-control" required="true"
							placeholder="Enter contact" />
					</div>
					<form:hidden path="type" value="Student" />
					<div cssClass="mb-2" id="dept">
						<form:label path="department" cssClass="form-label">Department</form:label>
						<form:select path="department.id" id="department"
							cssClass="form-select">
							<c:forEach var="item" items="${dlist}">
								<form:option value="${item.id}">${item.name}</form:option>
							</c:forEach>
						</form:select>
					</div>
					<div cssClass="mb-2">
						<form:label path="year" cssClass="form-label">Select Passout Year</form:label>
						<form:select path="pass.id" id="year" cssClass="form-select">
							<c:forEach var="item" items="${y}">
								<form:option value="${item.id}">${item.year}</form:option>
							</c:forEach>
						</form:select>
					</div>
					<button type="submit" cssClass="btn btn-primary">Add User</button>
				</form:form>
			</div>
			<!-- User Table -->


			<!-- Bootstrap JS, Popper.js, and jQuery -->
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
				crossorigin="anonymous"></script>
			<!-- Custom JS -->
			<script src="<c:url value='/resources/js/DashBoard.js'/>"></script>
</body>
</html>
