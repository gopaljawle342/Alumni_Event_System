<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>
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
    <!-- Include Header and Sidebar -->
    <jsp:include page="Header.jsp"></jsp:include>
    <jsp:include page="sidebar.jsp"></jsp:include>
    
    <div class="content">
        <div id="user" class="form-section">
           
           
            
            <div id="add-admin-form" class=" mx-auto row">
                <!-- Add User Form -->
                 
                <form action="admin" method="post" id="admin-form" class="col-lg-6 col-md-8 col-10 mx-auto">
                <h3>Add Admin</h3>
                   <div class="col-12 d-flex ">
                    <div class="mb-3 col-6">
                      <label for="firstname" class="form-label">First Name</label>
                      <input
                        type="text"
                        class="form-control"
                        id="firstname"
                        name="firstname"
                        required
                        placeholder="Enter First name"
                      />
                    </div>
                    <div class="mb-3 col-6">
                      <label for="lastname" class="form-label">Last Name</label>
                      <input
                        type="text"
                        class="form-control"
                        id="lastname"
                        name="lastname"
                        required
                        placeholder="Enter last name"
                      />
                    </div>
                     </div>
                    <div class="mb-3">
                      <label for="userEmail" class="form-label">Email</label>
                      <input
                        type="email"
                        class="form-control"
                        id="userEmail"
                        name="email"
                        required
                        placeholder="Enter email"
                      />
                    </div>
                    <div class="mb-3">
                      <label for="contact" class="form-label">Contact</label>
                      <input
                        type="text"
                        class="form-control"
                        id="contact"
                        name="contact"
                        required
                        placeholder="Enter contact"
                        maxlength="10"
                      />
                      <p id="validationMessage"></p>
                    </div>
                    
                    <div class="mb-3">
                      <label for="password" class="form-label">Password</label>
                      <input
                        type="password"
                        class="form-control"
                        id="password"
                        name="password"
                        required
                        placeholder="Enter Password"
                      />
                    </div>
                    <div class="mb-3">
                      <label for="userRole" class="form-label">Role</label>
                      <select class="form-select" id="userRole" name="type">
                        <option value="admin">Admin</option>
                        <option value="subadmin">Subadmin</option>
                      </select>
                    </div>
                    
                    <button type="submit" class="btn btn-primary">Add User</button>
                </form>
            </div>
            
            </div>
            </div>
     
            <!-- User Table -->
            
  
    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script> <!-- Custom JS -->
    <script src="<c:url value='/resources/js/DashBoard.js'/>"></script> 
     <script src="<c:url value='/resources/js/validation.js'/>"></script> 
</body>
</html>
