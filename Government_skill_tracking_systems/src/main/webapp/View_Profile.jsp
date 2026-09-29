<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // =========================================================
    // GET PROFILE DATA FROM SERVLET
    // =========================================================

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


    // =========================================================
    // DEFAULT VALUES
    // =========================================================

    if (fullName == null || fullName.trim().isEmpty())
        fullName = "Not Available";

    if (age == null || age.trim().isEmpty())
        age = "Not Available";

    if (gender == null || gender.trim().isEmpty())
        gender = "Not Available";

    if (mobile == null || mobile.trim().isEmpty())
        mobile = "Not Available";

    if (state == null || state.trim().isEmpty())
        state = "Not Available";

    if (district == null || district.trim().isEmpty())
        district = "Not Available";

    if (educationLevel == null || educationLevel.trim().isEmpty())
        educationLevel = "Not Available";

    if (courseName == null || courseName.trim().isEmpty())
        courseName = "Not Available";

    if (annualIncome == null || annualIncome.trim().isEmpty())
        annualIncome = "Not Available";

    if (category == null || category.trim().isEmpty())
        category = "Not Available";

    if (disability == null || disability.trim().isEmpty())
        disability = "Not Available";

    if (bankAccount == null || bankAccount.trim().isEmpty())
        bankAccount = "Not Available";


    // =========================================================
    // LOCATION
    // =========================================================

    String location = state;

    if (!"Not Available".equalsIgnoreCase(district)) {

        if (!"Not Available".equalsIgnoreCase(state)) {
            location = state + ", " + district;
        } else {
            location = district;
        }
    }


    // =========================================================
    // USER INITIAL
    // =========================================================

    String initial = "U";

    if (!"Not Available".equals(fullName)) {
        initial = fullName.substring(0, 1).toUpperCase();
    }
%>


<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>My Profile - Smart Government Scheme Eligibility</title>


<style>

/* =========================================================
   RESET
========================================================= */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}


/* =========================================================
   BODY
========================================================= */

body {

    font-family: Arial, Helvetica, sans-serif;

    background: #f4f8fc;

    color: #14213d;
}


/* =========================================================
   MAIN CONTAINER
========================================================= */

.dashboard-container {

    display: flex;

    min-height: 100vh;
}


/* =========================================================
   SIDEBAR
========================================================= */

.sidebar {

    width: 275px;

    min-height: 100vh;

    background: linear-gradient(
        180deg,
        #123d7a,
        #082b5c
    );

    color: white;

    position: fixed;

    left: 0;

    top: 0;

    bottom: 0;

    padding: 25px 14px;
}


/* =========================================================
   LOGO
========================================================= */

.logo-section {

    display: flex;

    align-items: center;

    gap: 12px;

    padding: 0 12px 25px;

    border-bottom: 1px solid
                rgba(255,255,255,0.15);
}

.logo-icon {

    font-size: 42px;
}

.logo-text {

    font-size: 16px;

    font-weight: bold;

    line-height: 1.4;

    letter-spacing: 0.3px;
}


/* =========================================================
   SIDEBAR MENU
========================================================= */

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

    transition: 0.2s;
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


/* =========================================================
   SIDEBAR BOTTOM
========================================================= */

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


/* =========================================================
   MAIN CONTENT
========================================================= */

.main-content {

    margin-left: 275px;

    width: calc(100% - 275px);

    min-height: 100vh;
}


/* =========================================================
   HEADER
========================================================= */

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

    color: #14213d;
}

.header-right {

    display: flex;

    align-items: center;

    gap: 25px;
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


/* =========================================================
   CONTENT
========================================================= */

.content-area {

    padding: 25px 30px 40px;
}


/* =========================================================
   PAGE TITLE
========================================================= */

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


/* =========================================================
   PROFILE HEADER CARD
========================================================= */

.profile-header {

    background: white;

    border-radius: 14px;

    padding: 25px;

    box-shadow: 0 3px 12px
                rgba(30,60,90,0.08);

    display: flex;

    align-items: center;

    gap: 20px;

    margin-bottom: 20px;
}

.profile-avatar {

    width: 85px;

    height: 85px;

    border-radius: 50%;

    background: #e3efff;

    color: #1769e0;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 32px;

    font-weight: bold;
}

.profile-header-info h2 {

    font-size: 23px;

    color: #14213d;

    margin-bottom: 7px;
}

.profile-header-info p {

    color: #64748b;

    font-size: 14px;

    margin-bottom: 5px;
}

.category-badge {

    display: inline-block;

    background: #e8f2ff;

    color: #1769e0;

    padding: 6px 12px;

    border-radius: 20px;

    font-size: 12px;

    font-weight: bold;
}


/* =========================================================
   PROFILE GRID
========================================================= */

.profile-grid {

    display: grid;

    grid-template-columns: 1fr 1fr;

    gap: 20px;
}


/* =========================================================
   PROFILE CARD
========================================================= */

.profile-card {

    background: white;

    border-radius: 14px;

    padding: 22px;

    box-shadow: 0 3px 12px
                rgba(30,60,90,0.08);
}

.card-title {

    display: flex;

    align-items: center;

    gap: 10px;

    padding-bottom: 15px;

    border-bottom: 1px solid #e8eef5;

    margin-bottom: 5px;
}

.card-title-icon {

    font-size: 22px;

    color: #1769e0;
}

.card-title h2 {

    font-size: 18px;

    color: #14213d;
}


/* =========================================================
   PROFILE ROW
========================================================= */

.profile-row {

    display: grid;

    grid-template-columns: 170px 1fr;

    align-items: center;

    padding: 14px 0;

    border-bottom: 1px solid #e8eef5;
}

.profile-row:last-child {

    border-bottom: none;
}

.profile-label {

    color: #52647d;

    font-size: 14px;
}

.profile-value {

    color: #162541;

    font-size: 14px;

    font-weight: 600;
}


/* =========================================================
   BACK BUTTON
========================================================= */

.button-area {

    margin-top: 25px;
}

.back-button {

    display: inline-block;

    background: #1769e0;

    color: white;

    text-decoration: none;

    padding: 11px 20px;

    border-radius: 7px;

    font-size: 13px;

    font-weight: bold;

    transition: 0.2s;
}

.back-button:hover {

    background: #1257bd;
}


/* =========================================================
   RESPONSIVE
========================================================= */

@media(max-width: 1000px) {

    .profile-grid {

        grid-template-columns: 1fr;
    }
}


@media(max-width: 800px) {

    .sidebar {

        width: 75px;
    }

    .logo-text,
    .sidebar-menu a span:not(.menu-icon),
    .sidebar-bottom {

        display: none;
    }

    .logo-section {

        justify-content: center;

        padding: 0 0 25px;
    }

    .sidebar-menu a {

        justify-content: center;

        padding: 14px 5px;
    }

    .main-content {

        margin-left: 75px;

        width: calc(100% - 75px);
    }

    .profile-grid {

        grid-template-columns: 1fr;
    }
}


@media(max-width: 600px) {

    .content-area {

        padding: 18px;
    }

    .top-header {

        padding: 0 18px;
    }

    .profile-header {

        flex-direction: column;

        text-align: center;
    }

    .profile-row {

        grid-template-columns: 1fr;

        gap: 6px;
    }

    .page-title h1 {

        font-size: 24px;
    }
}
.button-area {
    margin-top: 25px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.back-button,
.edit-button {
    display: inline-block;
    color: white;
    text-decoration: none;
    padding: 11px 20px;
    border-radius: 7px;
    font-size: 13px;
    font-weight: bold;
    transition: 0.2s;
}

/* Back to Dashboard */
.back-button {
    background: #1769e0;
}

.back-button:hover {
    background: #1257bd;
}

/* Edit Profile */
.edit-button {
    background: #dc2626;
}

.edit-button:hover {
    background: #b91c1c;
}

</style>

</head>


<body>


<div class="dashboard-container">


    <!-- =====================================================
         SIDEBAR
    ====================================================== -->

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



    <!-- =====================================================
         MAIN CONTENT
    ====================================================== -->

    <main class="main-content">


        <!-- HEADER -->

        <header class="top-header">

            <div class="menu-button">
                ☰
            </div>


            <div class="header-right">

                <div class="user-info">

                    <div class="user-avatar">
                        <%= initial %>
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



        <!-- =================================================
             CONTENT
        ================================================== -->

        <section class="content-area">


            <!-- PAGE TITLE -->

            <div class="page-title">

                <h1>My Profile</h1>

                <p>
                    View your personal and eligibility information.
                </p>

            </div>



            <!-- =================================================
                 PROFILE HEADER
            ================================================== -->

            <div class="profile-header">

                <div class="profile-avatar">
                    <%= initial %>
                </div>


                <div class="profile-header-info">

                    <h2>
                        <%= fullName %>
                    </h2>

                    <p>
                        📱 <%= mobile %>
                    </p>

                    <span class="category-badge">
                        <%= category %>
                    </span>

                </div>

            </div>



            <!-- =================================================
                 PROFILE INFORMATION
            ================================================== -->

            <div class="profile-grid">


                <!-- PERSONAL INFORMATION -->

                <div class="profile-card">

                    <div class="card-title">

                        <span class="card-title-icon">
                            👤
                        </span>

                        <h2>
                            Personal Information
                        </h2>

                    </div>


                    <div class="profile-row">

                        <div class="profile-label">
                            Full Name
                        </div>

                        <div class="profile-value">
                            <%= fullName %>
                        </div>

                    </div>


                    <div class="profile-row">

                        <div class="profile-label">
                            Age
                        </div>

                        <div class="profile-value">

                            <% if (!"Not Available".equals(age)) { %>

                                <%= age %> Years

                            <% } else { %>

                                Not Available

                            <% } %>

                        </div>

                    </div>


                    <div class="profile-row">

                        <div class="profile-label">
                            Gender
                        </div>

                        <div class="profile-value">
                            <%= gender %>
                        </div>

                    </div>


                    <div class="profile-row">

                        <div class="profile-label">
                            Mobile
                        </div>

                        <div class="profile-value">
                            <%= mobile %>
                        </div>

                    </div>


                    <div class="profile-row">

                        <div class="profile-label">
                            Category
                        </div>

                        <div class="profile-value">
                            <%= category %>
                        </div>

                    </div>

                </div>



                <!-- LOCATION INFORMATION -->

                <div class="profile-card">

                    <div class="card-title">

                        <span class="card-title-icon">
                            📍
                        </span>

                        <h2>
                            Location Information
                        </h2>

                    </div>


                    <div class="profile-row">

                        <div class="profile-label">
                            State
                        </div>

                        <div class="profile-value">
                            <%= state %>
                        </div>

                    </div>


                    <div class="profile-row">

                        <div class="profile-label">
                            District
                        </div>

                        <div class="profile-value">
                            <%= district %>
                        </div>

                    </div>


                    <div class="profile-row">

                        <div class="profile-label">
                            Location
                        </div>

                        <div class="profile-value">
                            <%= location %>
                        </div>

                    </div>


                    <div class="profile-row">

                        <div class="profile-label">
                            Annual Income
                        </div>

                        <div class="profile-value">

                            <% if (!"Not Available".equals(annualIncome)) { %>

                                ₹ <%= annualIncome %>

                            <% } else { %>

                                Not Available

                            <% } %>

                        </div>

                    </div>

                </div>



                <!-- EDUCATION / BUSINESS INFORMATION -->

                <div class="profile-card">

                    <div class="card-title">

                        <span class="card-title-icon">
                            🎓
                        </span>

                        <h2>
                            Education / Professional Information
                        </h2>

                    </div>


                    <div class="profile-row">

                        <div class="profile-label">
                            Education / Business Type
                        </div>

                        <div class="profile-value">
                            <%= educationLevel %>
                        </div>

                    </div>


                    <div class="profile-row">

                        <div class="profile-label">
                            Course / Business Name
                        </div>

                        <div class="profile-value">
                            <%= courseName %>
                        </div>

                    </div>


                    <div class="profile-row">

                        <div class="profile-label">
                            User Category
                        </div>

                        <div class="profile-value">
                            <%= category %>
                        </div>

                    </div>

                </div>



                <!-- OTHER INFORMATION -->

                <div class="profile-card">

                    <div class="card-title">

                        <span class="card-title-icon">
                            📋
                        </span>

                        <h2>
                            Other Information
                        </h2>

                    </div>


                    <div class="profile-row">

                        <div class="profile-label">
                            Differently Abled
                        </div>

                        <div class="profile-value">
                            <%= disability %>
                        </div>

                    </div>


                    <div class="profile-row">

                        <div class="profile-label">
                            Bank / Account Status
                        </div>

                        <div class="profile-value">
                            <%= bankAccount %>
                        </div>

                    </div>


                    <div class="profile-row">

                        <div class="profile-label">
                            Profile Status
                        </div>

                        <div class="profile-value"
                             style="color:#16a34a;">

                            ✓ Active

                        </div>

                    </div>

                </div>

            </div>



            <!-- BACK BUTTON -->

           <div class="button-area">

    <a  href="<%= request.getContextPath() %>/Edit_Profile_servlet"
       class="edit-button">
        ✏ Edit Profile
    </a>

    <a href="<%= request.getContextPath() %>/User_Dashboard_servler"
       class="back-button">
        ← Back to Dashboard
    </a>

</div>


        </section>

    </main>

</div>


</body>

</html>