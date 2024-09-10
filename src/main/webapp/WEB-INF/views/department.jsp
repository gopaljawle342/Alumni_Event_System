<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Departments</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bootstrap.css'/>" />

    <!-- DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"/>

    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/dashboard.css'/>" />

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>

</head>
<body>
  
<jsp:include page="Header.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>

<div class="content">
    <div id="department" class="form-section">
        <h1>Manage Departments</h1>
        <button class="btn btn-primary mb-3" onclick="toggleForm('add-department-form')">Add Department</button>
        
        <div id="add-department-form" class="add-form row">
           <form action="department" method="post" id="departmentForm">
            <div class="form-group col-10 col-md-8 col-lg-4">
                <label for="department">Department Name</label>
                <input type="text" class="form-control" required id="department" name="name" placeholder="Enter department name" />
                <span id="departmentError" class="error"></span>
            </div>
            <button type="submit" class="btn btn-success mt-2">Add Department</button>
        </form>
        </div>

        <h2 id="msg">${msg}</h2>    
        <table id="depttable" class="table table-dark mt-1">
            <thead class="text-center">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="deptTable">
                <%
                int c = 1;
                %>
                <c:forEach var="dept" items="${dlist}">
                    <tr>
                        <td><%=c++ %></td>
                        <td>${dept.getName()}</td>
                        <td>
                            <a href="department/update/${dept.getId()}" class="btn btn-warning btn-sm">Update</a>
                            <button class="btn btn-danger btn-sm" id="${dept.getId()}" onClick="deleteDepartment(this.id)">Delete</button>
                        </td>
                    </tr>
                </c:forEach>
                <% c = 0; %>
            </tbody>
        </table>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="<c:url value='/resources/js/bootstrap.bundle.js'/>"></script>
<script src="<c:url value='/resources/js/DashBoard.js'/>"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>  <!-- Custom JS -->
<script src="<c:url value='/resources/js/Department.js'/>"></script>
   
<!-- DataTables Initialization -->
<script>
    
</script>

</body>
</html>
