<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Girl Student Information Form</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

<style>

body{
    background:#eef4fb;
    font-family:'Segoe UI',sans-serif;
}

.main-container{
    width:95%;
    margin:30px auto;
}

.hero-card{
    background:linear-gradient(135deg,#0B3D91,#1E40AF,#2563EB);
    border-radius:18px;
    color:white;
    overflow:hidden;
    box-shadow:0 10px 30px rgba(0,0,0,.18);
}

.hero-icon{
    width:95px;
    height:95px;
    background:white;
    color:#0B3D91;
    border-radius:50%;
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:42px;
}

.hero-title{
    font-size:37px;
    font-weight:700;
}

.hero-subtitle{
    font-size:17px;
    opacity:.95;
}

.form-card{
    width:95%;
    margin:25px auto;
    border:none;
    border-radius:15px;
    box-shadow:0 6px 20px rgba(0,0,0,.08);
}

.section-header{
    padding:18px 20px;
    border-bottom:1px solid #E5E7EB;
    font-size:24px;
    font-weight:700;
    color:#0B3D91;
}

.section-number{
    background:#0B3D91;
    color:white;
    width:35px;
    height:35px;
    border-radius:8px;
    display:inline-flex;
    align-items:center;
    justify-content:center;
    margin-right:10px;
}

.card-body{
    padding:30px;
}

.form-label{
    font-weight:600;
    color:#1F2937;
}

.required{
    color:red;
}

.form-control,
.form-select{
    height:48px;
    border-radius:10px;
    border:1px solid #CBD5E1;
}

.form-control:focus,
.form-select:focus{
    border-color:#0B3D91;
    box-shadow:0 0 0 .15rem rgba(11,61,145,.2);
}

.btn-primary{
    background:#0B3D91;
    border-color:#0B3D91;
    border-radius:10px;
    font-weight:600;
}

.btn-primary:hover{
    background:#082f6b;
    border-color:#082f6b;
}

@media(max-width:768px){

.hero-title{
    font-size:28px;
}

}

</style>

</head>

<body>

<div class="main-container">

<form action="Student_Profile_servlet" method="post">

<!-- ================= HERO SECTION ================= -->

<div class="hero-card p-4">

    <div class="row align-items-center">

        <div class="col-lg-1 text-center">

            <div class="hero-icon">

                <i class="fas fa-user-graduate"></i>

            </div>

        </div>

        <div class="col-lg-11">

            <h2 class="hero-title">
                 Student Information Form
            </h2>

            <p class="hero-subtitle">
                Provide accurate information to check your eligibility
                for Government Schemes.
            </p>

        </div>

    </div>

</div>

<!-- ================= PERSONAL DETAILS ================= -->

<div class="card form-card">

<div class="section-header">

<span class="section-number">1</span>

<i class="fas fa-id-card"></i>

Personal Details

</div>

<div class="card-body">

<div class="row">

<div class="col-md-3 mb-4">

<label class="form-label">
Full Name <span class="required">*</span>
</label>

<input
type="text"
class="form-control"
name="fullName"
placeholder="Enter Full Name"
required>

</div>

<div class="col-md-3 mb-4">

<label class="form-label">
Date of Birth <span class="required">*</span>
</label>

<input
type="date"
id="dob"
name="dob"
class="form-control"
required>

</div>

<div class="col-md-3 mb-4">

<label class="form-label">
Age <span class="required">*</span>
</label>

<input type="text"
id="age"
name="age"
class="form-control"
readonly
required>

</div>

<div class="col-md-3 mb-4">

<label class="form-label">
Gender <span class="required">*</span>
</label>

<select
class="form-select"
name="gender"
required>

<option value="Female" selected>Female</option>
<option value="male" selected>male</option>

</select>

</div>

<div class="col-md-3 mb-4">

<label class="form-label">
Mobile Number <span class="required">*</span>
</label>

<input
type="tel"
class="form-control"
name="mobile"
maxlength="10"
pattern="[0-9]{10}"
placeholder="Enter Mobile Number"
required>

</div>

<div class="col-md-3 mb-4">

<label class="form-label">
Email ID
</label>

<input
type="email"
class="form-control"
name="email"
placeholder="Enter Email">

</div>

<div class="col-md-3 mb-4">

<label class="form-label">
State <span class="required">*</span>
</label>

<input type="text"
       class="form-control"
       name="state"
       placeholder="Enter State"
       required>

</div>

<div class="col-md-3 mb-4">

<label class="form-label">
District <span class="required">*</span>
</label>

<input type="text"
       class="form-control"
       name="district"
       placeholder="Enter District"
       required>

</div>

</div>

</div>

</div>

<!-- ======================================================
                2. EDUCATION DETAILS
====================================================== -->

<div class="card form-card">

    <div class="section-header">

        <span class="section-number">2</span>

        <i class="fas fa-graduation-cap"></i>

        Education Details

    </div>

    <div class="card-body">

        <div class="row">

            <!-- Education Level -->

            <div class="col-md-3 mb-4">

                <label class="form-label">

                    Current Education Level
                    <span class="required">*</span>

                </label>

                <select class="form-select"
                        name="educationLevel"
                        required>

                    <option value="">Select Education Level</option>

                    <option value="10th">10th</option>

                    <option value="12th">12th</option>

                    <option value="Diploma">Diploma</option>

                    <option value="ITI">ITI</option>

                    <option value="Undergraduate">Undergraduate</option>

                    <option value="Postgraduate">Postgraduate</option>

                    <option value="PhD">PhD</option>

                </select>

            </div>

            <!-- Course Name -->

            <div class="col-md-3 mb-4">

                <label class="form-label">

                    Course Name
                    <span class="required">*</span>

                </label>

                <input type="text"
                       class="form-control"
                       name="courseName"
                       placeholder="Enter Course Name"
                       required>

            </div>

            <!-- Year / Semester -->

            <div class="col-md-3 mb-4">

                <label class="form-label">

                    Year / Semester
                    <span class="required">*</span>

                </label>

                <select class="form-select"
                        name="yearSemester"
                        required>

                    <option value="">Select Year / Semester</option>

                    <option value="1st Year">1st Year</option>

                    <option value="2nd Year">2nd Year</option>

                    <option value="3rd Year">3rd Year</option>

                    <option value="4th Year">4th Year</option>

                    <option value="1st Semester">1st Semester</option>

                    <option value="2nd Semester">2nd Semester</option>

                    <option value="3rd Semester">3rd Semester</option>

                    <option value="4th Semester">4th Semester</option>

                    <option value="5th Semester">5th Semester</option>

                    <option value="6th Semester">6th Semester</option>

                    <option value="7th Semester">7th Semester</option>

                    <option value="8th Semester">8th Semester</option>

                </select>

            </div>

            <!-- College Name -->

            <div class="col-md-3 mb-4">

                <label class="form-label">

                    College / School Name
                    <span class="required">*</span>

                </label>

                <input type="text"
                       class="form-control"
                       name="collegeName"
                       placeholder="Enter College / School Name"
                       required>

            </div>

            <!-- Percentage -->

            <div class="col-md-3 mb-4">

                <label class="form-label">

                    Percentage / CGPA
                    <span class="required">*</span>

                </label>

                <input type="text"
                       class="form-control"
                       name="percentage"
                       placeholder="Example : 82.50 or 8.25"
                       required>

            </div>

            <!-- Board / University -->

            <div class="col-md-3 mb-4">

                <label class="form-label">

                    Board / University
                    <span class="required">*</span>

                </label>

                <input type="text"
                       class="form-control"
                       name="boardUniversity"
                       placeholder="Enter Board / University"
                       required>

            </div>

            <!-- Medium -->

            <div class="col-md-3 mb-4">

                <label class="form-label">

                    Medium of Study
                    <span class="required">*</span>

                </label>

                <select class="form-select"
                        name="medium"
                        required>

                    <option value="">Select Medium</option>

                    <option value="English">English</option>

                    <option value="Marathi">Marathi</option>

                    <option value="Hindi">Hindi</option>

                    <option value="Gujarati">Gujarati</option>

                    <option value="Kannada">Kannada</option>

                    <option value="Urdu">Urdu</option>

                </select>

            </div>

            <!-- Stream -->

            <div class="col-md-3 mb-4">

                <label class="form-label">

                    Stream / Branch

                </label>

                <input type="text"
                       class="form-control"
                       name="stream"
                       placeholder="Enter Stream / Branch">

            </div>

        </div>

    </div>

</div>

<!-- ================= END OF PART 2 ================= -->
<!-- ======================================================
            3. FAMILY & ECONOMIC DETAILS
====================================================== -->

<div class="card form-card">

    <div class="section-header">

        <span class="section-number">3</span>

        <i class="fas fa-users"></i>

        Family & Economic Details

    </div>

    <div class="card-body">

        <div class="row">

            <!-- Annual Income -->

            <div class="col-md-3 mb-4">

                <label class="form-label">
                    Family Annual Income
                    <span class="required">*</span>
                </label>

                <select class="form-select"
                        name="annualIncome"
                        required>

                    <option value="">Select Income Range</option>

                    <option value="Below ₹1 Lakh">Below ₹1 Lakh</option>

                    <option value="₹1 - ₹2 Lakhs">₹1 - ₹2 Lakhs</option>

                    <option value="₹2 - ₹4 Lakhs">₹2 - ₹4 Lakhs</option>

                    <option value="₹4 - ₹8 Lakhs">₹4 - ₹8 Lakhs</option>

                    <option value="Above ₹8 Lakhs">Above ₹8 Lakhs</option>

                </select>

            </div>

            <!-- Category -->

            <div class="col-md-3 mb-4">

                <label class="form-label">
                    Category
                    <span class="required">*</span>
                </label>

                <select class="form-select"
                        name="category"
                        required>

                    <option value="">Select Category</option>

                    <option value="General">General</option>

                    <option value="OBC">OBC</option>

                    <option value="SC">SC</option>

                    <option value="ST">ST</option>

                    <option value="EWS">EWS</option>

                    <option value="SBC">SBC</option>

                    <option value="NT">NT</option>

                </select>

            </div>

            <!-- Parent Farmer -->

            <div class="col-md-3 mb-4">

                <label class="form-label">
                    Is Parent a Farmer?
                </label>

                <div class="mt-2">

                    <div class="form-check form-check-inline">

                        <input class="form-check-input"
                               type="radio"
                               name="parentFarmer"
                               value="Yes">

                        <label class="form-check-label">
                            Yes
                        </label>

                    </div>

                    <div class="form-check form-check-inline">

                        <input class="form-check-input"
                               type="radio"
                               name="parentFarmer"
                               value="No"
                               checked>

                        <label class="form-check-label">
                            No
                        </label>

                    </div>

                </div>

            </div>

            <!-- Orphan -->

            <div class="col-md-3 mb-4">

                <label class="form-label">
                    Are you an Orphan?
                </label>

                <div class="mt-2">

                    <div class="form-check form-check-inline">

                        <input class="form-check-input"
                               type="radio"
                               name="orphan"
                               value="Yes">

                        <label class="form-check-label">
                            Yes
                        </label>

                    </div>

                    <div class="form-check form-check-inline">

                        <input class="form-check-input"
                               type="radio"
                               name="orphan"
                               value="No"
                               checked>

                        <label class="form-check-label">
                            No
                        </label>

                    </div>

                </div>

            </div>

            <!-- Differently Abled -->

            <div class="col-md-3 mb-4">

                <label class="form-label">
                    Are you Differently Abled?
                </label>

                <div class="mt-2">

                    <div class="form-check form-check-inline">

                        <input class="form-check-input"
                               type="radio"
                               name="disabled"
                               value="Yes">

                        <label class="form-check-label">
                            Yes
                        </label>

                    </div>

                    <div class="form-check form-check-inline">

                        <input class="form-check-input"
                               type="radio"
                               name="disabled"
                               value="No"
                               checked>

                        <label class="form-check-label">
                            No
                        </label>

                    </div>

                </div>

            </div>

            <!-- Family Members -->

            <div class="col-md-3 mb-4">

                <label class="form-label">
                    Number of Family Members
                    <span class="required">*</span>
                </label>

                <input type="number"
                       class="form-control"
                       name="familyMembers"
                       min="1"
                       placeholder="Enter Number"
                       required>

            </div>

            <!-- Government Employee -->

            <div class="col-md-3 mb-4">

                <label class="form-label">
                    Government Employee in Family?
                </label>

                <div class="mt-2">

                    <div class="form-check form-check-inline">

                        <input class="form-check-input"
                               type="radio"
                               name="govJob"
                               value="Yes">

                        <label class="form-check-label">
                            Yes
                        </label>

                    </div>

                    <div class="form-check form-check-inline">

                        <input class="form-check-input"
                               type="radio"
                               name="govJob"
                               value="No"
                               checked>

                        <label class="form-check-label">
                            No
                        </label>

                    </div>

                </div>

            </div>

            <!-- Family Type -->

            <div class="col-md-3 mb-4">

                <label class="form-label">
                    Family Type
                    <span class="required">*</span>
                </label>

                <select class="form-select"
                        name="familyType"
                        required>

                    <option value="">Select Family Type</option>

                    <option value="Nuclear Family">
                        Nuclear Family
                    </option>

                    <option value="Joint Family">
                        Joint Family
                    </option>

                </select>

            </div>

        </div>

    </div>

</div>

<!-- ================= END OF PART 3 ================= -->
<!-- ======================================================
                4. ADDITIONAL DETAILS
====================================================== -->

<div class="card form-card">

    <div class="section-header">

        <span class="section-number">4</span>

        <i class="fas fa-file-alt"></i>

        Additional Details

    </div>

    <div class="card-body">

        <div class="row">

            <!-- Hostel -->

            <div class="col-md-3 mb-4">

                <label class="form-label">
                    Hostel Resident?
                </label>

                <div class="mt-2">

                    <div class="form-check form-check-inline">

                        <input class="form-check-input"
                               type="radio"
                               name="hostel"
                               value="Yes">

                        <label class="form-check-label">
                            Yes
                        </label>

                    </div>

                    <div class="form-check form-check-inline">

                        <input class="form-check-input"
                               type="radio"
                               name="hostel"
                               value="No"
                               checked>

                        <label class="form-check-label">
                            No
                        </label>

                    </div>

                </div>

            </div>

            <!-- Scholarship -->

            <div class="col-md-3 mb-4">

                <label class="form-label">
                    Scholarship Received Earlier?
                </label>

                <div class="mt-2">

                    <div class="form-check form-check-inline">

                        <input class="form-check-input"
                               type="radio"
                               name="scholarship"
                               value="Yes">

                        <label class="form-check-label">
                            Yes
                        </label>

                    </div>

                    <div class="form-check form-check-inline">

                        <input class="form-check-input"
                               type="radio"
                               name="scholarship"
                               value="No"
                               checked>

                        <label class="form-check-label">
                            No
                        </label>

                    </div>

                </div>

            </div>

            <!-- Scheme Name -->

            <div class="col-md-3 mb-4">

                <label class="form-label">
                    If Yes, Scheme Name
                </label>

                <input type="text"
                       class="form-control"
                       name="schemeName"
                       placeholder="Enter Scheme Name">

            </div>

            <!-- Distance -->

            <div class="col-md-3 mb-4">

                <label class="form-label">
                    Distance from Home (KM)
                </label>

                <input type="number"
                       class="form-control"
                       name="distance"
                       min="0"
                       placeholder="Enter Distance">

            </div>

            <!-- Bank Account -->

            <div class="col-md-3 mb-4">

                <label class="form-label">
                    Bank Account?
                </label>

                <div class="mt-2">

                    <div class="form-check form-check-inline">

                        <input class="form-check-input"
                               type="radio"
                               name="bank"
                               value="Yes">

                        <label class="form-check-label">
                            Yes
                        </label>

                    </div>

                    <div class="form-check form-check-inline">

                        <input class="form-check-input"
                               type="radio"
                               name="bank"
                               value="No"
                               checked>

                        <label class="form-check-label">
                            No
                        </label>

                    </div>

                </div>

            </div>

            <!-- Internet -->

            <div class="col-md-3 mb-4">

                <label class="form-label">
                    Internet Access?
                </label>

                <div class="mt-2">

                    <div class="form-check form-check-inline">

                        <input class="form-check-input"
                               type="radio"
                               name="internet"
                               value="Yes">

                        <label class="form-check-label">
                            Yes
                        </label>

                    </div>

                    <div class="form-check form-check-inline">

                        <input class="form-check-input"
                               type="radio"
                               name="internet"
                               value="No"
                               checked>

                        <label class="form-check-label">
                            No
                        </label>

                    </div>

                </div>

            </div>

            <!-- Laptop -->

            <div class="col-md-3 mb-4">

                <label class="form-label">
                    Laptop / Computer?
                </label>

                <div class="mt-2">

                    <div class="form-check form-check-inline">

                        <input class="form-check-input"
                               type="radio"
                               name="laptop"
                               value="Yes">

                        <label class="form-check-label">
                            Yes
                        </label>

                    </div>

                    <div class="form-check form-check-inline">

                        <input class="form-check-input"
                               type="radio"
                               name="laptop"
                               value="No"
                               checked>

                        <label class="form-check-label">
                            No
                        </label>

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>

<!-- ======================================================
                5. SKILLS
====================================================== -->

<div class="card form-card">

    <div class="section-header">

        <span class="section-number">5</span>

        <i class="fas fa-lightbulb"></i>

        Skills (Optional)

    </div>

    <div class="card-body">

        <div class="row">

            <div class="col-md-2">

                <div class="form-check">

                    <input class="form-check-input"
                           type="checkbox"
                           name="skills"
                           value="Computer Skills">

                    <label class="form-check-label">
                        Computer Skills
                    </label>

                </div>

            </div>

            <div class="col-md-2">

                <div class="form-check">

                    <input class="form-check-input"
                           type="checkbox"
                           name="skills"
                           value="Programming">

                    <label class="form-check-label">
                        Programming
                    </label>

                </div>

            </div>

            <div class="col-md-2">

                <div class="form-check">

                    <input class="form-check-input"
                           type="checkbox"
                           name="skills"
                           value="Communication">

                    <label class="form-check-label">
                        Communication
                    </label>

                </div>

            </div>

            <div class="col-md-2">

                <div class="form-check">

                    <input class="form-check-input"
                           type="checkbox"
                           name="skills"
                           value="English Speaking">

                    <label class="form-check-label">
                        English Speaking
                    </label>

                </div>

            </div>

            <div class="col-md-4">

                <input type="text"
                       class="form-control"
                       name="otherSkills"
                       placeholder="Other Skills">

            </div>

        </div>

    </div>

</div>

<!-- ======================================================
            INFORMATION CARD
====================================================== -->

<div class="card border-0 shadow-sm mt-4">

    <div class="card-body bg-light rounded">

        <h5 class="text-primary">

            <i class="fas fa-shield-alt"></i>

            Your Information is Safe

        </h5>

        <p class="mb-0">

            Your information will only be used to check your
            eligibility for Government Schemes.

        </p>

    </div>

</div>

<!-- ======================================================
                BUTTONS
====================================================== -->

<div class="text-center mt-5 mb-5">

    <button type="submit"
            class="btn btn-primary btn-lg px-5 me-3">

        <i class="fas fa-save"></i>

        Save Profile & Check Eligibility

    </button>

    <button type="reset"
            class="btn btn-outline-secondary btn-lg px-5">

        <i class="fas fa-rotate-left"></i>

        Reset

    </button>

</div>

</form>

<script>

document.getElementById("dob").addEventListener("change", function () {

    let dob = new Date(this.value);

    let today = new Date();

    let age = today.getFullYear() - dob.getFullYear();

    let month = today.getMonth() - dob.getMonth();

    if (month < 0 || (month === 0 && today.getDate() < dob.getDate())) {

        age--;

    }

    document.getElementById("age").value = age;

});

</script>

</body>
</html>