/**
 * 
 */
const viewLoginPage = () => {
  let login = document.getElementById("login");
  login.style.display = "flex";
  let register = document.getElementById("register");
  register.style.display = "none";
};
const viewRegisterPage = () => {
  let register = document.getElementById("register");
  register.style.display = "block";
  let login = document.getElementById("login");
  login.style.display = "none";
};
ss