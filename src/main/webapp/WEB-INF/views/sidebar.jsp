<div class="sidebar">
    <!-- Dashboard Dropdown -->
    <div class="dropdown">
        <button class="dropdown-btn" type="button" id="dashboardDropdown">
            Dashboard
        </button>
        <ul class="dropdown-menu" aria-labelledby="dashboardDropdown">
            <li><a class="dropdown-item" href="dashboard">Overview</a></li>
            <li><a class="dropdown-item" href="dashboard/reports">Reports</a></li>
            
        </ul>
    </div>

    <!-- Manage Departments Dropdown -->
    <div class="dropdown">
        <button class="dropdown-btn" type="button" id="departmentDropdown">
            Manage Departments
        </button>
        <ul class="dropdown-menu" aria-labelledby="departmentDropdown">
            <li><a class="dropdown-item" href="department">All Departments</a></li>
           
        </ul>
    </div>

    <!-- Manage Users Dropdown -->
    <div class="dropdown">
        <button class="dropdown-btn" type="button" id="userDropdown">
            Manage Users
        </button>
        <ul class="dropdown-menu" aria-labelledby="userDropdown">
            <li><a class="dropdown-item" href="user">View User</a></li>
            <li><a class="dropdown-item" href="student">Add Students</a></li>
            <li><a class="dropdown-item" href="admin">Add Admin/SubAdmin</a></li>
        </ul>
    </div>

    <!-- Manage PassYear Dropdown -->
    <div class="dropdown">
        <button class="dropdown-btn" type="button" id="passyearDropdown">
            Manage PassYear
        </button>
        <ul class="dropdown-menu" aria-labelledby="passyearDropdown">
            <li><a class="dropdown-item" href="passyear">All PassYears</a></li>
        </ul>
    </div>
    <!-- Manage Place Dropdown -->
    <div class="dropdown">
        <button class="dropdown-btn" type="button" id="placedropdown">
            Manage Event Place
        </button>
        <ul class="dropdown-menu" aria-labelledby="placedropdown">
            <li><a class="dropdown-item" href="place">Add Place</a></li>
        </ul>
    </div>

    <!-- Organize Events Dropdown -->
    <div class="dropdown">
        <button class="dropdown-btn" type="button" id="eventDropdown">
            Manage Events
        </button>
        <ul class="dropdown-menu" aria-labelledby="eventDropdown">
            <li><a class="dropdown-item" href="event">View Event</a></li>
            <li><a class="dropdown-item" href="addevent">Add Event</a></li>
           
        </ul>
    </div>

    <!-- Attendance Dropdown -->
    <div class="dropdown">
        <button class="dropdown-btn" type="button" id="attendanceDropdown">
            Attendance
        </button>
        <ul class="dropdown-menu" aria-labelledby="attendanceDropdown">
            <li><a class="dropdown-item" href="viewattendance">Attendance Records</a></li>
            <li><a class="dropdown-item" href="attendance">Mark Attendance</a></li>
            
        </ul>
    </div>
                           <!--  Review of Events -->
    <div class="dropdown">
        <button class="dropdown-btn" type="button" id="attendanceDropdown">
            Reviews
        </button>
        <ul class="dropdown-menu" aria-labelledby="attendanceDropdown">
            <li><a class="dropdown-item" href="viewReviews">View Reviews</a></li>
        </ul>
    </div>
    <div class="dropdown">
      <a class="dropdown-btn btn" href="logout" type="button" id="eventDropdown">
           Logout
        </a>

</div>
</div>
<script>
document.addEventListener('DOMContentLoaded', function() {
    const dropdownButtons = document.querySelectorAll('.dropdown-btn');
           
    dropdownButtons.forEach(button => {
        button.addEventListener('click', function() {
            // Close all other dropdowns
            const allMenus = document.querySelectorAll('.dropdown-menu');
            allMenus.forEach(menu => {
                if (menu !== this.nextElementSibling) {
                    menu.style.display = 'none';
                }
            });

            // Toggle the clicked dropdown
            const currentMenu = this.nextElementSibling;
            currentMenu.style.display = currentMenu.style.display === 'block' ? 'none' : 'block';
        });
    });

    // Close dropdowns if clicking outside
    document.addEventListener('click', function(event) {
        if (!event.target.matches('.dropdown-btn')) {
            const allMenus = document.querySelectorAll('.dropdown-menu');
            allMenus.forEach(menu => {
                menu.style.display = 'none';
            });
        }
    });
});
</script>
