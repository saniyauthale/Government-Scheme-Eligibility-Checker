<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Senior Citizen Information Form</title>

<style>
    * {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
}

body {
    background: #f4f7fb;
    color: #172b4d;
}

/* ================= HEADER ================= */

.header {
    background: #0b1f4b;
    color: white;
    padding: 28px 55px;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.header-left h1 {
    font-size: 30px;
    margin-bottom: 9px;
}

.header-left p {
    font-size: 15px;
    color: #d8e2f2;
}

.home-btn {
    text-decoration: none;
    color: #0b1f4b;
    background: white;
    padding: 12px 25px;
    border-radius: 6px;
    font-size: 15px;
    font-weight: bold;
}


/* ================= MAIN CONTAINER ================= */

.container {
    width: 95%;
    max-width: 1350px;
    margin: 30px auto;
}


/* ================= INFORMATION BOX ================= */

.info-box {
    background: #eaf1fb;
    border-left: 5px solid #0b1f4b;
    padding: 17px 20px;
    margin-bottom: 24px;
    font-size: 15px;
    line-height: 1.6;
}


/* ================= SECTION ================= */

.section {
    background: white;
    margin-bottom: 25px;
    border-radius: 8px;
    border: 1px solid #d5deea;
    overflow: hidden;
    box-shadow: 0 2px 7px rgba(0,0,0,0.04);
}

.section-title {
    background: #0b1f4b;
    color: white;
    padding: 15px 22px;
    font-size: 19px;
    font-weight: bold;
}

.section-body {
    padding: 25px;
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 23px 25px;
}

.form-group {
    display: flex;
    flex-direction: column;
}

.form-group.full {
    grid-column: span 2;
}


/* ================= LABEL ================= */

label {
    font-size: 15px;
    font-weight: bold;
    margin-bottom: 9px;
    color: #243b5a;
}

.required {
    color: red;
}


/* ================= INPUT & SELECT ================= */

input,
select {
    width: 100%;
    height: 46px;
    padding: 10px 13px;
    border: 1px solid #bcc8d8;
    border-radius: 6px;
    font-size: 15px;
    background: white;
    color: #172b4d;
    outline: none;
}

input::placeholder {
    color: #8995a5;
    font-size: 14px;
}

input:focus,
select:focus {
    border-color: #0b1f4b;
    box-shadow: 0 0 0 2px rgba(11,31,75,0.08);
}


/* ================= RADIO BUTTONS ================= */

.radio-group {
    display: flex;
    gap: 28px;
    align-items: center;
    height: 46px;
}

.radio-option {
    display: flex;
    flex-direction: row;
    align-items: center;
    gap: 8px;
    font-weight: normal;
    font-size: 15px;
    margin: 0;
}

.radio-option input {
    width: 17px;
    height: 17px;
    margin: 0;
}


/* ================= BOTTOM AREA ================= */

.bottom-area {
    text-align: center;
    margin: 30px 0 45px;
}

.declaration {
    margin-bottom: 22px;
    font-size: 14px;
    color: #4b5d73;
}

.declaration input {
    width: 17px;
    height: 17px;
    margin-right: 8px;
    vertical-align: middle;
}


/* ================= SUBMIT BUTTON ================= */

.submit-btn {
    background: #0b1f4b;
    color: white;
    border: none;
    padding: 15px 42px;
    border-radius: 6px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
}

.submit-btn:hover {
    background: #16366f;
}


/* ================= MESSAGES ================= */

.success-message {
    background: #e7f6ec;
    color: #176b35;
    border: 1px solid #b7dfc2;
    padding: 15px;
    margin-bottom: 22px;
    border-radius: 6px;
    font-size: 14px;
}

.error-message {
    background: #fdeaea;
    color: #a32020;
    border: 1px solid #efb5b5;
    padding: 15px;
    margin-bottom: 22px;
    border-radius: 6px;
    font-size: 14px;
}


/* ================= RESPONSIVE ================= */

@media (max-width: 1000px) {

    .section-body {
        grid-template-columns: repeat(2, 1fr);
    }

    .form-group.full {
        grid-column: span 2;
    }
}


@media (max-width: 650px) {

    .header {
        padding: 22px;
        flex-direction: column;
        gap: 15px;
        align-items: flex-start;
    }

    .header-left h1 {
        font-size: 25px;
    }

    .section-body {
        grid-template-columns: 1fr;
    }

    .form-group.full {
        grid-column: span 1;
    }

    .container {
        width: 94%;
    }
}
</style>

</head>

<body>

<!-- HEADER -->
<div class="header">

    <div class="header-left">
        <h1>Senior Citizen Information Form</h1>
        <p>
            Provide your information to find government schemes suitable for you.
        </p>
    </div>

    <a href="dashboard.jsp" class="home-btn">Dashboard</a>

</div>


<div class="container">

   


<form action="Senior_Citizen_Profile_servlet" method="post">


    <!-- 1. PERSONAL INFORMATION -->
    <div class="section">

        <div class="section-title">
            1. Personal Information
        </div>

        <div class="section-body">

            <div class="form-group">
                <label>Full Name <span class="required">*</span></label>
                <input type="text" name="fullName"
                       placeholder="Enter full name" required>
            </div>

            <div class="form-group">
                <label>Date of Birth <span class="required">*</span></label>
                <input type="date" name="dob" required>
            </div>

            <div class="form-group">
                <label>Age <span class="required">*</span></label>
                <input type="number" name="age"
                       placeholder="Enter age" min="60" required>
            </div>

            <div class="form-group">
                <label>Gender <span class="required">*</span></label>
                <select name="gender" required>
                    <option value="">Select Gender</option>
                    <option>Male</option>
                    <option>Female</option>
                    <option>Other</option>
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
                <select name="state" required>
                    <option value="">Select State</option>
                    <option>Maharashtra</option>
                    <option>Karnataka</option>
                    <option>Goa</option>
                    <option>Gujarat</option>
                    <option>Madhya Pradesh</option>
                    <option>Other</option>
                </select>
            </div>

            <div class="form-group">
                <label>District <span class="required">*</span></label>
                <input type="text" name="district"
                       placeholder="Enter district" required>
            </div>

            <div class="form-group full">
                <label>Address <span class="required">*</span></label>
                <input type="text" name="address"
                       placeholder="Enter complete address" required>
            </div>

            <div class="form-group">
                <label>Pincode <span class="required">*</span></label>
                <input type="text" name="pincode"
                       placeholder="Enter pincode"
                       maxlength="6" required>
            </div>

        </div>
    </div>


    <!-- 2. FAMILY & SOCIAL INFORMATION -->
    <div class="section">

        <div class="section-title">
            2. Family & Social Information
        </div>

        <div class="section-body">

            <div class="form-group">
                <label>Annual Family Income <span class="required">*</span></label>
                <select name="familyIncome" required>
                    <option value="">Select Income Range</option>
                    <option>Below ₹1 Lakh</option>
                    <option>₹1 Lakh - ₹2.5 Lakh</option>
                    <option>₹2.5 Lakh - ₹5 Lakh</option>
                    <option>₹5 Lakh - ₹10 Lakh</option>
                    <option>Above ₹10 Lakh</option>
                </select>
            </div>

            <div class="form-group">
                <label>Living Arrangement <span class="required">*</span></label>
                <select name="livingArrangement" required>
                    <option value="">Select Option</option>
                    <option>With Family</option>
                    <option>Alone</option>
                    <option>With Spouse</option>
                    <option>With Relatives</option>
                </select>
            </div>

            <div class="form-group">
                <label>Do you live alone?</label>

                <div class="radio-group">
                    <label class="radio-option">
                        <input type="radio" name="liveAlone" value="Yes">
                        Yes
                    </label>

                    <label class="radio-option">
                        <input type="radio" name="liveAlone" value="No">
                        No
                    </label>
                </div>
            </div>

            <div class="form-group">
                <label>Number of Family Members</label>
                <input type="number" name="familyMembers"
                       placeholder="Enter number" min="1">
            </div>

            <div class="form-group">
                <label>Do you have dependent family members?</label>

                <div class="radio-group">
                    <label class="radio-option">
                        <input type="radio" name="dependentMembers" value="Yes">
                        Yes
                    </label>

                    <label class="radio-option">
                        <input type="radio" name="dependentMembers" value="No">
                        No
                    </label>
                </div>
            </div>

            <div class="form-group">
                <label>Do you have a spouse?</label>

                <div class="radio-group">
                    <label class="radio-option">
                        <input type="radio" name="spouse" value="Yes">
                        Yes
                    </label>

                    <label class="radio-option">
                        <input type="radio" name="spouse" value="No">
                        No
                    </label>
                </div>
            </div>

            <div class="form-group">
                <label>Category <span class="required">*</span></label>

                <select name="category" required>
                    <option value="">Select Category</option>
                    <option>General</option>
                    <option>OBC</option>
                    <option>SC</option>
                    <option>ST</option>
                    <option>EWS</option>
                </select>
            </div>

            <div class="form-group">
                <label>Differently Abled?</label>

                <div class="radio-group">
                    <label class="radio-option">
                        <input type="radio" name="differentlyAbled" value="Yes">
                        Yes
                    </label>

                    <label class="radio-option">
                        <input type="radio" name="differentlyAbled" value="No">
                        No
                    </label>
                </div>
            </div>

        </div>
    </div>


    <!-- 3. HEALTH INFORMATION -->
    <div class="section">

        <div class="section-title">
            3. Health & Special Conditions
        </div>

        <div class="section-body">

            <div class="form-group">
                <label>Do you have any special health needs?</label>

                <div class="radio-group">
                    <label class="radio-option">
                        <input type="radio" name="healthNeed" value="Yes">
                        Yes
                    </label>

                    <label class="radio-option">
                        <input type="radio" name="healthNeed" value="No">
                        No
                    </label>
                </div>
            </div>

            <div class="form-group">
                <label>Do you have health insurance?</label>

                <div class="radio-group">
                    <label class="radio-option">
                        <input type="radio" name="healthInsurance" value="Yes">
                        Yes
                    </label>

                    <label class="radio-option">
                        <input type="radio" name="healthInsurance" value="No">
                        No
                    </label>
                </div>
            </div>

            <div class="form-group">
                <label>Are you a person with disability?</label>

                <div class="radio-group">
                    <label class="radio-option">
                        <input type="radio" name="disability" value="Yes">
                        Yes
                    </label>

                    <label class="radio-option">
                        <input type="radio" name="disability" value="No">
                        No
                    </label>
                </div>
            </div>

        </div>
    </div>


    <!-- 4. FINANCIAL INFORMATION -->
    <div class="section">

        <div class="section-title">
            4. Financial Information
        </div>

        <div class="section-body">

            <div class="form-group">
                <label>Do you have a Bank Account?</label>

                <div class="radio-group">
                    <label class="radio-option">
                        <input type="radio" name="bankAccount" value="Yes">
                        Yes
                    </label>

                    <label class="radio-option">
                        <input type="radio" name="bankAccount" value="No">
                        No
                    </label>
                </div>
            </div>

            <div class="form-group">
                <label>Pension Type</label>

                <select name="pensionType">
                    <option value="">Select Pension Type</option>
                    <option>Government Pension</option>
                    <option>Private Pension</option>
                    <option>Family Pension</option>
                    <option>No Pension</option>
                    <option>Other</option>
                </select>
            </div>

            <div class="form-group">
                <label>Monthly Pension Amount</label>
                <input type="number" name="pensionAmount"
                       placeholder="Enter amount">
            </div>

            <div class="form-group">
                <label>Other Monthly Income</label>
                <input type="number" name="otherIncome"
                       placeholder="Enter amount">
            </div>

        </div>
    </div>


    <!-- 5. ADDITIONAL INFORMATION -->
    <div class="section">

        <div class="section-title">
            5. Additional Information
        </div>

        <div class="section-body">

            <div class="form-group">
                <label>Previously received government benefits?</label>

                <div class="radio-group">
                    <label class="radio-option">
                        <input type="radio" name="previousBenefit" value="Yes">
                        Yes
                    </label>

                    <label class="radio-option">
                        <input type="radio" name="previousBenefit" value="No">
                        No
                    </label>
                </div>
            </div>

            <div class="form-group">
                <label>Do you have a Senior Citizen Card?</label>

                <div class="radio-group">
                    <label class="radio-option">
                        <input type="radio" name="seniorCitizenCard" value="Yes">
                        Yes
                    </label>

                    <label class="radio-option">
                        <input type="radio" name="seniorCitizenCard" value="No">
                        No
                    </label>
                </div>
            </div>

            <div class="form-group">
                <label>Previous Occupation</label>

                <select name="occupation">
                    <option value="">Select Occupation</option>
                    <option>Government Employee</option>
                    <option>Private Employee</option>
                    <option>Self Employed</option>
                    <option>Farmer</option>
                    <option>Business</option>
                    <option>Other</option>
                </select>
            </div>

        </div>
    </div>


    <!-- DECLARATION + SUBMIT -->
    <div class="bottom-area">

        <div class="declaration">
            <label>
                <input type="checkbox" name="declaration" required>
                I confirm that the information provided above is correct.
            </label>
        </div>

        <button type="submit" class="submit-btn">
            Save Profile & Find Eligible Schemes
        </button>

    </div>

</form>

</div>

</body>
</html>