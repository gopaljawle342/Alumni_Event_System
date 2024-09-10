function showSection(sectionId) {
        document.querySelectorAll(".form-section").forEach(function (section) {
          section.classList.remove("active");
        });
        document.getElementById(sectionId).classList.add("active");
      } 

       function toggleForm(formId) {
    	 
        const form = document.getElementById(formId);
        if (form.classList.contains("add-form")) {
             form.classList.remove("add-form");
           }else {
            form.classList.add("add-form");
          }
          }
      

      function toggleAttendance(button) {
        if (button.classList.contains("absent")) {
          button.classList.remove("absent");
          button.classList.add("present");
          button.textContent = "Present";
        } else {
          button.classList.remove("present");
          button.classList.add("absent");
          button.textContent = "Absent";
        }
      }
      
	  
	  
      
	  