<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reviews</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css' />">
<link rel="stylesheet" href="<c:url value='/resources/css/student.css' />">
</head>
<body>
	

    <jsp:include page="studentsidebar.jsp"></jsp:include>
	<div class="content ">
	   <%-- <h3 class="text-center text-success">${msg }</h3> --%>
    <div id="take-attendance" class="form-section col-12 col-md-6  mx-auto ">
        <form action="alumni/review" method="post" class="col-12 mt-5 ">
            <div class="mb-3">
                <label for="eventSelect" class="form-label">Select Event</label>
                <select class="form-select" id="eventSelect" name="eid" onChange="getStudent()">
                    <c:if test="${elist.size()==0 }">
                        <option>No Completed Event...</option>
                    </c:if>
                    <option>Select Event</option>
                    <c:forEach var="event" items="${elist }">
                        <option value="${event.getId()}">${event.getEname()}</option>
                    </c:forEach>
                </select>
            </div>
            <input type="hidden" name="sid" value="${sid }">
            <div class="form-group">
                <label for="exampleFormControlTextarea1">Write review Here</label>
                <textarea class="form-control" name="review" id="exampleFormControlTextarea1" rows="3"></textarea>
            </div>
            <button class="btn btn-primary">Send Review</button>
        </form>
    </div>
</div>

<!-- Menu Button for mobile view -->
<div class="menu-btn" onclick="toggleSidebar()">☰</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script src="<c:url value='/resources/js/viewattendance.js' />"></script>
</body>
</html>