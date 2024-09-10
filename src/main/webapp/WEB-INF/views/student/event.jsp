<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
      integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
      crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css' />">
<link rel="stylesheet" href="<c:url value='/resources/css/student.css' />">
<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- DataTables JS -->
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
</head>
<body>
    <!-- Main Content -->
    <div class="container-fluid">
        <jsp:include page="studentsidebar.jsp"></jsp:include>
        <header>
            <div class="menu-btn" id="menu-btn">
                <i class="fa-solid fa-bars" style="color: #FFD43B;"></i>
            </div>
            <h2 class="mb-4">Registered Event Details</h2>
        </header>

        <div class="content">
            <c:if test="${elist.size() == 0}">
                <h2>No Data Found..!</h2>
            </c:if>
            <div class="row gap-4">
                <c:forEach var="event" items="${elist}">
                    <div class="col-md-4 col-12">
                        <div class="event-card">
                            <img src="<c:url value='/resources/img/alumni.jpg' />" alt="Event Image">
                            <div class="p-3">
                                <h5 class="card-title">${event.getEname()}</h5>
                                <p class="card-text">${event.getDescription()}</p>
                                <p>Location: ${event.getPm().getName()}</p>
                                <p>Date: ${event.getDate()}</p>
                                <a href="#" class="btn btn-danger col-12">Registered</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#eventTable').DataTable({
                "paging": true,
                "searching": true,
                "ordering": true,
                "info": true,
                "lengthMenu": [5, 10, 20, 50],
                "columnDefs": [
                    { "orderable": true, "targets": [0, 1, 2] },
                    { "orderable": false, "targets": [3, 4] }
                ],
                "order": [[0, 'asc']]
            });
        });
    </script>
</body>
</html>
