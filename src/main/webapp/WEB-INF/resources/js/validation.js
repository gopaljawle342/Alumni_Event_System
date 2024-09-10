
/*
function contactcheck(inputtxt){
	
  var phoneno=/^\d{10}$/;
  
  if(inputtxt.value.match(phoneno)){
	  document.getElementById("nocheck").innerHTML="";
  }
  else{
	  document.getElementById("nocheck").innerHTML="Invalid Contact Number";
	  alert("invalid")
  }
	
	
}

function phonenumber(inputtxt)
{
  var phoneno = /^[0-9]{10}$/;
  if(inputtxt.value.match(phoneno))
    {
      document.getElementById("nocheck").innerHTML="";
     }
  else
    {
        alert("message");
        document.getElementById("nocheck").innerHTML="Invalid contact number";
    }
}*/


 document.addEventListener("DOMContentLoaded", function () {
  const contactInput = document.getElementById("contact");
  const validationMessage = document.getElementById("validationMessage");

  contactInput.addEventListener("input", function () {
    const regex = /^[0-9]{10}$/;

    // Check for non-digit input
    if (/[^0-9]/.test(contactInput.value)) {
      validationMessage.textContent = "Invalid contact number.";
      validationMessage.style.color = "red";
    } 
    // If 10 digits are entered, validate against the regex
    else if (regex.test(contactInput.value)) {
      validationMessage.textContent = "Valid contact number.";
      validationMessage.style.color = "green";
    } 
    // If input is less than 10 digits, clear the message or show a placeholder message
    else {
      validationMessage.textContent = "Incomplete contact number.";
      validationMessage.style.color = "orange";
    }
  });
});
