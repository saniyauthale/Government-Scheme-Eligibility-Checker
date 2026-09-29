
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");

    String url = "jdbc:mysql://localhost:3306/skill_tracking_system";
    String dbUser = "root";
    String dbPassword = "root";

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String schemeName = "";
    String category = "";
    String description = "";
    String eligibility = "";
    String benefits = "";
    String documents = "";
    String applicationProcess = "";
    String officialWebsite = "";
    String status = "";
    String createdAt = "";

    try {

        if (id == null || id.trim().equals("")) {
            throw new Exception("Invalid Scheme ID.");
        }

        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, dbUser, dbPassword);

        String sql = "SELECT * FROM schemes WHERE scheme_id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, Integer.parseInt(id));

        rs = ps.executeQuery();

        if (rs.next()) {
            schemeName = rs.getString("scheme_name");
            category = rs.getString("category");
            description = rs.getString("description");
            eligibility = rs.getString("eligibility");
            benefits = rs.getString("benefits");
            documents = rs.getString("required_documents");
            applicationProcess = rs.getString("application_process");
            officialWebsite = rs.getString("website_link");
            status = rs.getString("status");
            createdAt = rs.getString("created_at");
        } else {
            throw new Exception("Scheme not found.");
        }

    } catch (Exception e) {
%>
        <h3 style="color:red; text-align:center; margin-top:50px;">
            Error: <%= e.getMessage() %>
        </h3>
<%
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (ps != null) ps.close(); } catch (Exception e) {}
        try { if (con != null) con.close(); } catch (Exception e) {}
    }

    String statusClass = "status-inactive";
    if ("Active".equalsIgnoreCase(status)) {
        statusClass = "status-active";
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Scheme</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI', sans-serif;
}

body{
    background:#f5f7fb;
}

.wrapper{
    display:flex;
    min-height:100vh;
}

/* Sidebar */
.sidebar{
    width:260px;
    background:linear-gradient(180deg,#0b2e63,#082348);
    color:white;
    padding:20px 0;
}

.logo{
    padding:0 25px 25px;
    font-size:24px;
    font-weight:bold;
    border-bottom:1px solid rgba(255,255,255,0.1);
}

.menu a{
    display:block;
    padding:14px 25px;
    color:#d8e4ff;
    text-decoration:none;
    font-size:16px;
}

.menu a:hover,
.menu a.active{
    background:#2d6df6;
    border-radius:8px;
}

/* Main */
.main{
    flex:1;
    padding:30px;
}

.header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:25px;
}

.back-btn{
    background:#2d6df6;
    color:white;
    padding:10px 18px;
    border-radius:8px;
    text-decoration:none;
}

/* Card */
.card{
    background:white;
    padding:25px;
    border-radius:12px;
}

/* Info grid */
.info-grid{
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:15px;
    margin-bottom:20px;
}

.info-box{
    background:#f8fafc;
    padding:15px;
    border-radius:10px;
}

/* Section */
.section{
    margin-bottom:20px;
}

.section h3{
    color:#2563eb;
    margin-bottom:8px;
}

/* ⭐ IMPORTANT FIX FOR MULTILINE */
.multiline{
    white-space: pre-wrap;
    word-break: break-word;
}

/* Badges */
.badge{
    padding:5px 10px;
    border-radius:20px;
    font-size:12px;
}

.category-badge{
    background:#dbeafe;
    color:#2563eb;
}

.status-active{
    background:#dcfce7;
    color:#16a34a;
}

.status-inactive{
    background:#f1f5f9;
    color:#64748b;
}

.website-link{
    color:#2563eb;
    text-decoration:none;
}
</style>
</head>

<body>

<div class="wrapper">

<!-- Sidebar -->
<div class="sidebar">
    <div class="logo">
        <i class="fas fa-landmark"></i> Scheme Checker
    </div>

    <div class="menu">
        <a href="Admin_Dashboard_servlet">Dashboard</a>
        <a href="Admin_Add_Scheme.jsp">Add Scheme</a>
        <a href="Admin_Manage_Scheme.jsp" class="active">Manage Schemes</a>
        <a href="LogoutServlet">Logout</a>
    </div>
</div>

<!-- Main -->
<div class="main">

<div class="header">
    <h1>View Scheme</h1>

    <a href="Admin_Manage_Scheme.jsp" class="back-btn">
        <i class="fas fa-arrow-left"></i> Back
    </a>
</div>

<div class="card">

    <h2><%= schemeName %></h2>

    <div class="info-grid">
        <div class="info-box">
            Category:
            <span class="badge category-badge"><%= category %></span>
        </div>

        <div class="info-box">
            Status:
            <span class="badge <%= statusClass %>"><%= status %></span>
        </div>

        <div class="info-box">
            Date: <%= createdAt %>
        </div>

        <div class="info-box">
            Website:
            <a class="website-link" href="<%= officialWebsite %>" target="_blank">
                <%= officialWebsite %>
            </a>
        </div>
    </div>

    <div class="section">
        <h3>Description</h3>
        <p class="multiline">
            <%= (description == null) ? "" : description.replaceAll("\n", "<br>") %>
        </p>
    </div>

    <div class="section">
        <h3>Eligibility</h3>
        <p class="multiline">
            <%= (eligibility == null) ? "" : eligibility.replaceAll("\n", "<br>") %>
        </p>
    </div>

    <div class="section">
        <h3>Benefits</h3>
        <p class="multiline">
            <%= (benefits == null) ? "" : benefits.replaceAll("\n", "<br>") %>
        </p>
    </div>

    <div class="section">
        <h3>Documents</h3>
        <p class="multiline">
            <%= (documents == null) ? "" : documents.replaceAll("\n", "<br>") %>
        </p>
    </div>

    <div class="section">
        <h3>Application Process</h3>
        <p class="multiline">
            <%= (applicationProcess == null) ? "" : applicationProcess.replaceAll("\n", "<br>") %>
        </p>
    </div>

</div>
</div>
</div>

</body>
</html>