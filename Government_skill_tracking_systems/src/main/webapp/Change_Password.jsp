<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Change Password - Smart Government Scheme Eligibility</title>

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

/* MAIN CONTAINER */

.dashboard-container {
    display: flex;
    min-height: 100vh;
}

/* SIDEBAR */

.sidebar {
    width: 275px;
    height: 100vh;

    background: linear-gradient(
        180deg,
        #123d7a,
        #082b5c
    );

    color: white;

    position: fixed;
    left: 0;
    top: 0;

    padding: 25px 14px;

    overflow-y: auto;
}

/* LOGO */

.logo-section {
    display: flex;
    align-items: center;

    gap: 12px;

    padding: 0 12px 25px;

    border-bottom:
        1px solid rgba(255,255,255,0.15);
}

.logo-icon {
    font-size: 42px;
}

.logo-text {
    font-size: 16px;
    font-weight: bold;
    line-height: 1.4;
}

/* MENU */

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

/* SIDEBAR BOTTOM */

.sidebar-bottom {
    margin: 25px 4px 0;

    background: #164a9b;

    border-radius: 12px;

    padding: 25px 12px;

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
}

/* USER */

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

/* CONTENT */

.content-area {
    padding: 35px;
}

/* PASSWORD PANEL */

.password-panel {
    max-width: 600px;

    margin: 30px auto;

    background: white;

    border-radius: 14px;

    padding: 30px;

    box-shadow:
        0 3px 12px
        rgba(30,60,90,0.08);

    border:
        1px solid #edf2f7;
}

.password-header {
    margin-bottom: 25px;
}

.password-header h2 {
    font-size: 24px;

    color: #14213d;

    margin-bottom: 8px;
}

.password-header p {
    font-size: 14px;

    color: #64748b;
}

/* FORM */

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;

    font-size: 14px;

    font-weight: 600;

    color: #40516a;

    margin-bottom: 8px;
}

.form-group input {
    width: 100%;

    padding: 12px 14px;

    border:
        1px solid #cfd9e6;

    border-radius: 8px;

    font-size: 14px;

    outline: none;

    transition: 0.2s;
}

.form-group input:focus {
    border-color: #1769e0;

    box-shadow:
        0 0 0 3px
        rgba(23,105,224,0.1);
}

/* BUTTONS */

.button-area {
    display: flex;

    gap: 12px;

    margin-top: 25px;
}

.update-button {
    flex: 1;

    border: none;

    background: #1769e0;

    color: white;

    padding: 12px;

    border-radius: 8px;

    font-size: 14px;

    font-weight: bold;

    cursor: pointer;
}

.update-button:hover {
    background: #1258bd;
}

.cancel-button {
    flex: 1;

    text-align: center;

    text-decoration: none;

    background: #f5f9ff;

    color: #1769e0;

    border:
        1px solid #cfe0f7;

    padding: 12px;

    border-radius: 8px;

    font-size: 14px;

    font-weight: bold;
}

.cancel-button:hover {
    background: #eaf3ff;
}

/* MESSAGES */

.message {
    padding: 12px 15px;

    border-radius: 8px;

    margin-bottom: 20px;

    font-size: 14px;
}

.success {
    background: #e7f8ed;

    color: #15803d;

    border:
        1px solid #b7ebc6;
}

.error {
    background: #fff0f0;

    color: #dc2626;

    border:
        1px solid #fecaca;
}

/* RESPONSIVE */

@media(max-width: 800px) {

    .sidebar {
        width: 75px;

        padding: 25px 10px;
    }

    .logo-text {
        display: none;
    }

    .logo-section {
        justify-content: center;
    }

    .sidebar-menu a {
        justify-content: center;

        padding: 14px 5px;
    }

    .sidebar-menu a span:not(.menu-icon) {
        display: none;
    }

    .sidebar-bottom {
        display: none;
    }

    .main-content {
        margin-left: 75px;

        width: calc(100% - 75px);
    }

    .content-area {
        padding: 20px;
    }
}

</style>

</head>

<body>

<div class="dashboard-container">

    <!-- SIDEBAR -->

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


        <!-- MENU -->

        <nav class="sidebar-menu">

            <a href="User_Dashboard_servler">

                <span class="menu-icon">
                    ⌂
                </span>

                <span>
                    Dashboard
                </span>

            </a>


            <a href="<%= request.getContextPath() %>/View_Profile_servlet">

                <span class="menu-icon">
                    ♙
                </span>

                <span>
                    My Profile
                </span>

            </a>


            <a href="User_Dashboard_servler#eligibleSchemes">

                <span class="menu-icon">
                    ▣
                </span>

                <span>
                    Eligible Schemes
                </span>

            </a>


            <a href="My_Applications_servlet">

                <span class="menu-icon">
                    ☑
                </span>

                <span>
                    My Applications
                </span>

            </a>


            <a href="Saved_Schemes_servlet">

                <span class="menu-icon">
                    ♡
                </span>

                <span>
                    Saved Schemes
                </span>

            </a>


            <!-- ACTIVE -->

            <a href="Change_Password.jsp"
               class="active">

                <span class="menu-icon">
                    ?
                </span>

                <span>
                    Change Password
                </span>

            </a>


            <a href="Help_Support.jsp">

                <span class="menu-icon">
                    ♧
                </span>

                <span>
                    Help &amp; Support
                </span>

            </a>


            <a href="logout">

                <span class="menu-icon">
                    →
                </span>

                <span>
                    Logout
                </span>

            </a>

        </nav>


        <!-- BOTTOM -->

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


    <!-- MAIN CONTENT -->

    <main class="main-content">


        <!-- HEADER -->

        <header class="top-header">

            <div class="menu-button">
                ☰
            </div>


            <div class="header-right">

                <div class="user-info">

                    <div class="user-avatar">
                        👤
                    </div>

                    <div>

                        <div class="user-name">

                            <%= session.getAttribute("fullName") != null
                                ? session.getAttribute("fullName")
                                : "User" %>

                        </div>

                        <div class="user-category">

                            <%= session.getAttribute("category") != null
                                ? session.getAttribute("category")
                                : "User" %>

                        </div>

                    </div>

                </div>

            </div>

        </header>


        <!-- CONTENT -->

        <section class="content-area">


            <div class="password-panel">


                <div class="password-header">

                    <h2>
                        Change Password
                    </h2>

                    <p>
                        Update your account password securely.
                    </p>

                </div>


                <!-- SUCCESS MESSAGE -->

                <%

                    String message =
                        request.getParameter("message");

                    if ("success".equals(message)) {

                %>

                    <div class="message success">
                        ✓ Password changed successfully.
                    </div>

                <%

                    }

                    if ("error".equals(message)) {

                %>

                    <div class="message error">
                        ✗ Unable to change password.
                        Please try again.
                    </div>

                <%

                    }

                    if ("incorrect".equals(message)) {

                %>

                    <div class="message error">
                        ✗ Current password is incorrect.
                    </div>

                <%

                    }

                    if ("mismatch".equals(message)) {

                %>

                    <div class="message error">
                        ✗ New password and confirm password do not match.
                    </div>

                <%

                    }

                    if ("same".equals(message)) {

                %>

                    <div class="message error">
                        ✗ New password must be different from current password.
                    </div>

                <%

                    }

                %>


                <!-- FORM -->

                <form action="<%= request.getContextPath() %>/Change_Password_servlet"
                      method="post">


                    <!-- CURRENT PASSWORD -->

                    <div class="form-group">

                        <label for="currentPassword">
                            Current Password
                        </label>

                        <input
                            type="password"
                            id="currentPassword"
                            name="currentPassword"
                            placeholder="Enter current password"
                            required>

                    </div>


                    <!-- NEW PASSWORD -->

                    <div class="form-group">

                        <label for="newPassword">
                            New Password
                        </label>

                        <input
                            type="password"
                            id="newPassword"
                            name="newPassword"
                            placeholder="Enter new password"
                            required>

                    </div>


                    <!-- CONFIRM PASSWORD -->

                    <div class="form-group">

                        <label for="confirmPassword">
                            Confirm New Password
                        </label>

                        <input
                            type="password"
                            id="confirmPassword"
                            name="confirmPassword"
                            placeholder="Confirm new password"
                            required>

                    </div>


                    <!-- BUTTONS -->

                    <div class="button-area">

                        <button
                            type="submit"
                            class="update-button">

                            Update Password

                        </button>


                        <a
                            href="User_Dashboard_servler"
                            class="cancel-button">

                            Cancel

                        </a>

                    </div>

                </form>

            </div>

        </section>

    </main>

</div>

</body>

</html>