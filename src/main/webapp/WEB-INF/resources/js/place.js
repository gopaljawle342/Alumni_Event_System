/**
 * 
 */

 
 
 $(document).ready(function() {
        $('#placeTable').DataTable({
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
 
 
 let deletePlace=(id)=>{
	let table=document.getElementById("placeTable");
	if (confirm("Do You really Want delete......!") == true) 
	fetch(`place/${id}`, {
        method: 'DELETE'
    })
    .then(response => response.json())
    .then(data => {
		table.innerHTML="";
		console.log(data)
        document.getElementById("msg").innerHTML="data deleted Success";
        data.forEach((dept,index)=>{
			table.innerHTML+=`<tr>
              <td>${index+1}</td>
              <td>${dept.name}</td>
              <td>
               <a href="place/update/${dept.id}" class="btn btn-warning btn-sm">Update</a>
                        <button class="btn btn-danger btn-sm" id="${dept.id}" onClick="deletePlace(this.id)">Delete</button></td></tr>`;
		})
        // Reload or update the table to reflect the deletion
    })
    .catch(error => console.error('Error:', error));
    }