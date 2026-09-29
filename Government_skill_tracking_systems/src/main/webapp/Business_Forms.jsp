<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Business Information Form</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
    background:#f4f7fc;
    font-family:Arial, sans-serif;
}

.navbar{
    background:#0b2e59;
}

.navbar-brand{
    color:white;
    font-weight:bold;
    font-size:24px;
}

.card{
    border:none;
    border-radius:12px;
    box-shadow:0 3px 12px rgba(0,0,0,.15);
}

.card-header{
    background:#0b2e59;
    color:white;
    font-size:22px;
    font-weight:bold;
}

.section-title{
    color:#0b2e59;
    font-weight:bold;
    border-left:5px solid #0b2e59;
    padding-left:10px;
    margin-top:25px;
    margin-bottom:20px;
}

.form-label{
    font-weight:600;
}

.btn-next{
    background:#0b2e59;
    color:white;
    border:none;
    padding:10px 30px;
}

.btn-next:hover{
    background:#154c8c;
}
/* Textbox and Dropdown */
.form-control,
.form-select{
    border:2px solid #6c757d;   /* Dark Gray Border */
    border-radius:8px;
    box-shadow:none;
    transition:0.3s;
}

/* Focus Effect */
.form-control:focus,
.form-select:focus{
    border-color:#0b2e59;      /* Navy Blue */
    box-shadow:0 0 6px rgba(11,46,89,0.25);
}

/* ===== Textbox & Dropdown ===== */
.form-control,
.form-select{
    border:2px solid #5a6268;
    border-radius:8px;
}

.form-control:focus,
.form-select:focus{
    border-color:#0b2e59;
    box-shadow:0 0 5px rgba(11,46,89,0.25);
}

/* ===== Radio Button ===== */
.form-check-input[type="radio"]{
    width:18px;
    height:18px;
    border:2px solid #5a6268;
    cursor:pointer;
}

.form-check-input[type="radio"]:checked{
    background-color:#0b2e59;
    border-color:#0b2e59;
}

/* ===== Checkbox ===== */
.form-check-input[type="checkbox"]{
    width:18px;
    height:18px;
    border:2px solid #5a6268;
    cursor:pointer;
}

.form-check-input[type="checkbox"]:checked{
    background-color:#0b2e59;
    border-color:#0b2e59;
}

/* ===== Labels ===== */
.form-check-label{
    margin-left:8px;
    font-weight:500;
    color:#333;
}
</style>

</head>

<body>

<!-- Navbar -->

<nav class="navbar navbar-expand-lg">

<div class="container">

<a class="navbar-brand" href="#">
Smart Government Scheme Eligibility Checker
</a>

</div>

</nav>

<div class="container mt-5">

<div class="card">

<div class="card-header">

Business Information Form

</div>

<div class="card-body">

<form action="Business_Profile_servlet" method="post">

<!-- Personal Information -->

<h4 class="section-title">
1. Personal Information
</h4>

<div class="row">

<div class="col-md-6 mb-3">

<label class="form-label">
Full Name
</label>

<input type="text"
name="fullName"
class="form-control"
required>

</div>

<div class="col-md-3 mb-3">

<label class="form-label">
Date of Birth
</label>

<input type="date"
name="dob"
class="form-control"
required>

</div>

<div class="col-md-3 mb-3">

<label class="form-label">
Age
</label>

<input type="number"
name="age"
class="form-control"
required>

</div>

</div>

<div class="row">

<div class="col-md-4 mb-3">

<label class="form-label">
Gender
</label>

<select class="form-select"
name="gender">

<option>Select</option>

<option>Male</option>

<option>Female</option>

<option>Other</option>

</select>

</div>

<div class="col-md-4 mb-3">

<label class="form-label">
Mobile Number
</label>

<input type="text"
name="mobile"
class="form-control"
required>

</div>

<div class="col-md-4 mb-3">

<label class="form-label">
Email
</label>

<input type="email"
name="email"
class="form-control"
required>

</div>

</div>

<div class="row">

<div class="col-md-4 mb-3">

<label class="form-label">
State
</label>

<input type="text"
name="state"
class="form-control">

</div>

<div class="col-md-4 mb-3">

<label class="form-label">
District
</label>

<input type="text"
name="district"
class="form-control">

</div>

<div class="col-md-4 mb-3">

<label class="form-label">
Address
</label>

<textarea
name="address"
class="form-control"
rows="2"></textarea>

</div>

</div>
<!-- ============================= -->
<!-- 2. Business Information -->
<!-- ============================= -->

<h4 class="section-title">
    2. Business Information
</h4>

<div class="row">

    <div class="col-md-6 mb-3">
        <label class="form-label">Business Name</label>
        <input type="text" class="form-control" name="businessName" required>
    </div>

    <div class="col-md-6 mb-3">
        <label class="form-label">Business Type</label>
        <select class="form-select" name="businessType" required>
            <option value="">Select Business Type</option>
            <option>Manufacturing</option>
            <option>Retail</option>
            <option>Service</option>
            <option>Wholesale</option>
            <option>Startup</option>
            <option>Agriculture Based</option>
            <option>Other</option>
        </select>
    </div>

</div>

<div class="row">

    <div class="col-md-4 mb-3">
        <label class="form-label">Business Status</label>
        <select class="form-select" name="businessStatus">
            <option value="">Select</option>
            <option>New Business</option>
            <option>Existing Business</option>
        </select>
    </div>

    <div class="col-md-4 mb-3">
        <label class="form-label">Years of Business</label>
        <input type="number" class="form-control"
               name="yearsOfBusiness"
               placeholder="If Existing">
    </div>

    <div class="col-md-4 mb-3">
        <label class="form-label">Number of Employees</label>
        <input type="number" class="form-control"
               name="employees">
    </div>

</div>

<div class="row">

    <div class="col-md-6 mb-3">
        <label class="form-label">Annual Business Turnover</label>
        <select class="form-select" name="turnover">
            <option value="">Select Turnover</option>
            <option>Below ₹5 Lakh</option>
            <option>₹5 - ₹10 Lakh</option>
            <option>₹10 - ₹25 Lakh</option>
            <option>₹25 - ₹50 Lakh</option>
            <option>Above ₹50 Lakh</option>
        </select>
    </div>

    <div class="col-md-6 mb-3">
        <label class="form-label">Business Registration</label><br>

        <input type="radio" name="businessRegistration"
               value="Yes"> Yes

        &nbsp;&nbsp;

        <input type="radio" name="businessRegistration"
               value="No"> No
    </div>

</div>

<hr>

<!-- ============================= -->
<!-- 3. Financial Information -->
<!-- ============================= -->

<h4 class="section-title">
    3. Financial Information
</h4>

<div class="row">

    <div class="col-md-4 mb-3">
        <label class="form-label">Annual Family Income</label>

        <select class="form-select"
                name="familyIncome">

            <option value="">Select Income</option>

            <option>Below ₹1 Lakh</option>

            <option>₹1 - ₹3 Lakh</option>

            <option>₹3 - ₹5 Lakh</option>

            <option>₹5 - ₹8 Lakh</option>

            <option>Above ₹8 Lakh</option>

        </select>
    </div>

    <div class="col-md-4 mb-3">

        <label class="form-label">
            Bank Account Available
        </label>

        <br>

        <input type="radio"
               name="bankAccount"
               value="Yes"> Yes

        &nbsp;&nbsp;

        <input type="radio"
               name="bankAccount"
               value="No"> No

    </div>

    <div class="col-md-4 mb-3">

        <label class="form-label">
            UDYAM Registration
        </label>

        <br>

        <input type="radio"
               name="udyam"
               value="Yes"> Yes

        &nbsp;&nbsp;

        <input type="radio"
               name="udyam"
               value="No"> No

    </div>

</div>

<div class="row">

    <div class="col-md-6 mb-3">

        <label class="form-label">
            GST Registration
        </label>

        <br>

        <input type="radio"
               name="gst"
               value="Yes"> Yes

        &nbsp;&nbsp;

        <input type="radio"
               name="gst"
               value="No"> No

    </div>

</div>
<!-- ============================= -->
<!-- 4. Category Information -->
<!-- ============================= -->

<h4 class="section-title">
    4. Category Information
</h4>

<div class="row">

    <div class="col-md-4 mb-3">
        <label class="form-label">Category</label>
        <select class="form-select" name="category" required>
            <option value="">Select Category</option>
            <option>General</option>
            <option>SC</option>
            <option>ST</option>
            <option>OBC</option>
            <option>EWS</option>
            <option>NT</option>
            <option>SBC</option>
        </select>
    </div>

    <div class="col-md-4 mb-3">
        <label class="form-label">Women Entrepreneur</label>
        <select class="form-select" name="womenEntrepreneur">
            <option value="">Select</option>
            <option>Yes</option>
            <option>No</option>
        </select>
    </div>

    <div class="col-md-4 mb-3">
        <label class="form-label">Differently Abled</label>
        <select class="form-select" name="differentlyAbled">
            <option value="">Select</option>
            <option>Yes</option>
            <option>No</option>
        </select>
    </div>

</div>

<hr>

<!-- ============================= -->
<!-- 5. Scheme Preference -->
<!-- ============================= -->

<h4 class="section-title">
    5. Scheme Preference
</h4>

<div class="row">

    <div class="col-md-12">

        <label class="form-label">
            Select Scheme Type
        </label>

        <div class="form-check">
            <input class="form-check-input" type="checkbox"
                   name="schemePreference"
                   value="Business Loan">
            <label class="form-check-label">
                Business Loan
            </label>
        </div>

        <div class="form-check">
            <input class="form-check-input" type="checkbox"
                   name="schemePreference"
                   value="Startup Support">
            <label class="form-check-label">
                Startup Support
            </label>
        </div>

        <div class="form-check">
            <input class="form-check-input" type="checkbox"
                   name="schemePreference"
                   value="Subsidy">
            <label class="form-check-label">
                Subsidy
            </label>
        </div>

        <div class="form-check">
            <input class="form-check-input" type="checkbox"
                   name="schemePreference"
                   value="Skill Development">
            <label class="form-check-label">
                Skill Development
            </label>
        </div>

        <div class="form-check">
            <input class="form-check-input" type="checkbox"
                   name="schemePreference"
                   value="Equipment Assistance">
            <label class="form-check-label">
                Equipment / Machinery Assistance
            </label>
        </div>

    </div>

</div>

<hr>

<!-- ============================= -->
<!-- Declaration -->
<!-- ============================= -->

<div class="form-check mb-4">

    <input class="form-check-input"
           type="checkbox"
           required>

    <label class="form-check-label">

        I declare that the information provided is true and correct.

    </label>

</div>

<!-- Buttons -->

<div class="text-center mb-4">

    <button type="submit"
            class="btn btn-primary px-5">
        Save Profile
    </button>

    <button type="reset"
            class="btn btn-secondary px-5 ms-3">
        Reset
    </button>

</div>

</form>

</div>

</div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>