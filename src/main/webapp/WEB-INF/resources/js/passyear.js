$(document).ready(function() {
    // Initialize DataTable
    $('#passtable').DataTable({
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

// Delete PassYear function
function deletePassYear(id) {
    let passtable = document.getElementById("passTable");
    
    if (confirm("Do you really want to delete this entry?")) {
        fetch(`passyear/${id}`, {
            method: 'DELETE'
        })
        .then(response => response.json())
        .then(data => {
            passtable.innerHTML = "";
            document.getElementById("msg").innerText = "Data deleted successfully!";
            data.forEach((y, index) => {
                passtable.innerHTML += `<tr>
                    <td>${index + 1}</td>
                    <td>${y.year}</td>
                    <td>
                        <a href="passyear/update/${y.id}" class="btn btn-warning btn-sm">Update</a>
                        <button class="btn btn-danger btn-sm" id="${y.id}" onClick="deletePassYear(this.id)">Delete</button>
                    </td>
                </tr>`;
            });
        })
        .catch(error => console.error('Error:', error));
    }
}

// Search PassYear by year
let search = document.getElementById("search");
search.addEventListener("keyup", (event) => {
    let table = document.getElementById("passtable");
    let year = event.target.value;
    if (year.trim() === "") {
        location.reload();
    }

    fetch(`passyear/year/${year}`, {
        method: 'GET'
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json();
    })
    .then(data => {
        table.innerHTML = "";
        data.forEach((y, index) => {
            table.innerHTML += `<tr>
                <td>${index + 1}</td>
                <td>${y.year}</td>
                <td>
                    <a href="passyear/update/${y.id}" class="btn btn-warning btn-sm">Update</a>
                    <button class="btn btn-danger btn-sm" id="${y.id}" onClick="deletePassYear(this.id)">Delete</button>
                </td>
            </tr>`;
        });
    })
    .catch(error => console.error('Error:', error));
});