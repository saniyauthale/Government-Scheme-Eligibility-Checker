<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    background:#eef3f8;
}

/* Header */

.header{
    background:#1f3c88;
    color:white;
    padding:18px;
    text-align:center;
    font-size:26px;
    font-weight:bold;
    letter-spacing:.5px;
}

/* Container */

.container{

    width:70%;
    margin:30px auto;
    background:#fff;
    padding:30px;
    border-radius:12px;
    box-shadow:0 5px 18px rgba(0,0,0,.15);

}

/* Section */

.section-title{

    color:#1f3c88;
    font-size:18px;
    margin-top:20px;
    margin-bottom:15px;
    border-bottom:2px solid #ddd;
    padding-bottom:6px;

}

/* Row */

.row{

    display:flex;
    gap:20px;

}

.form-group{

    flex:1;
    margin-bottom:18px;

}

label{

    display:block;
    font-weight:600;
    margin-bottom:6px;

}

input,
select{

    width:100%;
    padding:11px;
    border:1px solid #ccc;
    border-radius:6px;
    font-size:15px;

}

input:focus,
select:focus{

    outline:none;
    border-color:#1f3c88;

}

/* Checkbox */

.checkbox{

    margin-top:15px;
    margin-bottom:20px;

}

.checkbox input{

    width:auto;

}

/* Buttons */

.btn-container{

    text-align:center;
    margin-top:20px;

}

button{

    padding:11px 30px;
    font-size:16px;
    border:none;
    border-radius:5px;
    cursor:pointer;

}

.register-btn{

    background:#1f3c88;
    color:white;

}

.register-btn:hover{

    background:#132a63;

}

.reset-btn{

    background:#bdbdbd;
    color:black;

}

.reset-btn:hover{

    background:#9a9a9a;

}

/* Footer */

.footer{

    margin-top:25px;
    text-align:center;
    font-size:15px;

}

.footer a{

    color:#1f3c88;
    text-decoration:none;
    font-weight:bold;

}

.footer a:hover{

    text-decoration:underline;

}

@media(max-width:768px){

.row{

display:block;

}

.container{

width:95%;

}

}

</style>

<script>

window.onload=function(){

const params=new URLSearchParams(window.location.search);

const status=params.get("status");

if(status=="success"){

window.history.replaceState({},document.title,"RegisterPage.jsp");

if(confirm("Registration Successful!\n\nGo to Login Page?")){

window.location="Login.jsp";

}

}

if(status=="failed"){

alert("Registration Failed.");

}

if(status=="password_error"){

alert("Password and Confirm Password do not match.");

}

if(status=="error"){

alert("Something went wrong.");

}

}

</script>

</head>

<body>

<div class="header">

Smart Government Scheme Eligibility Checker System

</div>

<div class="container">

<form action="<%=request.getContextPath()%>/RegisterServlet" method="post">

<div class="section-title">

1. Personal Information

</div>

<div class="form-group">

<label>Full Name</label>

<input
type="text"
name="name"
placeholder="Enter Full Name"
required>

</div>

<div class="row">

<div class="form-group">

<label>Age</label>

<input
type="number"
name="age"
min="18"
max="100"
placeholder="Enter Age"
required>

</div>

<div class="form-group">

<label>Gender</label>

<select name="gender" required>

<option value="">Select Gender</option>

<option>Male</option>

<option>Female</option>

<option>Other</option>

</select>

</div>

</div>


<div class="section-title">

2. Contact Details

</div>

<div class="row">

<div class="form-group">

<label>Mobile Number</label>

<input
type="text"
name="mobile"
maxlength="10"
pattern="[0-9]{10}"
placeholder="Enter 10 Digit Mobile Number"
required>

</div>

<div class="form-group">

<label>Email Address</label>

<input
type="email"
name="email"
placeholder="Enter Email Address"
required>

</div>

</div>


<div class="section-title">

3. Account Setup

</div>

<div class="row">

<div class="form-group">

<label>Password</label>

<input
type="password"
name="password"
placeholder="Enter Password"
required>

</div>

<div class="form-group">

<label>Confirm Password</label>

<input
type="password"
name="confirmPassword"
placeholder="Confirm Password"
required>

</div>

</div>

<div class="checkbox">

<input type="checkbox" required>

I agree to the Terms & Conditions

</div>

<div class="btn-container">

<button
type="submit"
class="register-btn">

Register Account

</button>

<button
type="reset"
class="reset-btn">

Clear Form

</button>

</div>

</form>

<div class="footer">

Already have an account?

<a href="Login_page.jsp">

Login Here

</a>

</div>

</div>

</body>
</html>