<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String fullName = (String) request.getAttribute("fullName");
    String age = (String) request.getAttribute("age");
    String gender = (String) request.getAttribute("gender");
    String mobile = (String) request.getAttribute("mobile");
    String state = (String) request.getAttribute("state");
    String district = (String) request.getAttribute("district");
    String educationLevel = (String) request.getAttribute("educationLevel");
    String courseName = (String) request.getAttribute("courseName");
    String annualIncome = (String) request.getAttribute("annualIncome");
    String category = (String) request.getAttribute("category");
    String disability = (String) request.getAttribute("disability");
    String bankAccount = (String) request.getAttribute("bankAccount");

    if (fullName == null) fullName = "";
    if (age == null) age = "";
    if (gender == null) gender = "";
    if (mobile == null) mobile = "";
    if (state == null) state = "";
    if (district == null) district = "";
    if (educationLevel == null) educationLevel = "";
    if (courseName == null) courseName = "";
    if (annualIncome == null) annualIncome = "";
    if (category == null) category = "";
    if (disability == null) disability = "";
    if (bankAccount == null) bankAccount = "";
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Edit Profile</title>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, Helvetica, sans-serif;
    background: #f4f8fc;
    color: #14213d;
}

/* MAIN */

.dashboard-container {
    display: flex;
    min-height: 100vh;
}

/* SIDEBAR */

.sidebar {
    width: 275px;
    min-height: 100vh;
    background: linear-gradient(180deg, #123d7a, #082b5c);
    color: white;
    position: fixed;
    left: 0;
    top: 0;
    bottom: 0;
    padding: 25px 14px;
}

.logo-section {
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 0 12px 25px;
    border-bottom: 1px solid rgba(255,255,255,0.15);
}

.logo-icon {
    font-size: 42px;
}

.logo-text {
    font-size: 16px;
    font-weight: bold;
    line-height: 1.4;
}

.sidebar-menu {
    margin-top: 22px;
}

.sidebar-menu a {
    display: flex;
    align-items: center;
    gap: 17px;
    color: white;
    text-decoration: none;
    padding: 14px 15px;
    margin-bottom: 7px;
    border-radius: 9px;
    font-size: 15px;
}

.sidebar-menu a:hover {
    background: rgba(255,255,255,0.12);
}

.sidebar-menu a.active {
    background: #1769e0;
}

.menu-icon {
    width: 25px;
    text-align: center;
    font-size: 20px;
}

/* SIDEBAR BOTTOM */

.sidebar-bottom {
    position: absolute;
    bottom: 30px;
    left: 18px;
    right: 18px;
    background: #164a9b;
    border-radius: 12px;
    padding: 25px 15px;
    text-align: center;
}

.building-icon {
    font-size: 55px;
    margin-bottom: 12px;
}

.sidebar-bottom h3 {
    font-size: 17px;
    margin-bottom: 8px;
}

.sidebar-bottom p {
    font-size: 14px;
}

/* MAIN CONTENT */

.main-content {
    margin-left: 275px;
    width: calc(100% - 275px);
    min-height: 100vh;
}

/* HEADER */

.top-header {
    height: 70px;
    background: white;
    border-bottom: 1px solid #dce5ef;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 30px;
}

.menu-button {
    font-size: 27px;
}

.header-right {
    display: flex;
    align-items: center;
}

.user-info {
    display: flex;
    align-items: center;
    gap: 12px;
}

.user-avatar {
    width: 42px;
    height: 42px;
    border-radius: 50%;
    background: #164a9b;
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 18px;
    font-weight: bold;
}

.user-name {
    font-weight: bold;
    font-size: 14px;
}

.user-category {
    font-size: 12px;
    color: #64748b;
    margin-top: 4px;
}

/* CONTENT */

.content-area {
    padding: 25px 30px 40px;
}

.page-title {
    margin-bottom: 22px;
}

.page-title h1 {
    font-size: 30px;
    color: #10244a;
    margin-bottom: 8px;
}

.page-title p {
    color: #52647d;
    font-size: 15px;
}

/* FORM */

.form-card {
    background: white;
    border-radius: 14px;
    padding: 25px;
    box-shadow: 0 3px 12px rgba(30,60,90,0.08);
}

.form-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
}

.form-group {
    display: flex;
    flex-direction: column;
}

.form-group.full {
    grid-column: 1 / 3;
}

.form-group label {
    font-size: 14px;
    font-weight: bold;
    color: #52647d;
    margin-bottom: 8px;
}

.form-group input,
.form-group select {
    padding: 12px;
    border: 1px solid #d5deea;
    border-radius: 7px;
    font-size: 14px;
    outline: none;
}

.form-group input:focus,
.form-group select:focus {
    border-color: #1769e0;
}

/* BUTTONS */

.button-area {
    margin-top: 25px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.back-button,
.update-button {
    display: inline-block;
    color: white;
    text-decoration: none;
    padding: 11px 20px;
    border-radius: 7px;
    font-size: 13px;
    font-weight: bold;
    border: none;
    cursor: pointer;
}

.back-button {
    background: #1769e0;
}

.back-button:hover {
    background: #1257bd;
}

.update-button {
    background: #16a34a;
}

.update-button:hover {
    background: #15803d;
}

/* RESPONSIVE */

@media(max-width: 800px) {

    .sidebar {
        width: 75px;
    }

    .logo-text,
    .sidebar-menu a span:not(.menu-icon),
    .sidebar-bottom {
        display: none;
    }

    .main-content {
        margin-left: 75px;
        width: calc(100% - 75px);
    }

    .form-grid {
        grid-template-columns: 1fr;
    }

    .form-group.full {
        grid-column: auto;
    }
}

</style>

</head>

<body>

<div class="dashboard-container">

<!-- SIDEBAR -->

<aside class="sidebar">

    <div class="logo-section">

        <div class="logo-icon">
            🏛️
        </div>

        <div class="logo-text">
            SMART GOVERNMENT<br>
            SCHEME ELIGIBILITY
        </div>

    </div>

    <nav class="sidebar-menu">

        <a href="<%= request.getContextPath() %>/User_Dashboard_servler">
            <span class="menu-icon">⌂</span>
            <span>Dashboard</span>
        </a>

        <a href="<%= request.getContextPath() %>/View_Profile_servlet"
           class="active">

            <span class="menu-icon">♙</span>
            <span>My Profile</span>

        </a>

        <a href="<%= request.getContextPath() %>/User_Dashboard_servler#eligibleSchemes">
            <span class="menu-icon">▣</span>
            <span>Eligible Schemes</span>
        </a>

        <a href="<%= request.getContextPath() %>/My_Applications_servlet">
            <span class="menu-icon">☑</span>
            <span>My Applications</span>
        </a>

        <a href="<%= request.getContextPath() %>/Saved_Schemes_servlet">
            <span class="menu-icon">♡</span>
            <span>Saved Schemes</span>
        </a>

        <a href="Notifications.jsp">
            <span class="menu-icon">♧</span>
            <span>Notifications</span>
        </a>

        <a href="Change_Password.jsp">
            <span class="menu-icon">?</span>
            <span>Change Password</span>
        </a>

        <a href="Help_Support.jsp">
            <span class="menu-icon">♧</span>
            <span>Help & Support</span>
        </a>

        <a href="logout">
            <span class="menu-icon">→</span>
            <span>Logout</span>
        </a>

    </nav>

    <div class="sidebar-bottom">

        <div class="building-icon">
            🏛️
        </div>

        <h3>Empowering Citizens</h3>

        <p>Building a Better India</p>

    </div>

</aside>


<!-- MAIN -->

<main class="main-content">

<header class="top-header">

    <div class="menu-button">
        ☰
    </div>

    <div class="header-right">

        <div class="user-info">

            <div class="user-avatar">
                <%= fullName.isEmpty() ? "U" :
                   fullName.substring(0,1).toUpperCase() %>
            </div>

            <div>

                <div class="user-name">
                    <%= fullName %>
                </div>

                <div class="user-category">
                    <%= category %>
                </div>

            </div>

        </div>

    </div>

</header>


<section class="content-area">

    <div class="page-title">

        <h1>Edit Profile</h1>

        <p>
            Update your personal and eligibility information.
        </p>

    </div>


    <form action="<%= request.getContextPath() %>/Update_Profile_servlet"
          method="post">

        <div class="form-card">

            <div class="form-grid">

                <!-- FULL NAME -->

                <div class="form-group">

                    <label>Full Name</label>

                    <input type="text"
                           name="fullName"
                           value="<%= fullName %>"
                           required>

                </div>


                <!-- AGE -->

                <div class="form-group">

                    <label>Age</label>

                    <input type="number"
                           name="age"
                           value="<%= age %>"
                           required>

                </div>


                <!-- GENDER -->

                <div class="form-group">

                    <label>Gender</label>

                    <select name="gender">

                        <option value="Male"
                            <%= "Male".equalsIgnoreCase(gender)
                                ? "selected" : "" %>>
                            Male
                        </option>

                        <option value="Female"
                            <%= "Female".equalsIgnoreCase(gender)
                                ? "selected" : "" %>>
                            Female
                        </option>

                        <option value="Other"
                            <%= "Other".equalsIgnoreCase(gender)
                                ? "selected" : "" %>>
                            Other
                        </option>

                    </select>

                </div>


                <!-- MOBILE -->

                <div class="form-group">

                    <label>Mobile</label>

                    <input type="text"
                           name="mobile"
                           value="<%= mobile %>"
                           required>

                </div>


                <!-- STATE -->

                <div class="form-group">

                    <label>State</label>

                    <input type="text"
                           name="state"
                           value="<%= state %>"
                           required>

                </div>


                <!-- DISTRICT -->

                <div class="form-group">

                    <label>District</label>

                    <input type="text"
                           name="district"
                           value="<%= district %>"
                           required>

                </div>


                <!-- EDUCATION -->

                <div class="form-group">

                    <label>Education / Business Type</label>

                    <input type="text"
                           name="educationLevel"
                           value="<%= educationLevel %>">

                </div>


                <!-- COURSE / BUSINESS -->

                <div class="form-group">

                    <label>Course / Business Name</label>

                    <input type="text"
                           name="courseName"
                           value="<%= courseName %>">

                </div>


                <!-- INCOME -->

                <div class="form-group">

                    <label>Annual / Family Income</label>

                    <input type="number"
                           name="annualIncome"
                           value="<%= annualIncome %>">

                </div>


                <!-- DISABILITY -->

                <div class="form-group">

                    <label>Differently Abled</label>

                    <select name="disability">

                        <option value="Yes"
                            <%= "Yes".equalsIgnoreCase(disability)
                                ? "selected" : "" %>>
                            Yes
                        </option>

                        <option value="No"
                            <%= "No".equalsIgnoreCase(disability)
                                ? "selected" : "" %>>
                            No
                        </option>

                    </select>

                </div>


                <!-- BANK -->

                <div class="form-group">

                    <label>Bank / Account Status</label>

                    <input type="text"
                           name="bankAccount"
                           value="<%= bankAccount %>">

                </div>


                <!-- CATEGORY -->

                <div class="form-group">

                    <label>Category</label>

                    <!-- Don't allow user to change category -->

                    <input type="text"
                           value="<%= category %>"
                           readonly>

                    <input type="hidden"
                           name="category"
                           value="<%= category %>">

                </div>

            </div>


            <!-- BUTTONS -->

            <div class="button-area">

                <a href="<%= request.getContextPath() %>/View_Profile_servlet"
                   class="back-button">
                    ← Back to Profile
                </a>

                <button type="submit"
                        class="update-button">
                    ✓ Update Profile
                </button>

            </div>

        </div>

    </form>

</section>

</main>

</div>

</body>
</html>