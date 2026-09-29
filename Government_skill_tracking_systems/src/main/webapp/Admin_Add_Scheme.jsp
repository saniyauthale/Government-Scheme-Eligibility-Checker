
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add New Scheme</title>

<!-- Font Awesome -->
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f4f7fc;
}

/* Layout */
.container {
    display: flex;
}

/* Sidebar */
.sidebar {
    width: 250px;
    background: #0b2e6b;
    color: white;
    height: 100vh;
    padding: 20px;
}

.sidebar h2 {
    font-size: 18px;
    margin-bottom: 20px;
}

.sidebar a {
    display: block;
    color: white;
    padding: 10px;
    text-decoration: none;
    margin-bottom: 5px;
    border-radius: 5px;
}

.sidebar a:hover {
    background: #1565c0;
}

/* Main */
.main {
    flex: 1;
    padding: 20px;
}

/* Card */
.card {
    background: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
}

h2 {
    margin-bottom: 20px;
    color: #0b2e6b;
}

/* Form */
.form-group {
    margin-bottom: 15px;
}

label {
    font-weight: bold;
    display: block;
    margin-bottom: 5px;
}

input, select, textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}

textarea {
    resize: none;
    height: 80px;
}

/* Button */
.btn {
    background: #0b2e6b;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.btn:hover {
    background: #1565c0;
}

/* Steps */
.steps {
    display: flex;
    gap: 10px;
    margin-bottom: 25px;
}

.step {
    flex: 1;
    text-align: center;
    padding: 12px;
    background: #e3eaf5;
    border-radius: 5px;
    cursor: pointer;
    transition: 0.3s;
    font-weight: bold;
}

.step:hover {
    background: #cfdcf2;
}

.step.active {
    background: #1565c0;
    color: white;
}

/* Step Content */
.step-content {
    display: none;
}

.step-content.active {
    display: block;
}

/* Navigation Buttons */
.navigation {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
}

.hidden {
    display: none;
}
</style>
</head>

<body>

<div class="container">

    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Admin Panel</h2>
        <a href="Admin_Dashboard_servlet">Dashboard</a>
        <a href="Admin_Add_Scheme.jsp">Add Scheme</a>
        <a href="Admin_Manage_Scheme.jsp">Manage Schemes</a>
        <a href="UsersServlet">Users</a>
        <a href="Admin_Login.jsp">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="main">

        <div class="card">

            <h2><i class="fa fa-plus-circle"></i> Add New Scheme</h2>

            <!-- Steps -->
            <div class="steps">
                <div class="step active" onclick="showStep(1)">
                    1. Scheme Info
                </div>

                <div class="step" onclick="showStep(2)">
                    2. Documents
                </div>

                <div class="step" onclick="showStep(3)">
                    3. Review
                </div>
            </div>

            <!-- FORM -->
            <form action="Add_Scheme_servlet" method="post" enctype="multipart/form-data">

                <!-- STEP 1 -->
                <div class="step-content active" id="step1">

                    <div class="form-group">
                        <label>Scheme Name *</label>
                        <input type="text" name="schemeName" required>
                    </div>

                    <div class="form-group">
                        <label>Scheme Category *</label>
                        <select name="category" required>
                            <option value="">Select Category</option>
                            <option value="Education">Education</option>
                            <option value="Agriculture">Agriculture</option>
                            <option value="Women Welfare">Women Welfare</option>
                            <option value="Health">Health</option>
                            <option value="Employment">Employment</option>
                            <option value="Senior Citizen welfare">Senior Citizen welfare</option>
                        </select>
                    </div>
<div class="form-group">
    <label>Candidate Type *</label>
    <select name="candidateType" required>
        <option value="">Select Candidate Type</option>
        <option value="Students">Students</option>
        <option value="Students">Girl Students</option>
        <option value="Farmers">Farmers</option>
        <option value="Women">Women</option>
        <option value="Senior Citizens">Senior Citizens</option>
        <option value="Unemployed Youth">Unemployed Youth</option>
        <option value="Entrepreneurs">Entrepreneurs</option>
        <option value="SC/ST">SC/ST</option>
        <option value="Minority">Minority</option>
        <option value="Disabled Persons">Disabled Persons</option>
        <option value="All Citizens">All Citizens</option>
    </select>
</div>
                    <div class="form-group">
                        <label>Status *</label>
                        <select name="status" required>
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Description *</label>
                        <textarea name="description" required></textarea>
                    </div>

                    <div class="form-group">
                        <label>Eligibility Criteria *</label>
                        <textarea name="eligibility" required></textarea>
                    </div>
                    <!-- Eligibility Matching Fields -->

<div class="form-group">
    <label>Minimum Age</label>
    <input type="number"
           name="minAge"
           min="0"
           placeholder="Example: 60">
</div>

<div class="form-group">
    <label>Maximum Age</label>
    <input type="number"
           name="maxAge"
           min="0"
           placeholder="Example: 100">
</div>

<div class="form-group">
    <label>Maximum Family Income</label>
    <input type="number"
           name="maxIncome"
           step="0.01"
           min="0"
           placeholder="Example: 300000">
</div>

<div class="form-group">
    <label>Gender Required</label>
    <select name="genderRequired">
        <option value="">Any Gender</option>
        <option value="Male">Male</option>
        <option value="Female">Female</option>
        <option value="Other">Other</option>
    </select>
</div>

<div class="form-group">
    <label>Category Required</label>
    <select name="categoryRequired">
        <option value="">Any Category</option>
        <option value="General">General</option>
        <option value="SC">SC</option>
        <option value="ST">ST</option>
        <option value="OBC">OBC</option>
        <option value="Minority">Minority</option>
    </select>
</div>

<div class="form-group">
    <label>Disability Required</label>
    <select name="disabilityRequired">
        <option value="">Not Required</option>
        <option value="Yes">Yes</option>
        <option value="No">No</option>
    </select>
</div>

<div class="form-group">
    <label>Health Insurance Required</label>
    <select name="healthInsuranceRequired">
        <option value="">Not Required</option>
        <option value="Yes">Yes</option>
        <option value="No">No</option>
    </select>
</div>

<div class="form-group">
    <label>Bank Account Required</label>
    <select name="bankAccountRequired">
        <option value="">Not Required</option>
        <option value="Yes">Yes</option>
        <option value="No">No</option>
    </select>
</div>

                    <div class="form-group">
                        <label>Benefits *</label>
                        <textarea name="benefits" required></textarea>
                    </div>

                    <div class="form-group">
                        <label>Application Process *</label>
                        <textarea name="process" required></textarea>
                    </div>

                    <div class="form-group">
                        <label>Official Website Link</label>
                        <input type="text" name="website">
                    </div>

                    <div class="form-group">
                        <label>Last Date to Apply</label>
                        <input type="date" name="lastDate">
                    </div>

                </div>

                <!-- STEP 2 -->
                <div class="step-content" id="step2">

                    <div class="form-group">
                        <label>Required Documents</label>
                        <textarea name="documents"
                            placeholder="Example: Aadhaar Card, Income Certificate, Passport Size Photo"></textarea>
                    </div>

                    <div class="form-group">
                        <label>Upload Scheme PDF</label>
                        <input type="file" name="schemePdf">
                    </div>

                </div>

                <!-- STEP 3 -->
                <div class="step-content" id="step3">

                    <h3>Review Scheme Details</h3>

                    <p>
                        Review all entered details before submitting the scheme.
                    </p>

                    <ul>
                        <li>Check Scheme Information</li>
                        <li>Verify Documents</li>
                        <li>Confirm Last Date</li>
                    </ul>

                </div>

                <!-- Navigation Buttons -->
                <div class="navigation">

                    <button type="button" class="btn hidden" id="prevBtn"
                            onclick="nextPrev(-1)">
                        <i class="fa fa-arrow-left"></i> Previous
                    </button>

                    <button type="button" class="btn" id="nextBtn"
                            onclick="nextPrev(1)">
                        Next <i class="fa fa-arrow-right"></i>
                    </button>

                    <button type="submit" class="btn hidden" id="submitBtn">
                        <i class="fa fa-save"></i> Save Scheme
                    </button>

                </div>

            </form>

        </div>

    </div>
</div>

<script>

let currentStep = 1;

function showStep(step) {

    currentStep = step;

    // Hide all contents
    let contents = document.querySelectorAll(".step-content");
    contents.forEach(content => {
        content.classList.remove("active");
    });

    // Remove active from all steps
    let steps = document.querySelectorAll(".step");
    steps.forEach(s => {
        s.classList.remove("active");
    });

    // Show selected step
    document.getElementById("step" + step).classList.add("active");
    steps[step - 1].classList.add("active");

    // Button Handling
    document.getElementById("prevBtn").classList.toggle("hidden", step === 1);
    document.getElementById("nextBtn").classList.toggle("hidden", step === 3);
    document.getElementById("submitBtn").classList.toggle("hidden", step !== 3);
}

function nextPrev(n) {

    currentStep += n;

    if (currentStep > 3) currentStep = 3;
    if (currentStep < 1) currentStep = 1;

    showStep(currentStep);
}

</script>

</body>
</html>