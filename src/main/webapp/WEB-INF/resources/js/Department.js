

$(document).ready(function() {
        $('#depttable').DataTable({
            "paging": true,
            "searching": true,
            "ordering": true,
            "info": true,
           /* "pageLength":5,*/
            "lengthMenu":[5,10,20,50],
            "columnDefs": [
                { "orderable": true, "targets": [0, 1] }, // Enable sorting only on ID (0) and Name (1)
                { "orderable": false, "targets": [2] }   // Disable sorting on the Actions column (2)
            ],
            "order": [[0, 'asc']] // Default sort by ID column
        });
    });

let deleteDepartment=(id)=>{
	let table=document.getElementById("deptTable");
	if (confirm("Do You really Want delete......!") == true) 
	fetch(`department/${id}`, {
        method: 'DELETE'
    })
    .then(response => response.json())
    .then(data => {
		table.innerHTML="";
		
        document.getElementById("msg").innerHTML="data deleted Success";
        data.forEach((dept,index)=>{
			table.innerHTML+=`<tr>
              <td>${index+1}</td>
              <td>${dept.name}</td>
              <td>
                <button class="btn btn-warning btn-sm" id="${dept.id}">Update</button>
                <button class="btn btn-danger btn-sm" id="${dept.id}" onClick="deleteDepartment(this.id)">Delete</button>
              </td></tr>`;
		})
		location.reload();
        
    })
    .catch(error => console.error('Error:', error));
    
    
	
}

/*let search=document.getElementById("search");
search.addEventListener("keyup",(event)=>{
	let table=document.getElementById("depttable");
	let name=event.target.value;
	if(name.trim()===""){
		location.reload();
		
	}
	
	fetch(`department/name/${name}`, {
        method: 'GET'
    })
    .then(response =>{
    if (!response.ok) {
            throw new Error('Network response was not ok');
        }
       
     return response.json();})
    .then(data => {
		table.innerHTML="";
		console.log(data);
		data.forEach((dept,index)=>{
			table.innerHTML+=` <tr>
              <td>${index+1}</td>
              <td>${dept.name}</td>
              <td>
                <button class="btn btn-warning btn-sm" id="${dept.id}">Update</button>
                <button class="btn btn-danger btn-sm" id="${dept.id}" onClick="deleteDepartment(this.id)">Delete</button>
              </td></tr>`;
		})
        
        
       
        // Reload or update the table to reflect the deletion
    })
    .catch(error => console.error('Error:', error));
	
});*/

 /*    Confirm Update Department  */
 
 
 
/* validation code */



    document.getElementById('departmentForm').addEventListener('submit', function(event) {
            let valid = true;
      const departmentNameRegex = /^[A-Za-z\s-]+$/;
        alert("hello")
            // Validate Department Name
            let departmentInput = document.getElementById("department").value;
			alert(departmentInput)
            const departmentError = document.getElementById('departmentError');
            if (!departmentNameRegex.test(departmentInput)) {
                departmentError.textContent = 'Invalid department name. Only letters, spaces, and hyphens are allowed.';
                valid = false;
            } else {
                departmentError.textContent = '';
            }

            if (!valid) {
                event.preventDefault(); // Prevent form submission if validation fails
            }
        });













