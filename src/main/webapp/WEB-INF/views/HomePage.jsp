<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Alumni Event Organizer</title>
<!-- Bootstrap 5 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/HomePage.css'/>" />
</head>
<body>
	<!-- Navbar Section -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top">
		<a class="navbar-brand text-white" href="#">Alumni Event Organizer</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
				fill="white" class="bi bi-list" viewBox="0 0 16 16">
  <path fill-rule="evenodd"
					d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5" />
</svg>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ms-auto">
				<li class="nav-item"><a class="nav-link" href="#events">Upcoming
						Events</a></li>
				<li class="nav-item"><a class="nav-link" href="#login"
					onclick="toggleAuthSection('login')">Login</a></li>
				<li class="nav-item"><a class="nav-link" href="#signup"
					onclick="toggleAuthSection('signup')">Sign Up</a></li>
			</ul>
		</div>
	</nav>



	<!-- Header Section -->
	<header class="header container-fluid mt-3">


		<!-- Message for already registerd -->
		<c:if test="${registred==1}">
			<h2 class="text-dark">You are already registred please login...!</h2>
			<li class="nav-item"><a class="nav-link btn-link co" href="#login"
				onclick="toggleAuthSection('login')">Login</a></li>

			<li class="nav-item"><a class="nav-link" href="#signup"
				onclick="toggleAuthSection('signup')">Sign Up</a></li>
		</c:if>



		<!-- Mesaage for Registration -->
		<c:if test="${status==1}">
			<h2 class="text-success">Registration Success...! Login Now</h2>
			<li class="nav-item"><a class="nav-link btn-link "
				href="#login" onclick="toggleAuthSection('login')">Login</a></li>
		</c:if>
		<c:if test="${registerstatus==1}">
			<h2 class="text-white">To register Event Plase login</h2>
			<div>
			<a class=" btn  btn-success"
				href="#login" onclick="toggleAuthSection('login')">Login</a>
		<a class="btn  btn-success" href="#signup"
				onclick="toggleAuthSection('signup')">Sign Up</a>
				</div>
		</c:if>
		<c:if test="${status==0}">
			<h2 class="text-danger">Registration failed...! Try Again</h2>
		</c:if>

		<!-- Message for Login -->
		<c:if test="${login==0}">
			<h2 class="text-danger">Invalid Login...!</h2>
		</c:if>


		<h1>Alumni Event Organizer</h1>
		<p>Connecting Alumni Through Memorable Events</p>
		<a href="#events" class="btn btn-primary">View Events</a>
	</header>

	<!--    Form For OTP Verification  -->
	<c:if test="${msg==1}">
		<%
		int id = 0;
		try {
			id = (int) session.getAttribute("userid");
		} catch (Exception e) {
			System.out.print(e);
		}
		%>
		<form action="student/verify" method="post" class="col-2 mx-auto">
			<input type="hidden" value="<%=id%>" name="userid">
			<h5 class="text-danger">${otpstatus}</h5>
			<input type="text" class="form-control" id="otp" name="otp"
				placeholder="Enter 6 digit otp" maxlength="6" required />
			<button class="btn btn-success col-8 col-md-4 mx-auto ">Verify</button>
		</form>
	</c:if>



	<!-- Featured Event Section -->
	<section class="container my-5">
		<h2 class="text-center md-3">Featured Event</h2>
		<div class="row">
			<div class="col-md-6">
				<img src="<c:url value='/resources/img/alumni.jpg' />"
					alt="Featured Event" class="img-fluid" />
			</div>
			<c:set var="maxIterations" value="1" />

			<%-- Loop through the list and limit to 3 iterations --%>
			<c:forEach var="event" items="${elist}" varStatus="status">
				<c:if test="${status.index < maxIterations}">
					<div class="col-md-6">
						<h3>${event.getEname() }</h3>
						<p>Date: ${event.getDate() }</p>
						<p>Location: ${event.getPm().getName() }</p>
						<p>${event.getDescription() }.</p>
						<a href="alumni/register/${event.getId()}" class="btn btn-primary">Register</a>
					</div>
				</c:if>
			</c:forEach>

		</div>
	</section>


	<!-- Event Listing Section -->
	<section class="container my-5" id="events">
		<h2 class="text-center">Upcoming Events</h2>
		<div class="row">

			<c:set var="maxIterations" value="3" />

			<%-- Loop through the list and limit to 3 iterations --%>
			<c:forEach var="event" items="${elist}" varStatus="status">
				<c:if test="${status.index < maxIterations}">
					<div class="col-md-4">
						<div class="card event-card">
							<img src="<c:url value='/resources/img/img-${status.index}.jpeg' />"
								class="card-img-top" alt="Event 1" />
							<div class="card-body">
								<h5 class="card-title">${event.getEname() }</h5>
								<p class="card-text">
									Date: ${event.getDate() }<br />Location:${event.getPm().getName()}
								</p>
								<a href="alumni/register/${event.getId()}"
									class="btn btn-primary">Register</a>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
			<!-- <div class="col-md-4">
				<div class="card event-card">
					<img src="https://via.placeholder.com/400x200" class="card-img-top"
						alt="Event 1" />
					<div class="card-body">
						<h5 class="card-title">Alumni Networking Brunch</h5>
						<p class="card-text">
							Date: October 15, 2024<br />Location: Mumbai, Maharashtra
						</p>
						<a href="#" class="btn btn-primary">Learn More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card event-card">
					<img src="https://via.placeholder.com/400x200" class="card-img-top"
						alt="Event 2" />
					<div class="card-body">
						<h5 class="card-title">Tech Talk with Alumni</h5>
						<p class="card-text">
							Date: November 5, 2024<br />Location: Bangalore, Karnataka
						</p>
						<a href="#" class="btn btn-primary">Learn More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card event-card">
					<img src="https://via.placeholder.com/400x200" class="card-img-top"
						alt="Event 3" />
					<div class="card-body">
						<h5 class="card-title">Annual Alumni Meetup 2024</h5>
						<p class="card-text">
							Date: December 12, 2024<br />Location: Pune, Maharashtra
						</p>
						<a href="#" class="btn btn-primary">Learn More</a>
					</div>
				</div>
			</div> -->
		</div>
	</section>

	<!-- Login and Signup Section -->
	<section class="container my-5" id="auth">
		<!-- Login Form -->
		<div class="auth-section" id="login">
			<h2 class="text-center">Login</h2>
			<div class="row justify-content-center">
				<div class="col-8 col-md-4">
					<form action="login" method="post">
						<div class="mb-3">
							<label for="email" class="form-label">Email address</label> <input
								type="text" class="form-control" id="email" name="email"
								placeholder="Enter email" />
						</div>
						<div class="mb-4">
							<label for="password" class="form-label">Password</label> <input
								type="password" class="form-control" name="password"
								id="password" placeholder="Password" />
						</div>
						<button type="submit" class="btn btn-primary w-100">
							Login</button>
					</form>
				</div>
			</div>
		</div>

		<!-- Signup Form -->
		<div class="auth-section" id="signup">
			<h2 class="text-center">Sign Up</h2>
			<div class="row justify-content-center">
				<div class="col-8 col-md-4">
					<form action="student/register" method="post">
						<div class="col-12 d-flex">
							<div class="mb-3 col-6">
								<label for="firstname" class="form-label">First Name</label> <input
									type="text" class="form-control" id="firstname"
									name="firstname" placeholder="First Name" required />
							</div>
							<div class="mb-3 col-6">
								<label for="lastname" class="form-label">Last Name</label> <input
									type="text" class="form-control" id="lastname" name="lastname"
									placeholder="Last Name" required />
							</div>
						</div>
						<div class="mb-3">
							<label for="signupEmail" class="form-label">Email address</label>
							<input type="email" class="form-control" id="signupEmail"
								name="email" placeholder="Enter your email" required />
						</div>
						<div class="mb-3">
							<label for="signupPassword" class="form-label">Password</label> <input
								type="password" class="form-control" id="signupPassword"
								name="password" placeholder="Create a password" required />
						</div>
						<div class="mb-3">
							<label for="contact" class="form-label">Contact</label> <input
								type="text" class="form-control" id="contact" name="contact"
								placeholder="Enter a Contact" required />
						</div>

						<div class="mb-2">
							<label for="department" class="form-label">Department</label> <select
								class="form-select" id="department" name="department.id">
								<c:forEach var="item" items="${dlist}">
									<option value="${item.getId() }">${item.getName()}</option>
								</c:forEach>

							</select>
						</div>
						<div class="mb-2">
							<label for="year" class="form-label">Select Passout Year</label>
							<select class="form-select" id="year" name="pass.id">
								<c:forEach var="item" items="${y}">
									<option value="${item.getId() }">${item.getYear()}</option>
								</c:forEach>
							</select>
						</div>
						<div class="mb-3">

							<input type="hidden" class="form-control" id="type" name="type"
								value="student" />
						</div>
						<button type="submit" class="btn btn-success w-100">Sign
							Up</button>
					</form>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer Section -->
	<footer>
		<p>&copy; 2024 Alumni Event Organizer. All rights reserved.</p>
	</footer>

	<!-- Bootstrap 5 JS and Popper.js -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<!-- Custom JS -->

	<!-- JavaScript for toggling auth sections -->
	<script>
		function toggleAuthSection(section) {
			document.querySelectorAll(".auth-section").forEach(function(el) {
				el.style.display = "none";
			});
			document.getElementById(section).style.display = "block";
		}
	</script>
</body>
</html>
