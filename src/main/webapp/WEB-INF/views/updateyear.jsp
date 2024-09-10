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
    
     <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bootstrap.css'/>" />
     <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/dashboard.css'/>" />
  
</head>
<body>
  
     <jsp:include page="Header.jsp"></jsp:include>
           <jsp:include page="sidebar.jsp"></jsp:include>
   <div class="content">
   <div id="department" class="form-section">
        <h1>Update Department</h1>
        
        <div id="add-department-form" class=" row">
          <form action="year" method="post" id="update">
            <div class="form-group col-10 col-md-8 col-lg-4">
              
              <input
                type="hidden"
                class="form-control"
                id="id"
                name="id"
                value="${y.getId() }"
              />
            </div>
            <div class="form-group col-10 col-md-8 col-lg-4">
              <label for="year">New Year</label>
              <input
                type="text"
                class="form-control"
                required
                id="year"
                name="year"
                value="${y.getYear()}"
                
              />
            </div>
            <button type="submit" class="btn btn-primary mt-2">
              Update PassYear
            </button>
          </form>
        </div>
   </div>
   </div>
   

    <script  src="<c:url value='/resources/js/bootstrap.bundle.js'/>"></script> 
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>  <!-- Custom JS -->
   
   <script>
   let updateform=document.getElementById("update");
   
   updateform.addEventListener("submit",()=>{
  	 let msg=confirm("Do You Want Update Form.....?");
  	 
  	 if(!msg){
  		 event.preventDefault();
  		 window.location.href = "/AEMSAPP/passyear"
  	 }
   });
   </script>
    
</body>
</html>