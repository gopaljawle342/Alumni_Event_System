<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
    />
     <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/dashboard.css'/>" />
  
</head>
<body>
 <jsp:include page="Header.jsp"></jsp:include>
       <jsp:include page="sidebar.jsp"></jsp:include>
  <div class="content">
   <div id="attendance" class="form-section">
        <h1>Attendance</h1>
        <!-- Placeholder for attendance management -->
        <p>Manage and view attendance records here.</p>
      </div>
  </div>
  
   <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>  <!-- Custom JS -->
   
</body>
</html>