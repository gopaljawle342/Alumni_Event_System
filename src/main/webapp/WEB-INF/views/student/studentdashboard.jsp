<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Student Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css" /> ">
    <link rel="stylesheet" href="<c:url value="/resources/css/student.css" /> ">
</head>
<body>
    

    <jsp:include page="studentsidebar.jsp"></jsp:include>
    <!-- Main Content -->
    <div class="main-content  container-fluid ">
    <!-- Sidebar -->
        <header>
            <div class="menu-btn" id="menu-btn">
               <i class="fa-solid fa-bars" style="color: #FFD43B;"></i>
            </div>
            <h2>Upcoming Events..</h2> 
        </header>
             <h2><span class="text-green">${msg }</span></h2>
        <div class="container-fluid   row shadow-secondary  mx-auto ">
           <c:if test="${elist.size()==0 }">
             <h2>No Data Found..!</h2>
           </c:if>
        <div class="content  row flex-grow justify-content-md-center gap-2   " >
        <c:forEach var="event" items="${elist }">
             <div class="col-12 col-md-3">
                <div class="event-card">
                    <img src="<c:url value='/resources/img/alumni.jpg' />" alt="Event Image">
                    <div class="row"  >
                        <h5 class="card-title">${event.getEname() }</h5>
                        <p class="card-text">${event.getDescription() }</p>
                        <p>Location:${event.getPm().getName() }</p>
                        <p>Date:${event.getDate() }</p>
                        <a href="alumni/register/${event.getId() }" class="btn btn-success col-12">Register</a>
                    </div>
                </div>
            </div>
        </c:forEach>
        </div>
        
        <!-- <div class="content col-4" >
             
             <div class="col-12">
                <div class="event-card">
                    <img src="https://via.placeholder.com/350x200" alt="Event Image">
                    <div class="p-3">
                        <h5 class="card-title">Event Title</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus imperdiet, nulla id faucibus.</p>
                        <a href="#" class="btn btn-register">Register</a>
                    </div>
                </div>
            </div>

        </div>
        <div class="content col-4" >
             
             <div class="col-12">
                <div class="event-card">
                    <img src="https://via.placeholder.com/350x200" alt="Event Image">
                    <div class="p-3">
                        <h5 class="card-title">Event Title</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus imperdiet, nulla id faucibus.</p>
                        <a href="#" class="btn btn-register">Register</a>
                    </div>
                </div>
            </div>

        </div>
         ==============End================                 
	        <div class="content col-4" >
	             
	             <div class="col-12">
	                <div class="event-card">
	                    <img src="https://via.placeholder.com/350x200" alt="Event Image">
	                    <div class="p-3">
	                        <h5 class="card-title">Event Title</h5>
	                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus imperdiet, nulla id faucibus.</p>
	                        <a href="#" class="btn btn-register">Register</a>
	                    </div>
	                </div>
	            </div>
	
	        </div> -->
	        <!--  ==============End================                  -->
        </div>
    </div>

    <!-- FontAwesome CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/js/all.min.js" integrity="sha256-ZH4HGJ1+4u5GAtvOeuPqht8nZfA1FDjGCcs3+4gWjto=" crossorigin="anonymous"></script>

    <script>
        const sidebar = document.getElementById('sidebar');
        const menuBtn = document.getElementById('menu-btn');

        menuBtn.addEventListener('click', () => {
            sidebar.classList.toggle('hidden');
        });
    </script>
</body>
</html>
