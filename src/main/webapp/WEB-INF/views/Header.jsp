<%@page import="com.model.UserModel"%>
<nav class="navbar navbar-expand-lg navbar-light d-flex justify-content-between col-12 z-index-2">
  <a class="navbar-brand" href="dashboard">Admin Dashboard</a>
  <button
    class="navbar-toggler"
    type="button"
    data-bs-toggle="collapse"
    data-bs-target="#navbarNav"
    aria-controls="navbarNav"
    aria-expanded="false"
    aria-label="Toggle navigation"
  >
    <span class="navbar-toggler-icon "></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ms-auto">
      <li class="nav-item dropdown">
        <a
          class="nav-link dropdown-toggle profile-dropdown"
          href="#"
          id="profileDropdown"
          role="button"
          data-bs-toggle="dropdown"
          aria-expanded="false"
        >
        <%  
        UserModel user=null;
        try{
        if(session.getAttribute("user")!=null){
               user=(UserModel)session.getAttribute("user");
        }else{
        	request.getRequestDispatcher("/").forward(request, response);
        }
        }catch(Exception ex){
        	ex.printStackTrace();
        }
        %>
         
          <img src="https://via.placeholder.com/40" alt="Profile Picture" />
          <!-- Replace with actual profile picture -->
          <span><%=user.getFirstname() %></span>
        </a>
        <ul class="dropdown-menu" aria-labelledby="profileDropdown">
          <li><a class="dropdown-item" href="#">Name: <%=user.getFirstname() %>&nbsp<%=user.getLastname() %></a></li>
          <li><a class="dropdown-item" href="#">Email: <%=user.getEmail() %>/a></li>
          <li><a class="dropdown-item" href="#"><i class="fas fa-edit"></i> Edit Profile</a></li>
          <li><hr class="dropdown-divider"></li>
          <li><a class="dropdown-item" href="/logout">Logout</a></li>
        </ul>
        
      </li>
    </ul>
  </div>
</nav>
