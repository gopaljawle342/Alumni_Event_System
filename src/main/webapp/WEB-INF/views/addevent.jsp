<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
		<h2>Add Event</h2>
		<form:form action="event" method="post" modelAttribute="EventModel" id="eventForm">
            <div class="mb-2">
                <form:label path="Ename" cssClass="form-label">Event Title</form:label>
                <form:input path="Ename" id="eventTitle" cssClass="form-control"
                    placeholder="Enter event title"  />
                <span id="eventTitleError" class="error"></span>
            </div>
            <div class="mb-2">
                <form:label path="date" cssClass="form-label">Event Date</form:label>
                <form:input path="date" id="eventDate" type="date"
                    cssClass="form-control" />
            </div>
            <div class="mb-2">
                <form:label path="dm.id" cssClass="form-label">Department</form:label>
                <form:select path="dm.id" id="department" cssClass="form-select" >
                    <c:forEach var="item" items="${dlist}">
                        <form:option value="${item.id}">${item.name}</form:option>
                    </c:forEach>
                </form:select>
            </div>
            <div class="mb-2">
                <form:label path="pm.id" cssClass="form-label">Place</form:label>
                <form:select path="pm.id" id="place" cssClass="form-select" >
                    <c:forEach var="item" items="${plist}">
                        <form:option value="${item.id}">${item.name}</form:option>
                    </c:forEach>
                </form:select>
            </div>
            <div class="mb-3">
                <form:label path="description" cssClass="form-label">Event Description</form:label>
                <form:textarea path="description" id="eventDescription"
                    cssClass="form-control" rows="3"
                    placeholder="Enter event description" />
                <span id="eventDescriptionError" class="error"></span>
            </div>
            <button type="submit" class="btn btn-success col-6">Organize Event</button>
        </form:form>
	</div>

	<script>
		// Function to set the minimum date to today's date
		function setMinDate() {
			const today = new Date().toISOString().split('T')[0]; // Format date as YYYY-MM-DD
			document.getElementById('eventDate').setAttribute('min', today);
		}
      
		

        // Regular expression for Event Description: allows letters, numbers, spaces, and common punctuation

        document.getElementById('eventForm').addEventListener('submit', function(event) {
            let valid = true;
        const eventDescriptionRegex = /^[A-Za-z0-9\s.,'!?"()-]*$/;
		const eventTitleRegex = /^[A-Za-z0-9\s-]+$/;

            // Validate Event Title
            const eventTitleInput = document.getElementById('eventTitle').value;
            const eventTitleError = document.getElementById('eventTitleError');
            if (!eventTitleRegex.test(eventTitleInput)) {
                eventTitleError.textContent = 'Invalid title. Only letters, numbers,special Symbols not  allowed.';
                valid = false;
            } else {
                eventTitleError.textContent = '';
            }

            // Validate Event Description
            const eventDescriptionInput = document.getElementById('eventDescription').value;
            const eventDescriptionError = document.getElementById('eventDescriptionError');
            if (!eventDescriptionRegex.test(eventDescriptionInput)) {
                eventDescriptionError.textContent = 'Invalid description. Only letters, numbers,symbols are not allowed are allowed.';
                valid = false;
            } else {
                eventDescriptionError.textContent = '';
            }

            if (!valid) {
                event.preventDefault(); // Prevent form submission if validation fails
            }
        });
		
		// Call the function on page load
		window.onload = setMinDate;
	</script>
</body>
</html>