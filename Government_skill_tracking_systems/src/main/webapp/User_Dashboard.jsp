<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>

<%
    /* =========================================================
       USER INFORMATION
    ========================================================= */

    String userName =
            (String) request.getAttribute("fullName");

    String category =
            (String) request.getAttribute("category");


    if (userName == null || userName.trim().isEmpty()) {

        userName =
                (String) session.getAttribute("userName");
    }


    if (category == null || category.trim().isEmpty()) {

        category =
                (String) session.getAttribute("category");
    }


    if (userName == null || userName.trim().isEmpty()) {

        userName = "User";
    }


    if (category == null || category.trim().isEmpty()) {

        category = "Not Available";
    }



    /* =========================================================
       PROFILE INFORMATION
    ========================================================= */

    String profileAge =
            (String) request.getAttribute("age");

    String profileState =
            (String) request.getAttribute("state");

    String profileDistrict =
            (String) request.getAttribute("district");

    String profileIncome =
            (String) request.getAttribute("annualIncome");

    String profileMobile =
            (String) request.getAttribute("mobile");

    String profileEmail =
            (String) request.getAttribute("email");


    if (profileAge == null ||
        profileAge.trim().isEmpty()) {

        profileAge = "Not Available";
    }


    if (profileState == null ||
        profileState.trim().isEmpty()) {

        profileState = "Not Available";
    }


    if (profileDistrict == null) {

        profileDistrict = "";
    }


    if (profileIncome == null ||
        profileIncome.trim().isEmpty()) {

        profileIncome = "Not Available";
    }


    if (profileMobile == null ||
        profileMobile.trim().isEmpty()) {

        profileMobile = "Not Available";
    }


    if (profileEmail == null ||
        profileEmail.trim().isEmpty()) {

        profileEmail = "Not Available";
    }



    /* =========================================================
       PROFILE LOCATION
    ========================================================= */

    String profileLocation =
            profileState;


    if (!profileDistrict.trim().isEmpty()) {

        if (!"Not Available"
                .equalsIgnoreCase(profileState)) {

            profileLocation =
                    profileState + ", "
                    + profileDistrict;

        } else {

            profileLocation =
                    profileDistrict;
        }
    }



    /* =========================================================
       DASHBOARD COUNTS
    ========================================================= */

    Integer schemeCount =
            (Integer) request.getAttribute("schemeCount");

    Integer applicationCount =
            (Integer) request.getAttribute("applicationCount");

    Integer savedSchemeCount =
            (Integer) request.getAttribute("savedSchemeCount");


    if (schemeCount == null) {

        schemeCount = 0;
    }


    if (applicationCount == null) {

        applicationCount = 0;
    }


    if (savedSchemeCount == null) {

        savedSchemeCount = 0;
    }



    /* =========================================================
       ELIGIBLE SCHEMES
    ========================================================= */

    List<Map<String, Object>> eligibleSchemes =
            (List<Map<String, Object>>)
            request.getAttribute("eligibleSchemes");


    if (eligibleSchemes == null) {

        eligibleSchemes =
                new java.util.ArrayList<>();
    }

%>


<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>
    Smart Government Scheme Eligibility - Dashboard
</title>


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

    font-family:
        Arial,
        Helvetica,
        sans-serif;

    background: #f4f8fc;

    color: #14213d;
}


/* =========================================================
   MAIN LAYOUT
========================================================= */

.dashboard-container {

    display: flex;

    min-height: 100vh;
}


/* =========================================================
   SIDEBAR
========================================================= */

/* =========================================================
   SIDEBAR
========================================================= */

.sidebar {

    width: 275px;

    height: 100vh;

    background:
        linear-gradient(
            180deg,
            #123d7a,
            #082b5c
        );

    color: white;

    position: fixed;

    left: 0;
    top: 0;

    padding: 25px 14px;

    /* IMPORTANT */
    overflow-y: auto;
    overflow-x: hidden;

    /* IMPORTANT */
    display: flex;
    flex-direction: column;
}


/* SIDEBAR SCROLLBAR */

.sidebar::-webkit-scrollbar {
    width: 6px;
}

.sidebar::-webkit-scrollbar-track {
    background: transparent;
}

.sidebar::-webkit-scrollbar-thumb {
    background: rgba(255,255,255,0.3);
    border-radius: 10px;
}

.sidebar::-webkit-scrollbar-thumb:hover {
    background: rgba(255,255,255,0.5);
}
.sidebar::-webkit-scrollbar {
    width: 6px;
}

.sidebar::-webkit-scrollbar-track {
    background: transparent;
}

.sidebar::-webkit-scrollbar-thumb {
    background: rgba(255,255,255,0.3);
    border-radius: 10px;
}

.sidebar::-webkit-scrollbar-thumb:hover {
    background: rgba(255,255,255,0.5);
}


/* =========================================================
   LOGO
========================================================= */

.logo-section {

    display: flex;

    align-items: center;

    gap: 12px;

    padding:
        0 12px 25px;

    border-bottom:
        1px solid
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

/* =========================================================
   SIDEBAR MENU
========================================================= */

.sidebar-menu {

    margin-top: 22px;

    /* IMPORTANT */
    flex-shrink: 0;
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

    background:
        rgba(255,255,255,0.12);
}


.sidebar-menu a.active {

    background: #1769e0;
}


.menu-icon {

    width: 25px;

    text-align: center;

    font-size: 20px;

    flex-shrink: 0;
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

    background:
        rgba(255,255,255,0.12);
}


.sidebar-menu a.active {

    background: #1769e0;
}


.menu-icon {

    width: 25px;

    text-align: center;

    font-size: 20px;

    flex-shrink: 0;
}


/* =========================================================
   SIDEBAR BOTTOM CARD
========================================================= */

/* =========================================================
   SIDEBAR BOTTOM CARD
========================================================= */

.sidebar-bottom {
    position: static;
    margin: 10px 4px 0;   /* move it upward */

    background: #164a9b;
    border-radius: 12px;
    padding: 18px 12px;    /* reduce height */
    text-align: center;
    flex-shrink: 0;
}


.sidebar-bottom .building-icon {

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


.sidebar-bottom
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

    width:
        calc(100% - 275px);

    min-height: 100vh;
}


/* =========================================================
   TOP HEADER
========================================================= */

.top-header {

    height: 70px;

    background: white;

    border-bottom:
        1px solid #dce5ef;

    display: flex;

    align-items: center;

    justify-content: space-between;

    padding: 0 30px;
}


.menu-button {

    font-size: 27px;

    color: #14213d;

    cursor: pointer;
}


/* =========================================================
   HEADER RIGHT
========================================================= */

.header-right {

    display: flex;

    align-items: center;

    gap: 18px;
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

    font-size: 22px;
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
   CONTENT AREA
========================================================= */

.content-area {

    padding:
        25px 30px 30px;
}


/* =========================================================
   SUCCESS / WARNING / ERROR MESSAGES
========================================================= */

.success-message {

    background: #e7f8ed;

    color: #15803d;

    border:
        1px solid #b7ebc6;

    padding: 12px 15px;

    border-radius: 8px;

    margin-bottom: 18px;

    font-size: 14px;
}


.warning-message {

    background: #fff7df;

    color: #a16207;

    border:
        1px solid #f5df9b;

    padding: 12px 15px;

    border-radius: 8px;

    margin-bottom: 18px;

    font-size: 14px;
}


.error-message {

    background: #fff0f0;

    color: #dc2626;

    border:
        1px solid #fecaca;

    padding: 12px 15px;

    border-radius: 8px;

    margin-bottom: 18px;

    font-size: 14px;
}


/* =========================================================
   SUMMARY CARDS
========================================================= */

.summary-grid {

    display: grid;

    grid-template-columns:
        repeat(3, minmax(0, 1fr));

    gap: 18px;

    width: 100%;

    margin-bottom: 20px;
}


/* =========================================================
   SUMMARY CARD
========================================================= */

.summary-card {

    background: white;

    border-radius: 14px;

    padding: 20px;

    min-height: 125px;

    box-shadow:
        0 3px 12px
        rgba(30,60,90,0.08);

    border:
        1px solid #edf2f7;

    display: flex;

    align-items: center;

    gap: 16px;

    position: relative;

    transition:
        transform 0.2s ease,
        box-shadow 0.2s ease;
}


.summary-card:hover {

    transform:
        translateY(-2px);

    box-shadow:
        0 7px 18px
        rgba(30,60,90,0.12);
}


/* =========================================================
   CARD ICON
========================================================= */

.card-icon {

    width: 56px;

    height: 56px;

    min-width: 56px;

    border-radius: 13px;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 27px;

    flex-shrink: 0;
}


.blue-icon {

    background: #e3efff;

    color: #1769e0;
}


.green-icon {

    background: #e2f8eb;

    color: #16a34a;
}


.purple-icon {

    background: #eee8ff;

    color: #6d3bd1;
}


/* =========================================================
   CARD CONTENT
========================================================= */

.summary-card-content {

    flex: 1;

    min-width: 0;
}


.summary-card h3 {

    font-size: 14px;

    color: #253553;

    margin-bottom: 7px;

    font-weight: 600;
}


.summary-number {

    font-size: 29px;

    font-weight: bold;

    color: #14213d;

    margin-bottom: 6px;
}


.summary-link {

    font-size: 12px;

    color: #1769e0;

    text-decoration: none;

    font-weight: 500;
}


.summary-link:hover {

    text-decoration: underline;
}


/* =========================================================
   CARD ARROW
========================================================= */

.summary-arrow {

    width: 32px;

    height: 32px;

    border:
        1px solid #d5dfeb;

    border-radius: 50%;

    display: flex;

    align-items: center;

    justify-content: center;

    color: #52647d;

    font-size: 19px;

    flex-shrink: 0;
}


/* =========================================================
   MAIN TWO COLUMN AREA
========================================================= */

.main-grid {

    display: grid;

    grid-template-columns:
        420px minmax(0, 1fr);

    gap: 18px;

    margin-bottom: 18px;
}


/* =========================================================
   COMMON PANEL
========================================================= */

.panel {

    background: white;

    border-radius: 12px;

    padding: 20px;

    box-shadow:
        0 3px 12px
        rgba(30,60,90,0.08);

    min-width: 0;
}


/* =========================================================
   PANEL HEADER
========================================================= */

.panel-header {

    display: flex;

    align-items: center;

    justify-content: space-between;

    gap: 10px;

    margin-bottom: 15px;
}


.panel-title {

    display: flex;

    align-items: center;

    gap: 10px;

    min-width: 0;
}


.panel-title h2 {

    font-size: 20px;

    color: #14213d;
}


.panel-title-icon {

    font-size: 23px;

    color: #1769e0;
}


.view-button {

    border:
        1px solid #cfe0f7;

    background: #f5f9ff;

    color: #1769e0;

    padding: 8px 13px;

    border-radius: 7px;

    text-decoration: none;

    font-size: 12px;

    white-space: nowrap;
}


.view-button:hover {

    background: #eaf3ff;
}


/* =========================================================
   PROFILE SUMMARY
========================================================= */

.profile-row {

    display: grid;

    grid-template-columns:
        140px minmax(0, 1fr);

    align-items: center;

    padding: 11px 0;

    border-bottom:
        1px solid #e8eef5;
}


.profile-row:last-child {

    border-bottom: none;
}


.profile-label {

    color: #40516a;

    font-size: 14px;
}


.profile-value {

    color: #162541;

    font-size: 14px;

    font-weight: 500;

    word-break: break-word;
}


/* =========================================================
   ELIGIBLE SCHEMES
========================================================= */

.scheme-list {

    display: flex;

    flex-direction: column;

    gap: 10px;
}


.scheme-item {

    border:
        1px solid #e0e8f2;

    border-radius: 12px;

    padding: 15px;

    display: grid;

    grid-template-columns:
        65px minmax(0, 1fr) 80px 115px;

    align-items: center;

    gap: 15px;
}


.scheme-icon {

    width: 55px;

    height: 55px;

    background: #f1f7ff;

    border-radius: 50%;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 28px;
}


.scheme-name {

    font-size: 15px;

    font-weight: bold;

    color: #14213d;

    margin-bottom: 6px;
}


.scheme-description {

    font-size: 13px;

    color: #53657d;

    line-height: 1.5;
}


.match-percentage {

    color: #16a34a;

    font-size: 21px;

    font-weight: bold;
}


.match-text {

    color: #16a34a;

    font-size: 12px;

    margin-top: 3px;
}


/* =========================================================
   DETAILS BUTTON
========================================================= */

.details-button {

    display: block;

    background: #19a957;

    color: white;

    text-decoration: none;

    text-align: center;

    padding: 11px 8px;

    border-radius: 7px;

    font-size: 12px;

    font-weight: bold;
}


.details-button:hover {

    background: #138a46;
}


/* =========================================================
   SAVE BUTTON
========================================================= */

.save-button {

    width: 100%;

    margin-top: 7px;

    background: #f5f9ff;

    color: #1769e0;

    border:
        1px solid #cfe0f7;

    padding: 8px 10px;

    border-radius: 7px;

    font-size: 11px;

    cursor: pointer;
}


.save-button:hover {

    background: #eaf3ff;
}


/* =========================================================
   NO SCHEMES
========================================================= */

.no-schemes {

    text-align: center;

    padding: 35px;

    color: #68788f;
}


.no-schemes-icon {

    font-size: 40px;

    margin-bottom: 10px;
}


/* =========================================================
   RESPONSIVE - 1200px
========================================================= */

@media(max-width: 1200px) {

    .summary-grid {

        grid-template-columns:
            repeat(3, minmax(0, 1fr));

        gap: 14px;
    }


    .summary-card {

        padding: 16px;

        gap: 12px;
    }


    .card-icon {

        width: 50px;

        height: 50px;

        min-width: 50px;

        font-size: 24px;
    }


    .summary-number {

        font-size: 26px;
    }


    .main-grid {

        grid-template-columns:
            380px minmax(0, 1fr);
    }


    .scheme-item {

        grid-template-columns:
            55px minmax(0, 1fr)
            70px 105px;

        gap: 10px;
    }

}


/* =========================================================
   RESPONSIVE - 950px
========================================================= */

@media(max-width: 950px) {

    .sidebar {

        width: 230px;
    }


    .main-content {

        margin-left: 230px;

        width:
            calc(100% - 230px);
    }


    .summary-grid {

        grid-template-columns:
            repeat(3, minmax(0, 1fr));
    }


    .summary-card {

        min-height: 110px;

        padding: 14px;
    }


    .summary-card h3 {

        font-size: 13px;
    }


    .summary-number {

        font-size: 24px;
    }


    .summary-arrow {

        display: none;
    }


    .main-grid {

        grid-template-columns: 1fr;
    }

}


/* =========================================================
   RESPONSIVE - 800px
========================================================= */

@media(max-width: 800px) {

    .sidebar {

        width: 75px;

        padding:
            25px 10px;
    }


    .logo-text {

        display: none;
    }


    .logo-section {

        justify-content: center;

        padding:
            0 0 25px;
    }


    .sidebar-menu a {

        justify-content: center;

        padding: 14px 5px;
    }


    .sidebar-menu a span:not(.menu-icon) {

        display: none;
    }


    .sidebar-menu {

        margin-top: 22px;
    }


    .menu-icon {

        font-size: 22px;
    }


    .sidebar-bottom {

        display: none;
    }


    .main-content {

        margin-left: 75px;

        width:
            calc(100% - 75px);
    }


    .content-area {

        padding:
            20px;
    }


    .summary-grid {

        grid-template-columns:
            1fr;
    }


    .summary-card {

        min-height: 105px;
    }


    .summary-arrow {

        display: flex;
    }


    .scheme-item {

        grid-template-columns:
            55px minmax(0, 1fr);
    }


    .match-area {

        grid-column: 2;
    }


    .scheme-button-area {

        grid-column: 2;
    }

}


/* =========================================================
   RESPONSIVE - 600px
========================================================= */

@media(max-width: 600px) {

    .top-header {

        height: 65px;

        padding:
            0 18px;
    }


    .header-right {

        gap: 8px;
    }


    .user-info > div {

        display: none;
    }


    .content-area {

        padding: 18px;
    }


    .panel {

        padding: 15px;
    }


    .panel-title h2 {

        font-size: 17px;
    }


    .profile-row {

        grid-template-columns: 1fr;

        gap: 5px;
    }


    .scheme-item {

        grid-template-columns:
            1fr;
    }


    .match-area {

        grid-column: 1;
    }


    .scheme-button-area {

        grid-column: 1;
    }


    .scheme-icon {

        margin-bottom: 5px;
    }

}

</style>

</head>


<body>


<div class="dashboard-container">


    <!-- =====================================================
         SIDEBAR
    ====================================================== -->

    <aside class="sidebar">


        <!-- LOGO -->

        <div class="logo-section">

            <div class="logo-icon">
                🏛️
            </div>

            <div class="logo-text">

                SMART GOVERNMENT<br>
                SCHEME ELIGIBILITY

            </div>

        </div>


        <!-- SIDEBAR MENU -->

        <nav class="sidebar-menu">


            <!-- DASHBOARD -->

            <a href="User_Dashboard_servler"
               class="active">

                <span class="menu-icon">
                    ⌂
                </span>

                <span>
                    Dashboard
                </span>

            </a>


            <!-- MY PROFILE -->

             <a href="<%= request.getContextPath() %>/View_Profile_servlet">
                          

                <span class="menu-icon">
                    ♙
                </span>

                <span>
                    My Profile
                </span>

            </a>


            <!-- ELIGIBLE SCHEMES -->

            <a href="#eligibleSchemes">

                <span class="menu-icon">
                    ▣
                </span>

                <span>
                    Eligible Schemes
                </span>

            </a>


            <!-- MY APPLICATIONS -->

            <a href="My_Applications_servlet">

                <span class="menu-icon">
                    ☑
                </span>

                <span>
                    My Applications
                </span>

            </a>


            <!-- SAVED SCHEMES -->

            <a href="Saved_Schemes_servlet">

                <span class="menu-icon">
                    ♡
                </span>

                <span>
                    Saved Schemes
                </span>

            </a>


            <!-- CHANGE PASSWORD -->

            <a href="Change_Password.jsp">

                <span class="menu-icon">
                    ?
                </span>

                <span>
                    Change Password
                </span>

            </a>


            <!-- HELP & SUPPORT -->

            <a href="Help_Support.jsp">

                <span class="menu-icon">
                    ♧
                </span>

                <span>
                    Help &amp; Support
                </span>

            </a>


            <!-- LOGOUT -->

            <a href="Logout_Servlet">

                <span class="menu-icon">
                    →
                </span>

                <span>
                    Logout
                </span>

            </a>


        </nav>


        <!-- SIDEBAR BOTTOM -->

        <div class="sidebar-bottom">

            <div class="building-icon">
                🏛️
            </div>

            <h3>
                Empowering Citizens
            </h3>

            <p>
                Building a Better India
            </p>

        </div>


    </aside>



    <!-- =====================================================
         MAIN CONTENT
    ====================================================== -->

    <main class="main-content">


        <!-- =================================================
             TOP HEADER
        ================================================== -->

        <header class="top-header">


            <div class="menu-button">
                ☰
            </div>


            <div class="header-right">


                <!-- USER -->

                <div class="user-info">


                    <div class="user-avatar">
                        👤
                    </div>


                    <div>

                        <div class="user-name">
                            <%= userName %>
                        </div>

                        <div class="user-category">
                            <%= category %>
                        </div>

                    </div>


                    <span>
                        ⌄
                    </span>


                </div>


            </div>


        </header>



        <!-- =================================================
             CONTENT AREA
        ================================================== -->

        <section class="content-area">


            <!-- =================================================
                 SAVE SCHEME MESSAGE
            ================================================== -->

            <%
                String message =
                        request.getParameter("message");
            %>


            <% if ("saved".equals(message)) { %>

                <div class="success-message">

                    ✓ Scheme saved successfully!

                </div>

            <% } else if
                ("alreadySaved".equals(message)) { %>

                <div class="warning-message">

                    ⚠ You have already saved this scheme.

                </div>

            <% } else if
                ("error".equals(message)) { %>

                <div class="error-message">

                    ✗ Unable to save scheme.
                    Please try again.

                </div>

            <% } %>



            <!-- =================================================
                 SUMMARY CARDS
            ================================================== -->

            <div class="summary-grid">


                <!-- =================================================
                     ELIGIBLE SCHEMES CARD
                ================================================== -->

                <div class="summary-card">


                    <div class="card-icon blue-icon">

                        📄

                    </div>


                    <div class="summary-card-content">


                        <h3>
                            Eligible Schemes
                        </h3>


                        <div class="summary-number">

                            <%= schemeCount %>

                        </div>


                        <a href="#eligibleSchemes"
                           class="summary-link">

                            View all schemes →

                        </a>


                    </div>


                    <div class="summary-arrow">

                        ›

                    </div>


                </div>



                <!-- =================================================
                     APPLICATIONS CARD
                ================================================== -->

                <div class="summary-card">


                    <div class="card-icon green-icon">

                        ☑

                    </div>


                    <div class="summary-card-content">


                        <h3>
                            My Applications
                        </h3>


                        <div class="summary-number">

                            <%= applicationCount %>

                        </div>


                        <a href="My_Applications_servlet"
                           class="summary-link">

                            Track status →

                        </a>


                    </div>


                    <div class="summary-arrow">

                        ›

                    </div>


                </div>



                <!-- =================================================
                     SAVED SCHEMES CARD
                ================================================== -->

                <div class="summary-card">


                    <div class="card-icon purple-icon">

                        🔖

                    </div>


                    <div class="summary-card-content">


                        <h3>
                            Saved Schemes
                        </h3>


                        <div class="summary-number">

                            <%= savedSchemeCount %>

                        </div>


                        <a href="Saved_Schemes_servlet"
                           class="summary-link">

                            View saved →

                        </a>


                    </div>


                    <div class="summary-arrow">

                        ›

                    </div>


                </div>


            </div>



            <!-- =================================================
                 PROFILE + ELIGIBLE SCHEMES
            ================================================== -->

            <div class="main-grid">


                <!-- =================================================
                     PROFILE SUMMARY
                ================================================== -->

                <div class="panel">


                    <div class="panel-header">


                        <div class="panel-title">


                            <span class="panel-title-icon">
                                👤
                            </span>


                            <h2>
                                My Profile Summary
                            </h2>


                        </div>


                        <a href="<%= request.getContextPath() %>/View_Profile_servlet"
                           class="view-button">

                            View Profile

                        </a>


                    </div>



                    <!-- NAME -->

                    <div class="profile-row">

                        <div class="profile-label">
                            Name
                        </div>

                        <div class="profile-value">

                            <%= userName %>

                        </div>

                    </div>



                    <!-- CATEGORY -->

                    <div class="profile-row">

                        <div class="profile-label">
                            Category
                        </div>

                        <div class="profile-value">

                            <%= category %>

                        </div>

                    </div>



                    <!-- AGE -->

                    <div class="profile-row">

                        <div class="profile-label">
                            Age
                        </div>

                        <div class="profile-value">

                            <%= profileAge %>

                            <% if
                                (!"Not Available"
                                .equals(profileAge)) { %>

                                Years

                            <% } %>

                        </div>

                    </div>



                    <!-- LOCATION -->

                    <div class="profile-row">

                        <div class="profile-label">
                            Location
                        </div>

                        <div class="profile-value">

                            <%= profileLocation %>

                        </div>

                    </div>



                    <!-- FAMILY INCOME -->

                    <div class="profile-row">

                        <div class="profile-label">
                            Family Income
                        </div>

                        <div class="profile-value">


                            <% if
                                (!"Not Available"
                                .equals(profileIncome)) { %>

                                ₹ <%= profileIncome %>
                                / Year

                            <% } else { %>

                                Not Available

                            <% } %>


                        </div>

                    </div>



                    <!-- MOBILE -->

                    <div class="profile-row">

                        <div class="profile-label">
                            Mobile
                        </div>

                        <div class="profile-value">

                            <%= profileMobile %>

                        </div>

                    </div>



                    <!-- EMAIL -->

                    <div class="profile-row">

                        <div class="profile-label">
                            Email
                        </div>

                        <div class="profile-value">

                            <%= profileEmail %>

                        </div>

                    </div>


                </div>



                <!-- =================================================
                     ELIGIBLE GOVERNMENT SCHEMES
                ================================================== -->

                <div class="panel"
                     id="eligibleSchemes">


                    <div class="panel-header">


                        <div class="panel-title">


                            <span class="panel-title-icon"
                                  style="color:#16a34a;">

                                🛡

                            </span>


                            <h2>

                                Eligible Government
                                Schemes for You

                            </h2>


                        </div>


                        <a href="Eligible_Schemes.jsp"
                           class="view-button">

                            View All

                        </a>


                    </div>



                    <!-- SCHEME LIST -->

                    <div class="scheme-list">


                        <%
                            if (eligibleSchemes.isEmpty()) {
                        %>


                            <!-- NO SCHEMES -->

                            <div class="no-schemes">


                                <div class="no-schemes-icon">

                                    📄

                                </div>


                                <div>

                                    No eligible schemes
                                    found for your profile.

                                </div>


                            </div>


                        <%
                            } else {


                                for
                                (Map<String, Object> scheme
                                : eligibleSchemes) {


                                    Object schemeIdObj =
                                            scheme.get(
                                                "scheme_id"
                                            );


                                    Object schemeNameObj =
                                            scheme.get(
                                                "scheme_name"
                                            );


                                    Object descriptionObj =
                                            scheme.get(
                                                "description"
                                            );


                                    Object matchObj =
                                            scheme.get(
                                                "matchPercentage"
                                            );


                                    String schemeId =

                                            schemeIdObj == null
                                            ? ""
                                            : schemeIdObj.toString();


                                    String schemeName =

                                            schemeNameObj == null
                                            ? "Government Scheme"
                                            : schemeNameObj.toString();


                                    String description =

                                            descriptionObj == null
                                            ? "Government welfare scheme."
                                            : descriptionObj.toString();


                                    String matchPercentage =

                                            matchObj == null
                                            ? "100"
                                            : matchObj.toString();

                        %>


                        <!-- =================================================
                             SINGLE SCHEME
                        ================================================== -->

                        <div class="scheme-item">


                            <!-- SCHEME ICON -->

                            <div class="scheme-icon">

                                🇮🇳

                            </div>


                            <!-- SCHEME INFORMATION -->

                            <div>


                                <div class="scheme-name">

                                    <%= schemeName %>

                                </div>


                                <div class="scheme-description">

                                    <%= description %>

                                </div>


                            </div>


                            <!-- MATCH -->

                            <div class="match-area">


                                <div class="match-percentage">

                                    <%= matchPercentage %>%

                                </div>


                                <div class="match-text">

                                    Match

                                </div>


                            </div>


                            <!-- BUTTONS -->

                            <div class="scheme-button-area">


                                <!-- VIEW DETAILS -->

                                <a href="Scheme_Details_servlet?id=<%= schemeId %>"
                                   class="details-button">

                                    View Details

                                </a>


                                <!-- SAVE SCHEME -->

                                <form
                                    action="<%= request.getContextPath() %>/Saved_Schemes_servlet"
                                    method="post">


                                    <input
                                        type="hidden"
                                        name="schemeId"
                                        value="<%= schemeId %>">


                                    <button
                                        type="submit"
                                        class="save-button">

                                        ♡ Save Scheme

                                    </button>


                                </form>


                            </div>


                        </div>


                        <%
                                }
                            }
                        %>


                    </div>


                </div>


            </div>


        </section>


    </main>


</div>


</body>

</html>