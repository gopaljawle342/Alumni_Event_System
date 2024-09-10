<%@page import="com.model.UserModel"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
	integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.css" /> ">
<link rel="stylesheet"
	href="<c:url value="/resources/css/student.css" /> ">
</head>
<body>
	<!-- Sidebar -->
   <%
         UserModel user=(UserModel)session.getAttribute("user");
   %>

	<!-- Main Content -->
	<div class="main-content">
	<jsp:include page="studentsidebar.jsp"></jsp:include>
		<header>
			<div class="menu-btn" id="menu-btn">
				<i class="fa-solid fa-bars" style="color: #FFD43B;"></i>
			</div>
			<h2>Profile</h2>
		</header>

		<div class="content">
			<div class="container-fluid">
				<!-- Profile Header -->
				<div class="profile-header text-center col-12 ">
					<img src="<c:url value='/resources/img/profile.png' />" alt="Profile Image"
						class="profile-image">
					<h2 class="mt-3 fs-1"><%=user.getFirstname() %>&nbsp <%=user.getLastname() %></h2>
					<p class="fs-2"><%=user.getType() %></p>
					<a href="#" class="btn btn-edit">Edit Profile</a>
				</div>

				<!-- Profile Details -->
				<div class="row mt-4">
					<!-- Personal Information -->
					<div class="col-lg-6">
						<div class="card profile-card">
							<div class="card-body">
								<h5 class="card-title">Personal Information</h5>
								<p class="card-text">
									<strong>Email:</strong> <%=user.getEmail() %>
								</p>
								<p class="card-text">
									<strong>Phone:</strong> <%=user.getContact() %>
								</p>
								
							</div>
						</div>
					</div>

					<!-- Bio -->
					<div class="col-lg-6">
						<div class="card profile-card">
							<div class="card-body">
								<h5 class="card-title">Bio</h5>
								<p class="card-text">Student of <%=user.getDepartment().getName() %></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>