<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage PassYear</title>

<!-- External CSS and JS -->
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bootstrap.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/dashboard.css'/>" />

<!-- jQuery -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<!-- DataTables JS -->

</head>
<body>

<jsp:include page="Header.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>

<div class="content">
   <div id="passout" class="form-section">
        <h1>Manage PassYear</h1>
        
        <button class="btn btn-primary mb-3" onclick="toggleForm('add-batch-form')">ADD BATCH</button>
        
        <div id="add-batch-form" class="add-form row">
          <form action="passyear" method="post">
            <div class="form-group col-10 col-md-8 col-lg-4">
              <label for="passyear">Year</label>
              <input type="text" class="form-control" required id="passyear" name="year" maxLength="4" placeholder="Enter PassOut Year" />
            </div>
            <button type="submit" class="btn btn-primary mt-2">Add PassYear</button>
          </form>
        </div>

        <h2 id="msg">${msg}</h2>

        <table class="table table-dark mt-1" id="passtable">
          <thead>
            <tr>
              <th>ID</th>
              <th>PassYear</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody id="passTable">
            <%
            int c = 1;
            %>
            <c:forEach var="year" items="${plist}">
            <tr>
                <td><%= c++ %></td>
                <td>${year.getYear()}</td>
                <td>
                  <a href="passyear/update/${year.getId()}" class="btn btn-warning btn-sm">Update</a>
                  <button class="btn btn-danger btn-sm" id="${year.getId()}" onClick="deletePassYear(this.id)">Delete</button>
                </td>
            </tr>
            </c:forEach>
            <%
            c = 0;
            %>
          </tbody>
        </table>
    </div>
</div>

<!-- Bootstrap and custom scripts -->
<script src="<c:url value='/resources/js/bootstrap.bundle.js'/>"></script>
<script src="<c:url value='/resources/js/DashBoard.js'/>"></script>
<script src="<c:url value='/resources/js/passyear.js'/>"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>  <!-- Custom JS -->
   


</body>
</html>
