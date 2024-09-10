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
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"/>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/dashboard.css'/>" />
    
    <!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- DataTables JS -->
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    
</head>
<body>
    <!-- Include Header and Sidebar -->
    <jsp:include page="Header.jsp"></jsp:include>
    <jsp:include page="sidebar.jsp"></jsp:include>
    
    <div class="content">
        <div id="user" class="form-section">
            <h3 id="msg"></h3>
            
            
            <h1>All Student Record</h1>
            
            
            <h3>${msg}</h3>
      
            <!-- User Table -->
            <table class="table table-dark mt-4" id="studentTable">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Contact</th>
                        <th>Role</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="studentbody">
                <% int c=1; %>
                <c:forEach var="s" items="${slist}">
                <tr>
                        <td><%=c++ %></td>
                        <td>${s.getFirstname() } &nbsp&nbsp ${s.getLastname()}</td>
                        <td>${s.getEmail() }</td>
                        <td>${s.getContact() }</td>
                        <td>${s.getType()}</td>
                        <td>
                            <a href="student/update/${s.getId()}" class="btn btn-warning btn-sm">Update</a>
                            <button class="btn btn-danger btn-sm" id="${s.getId() }" onClick="deleteStudent(this.id)">Delete</button>
                        </td>
                    </tr>
                </c:forEach>
                    <% c=0; %>
                    <!-- Add more users as needed -->
                </tbody>
            </table>
        </div>
    </div>
  
    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script> <!-- Custom JS -->
    <script src="<c:url value='/resources/js/DashBoard.js'/>"></script> 
    <script src="<c:url value='/resources/js/student.js'/>"></script> 
    
</body>
</html>
