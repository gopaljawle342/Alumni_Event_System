<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    
    <!-- DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"/>


    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    
     <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bootstrap.css'/>" />
     <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/dashboard.css'/>" />
  
</head>
<body>
  
     <jsp:include page="Header.jsp"></jsp:include>
           <jsp:include page="sidebar.jsp"></jsp:include>
   <div class="content">
   <div id="department" class="form-section">
        <h1>Manage Event Locations</h1>
        <button
          class="btn btn-primary mb-3"
          onclick="toggleForm('add-place-form')"
        >
          Add Place
        </button>
        
        </div>
        
        <div id="add-place-form" class="add-form row">
                   <h1> Place</h1>
          <form action="place" method="post">
            <div class="form-group col-10 col-md-8 col-lg-4">
              <label for="place">Event Place </label>
              <input
                type="text"
                class="form-control"
                required
                id="place"
                name="name"
                placeholder="Enter place name"
              />
            </div>
            <button type="submit" class="btn btn-primary mt-2">
              Add Place
            </button>
          </form>
        </div>
        
        
        <h2 id="msg">${msg}</h2>
        
        <table class="table table-dark mt-1" id="placeTable">
          <thead>
            <tr>
              <th>ID</th>
              <th>Name</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody id="placeBTableBody">
          <%
          int c=1;%>
          <c:forEach var="p" items="${plist}">
          <tr>
              <td><%=c++ %></td>
              <td>${p.getName()}</td>
              <td>
                <a href="place/${p.getId()}" class="btn btn-warning btn-sm" >Update</a>
                <button class="btn btn-danger btn-sm" id="${p.getId()}" onClick="deletePlace(this.id)">Delete</button>
                
              </td>
            </tr>
          </c:forEach>
          <%c=0; %>
          
            
            <!-- Add more departments as needed -->
          </tbody>
        </table>
      </div>
   </div>
   
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>  <!-- Custom JS -->
   

    <script  src="<c:url value='/resources/js/bootstrap.bundle.js'/>"></script> 
    <script  src="<c:url value='/resources/js/DashBoard.js'/>"></script> 
    <script  src="<c:url value='/resources/js/place.js'/>"></script> 
    
</body>
</html>