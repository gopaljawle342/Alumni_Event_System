/**
 * 
 */

const fetchReviews=(eid)=>{
         console.log(eid);
		let table=document.getElementById("studentBodyTable");
		   
		fetch(`alumni/review/${eid}`,{
         method:"GET",
         
}).then(response=>response.json()).then(data=>{
	   table.innerHTML="";
      data.forEach((event,index)=>{
		       table.innerHTML+=`		<tr>
								<th>${index+1}</th>
								<th>${event.sname}</th>
								<th>${event.review}</th>
								<th>${event.datatime}</th>
							</tr>`;
	  })
 }).catch(e=>console.log(e));
		
}


$(document).ready(function() {
        $('#reviewTable').DataTable({
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