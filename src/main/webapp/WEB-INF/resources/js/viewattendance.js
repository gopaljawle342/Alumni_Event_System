/**
 * 
 */

$(document).ready(function() {
    // Initialize DataTable
    $('#studentTable').DataTable({
        "paging": true,
        "searching": true,
        "ordering": true,
        "info": true,
        "lengthMenu":[5,10,20,50],
        "columnDefs": [
            { "orderable": true, "targets": [0, 1] }, // Enable sorting on ID and PassYear
            { "orderable": false, "targets": [2] }    // Disable sorting on Actions
        ],
        "order": [[0, 'asc']] // Default sort by ID column
    });
    
    // Custom search functionality
    $('#search').on('keyup', function() {
        $('#passtable').DataTable().search(this.value).draw();
    });
});

let getStudent=() => {
		let eid = document.getElementById("eventSelect").value;
		let table = document.getElementById("studentBodyTable");
		let status=document.getElementById("status").value;
		fetch(`attendance/${eid}`, {
			method: 'GET'
		})
			.then(response => response.json())
			.then(data => {
				table.innerHTML = "";
				data.forEach((s, index) => {
                       
                      if(s.attendStatus==status){
					let attendanceClass = s.attendStatus === 0 ? 'absent' : 'present';
					let attendanceText = s.attendStatus === 0 ? 'Absent' : 'Present';

					table.innerHTML += `<tr>
	    						<td>${index + 1}</td>
	    						<td>${s.firstname}&nbsp${s.lastname}</td>
	    						<td>${s.email}</td>
	    					     
	    						<td><a href="#" id="${s.id}" class="attendance-btn ${attendanceClass}"
	    							onclick="markAttendance(this.id)">${attendanceText}</a></td>
	    					</tr>`;
                      }
				})
				
				// Reload or update the table to reflect the deletion
			})
			.catch(error => console.error('Error:', error));
	};