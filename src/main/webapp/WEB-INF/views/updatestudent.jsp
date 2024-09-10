<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
    /> -->

<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/bootstrap.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/dashboard.css'/>" />

</head>
<body>

	<jsp:include page="Header.jsp"></jsp:include>
	<jsp:include page="sidebar.jsp"></jsp:include>
	<div class="content">
		<div id="department" class="form-section">


			<div id="add-student-form" class="mx-auto row">
				
				<h3 class="text-center">Update Student</h3>
				<form action="update" method="POST" id="student-form"
					class="col-lg-6 col-md-8 col-10 mx-auto">
					<div class="d-flex col-12">
						<input type="hidden" value="${user.getId() }" name="id">
						<div class="mb-2 col-6">
							<label for="firstname" class="form-label">First Name</label> <input
								type="text" class="form-control" id="firstname" name="firstname"
								required value="${user.getFirstname() }"
								placeholder="Enter user name" />
						</div>
						<div class="mb-2 col-6">
							<label for="lastname" class="form-label">Last Name</label> <input
								type="text" class="form-control" id="lastname" name="lastname"
								required value="${user.getLastname() }"
								placeholder="Enter user name" />
						</div>
					</div>
					<div class="mb-2">
						<label for="userEmail" class="form-label">Email</label> <input
							type="email" class="form-control" id="userEmail" name="email"
							required value="${user.getEmail() }" placeholder="Enter email" />
					</div>

					<div class="mb-2">
						<label for="contact" class="form-label">Contact</label> <input
							type="text" class="form-control" id="contact" name="contact"
							value="${user.getContact() }" required
							placeholder="Enter contact" />
					</div>
					<input type="hidden" name="type" value="Student">
					<div class="mb-2" id="dept">
						<label for="department" class="form-label">Department</label> <select
							class="form-select" id="department" name="department.id">
							<c:forEach var="item" items="${dlist}">
								<c:choose>
									<c:when
										test="${item.getName() == user.getDepartment().getName()}">
										<option value="${item.getId()}" selected>${item.getName()}</option>
									</c:when>
									<c:otherwise>
										<option value="${item.getId()}">${item.getName()}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>

						</select>
					</div>
					<div class="mb-2">
						<label for="year" class="form-label">Select Passout Year</label> <select
							class="form-select" id="year" name="pass.id">
							<c:forEach var="item" items="${y}">
								<c:choose>
									<c:when test="${item.getYear() == user.getPass().getYear()}">
										<option value="${item.getId()}" selected>${item.getYear()}</option>
									</c:when>
									<c:otherwise>
										<option value="${item.getId()}">${item.getYear()}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
					<button type="submit" class="btn btn-primary">Add User</button>
				</form>
			</div>
		</div>
	</div>


	<script src="<c:url value='/resources/js/bootstrap.bundle.js'/>"></script>
	<script>
   let updateform=document.getElementById("update");
   
   updateform.addEventListener("submit",()=>{
  	 let msg=confirm("Do You Want Update Form.....?");
  	 
  	 if(!msg){
  		 event.preventDefault();
  		 window.location.href = "/AEMSAPP/department"
  	 }
   });
   </script>

</body>
</html>