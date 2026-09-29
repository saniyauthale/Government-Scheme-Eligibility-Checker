<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>

<%
    // Get user information from session
    String userName = (String) session.getAttribute("userName");
    String category = (String) session.getAttribute("category");

    if (userName == null) {
        userName = "User";
    }

    if (category == null) {
        category = "User";
    }

    // Get saved scheme data from Saved_Schemes_servlet
    List<Integer> schemeIds =
        (List<Integer>) request.getAttribute("schemeIds");

    List<String> schemeNames =
        (List<String>) request.getAttribute("schemeNames");

    List<String> descriptions =
        (List<String>) request.getAttribute("descriptions");

    List<String> savedDates =
        (List<String>) request.getAttribute("savedDates");
%>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Saved Schemes</title>

<style>

/* =========================
   BODY
========================= */

body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f4f7fb;
}


/* =========================
   SIDEBAR
========================= */

.sidebar {
    position: fixed;
    left: 0;
    top: 0;

    width: 300px;
    height: 100vh;

    background: #123f7a;
    color: white;

    padding: 20px;

    box-sizing: border-box;
}


.logo-section {
    display: flex;
    align-items: center;

    gap: 15px;

    padding-bottom: 25px;

    border-bottom: 1px solid rgba(255,255,255,0.2);
}


.logo-icon {
    font-size: 40px;
}


.logo-text {
    font-size: 18px;

    font-weight: bold;

    line-height: 1.4;
}


.sidebar-menu {
    margin-top: 25px;
}


.sidebar-menu a {

    display: flex;

    align-items: center;

    gap: 15px;

    color: white;

    text-decoration: none;

    padding: 15px;

    margin-bottom: 8px;

    border-radius: 10px;
}


.sidebar-menu a:hover {

    background: #1767c9;
}


.sidebar-menu a.active {

    background: #2474df;
}


.menu-icon {

    font-size: 20px;

}


/* =========================
   MAIN CONTENT
========================= */

.main-content {

    margin-left: 300px;

    min-height: 100vh;
}


/* =========================
   HEADER
========================= */

.top-header {

    height: 75px;

    background: white;

    display: flex;

    align-items: center;

    justify-content: space-between;

    padding: 0 35px;

    box-shadow: 0 1px 5px rgba(0,0,0,0.08);
}


.menu-button {

    font-size: 28px;

}


.header-right {

    display: flex;

    align-items: center;

    gap: 25px;

}


.header-notification {

    font-size: 25px;

}


.user-info {

    display: flex;

    align-items: center;

    gap: 10px;

}


.user-avatar {

    width: 42px;

    height: 42px;

    border-radius: 50%;

    background: #174a9c;

    display: flex;

    justify-content: center;

    align-items: center;

}


.user-name {

    font-weight: bold;

}


.user-category {

    color: #777;

    font-size: 14px;

}


/* =========================
   CONTENT
========================= */

.content-area {

    padding: 35px;

}


.welcome-section h1 {

    color: #12345d;

}


.welcome-section p {

    color: #555;

}


/* =========================
   PANEL
========================= */

.panel {

    background: white;

    border-radius: 15px;

    padding: 25px;

    margin-top: 25px;

    box-shadow: 0 3px 10px rgba(0,0,0,0.06);

}


.panel-header {

    display: flex;

    justify-content: space-between;

    align-items: center;

}


.panel-title {

    display: flex;

    align-items: center;

    gap: 10px;

}


.panel-title h2 {

    color: #12345d;

}


/* =========================
   SCHEME CARD
========================= */

.scheme-item {

    border: 1px solid #e0e6ef;

    border-radius: 12px;

    padding: 20px;

    margin-top: 15px;

    display: flex;

    align-items: center;

    gap: 20px;

    background: white;

}


.scheme-icon {

    width: 55px;

    height: 55px;

    border-radius: 50%;

    background: #eef5ff;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 28px;

}


.scheme-info {

    flex: 1;

}


.scheme-name {

    font-size: 19px;

    font-weight: bold;

    color: #12345d;

    margin-bottom: 8px;

}


.scheme-description {

    color: #555;

    line-height: 1.5;

}


.saved-date {

    color: #777;

    font-size: 13px;

    margin-top: 8px;

}


/* =========================
   VIEW DETAILS BUTTON
========================= */

.view-button {

    background: #16a34a;

    color: white;

    padding: 10px 18px;

    border-radius: 7px;

    text-decoration: none;

    font-weight: bold;

}


.view-button:hover {

    background: #12823b;

}


/* =========================
   EMPTY MESSAGE
========================= */

.empty-message {

    text-align: center;

    padding: 50px;

    color: #666;

    font-size: 18px;

}


.browse-button {

    display: inline-block;

    margin-top: 15px;

    padding: 10px 18px;

    background: #2474df;

    color: white;

    text-decoration: none;

    border-radius: 7px;

}

</style>

</head>


<body>


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


        <!-- DASHBOARD -->

        <a href="User_Dashboard_servler">

            <span class="menu-icon">
                ⌂
            </span>

            <span>
                Dashboard
            </span>

        </a>


        <!-- MY PROFILE -->

        <a href="My_Profile.jsp">

            <span class="menu-icon">
                ♙
            </span>

            <span>
                My Profile
            </span>

        </a>


        <!-- ELIGIBLE SCHEMES -->

        <a href="User_Dashboard_servler#eligibleSchemes">

            <span class="menu-icon">
                ▣
            </span>

            <span>
                Eligible Schemes
            </span>

        </a>


        <!-- APPLICATIONS -->

        <a href="My_Applications_servlet">

            <span class="menu-icon">
                ☑
            </span>

            <span>
                My Applications
            </span>

        </a>


        <!-- SAVED SCHEMES -->

        <a href="Saved_Schemes_servlet" class="active">

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


        <!-- HELP -->

        <a href="Help_Support.jsp">

            <span class="menu-icon">
                ♧
            </span>

            <span>
                Help & Support
            </span>

        </a>


        <!-- LOGOUT -->

        <a href="logout">

            <span class="menu-icon">
                →
            </span>

            <span>
                Logout
            </span>

        </a>


    </nav>

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


            <div class="header-notification">
                🔔
            </div>


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


            </div>

        </div>

    </header>



    <!-- =====================================================
         CONTENT
    ====================================================== -->

    <section class="content-area">


        <!-- WELCOME -->

        <div class="welcome-section">


            <h1>

                Saved Schemes 🔖

            </h1>


            <p>

                Here you can view the government schemes you have saved.

            </p>


        </div>



        <!-- =================================================
             SAVED SCHEMES PANEL
        ================================================== -->

        <div class="panel">


            <div class="panel-header">


                <div class="panel-title">


                    <span>

                        🔖

                    </span>


                    <h2>

                        My Saved Schemes

                    </h2>


                </div>


            </div>



            <%
                /*
                 * Check whether the user has saved any schemes.
                 */

                if (schemeNames == null ||
                    schemeNames.isEmpty()) {
            %>


                <!-- NO SAVED SCHEMES -->

                <div class="empty-message">


                    <p>

                        You haven't saved any schemes yet.

                    </p>


                    <a
                        href="User_Dashboard_servler"
                        class="browse-button">

                        Browse Eligible Schemes

                    </a>


                </div>


            <%
                } else {


                    /*
                     * Display every saved scheme.
                     */

                    for (int i = 0;
                         i < schemeNames.size();
                         i++) {
            %>


                <!-- =================================================
                     SAVED SCHEME CARD
                ================================================== -->

                <div class="scheme-item">


                    <!-- ICON -->

                    <div class="scheme-icon">

                        🔖

                    </div>



                    <!-- SCHEME INFORMATION -->

                    <div class="scheme-info">


                        <div class="scheme-name">

                            <%= schemeNames.get(i) %>

                        </div>


                        <div class="scheme-description">

                            <%= descriptions.get(i) %>

                        </div>


                        <div class="saved-date">

                            Saved on:

                            <%= savedDates.get(i) %>

                        </div>


                    </div>



                    <!-- VIEW DETAILS -->

                    <div>


                        <a
                            href="Scheme_Details.jsp?id=<%= schemeIds.get(i) %>"
                            class="view-button">

                            View Details

                        </a>


                    </div>


                </div>


            <%
                    }
                }
            %>


        </div>


    </section>


</main>


</body>

</html>