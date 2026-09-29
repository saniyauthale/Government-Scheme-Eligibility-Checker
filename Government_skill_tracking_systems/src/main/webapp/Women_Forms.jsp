<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Women Information Form</title>

<style>
    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
    }

    body {
        background-color: #f4f7fb;
        color: #222;
    }

    /* Header */
    .header {
        background-color: #0b2a5b;
        color: white;
        padding: 22px 45px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .header h1 {
        font-size: 27px;
        margin-bottom: 5px;
    }

    .header p {
        font-size: 14px;
        color: #dce7f7;
    }

    .header-right {
        font-size: 14px;
        text-align: right;
    }

    /* Main container */
    .container {
        width: 94%;
        max-width: 1200px;
        margin: 25px auto;
    }

    .form-section {
        background: white;
        border: 1px solid #dce2eb;
        border-radius: 8px;
        margin-bottom: 20px;
        overflow: hidden;
    }

    .section-title {
        background-color: #123d78;
        color: white;
        padding: 12px 18px;
        font-size: 17px;
        font-weight: bold;
    }

    .section-content {
        padding: 20px;
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 18px 25px;
    }

    .form-group {
        display: flex;
        flex-direction: column;
    }

    .form-group label {
        font-size: 14px;
        font-weight: bold;
        margin-bottom: 7px;
        color: #253858;
    }

    .required {
        color: red;
    }

    input,
    select {
        width: 100%;
        height: 40px;
        padding: 8px 10px;
        border: 1px solid #cbd3df;
        border-radius: 5px;
        font-size: 14px;
        background-color: white;
        outline: none;
    }

    input:focus,
    select:focus {
        border-color: #123d78;
    }

    /* Radio buttons */
    .radio-group {
        display: flex;
        gap: 20px;
        align-items: center;
        height: 40px;
    }

    .radio-group label {
        font-weight: normal;
        margin: 0;
        display: flex;
        align-items: center;
        gap: 6px;
    }

    .radio-group input {
        width: auto;
        height: auto;
    }

    /* Checkbox */
    .checkbox-section {
        grid-column: 1 / -1;
    }

    .checkbox-group {
        display: flex;
        flex-wrap: wrap;
        gap: 12px 25px;
        margin-top: 8px;
    }

    .checkbox-group label {
        font-size: 14px;
        font-weight: normal;
        display: flex;
        align-items: center;
        gap: 6px;
    }

    .checkbox-group input {
        width: auto;
        height: auto;
    }

    /* Information message */
    .info-box {
        background-color: #eef4fc;
        border: 1px solid #cbdcf2;
        color: #173b6d;
        padding: 14px 18px;
        border-radius: 6px;
        margin-bottom: 20px;
        font-size: 14px;
    }

    /* Button */
    .button-area {
        text-align: center;
        margin: 25px 0 40px;
    }

    .submit-btn {
        background-color: #0b2a5b;
        color: white;
        border: none;
        padding: 13px 35px;
        border-radius: 5px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
    }

    .submit-btn:hover {
        background-color: #164681;
    }

    /* Responsive */
    @media(max-width: 900px) {
        .section-content {
            grid-template-columns: repeat(2, 1fr);
        }
    }

    @media(max-width: 600px) {
        .section-content {
            grid-template-columns: 1fr;
        }

        .header {
            padding: 18px;
        }
    }
</style>

</head>

<body>

<!-- HEADER -->
<div class="header">

    <div>
        <h1>Women Information Form</h1>
        <p>
            Provide your information to find suitable government schemes
        </p>
    </div>

    <div class="header-right">
        Smart Government<br>
        Scheme Eligibility Checker
    </div>

</div>


<div class="container">

<form action="Women_Profile_Servlet" method="post">

<!-- ================= PERSONAL INFORMATION ================= -->

<div class="form-section">

    <div class="section-title">
        1. Personal Information
    </div>

    <div class="section-content">

        <div class="form-group">
            <label>Full Name <span class="required">*</span></label>
            <input type="text" name="fullName"
                   placeholder="Enter your full name" required>
        </div>

        <div class="form-group">
            <label>Date of Birth <span class="required">*</span></label>
            <input type="date" name="dob" required>
        </div>

        <div class="form-group">
            <label>Age <span class="required">*</span></label>
            <input type="number" name="age"
                   placeholder="Enter your age"
                   min="1" max="100" required>
        </div>

        <div class="form-group">
            <label>Gender <span class="required">*</span></label>
            <select name="gender" required>
                <option value="">Select Gender</option>
                <option value="Female">Female</option>
            </select>
        </div>

        <div class="form-group">
            <label>Mobile Number <span class="required">*</span></label>
            <input type="tel" name="mobile"
                   placeholder="Enter mobile number"
                   maxlength="10" required>
        </div>

        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email"
                   placeholder="Enter email address">
        </div>

        <div class="form-group">
            <label>State <span class="required">*</span></label>
            
            <input name="state" placeholder="Enter your state" required>
       </div>

        <div class="form-group">
            <label>District <span class="required">*</span></label>
            <input type="text" name="district"
                   placeholder="Enter district" required>
        </div>

        <div class="form-group">
            <label>Pincode <span class="required">*</span></label>
            <input type="text" name="pincode"
                   placeholder="Enter pincode"
                   maxlength="6" required>
        </div>

    </div>
</div>


<!-- ================= FAMILY & SOCIO ECONOMIC ================= -->

<div class="form-section">

    <div class="section-title">
        2. Family & Socio-Economic Details
    </div>

    <div class="section-content">

        <div class="form-group">
            <label>Annual Family Income <span class="required">*</span></label>
            <select name="familyIncome" required>
                <option value="">Select Income Range</option>
                <option value="Below 1 Lakh">Below ₹1 Lakh</option>
				<option value="1-2 Lakh">₹1 Lakh - ₹2 Lakh</option>
				<option value="2-3 Lakh">₹2 Lakh - ₹3 Lakh</option>
				<option value="3-5 Lakh">₹3 Lakh - ₹5 Lakh</option>
				<option value="Above 5 Lakh">Above ₹5 Lakh</option>
            </select>
        </div>

        <div class="form-group">
            <label>Family Type <span class="required">*</span></label>
            <select name="familyType" required>
                <option value="">Select Family Type</option>
                <option value="Nuclear">Nuclear</option>
                <option value="Joint">Joint</option>
                <option value="Other">Other</option>
            </select>
        </div>

        <div class="form-group">
            <label>Category <span class="required">*</span></label>
            <select name="category" required>
                <option value="">Select Category</option>
                <option value="General">General</option>
                <option value="OBC">OBC</option>
                <option value="SC">SC</option>
                <option value="ST">ST</option>
                <option value="EWS">EWS</option>
                <option value="NT">NT</option>
                <option value="SBC">SBC</option>
            </select>
        </div>

        <div class="form-group">
            <label>Number of Family Members</label>
            <input type="number" name="familyMembers"
                   placeholder="Enter number">
        </div>

        <div class="form-group">
            <label>Differently Abled?</label>

            <div class="radio-group">
                <label>
                    <input type="radio" name="differentlyAbled" value="Yes">
                    Yes
                </label>

                <label>
                    <input type="radio" name="differentlyAbled" value="No" checked>
                    No
                </label>
            </div>
        </div>

        <div class="form-group">
            <label>Receiving Government Benefits?</label>

            <div class="radio-group">
                <label>
                    <input type="radio" name="governmentBenefits" value="Yes">
                    Yes
                </label>

                <label>
                    <input type="radio" name="governmentBenefits" value="No" checked>
                    No
                </label>
            </div>
        </div>

    </div>
</div>


<!-- ================= EDUCATION & SKILLS ================= -->

<div class="form-section">

    <div class="section-title">
        3. Education & Skills
    </div>

    <div class="section-content">

        <div class="form-group">
            <label>Highest Education Level <span class="required">*</span></label>

            <select name="educationLevel" required>
                <option value="">Select Education</option>
                <option value="Below 10th">Below 10th</option>
                <option value="10th">10th</option>
                <option value="12th">12th</option>
                <option value="Diploma">Diploma</option>
                <option value="Graduate">Graduate</option>
                <option value="Post Graduate">Post Graduate</option>
                <option value="Other">Other</option>
            </select>
        </div>

        <div class="form-group">
            <label>Professional Qualification</label>
            <input type="text" name="qualification"
                   placeholder="Example: B.Ed, MBA">
        </div>

        <div class="checkbox-section">

            <label><b>Skills (Select all that apply)</b></label>

            <div class="checkbox-group">

                <label>
                    <input type="checkbox" name="skills" value="Computer">
                    Computer Skills
                </label>

                <label>
                    <input type="checkbox" name="skills" value="Tailoring">
                    Tailoring
                </label>

                <label>
                    <input type="checkbox" name="skills" value="Beauty">
                    Beauty & Wellness
                </label>

                <label>
                    <input type="checkbox" name="skills" value="Food Processing">
                    Food Processing
                </label>

                <label>
                    <input type="checkbox" name="skills" value="Handicraft">
                    Handicraft
                </label>

                <label>
                    <input type="checkbox" name="skills" value="Other">
                    Other
                </label>

            </div>
        </div>

    </div>
</div>


<!-- ================= EMPLOYMENT & BUSINESS ================= -->

<div class="form-section">

    <div class="section-title">
        4. Employment & Business Details
    </div>

    <div class="section-content">

        <div class="form-group">
            <label>Current Occupation <span class="required">*</span></label>

            <select name="occupation" required>
                <option value="">Select Occupation</option>
                <option value="Student">Student</option>
                <option value="Employed">Employed</option>
                <option value="Self Employed">Self Employed</option>
                <option value="Unemployed">Unemployed</option>
                <option value="Homemaker">Homemaker</option>
                <option value="Other">Other</option>
            </select>
        </div>

        <div class="form-group">
            <label>Are you Self Employed?</label>

            <div class="radio-group">

                <label>
                    <input type="radio"
                           name="selfEmployed"
                           value="Yes">
                    Yes
                </label>

                <label>
                    <input type="radio"
                           name="selfEmployed"
                           value="No"
                           checked>
                    No
                </label>

            </div>
        </div>

        <div class="form-group">
            <label>Do you own a Business?</label>

            <div class="radio-group">

                <label>
                    <input type="radio"
                           name="ownBusiness"
                           value="Yes">
                    Yes
                </label>

                <label>
                    <input type="radio"
                           name="ownBusiness"
                           value="No"
                           checked>
                    No
                </label>

            </div>
        </div>

        <div class="form-group">
            <label>Business Type</label>

            <select name="businessType">
                <option value="">Select Business Type</option>
                <option value="Manufacturing">Manufacturing</option>
                <option value="Service">Service</option>
                <option value="Retail">Retail</option>
                <option value="Food Business">Food Business</option>
                <option value="Handicraft">Handicraft</option>
                <option value="Other">Other</option>
            </select>
        </div>

        <div class="form-group">
            <label>Business Registered?</label>

            <div class="radio-group">

                <label>
                    <input type="radio"
                           name="businessRegistered"
                           value="Yes">
                    Yes
                </label>

                <label>
                    <input type="radio"
                           name="businessRegistered"
                           value="No"
                           checked>
                    No
                </label>

            </div>
        </div>

        <div class="form-group">
            <label>Annual Business Turnover</label>

            <select name="turnover">
                <option value="">Select Range</option>
                <option value="Below 1 Lakh">Below ₹1 Lakh</option>
                <option value="1-5 Lakh">₹1 Lakh - ₹5 Lakh</option>
                <option value="5-10 Lakh">₹6 Lakh - ₹10 Lakh</option>
                <option value="Above 10 Lakh">Above ₹10 Lakh</option>
            </select>
        </div>

    </div>
</div>


<!-- ================= PREFERENCES ================= -->

<div class="form-section">

    <div class="section-title">
        5. Scheme Preferences
    </div>

    <div class="section-content">

        <div class="checkbox-section">

            <label>
                <b>What type of government schemes are you interested in?</b>
            </label>

            <div class="checkbox-group">

                <label>
                    <input type="checkbox"
                           name="preferences"
                           value="Financial Assistance">
                    Financial Assistance / Loan
                </label>

                <label>
                    <input type="checkbox"
                           name="preferences"
                           value="Subsidy">
                    Subsidy / Grant
                </label>

                <label>
                    <input type="checkbox"
                           name="preferences"
                           value="Skill Development">
                    Skill Development / Training
                </label>

                <label>
                    <input type="checkbox"
                           name="preferences"
                           value="Employment">
                    Employment Opportunities
                </label>

                <label>
                    <input type="checkbox"
                           name="preferences"
                           value="Business Support">
                    Business Support
                </label>

            </div>

        </div>

    </div>
</div>


<!-- INFORMATION MESSAGE -->

<div class="info-box">

    <b>Your information is safe with us.</b><br>

    We use your profile information only to identify suitable
    government schemes for you. We do not require you to upload
    documents for eligibility checking.

</div>


<!-- SUBMIT BUTTON -->

<div class="button-area">

    <button type="submit" class="submit-btn">
        Save Profile & Find Eligible Schemes
    </button>

</div>

</form>

</div>

</body>
</html>