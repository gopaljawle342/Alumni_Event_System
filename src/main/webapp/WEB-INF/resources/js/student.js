
    $(document).ready(function() {
        $('#studentTable').DataTable({
            "paging": true,
            "searching": true,
            "ordering": true,
            "info": true,
            "lengthMenu":[5,10,20,50],
            "columnDefs": [
                { "orderable": true, "targets": [0, 1] }, // Enable sorting only on ID (0) and Name (1)
                { "orderable": false, "targets": [2] }   // Disable sorting on the Actions column (2)
            ],
            "order": [[0, 'asc']] // Default sort by ID column
        });
    });
    
    let deleteStudent=(id)=>{
    	
    	let table=document.getElementById("studentbody");
    	if (confirm("Do You really Want delete......!") == true) 
    	fetch(`student/${id}`, {
            method: 'DELETE'
        })
        .then(response => response.json())
        .then(data => {
    		table.innerHTML="";
    		console.log(data)
            document.getElementById("msg").innerHTML="data deleted Success";
            data.forEach((s,index)=>{
    			table.innerHTML+=`<tr>
                  <td>${index+1}</td>
                  <td>${s.firstname}+" "+${s.lastname} </td>
                  <td>${s.email}</td>
                  <td>${s.contact}</td>
                  <td>${s.type}</td>
                  <td>
                    <button class="btn btn-warning btn-sm" id="${s.id}">Update</button>
                    <button class="btn btn-danger btn-sm" id="${s.id}" onClick="deleteStudent(this.id)">Delete</button>
                  </td></tr>`;
    		});
            // Reload or update the table to reflect the deletion
        })
        .catch(error => console.error('Error:', error));
        
        
    	
    }