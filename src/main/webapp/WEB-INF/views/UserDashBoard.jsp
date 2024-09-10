<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Font Awesome -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/dashboard.css'/>" />
  </head>
  <body>
    <!-- Navbar -->
    <jsp:include page="Header.jsp"></jsp:include>

    <!-- Sidebar -->
    <jsp:include page="sidebar.jsp"></jsp:include>

    <!-- Content Area -->
    <div class="content">
       <div id="dashboard" class="form-section active">
            <h1>Dashboard</h1>
            <div class="row">
                <div class="col-md-4">
                    <div class="card bg-primary text-white mb-3">
                        <div class="card-header">Departments</div>
                        <div class="card-body">
                            <h5 class="card-title">Total Departments</h5>
                            <p class="card-text">${count}</p>
                            <!-- Replace with dynamic count -->
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card bg-success text-white mb-3">
                        <div class="card-header">Students</div>
                        <div class="card-body">
                            <h5 class="card-title">Total Students</h5>
                            <p class="card-text">350</p>
                            <!-- Replace with dynamic count -->
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card bg-warning text-white mb-3">
                        <div class="card-header">Events</div>
                        <div class="card-body">
                            <h5 class="card-title">Events Organized</h5>
                            <p class="card-text">20</p>
                            <!-- Replace with dynamic count -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <!-- JavaScript for toggling sections and forms -->
    <script src="<c:url value='/resources/js/dashboard.js' />"></script>
   
    
  </body>
</html>
