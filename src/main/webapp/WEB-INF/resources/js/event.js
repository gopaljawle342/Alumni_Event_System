/**
 * 
 */

 
 
	 $(document).ready(function() {
	        $('#eventTable').DataTable({
	            "paging": true,
	            "searching": true,
	            "ordering": true,
	            "info": true,
	            "lengthMenu":[5,10,20,50],
	            "columnDefs": [
	                { "orderable": true, "targets": [0, 1] }, // Enable sorting only on ID (0) and Name (1)
	                { "orderable": false, "targets": [5,6] }   // Disable sorting on the Actions column (2)
	            ],
	            "order": [[0, 'asc']] // Default sort by ID column
	        });
			
	    });
	    
	    
	    
	    
	    let deleteEvent=(id)=>{
	let table=document.getElementById("eventTableBody");
	if (confirm("Do You really Want delete......!") == true) 
	fetch(`event/${id}`, {
        method: 'DELETE'
    })
    .then(response => response.json())
    .then(data => {
		table.innerHTML="";
		console.log(data)
        document.getElementById("msg").innerHTML="data deleted Success";
        data.forEach((event,index)=>{
			table.innerHTML+=`<tr>
                           <td>${index+1}</td>
						<td>${event.Ename }</td>
						<td>${event.date }</td>
						<td>${event.pm.name }</td>
						<td>${event.dm.name }</td>
						<td>${event.description }</td>
						<td>
							<a href="event/update/${event.id}" class="btn btn-warning btn-sm">Update</a>
                            <button class="btn btn-danger btn-sm" id="${event.id}" onClick="deleteEvent(this.id)">Delete</button>
                        </td></tr>`;
		})
        // Reload or update the table to reflect the deletion
		location.reload();
    })
    .catch(error => console.error('Error:', error));
    
    
	
}