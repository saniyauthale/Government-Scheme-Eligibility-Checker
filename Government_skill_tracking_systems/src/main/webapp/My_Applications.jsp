<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="User_Dashboard_servler.My_Applications_servlet.Application"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>My Applications</title>

<style>

body {
    font-family: Arial, sans-serif;
    background: #f4f8fc;
    margin: 0;
    padding: 30px;
}

.container {
    max-width: 1100px;
    margin: auto;
}

h1 {
    color: #14213d;
}

.application-card {
    background: white;
    border-radius: 12px;
    padding: 20px;
    margin-top: 20px;
    box-shadow: 0 3px 12px rgba(30,60,90,0.08);
}

.row {
    display: grid;
    grid-template-columns: 180px 1fr;
    padding: 12px 0;
    border-bottom: 1px solid #e5eaf0;
}

.label {
    font-weight: bold;
    color: #52647d;
}

.value {
    color: #14213d;
}

.status {
    display: inline-block;
    padding: 7px 15px;
    border-radius: 20px;
    background: #fff3cd;
    color: #856404;
    font-weight: bold;
}

.no-applications {
    background: white;
    padding: 50px;
    text-align: center;
    border-radius: 12px;
    margin-top: 20px;
    color: #66758b;
}

.back-button {
    display: inline-block;
    margin-top: 20px;
    padding: 10px 18px;
    background: #1769e0;
    color: white;
    text-decoration: none;
    border-radius: 7px;
}

</style>

</head>

<body>

<div class="container">

    <h1>My Applications</h1>

    <%
        List<Application> applications =
            (List<Application>) request.getAttribute("applications");
    %>


    <% if (applications == null || applications.isEmpty()) { %>

        <div class="no-applications">

            <h2>No Applications Found</h2>

            <p>
                You have not applied for any government scheme yet.
            </p>

        </div>

    <% } else { %>


        <%
            for (Application app : applications) {
        %>

        <div class="application-card">

            <div class="row">

                <div class="label">
                    Application ID
                </div>

                <div class="value">
                    <%= app.getApplicationId() %>
                </div>

            </div>


            <div class="row">

                <div class="label">
                    Scheme Name
                </div>

                <div class="value">
                    <%= app.getSchemeName() %>
                </div>

            </div>


            <div class="row">

                <div class="label">
                    Application Date
                </div>

                <div class="value">
                    <%= app.getApplicationDate() %>
                </div>

            </div>


            <div class="row">

                <div class="label">
                    Status
                </div>

                <div class="value">

                    <span class="status">
                        <%= app.getStatus() %>
                    </span>

                </div>

            </div>

        </div>

        <%
            }
        %>


    <% } %>


    <a href="User_Dashboard_servler"
       class="back-button">
        ← Back to Dashboard
    </a>

</div>

</body>

</html>