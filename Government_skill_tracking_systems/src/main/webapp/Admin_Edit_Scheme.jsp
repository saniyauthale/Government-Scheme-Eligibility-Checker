<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.math.BigDecimal" %>

<%
    // =========================================================
    // GET SCHEME ID
    // =========================================================

    String id = request.getParameter("id");

    if (id == null || id.trim().equals("")) {
        response.sendRedirect("Admin_Manage_Scheme.jsp");
        return;
    }

    // =========================================================
    // DATABASE DETAILS
    // =========================================================

    String url = "jdbc:mysql://localhost:3306/skill_tracking_system";
    String dbUser = "root";
    String dbPassword = "root";

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String message = "";
    String messageType = "success";

    // =========================================================
    // VARIABLES
    // =========================================================

    String schemeName = "";
    String category = "";
    String candidateType = "";
    String status = "";

    String description = "";
    String eligibility = "";
    String benefits = "";
    String documents = "";
    String applicationProcess = "";
    String website = "";

    String minAge = "";
    String maxAge = "";
    String maxIncome = "";

    String genderRequired = "";
    String categoryRequired = "";
    String disabilityRequired = "";
    String healthInsuranceRequired = "";
    String bankAccountRequired = "";

    try {

        // =====================================================
        // LOAD MYSQL DRIVER
        // =====================================================

        Class.forName("com.mysql.cj.jdbc.Driver");

        // =====================================================
        // DATABASE CONNECTION
        // =====================================================

        con = DriverManager.getConnection(
                url,
                dbUser,
                dbPassword
        );

        // =====================================================
        // UPDATE DATA
        // =====================================================

        if ("POST".equalsIgnoreCase(request.getMethod())) {

            // -------------------------
            // BASIC INFORMATION
            // -------------------------

            schemeName = request.getParameter("scheme_name");
            category = request.getParameter("category");
            candidateType = request.getParameter("candidate_type");
            status = request.getParameter("status");

            description = request.getParameter("description");
            eligibility = request.getParameter("eligibility");
            benefits = request.getParameter("benefits");
            documents = request.getParameter("documents");
            applicationProcess =
                    request.getParameter("application_process");
            website = request.getParameter("website");

            // -------------------------
            // ELIGIBILITY FIELDS
            // -------------------------

            minAge = request.getParameter("min_age");
            maxAge = request.getParameter("max_age");
            maxIncome = request.getParameter("max_income");

            genderRequired =
                    request.getParameter("gender_required");

            categoryRequired =
                    request.getParameter("category_required");

            disabilityRequired =
                    request.getParameter("disability_required");

            healthInsuranceRequired =
                    request.getParameter("health_insurance_required");

            bankAccountRequired =
                    request.getParameter("bank_account_required");

            // =================================================
            // UPDATE QUERY
            // =================================================

            String updateQuery =
                    "UPDATE schemes SET "
                    + "scheme_name=?, "
                    + "category=?, "
                    + "candidate_type=?, "
                    + "status=?, "
                    + "description=?, "
                    + "eligibility=?, "
                    + "benefits=?, "
                    + "application_process=?, "
                    + "required_documents=?, "
                    + "website_link=?, "
                    + "min_age=?, "
                    + "max_age=?, "
                    + "max_income=?, "
                    + "gender_required=?, "
                    + "category_required=?, "
                    + "disability_required=?, "
                    + "health_insurance_required=?, "
                    + "bank_account_required=? "
                    + "WHERE scheme_id=?";

            ps = con.prepareStatement(updateQuery);

            // =================================================
            // SET BASIC VALUES
            // =================================================

            ps.setString(1, schemeName);
            ps.setString(2, category);
            ps.setString(3, candidateType);
            ps.setString(4, status);

            ps.setString(5, description);
            ps.setString(6, eligibility);
            ps.setString(7, benefits);
            ps.setString(8, applicationProcess);
            ps.setString(9, documents);
            ps.setString(10, website);

            // =================================================
            // MINIMUM AGE
            // =================================================

            if (minAge != null && !minAge.trim().isEmpty()) {

                ps.setInt(
                        11,
                        Integer.parseInt(minAge)
                );

            } else {

                ps.setNull(
                        11,
                        Types.INTEGER
                );
            }

            // =================================================
            // MAXIMUM AGE
            // =================================================

            if (maxAge != null && !maxAge.trim().isEmpty()) {

                ps.setInt(
                        12,
                        Integer.parseInt(maxAge)
                );

            } else {

                ps.setNull(
                        12,
                        Types.INTEGER
                );
            }

            // =================================================
            // MAXIMUM INCOME
            // =================================================

            if (maxIncome != null &&
                !maxIncome.trim().isEmpty()) {

                ps.setBigDecimal(
                        13,
                        new BigDecimal(maxIncome)
                );

            } else {

                ps.setNull(
                        13,
                        Types.DECIMAL
                );
            }

            // =================================================
            // OTHER ELIGIBILITY FIELDS
            // =================================================

            ps.setString(14, genderRequired);
            ps.setString(15, categoryRequired);
            ps.setString(16, disabilityRequired);
            ps.setString(17, healthInsuranceRequired);
            ps.setString(18, bankAccountRequired);

            // =================================================
            // SCHEME ID
            // =================================================

            ps.setInt(
                    19,
                    Integer.parseInt(id)
            );

            // =================================================
            // EXECUTE UPDATE
            // =================================================

            int rows = ps.executeUpdate();

            ps.close();
            ps = null;

            if (rows > 0) {

                message = "Scheme Updated Successfully!";
                messageType = "success";

            } else {

                message = "Update Failed! Scheme not found.";
                messageType = "error";
            }
        }

        // =====================================================
        // FETCH CURRENT SCHEME
        // =====================================================

        String fetchQuery =
                "SELECT * FROM schemes WHERE scheme_id=?";

        ps = con.prepareStatement(fetchQuery);

        ps.setInt(
                1,
                Integer.parseInt(id)
        );

        rs = ps.executeQuery();

        if (rs.next()) {

            // =================================================
            // BASIC INFORMATION
            // =================================================

            schemeName =
                    rs.getString("scheme_name");

            category =
                    rs.getString("category");

            candidateType =
                    rs.getString("candidate_type");

            status =
                    rs.getString("status");

            // =================================================
            // DESCRIPTION / DETAILS
            // =================================================

            description =
                    rs.getString("description");

            eligibility =
                    rs.getString("eligibility");

            benefits =
                    rs.getString("benefits");

            documents =
                    rs.getString("required_documents");

            applicationProcess =
                    rs.getString("application_process");

            website =
                    rs.getString("website_link");

            // =================================================
            // ELIGIBILITY VALUES
            // =================================================

            int minAgeValue =
                    rs.getInt("min_age");

            if (!rs.wasNull()) {
                minAge = String.valueOf(minAgeValue);
            }

            int maxAgeValue =
                    rs.getInt("max_age");

            if (!rs.wasNull()) {
                maxAge = String.valueOf(maxAgeValue);
            }

            BigDecimal maxIncomeValue =
                    rs.getBigDecimal("max_income");

            if (maxIncomeValue != null) {
                maxIncome =
                        maxIncomeValue.toString();
            }

            genderRequired =
                    rs.getString("gender_required");

            categoryRequired =
                    rs.getString("category_required");

            disabilityRequired =
                    rs.getString("disability_required");

            healthInsuranceRequired =
                    rs.getString("health_insurance_required");

            bankAccountRequired =
                    rs.getString("bank_account_required");

        } else {

            out.println("<h2>Scheme Not Found</h2>");
            return;
        }

    } catch (NumberFormatException e) {

        message =
                "Please enter valid numeric values for age and income.";

        messageType = "error";

    } catch (Exception e) {

        message =
                "Database Error: " + e.getMessage();

        messageType = "error";

        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Edit Scheme</title>

<!-- Font Awesome -->
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Arial, sans-serif;
}

body {
    background: #f5f7fb;
    color: #1e293b;
}

/* =========================================================
   MAIN WRAPPER
========================================================= */

.wrapper {
    display: flex;
    min-height: 100vh;
}

/* =========================================================
   SIDEBAR
========================================================= */

.sidebar {
    width: 260px;
    min-height: 100vh;
    background: linear-gradient(
        180deg,
        #0b2e63,
        #082348
    );
    color: white;
    padding: 20px 0;
}

.logo {
    padding: 0 25px 25px;
    font-size: 22px;
    font-weight: bold;
    border-bottom: 1px solid
                rgba(255,255,255,0.1);
}

.logo i {
    margin-right: 10px;
}

.menu {
    margin-top: 30px;
}

.menu a {
    display: block;
    padding: 14px 25px;
    color: #d8e4ff;
    text-decoration: none;
    font-size: 16px;
    transition: 0.3s;
}

.menu a:hover,
.menu a.active {
    background: #2d6df6;
    color: white;
    border-radius: 8px;
    margin: 0 15px;
}

/* =========================================================
   MAIN
========================================================= */

.main {
    flex: 1;
    padding: 30px;
}

/* =========================================================
   HEADER
========================================================= */

.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 25px;
}

.header h1 {
    font-size: 32px;
    color: #1a2b49;
}

.header p {
    color: #64748b;
    margin-top: 7px;
}

/* =========================================================
   CARD
========================================================= */

.card {
    background: white;
    border-radius: 16px;
    padding: 30px;
    box-shadow:
        0 4px 20px rgba(0,0,0,0.05);
}

/* =========================================================
   MESSAGE
========================================================= */

.message {
    padding: 14px 18px;
    border-radius: 10px;
    margin-bottom: 25px;
    font-weight: 600;
}

.success {
    background: #dcfce7;
    color: #166534;
}

.error {
    background: #fee2e2;
    color: #991b1b;
}

/* =========================================================
   SECTION
========================================================= */

.section {
    margin-bottom: 25px;
}

.section-title {
    color: #0b2e63;
    font-size: 19px;
    margin-bottom: 15px;
    padding-bottom: 8px;
    border-bottom: 2px solid #e5e7eb;
}

/* =========================================================
   GRID
========================================================= */

.info-grid {
    display: grid;
    grid-template-columns:
        repeat(2, minmax(0, 1fr));
    gap: 20px;
    margin-bottom: 25px;
}

.info-box {
    width: 100%;
}

.info-box.full {
    grid-column: 1 / -1;
}

/* =========================================================
   FORM
========================================================= */

.form-group {
    margin-bottom: 18px;
}

.form-group label,
.info-box label {
    display: block;
    margin-bottom: 8px;
    font-weight: 600;
    color: #334155;
}

input,
textarea,
select {
    width: 100%;
    padding: 13px;
    border: 1px solid #dbe2ea;
    border-radius: 9px;
    font-size: 15px;
    background: white;
    color: #1e293b;
}

input:focus,
textarea:focus,
select:focus {
    border-color: #2563eb;
    outline: none;
    box-shadow:
        0 0 0 3px
        rgba(37,99,235,0.1);
}

textarea {
    resize: vertical;
    min-height: 120px;
}

/* =========================================================
   ELIGIBILITY BOX
========================================================= */

.eligibility-box {
    background: #f8fafc;
    border: 1px solid #e2e8f0;
    border-radius: 12px;
    padding: 20px;
    margin-top: 10px;
}

/* =========================================================
   BUTTONS
========================================================= */

.btn-group {
    display: flex;
    gap: 12px;
    margin-top: 25px;
}

.update-btn {
    background: #2563eb;
    color: white;
    border: none;
    padding: 13px 25px;
    border-radius: 9px;
    font-size: 15px;
    font-weight: 600;
    cursor: pointer;
}

.update-btn:hover {
    background: #1d4ed8;
}

.back-btn,
.cancel-btn {
    background: #64748b;
    color: white;
    padding: 13px 25px;
    border-radius: 9px;
    text-decoration: none;
    font-weight: 600;
    display: inline-block;
}

.back-btn:hover,
.cancel-btn:hover {
    background: #475569;
}

/* =========================================================
   REQUIRED
========================================================= */

.required {
    color: #dc2626;
}

/* =========================================================
   RESPONSIVE
========================================================= */

@media (max-width: 900px) {

    .sidebar {
        width: 210px;
    }

    .info-grid {
        grid-template-columns: 1fr;
    }
}

@media (max-width: 700px) {

    .wrapper {
        display: block;
    }

    .sidebar {
        width: 100%;
        min-height: auto;
    }

    .main {
        padding: 15px;
    }

    .header {
        flex-direction: column;
        align-items: flex-start;
        gap: 15px;
    }

    .card {
        padding: 20px;
    }
}

</style>

</head>

<body>

<div class="wrapper">

    <!-- =====================================================
         SIDEBAR
    ====================================================== -->

    <div class="sidebar">

        <div class="logo">
            <i class="fas fa-landmark"></i>
            Scheme Checker
        </div>

        <div class="menu">

            <a href="Admin_Dashboard_servlet">
                <i class="fas fa-home"></i>
                Dashboard
            </a>

            <a href="Admin_Add_Scheme.jsp">
                <i class="fas fa-plus-circle"></i>
                Add Scheme
            </a>

            <a href="Admin_Manage_Scheme.jsp"
               class="active">

                <i class="fas fa-list"></i>
                Manage Schemes

            </a>

            <a href="LogoutServlet">

                <i class="fas fa-sign-out-alt"></i>
                Logout

            </a>

        </div>

    </div>


    <!-- =====================================================
         MAIN CONTENT
    ====================================================== -->

    <div class="main">

        <!-- HEADER -->

        <div class="header">

            <div>

                <h1>
                    <i class="fas fa-edit"></i>
                    Edit Scheme
                </h1>

                <p>
                    Update government scheme details
                    and eligibility criteria.
                </p>

            </div>

            <a href="Admin_Manage_Scheme.jsp"
               class="back-btn">

                <i class="fas fa-arrow-left"></i>
                Back

            </a>

        </div>


        <!-- =================================================
             CARD
        ================================================== -->

        <div class="card">

            <!-- MESSAGE -->

            <% if (message != null &&
                   !message.trim().isEmpty()) { %>

                <div class="message <%= messageType %>">

                    <%= message %>

                </div>

            <% } %>


            <!-- =================================================
                 FORM
            ================================================== -->

            <form method="post"
                  action="Admin_Edit_Scheme.jsp?id=<%= id %>">


                <!-- =================================================
                     BASIC INFORMATION
                ================================================== -->

                <div class="section">

                    <h3 class="section-title">
                        <i class="fas fa-info-circle"></i>
                        Basic Scheme Information
                    </h3>


                    <div class="info-grid">

                        <!-- Scheme Name -->

                        <div class="info-box">

                            <label>
                                Scheme Name
                                <span class="required">*</span>
                            </label>

                            <input type="text"
                                   name="scheme_name"
                                   value="<%= schemeName != null ? schemeName : "" %>"
                                   required>

                        </div>


                        <!-- Category -->

                        <div class="info-box">

                            <label>
                                Scheme Category
                                <span class="required">*</span>
                            </label>

                            <select name="category"
                                    required>

                                <option value="">
                                    Select Category
                                </option>

                                <option value="Education"
                                <%= "Education".equals(category)
                                    ? "selected" : "" %>>
                                    Education
                                </option>

                                <option value="Agriculture"
                                <%= "Agriculture".equals(category)
                                    ? "selected" : "" %>>
                                    Agriculture
                                </option>

                                <option value="Women Welfare"
                                <%= "Women Welfare".equals(category)
                                    ? "selected" : "" %>>
                                    Women Welfare
                                </option>

                                <option value="Health"
                                <%= "Health".equals(category)
                                    ? "selected" : "" %>>
                                    Health
                                </option>

                                <option value="Employment"
                                <%= "Employment".equals(category)
                                    ? "selected" : "" %>>
                                    Employment
                                </option>
                                

                                <option value="Skill Development"
                                <%= "Skill Development".equals(category)
                                    ? "selected" : "" %>>
                                    Skill Development
                                </option>

                                <option value="Social Security"
                                <%= "Social Security".equals(category)
                                    ? "selected" : "" %>>
                                    Social Security
                                </option>

                                <option value="Business"
                                <%= "Business".equals(category)
                                    ? "selected" : "" %>>
                                    Business
                                </option>

                                <option value="Women Empowerment"
                                <%= "Women Empowerment".equals(category)
                                    ? "selected" : "" %>>
                                    Women Empowerment
                                </option>

                            </select>

                        </div>


                        <!-- Candidate Type -->

                        <div class="info-box">

                            <label>
                                Candidate Type
                                <span class="required">*</span>
                            </label>

                            <select name="candidate_type"
                                    required>

                                <option value="">
                                    Select Candidate Type
                                </option>

                                <option value="Student"
                                <%= "Student".equals(candidateType)
                                    ? "selected" : "" %>>
                                    Student
                                </option>

                                <option value="Girl Student"
                                <%= "Girl Student".equals(candidateType)
                                    ? "selected" : "" %>>
                                    Girl Student
                                </option>

                                <option value="Farmer"
                                <%= "Farmer".equals(candidateType)
                                    ? "selected" : "" %>>
                                    Farmer
                                </option>

                                <option value="Women"
                                <%= "Women".equals(candidateType)
                                    ? "selected" : "" %>>
                                    Women
                                </option>

                                <option value="Senior Citizen"
                                <%= "Senior Citizen".equals(candidateType)
                                    ? "selected" : "" %>>
                                    Senior Citizen
                                </option>

                                <option value="Unemployed Youth"
                                <%= "Unemployed Youth".equals(candidateType)
                                    ? "selected" : "" %>>
                                    Unemployed Youth
                                </option>

                                <option value="Entrepreneur"
                                <%= "Entrepreneur".equals(candidateType)
                                    ? "selected" : "" %>>
                                    Entrepreneur
                                </option>

                                <option value="SC/ST"
                                <%= "SC/ST".equals(candidateType)
                                    ? "selected" : "" %>>
                                    SC/ST
                                </option>

                                <option value="Minority"
                                <%= "Minority".equals(candidateType)
                                    ? "selected" : "" %>>
                                    Minority
                                </option>

                                <option value="Disabled Persons"
                                <%= "Disabled Persons".equals(candidateType)
                                    ? "selected" : "" %>>
                                    Disabled Persons
                                </option>

                                <option value="All Citizens"
                                <%= "All Citizens".equals(candidateType)
                                    ? "selected" : "" %>>
                                    All Citizens
                                </option>

                            </select>

                        </div>


                        <!-- Status -->

                        <div class="info-box">

                            <label>
                                Status
                                <span class="required">*</span>
                            </label>

                            <select name="status"
                                    required>

                                <option value="Active"
                                <%= "Active".equals(status)
                                    ? "selected" : "" %>>
                                    Active
                                </option>

                                <option value="Inactive"
                                <%= "Inactive".equals(status)
                                    ? "selected" : "" %>>
                                    Inactive
                                </option>

                            </select>

                        </div>


                        <!-- Website -->

                        <div class="info-box full">

                            <label>
                                Official Website
                            </label>

                            <input type="text"
                                   name="website"
                                   value="<%= website != null ? website : "" %>"
                                   placeholder="https://example.gov.in">

                        </div>

                    </div>

                </div>


                <!-- =================================================
                     DESCRIPTION
                ================================================== -->

                <div class="section">

                    <h3 class="section-title">
                        <i class="fas fa-align-left"></i>
                        Description
                    </h3>

                    <textarea name="description"
                              required><%= description != null ? description : "" %></textarea>

                </div>


                <!-- =================================================
                     ELIGIBILITY DESCRIPTION
                ================================================== -->

                <div class="section">

                    <h3 class="section-title">
                        <i class="fas fa-check-circle"></i>
                        Eligibility Criteria
                    </h3>

                    <textarea name="eligibility"
                              required><%= eligibility != null ? eligibility : "" %></textarea>

                </div>


                <!-- =================================================
                     BENEFITS
                ================================================== -->

                <div class="section">

                    <h3 class="section-title">
                        <i class="fas fa-gift"></i>
                        Benefits
                    </h3>

                    <textarea name="benefits"
                              required><%= benefits != null ? benefits : "" %></textarea>

                </div>


                <!-- =================================================
                     REQUIRED DOCUMENTS
                ================================================== -->

                <div class="section">

                    <h3 class="section-title">
                        <i class="fas fa-file-alt"></i>
                        Required Documents
                    </h3>

                    <textarea name="documents"><%= documents != null ? documents : "" %></textarea>

                </div>


                <!-- =================================================
                     APPLICATION PROCESS
                ================================================== -->

                <div class="section">

                    <h3 class="section-title">
                        <i class="fas fa-tasks"></i>
                        Application Process
                    </h3>

                    <textarea name="application_process"
                              required><%= applicationProcess != null ? applicationProcess : "" %></textarea>

                </div>


                <!-- =================================================
                     ELIGIBILITY MATCHING FIELDS
                ================================================== -->

                <div class="section">

                    <h3 class="section-title">
                        <i class="fas fa-filter"></i>
                        Eligibility Matching Conditions
                    </h3>

                    <div class="eligibility-box">

                        <div class="info-grid">

                            <!-- MIN AGE -->

                            <div class="info-box">

                                <label>
                                    Minimum Age
                                </label>

                                <input type="number"
                                       name="min_age"
                                       min="0"
                                       value="<%= minAge != null ? minAge : "" %>"
                                       placeholder="Example: 18">

                            </div>


                            <!-- MAX AGE -->

                            <div class="info-box">

                                <label>
                                    Maximum Age
                                </label>

                                <input type="number"
                                       name="max_age"
                                       min="0"
                                       value="<%= maxAge != null ? maxAge : "" %>"
                                       placeholder="Example: 60">

                            </div>


                            <!-- MAX INCOME -->

                            <div class="info-box">

                                <label>
                                    Maximum Family Income
                                </label>

                                <input type="number"
                                       name="max_income"
                                       min="0"
                                       step="0.01"
                                       value="<%= maxIncome != null ? maxIncome : "" %>"
                                       placeholder="Example: 250000">

                            </div>


                            <!-- GENDER -->

                            <div class="info-box">

                                <label>
                                    Required Gender
                                </label>

                                <select name="gender_required">

                                    <option value="">
                                        No Specific Gender
                                    </option>

                                    <option value="Male"
                                    <%= "Male".equals(genderRequired)
                                        ? "selected" : "" %>>
                                        Male
                                    </option>

                                    <option value="Female"
                                    <%= "Female".equals(genderRequired)
                                        ? "selected" : "" %>>
                                        Female
                                    </option>

                                    <option value="Other"
                                    <%= "Other".equals(genderRequired)
                                        ? "selected" : "" %>>
                                        Other
                                    </option>

                                </select>

                            </div>


                            <!-- CATEGORY REQUIRED -->

                            <div class="info-box">

                                <label>
                                    Required Category
                                </label>

                                <select name="category_required">

                                    <option value="">
                                        No Specific Category
                                    </option>

                                    <option value="SC"
                                    <%= "SC".equals(categoryRequired)
                                        ? "selected" : "" %>>
                                        SC
                                    </option>

                                    <option value="ST"
                                    <%= "ST".equals(categoryRequired)
                                        ? "selected" : "" %>>
                                        ST
                                    </option>

                                    <option value="OBC"
                                    <%= "OBC".equals(categoryRequired)
                                        ? "selected" : "" %>>
                                        OBC
                                    </option>

                                    <option value="General"
                                    <%= "General".equals(categoryRequired)
                                        ? "selected" : "" %>>
                                        General
                                    </option>

                                    <option value="Minority"
                                    <%= "Minority".equals(categoryRequired)
                                        ? "selected" : "" %>>
                                        Minority
                                    </option>

                                </select>

                            </div>


                            <!-- DISABILITY -->

                            <div class="info-box">

                                <label>
                                    Disability Required
                                </label>

                                <select name="disability_required">

                                    <option value="">
                                        Not Required
                                    </option>

                                    <option value="Yes"
                                    <%= "Yes".equals(disabilityRequired)
                                        ? "selected" : "" %>>
                                        Yes
                                    </option>

                                    <option value="No"
                                    <%= "No".equals(disabilityRequired)
                                        ? "selected" : "" %>>
                                        No
                                    </option>

                                </select>

                            </div>


                            <!-- HEALTH INSURANCE -->

                            <div class="info-box">

                                <label>
                                    Health Insurance Required
                                </label>

                                <select name="health_insurance_required">

                                    <option value="">
                                        Not Required
                                    </option>

                                    <option value="Yes"
                                    <%= "Yes".equals(healthInsuranceRequired)
                                        ? "selected" : "" %>>
                                        Yes
                                    </option>

                                    <option value="No"
                                    <%= "No".equals(healthInsuranceRequired)
                                        ? "selected" : "" %>>
                                        No
                                    </option>

                                </select>

                            </div>


                            <!-- BANK ACCOUNT -->

                            <div class="info-box">

                                <label>
                                    Bank Account Required
                                </label>

                                <select name="bank_account_required">

                                    <option value="">
                                        Not Required
                                    </option>

                                    <option value="Yes"
                                    <%= "Yes".equals(bankAccountRequired)
                                        ? "selected" : "" %>>
                                        Yes
                                    </option>

                                    <option value="No"
                                    <%= "No".equals(bankAccountRequired)
                                        ? "selected" : "" %>>
                                        No
                                    </option>

                                </select>

                            </div>

                        </div>

                    </div>

                </div>


                <!-- =================================================
                     BUTTONS
                ================================================== -->

                <div class="btn-group">

                    <button type="submit"
                            class="update-btn">

                        <i class="fas fa-save"></i>
                        Update Scheme

                    </button>


                    <a href="Admin_Manage_Scheme.jsp"
                       class="cancel-btn">

                        <i class="fas fa-times"></i>
                        Cancel

                    </a>

                </div>

            </form>

        </div>

    </div>

</div>

</body>
</html>


<%
    // =========================================================
    // CLOSE DATABASE RESOURCES
    // =========================================================

    try {

        if (rs != null) {
            rs.close();
        }

    } catch (Exception e) {
    }

    try {

        if (ps != null) {
            ps.close();
        }

    } catch (Exception e) {
    }

    try {

        if (con != null) {
            con.close();
        }

    } catch (Exception e) {
    }
%>