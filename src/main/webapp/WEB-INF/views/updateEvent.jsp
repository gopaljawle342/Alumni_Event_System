<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

			<div id="add-event-form" class=" col-5 mx-auto ">
                         <h2>Update Event</h2>
				<form class="" action="update" method="post"  >
				<input type="hidden" name="id" value="${event.getId() }">
					<div class="mb-2">
						<label for="eventTitle" class="form-label">Event Title</label> <input
							type="text" class="form-control" id="eventTable"
							placeholder="Enter event title" name="Ename" value="${event.getEname()}" />
					</div>
					<div class="mb-2">
						<label for="eventDate" class="form-label">Event Date</label> <input
							type="date" class="form-control" id="eventDate" name="date" value="${event.getDate()}"/>
					</div>
					<div class="mb-2">
						<label for="department" class="form-label">Department</label> <select
							class="form-select" id="department" name="dm.id">
							<c:forEach var="item" items="${dlist}">
							<c:choose>
									<c:when
										test="${item.getName() == event.getDm().getName()}">
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
						<label for="place" class="form-label">Place</label>
						 <select class="form-select" id="place" name="pm.id">
							<c:forEach var="item" items="${plist}">
								<c:choose>
									<c:when
										test="${item.getName() == event.getPm().getName()}">
										<option value="${item.getId()}" selected>${item.getName()}</option>
									</c:when>
									<c:otherwise>
										<option value="${item.getId()}">${item.getName()}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>

						</select>
					</div>
					<div class="mb-3">
						<label for="eventDescription" class="form-label">Event
							Description</label>
						<textarea class="form-control" id="eventDescription" rows="3" name="description"
							placeholder="Enter event description" >${event.getDescription() }</textarea>
					</div>
					<button type="submit" class="btn btn-success col-6 ">Save
						Event</button>
				</form>
			</div>
			
			 <script>
			
        // Function to set the minimum date to today's date
        function setMinDate() {
            const today = new Date().toISOString().split('T')[0]; // Format date as YYYY-MM-DD
            document.getElementById('eventDate').setAttribute('min', today);
        }

        // Call the function on page load
        window.onload = setMinDate;
    </script>
</body>
</html>