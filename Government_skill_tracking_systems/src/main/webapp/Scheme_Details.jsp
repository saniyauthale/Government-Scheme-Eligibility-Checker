<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // =========================================================
    // GET SCHEME INFORMATION FROM SERVLET
    // =========================================================

    Object schemeIdObj = request.getAttribute("schemeId");

    String schemeName = (String) request.getAttribute("schemeName");
    String category = (String) request.getAttribute("category");
    String candidateType = (String) request.getAttribute("candidateType");
    String status = (String) request.getAttribute("status");
    String description = (String) request.getAttribute("description");
    String eligibility = (String) request.getAttribute("eligibility");
    String benefits = (String) request.getAttribute("benefits");
    String applicationProcess =
            (String) request.getAttribute("applicationProcess");
    String requiredDocuments =
            (String) request.getAttribute("requiredDocuments");
    String websiteLink =
            (String) request.getAttribute("websiteLink");

    Object minAge = request.getAttribute("minAge");
    Object maxAge = request.getAttribute("maxAge");
    Object maxIncome = request.getAttribute("maxIncome");

    String genderRequired =
            (String) request.getAttribute("genderRequired");

    String categoryRequired =
            (String) request.getAttribute("categoryRequired");

    String disabilityRequired =
            (String) request.getAttribute("disabilityRequired");

    String bankRequired =
            (String) request.getAttribute("bankRequired");


    // =========================================================
    // DEFAULT VALUES
    // =========================================================

    String schemeId = schemeIdObj == null
            ? "N/A"
            : schemeIdObj.toString();

    if (schemeName == null || schemeName.trim().isEmpty())
        schemeName = "Government Scheme";

    if (category == null || category.trim().isEmpty())
        category = "Not Available";

    if (candidateType == null || candidateType.trim().isEmpty())
        candidateType = "Not Available";

    if (status == null || status.trim().isEmpty())
        status = "Active";

    if (description == null || description.trim().isEmpty())
        description = "No description available.";

    if (eligibility == null || eligibility.trim().isEmpty())
        eligibility = "Eligibility information is not available.";

    if (benefits == null || benefits.trim().isEmpty())
        benefits = "Benefits information is not available.";

    if (applicationProcess == null ||
        applicationProcess.trim().isEmpty())
        applicationProcess = "Application process information is not available.";

    if (requiredDocuments == null ||
        requiredDocuments.trim().isEmpty())
        requiredDocuments = "Required document information is not available.";

    if (websiteLink == null)
        websiteLink = "";
%>


<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title><%= schemeName %> | Scheme Details</title>


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
        "Segoe UI",
        Arial,
        Helvetica,
        sans-serif;

    background:
        linear-gradient(
            135deg,
            #f4f8ff 0%,
            #eef5ff 50%,
            #f8fbff 100%
        );

    color: #172b4d;

    line-height: 1.6;

    min-height: 100vh;
}


/* =========================================================
   TOP HEADER
========================================================= */

.header {

    height: 74px;

    background:
        linear-gradient(
            110deg,
            #082b5c,
            #123d7a,
            #1769e0
        );

    color: white;

    display: flex;

    align-items: center;

    justify-content: space-between;

    padding: 0 55px;

    box-shadow:
        0 5px 20px rgba(8,43,92,0.20);

    position: sticky;

    top: 0;

    z-index: 100;
}


.header-left {

    display: flex;

    align-items: center;

    gap: 14px;
}


.header-logo {

    width: 45px;

    height: 45px;

    border-radius: 12px;

    background:
        rgba(255,255,255,0.15);

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 25px;

    backdrop-filter: blur(8px);

    border:
        1px solid rgba(255,255,255,0.20);
}


.header-title {

    font-size: 19px;

    font-weight: 700;

    letter-spacing: 0.3px;
}


.header-subtitle {

    font-size: 11px;

    color: rgba(255,255,255,0.75);

    margin-top: 1px;
}


/* =========================================================
   BACK BUTTON
========================================================= */

.back-button {

    display: flex;

    align-items: center;

    gap: 8px;

    color: white;

    text-decoration: none;

    padding: 10px 17px;

    border-radius: 9px;

    border:
        1px solid rgba(255,255,255,0.35);

    background:
        rgba(255,255,255,0.08);

    font-size: 13px;

    font-weight: 600;

    transition:
        all 0.3s ease;
}


.back-button:hover {

    background:
        rgba(255,255,255,0.20);

    border-color:
        rgba(255,255,255,0.70);

    transform:
        translateX(-3px);

    box-shadow:
        0 5px 15px rgba(0,0,0,0.12);
}


/* =========================================================
   MAIN CONTAINER
========================================================= */

.container {

    max-width: 1200px;

    margin: 35px auto;

    padding: 0 25px;
}


/* =========================================================
   BREADCRUMB
========================================================= */

.breadcrumb {

    display: flex;

    align-items: center;

    gap: 8px;

    font-size: 12px;

    color: #718096;

    margin-bottom: 18px;
}


.breadcrumb span:last-child {

    color: #1769e0;

    font-weight: 600;
}


/* =========================================================
   HERO SECTION
========================================================= */

.scheme-header {

    position: relative;

    overflow: hidden;

    background: white;

    border-radius: 20px;

    padding: 32px;

    display: flex;

    align-items: center;

    gap: 25px;

    box-shadow:
        0 8px 30px rgba(30,60,90,0.09);

    border:
        1px solid #e4ecf7;

    margin-bottom: 22px;

    transition:
        all 0.3s ease;
}


.scheme-header:hover {

    transform: translateY(-2px);

    box-shadow:
        0 12px 35px rgba(30,60,90,0.13);
}


/* Decorative background */

.scheme-header::before {

    content: "";

    position: absolute;

    width: 250px;

    height: 250px;

    border-radius: 50%;

    background:
        linear-gradient(
            135deg,
            rgba(23,105,224,0.08),
            rgba(22,163,74,0.04)
        );

    right: -80px;

    top: -110px;
}


.scheme-header::after {

    content: "";

    position: absolute;

    width: 150px;

    height: 150px;

    border-radius: 50%;

    background:
        rgba(23,105,224,0.04);

    left: -70px;

    bottom: -90px;
}


/* =========================================================
   SCHEME ICON
========================================================= */

.scheme-icon {

    width: 92px;

    height: 92px;

    min-width: 92px;

    border-radius: 22px;

    background:
        linear-gradient(
            135deg,
            #eaf3ff,
            #dcecff
        );

    border:
        1px solid #d5e6ff;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 47px;

    position: relative;

    z-index: 2;

    box-shadow:
        0 8px 20px rgba(23,105,224,0.10);

    transition:
        transform 0.3s ease;
}


.scheme-header:hover .scheme-icon {

    transform:
        rotate(-3deg)
        scale(1.04);
}


/* =========================================================
   SCHEME TITLE
========================================================= */

.scheme-title-area {

    flex: 1;

    position: relative;

    z-index: 2;
}


.scheme-title {

    font-size: 30px;

    font-weight: 750;

    color: #10244a;

    line-height: 1.25;

    margin-bottom: 10px;
}


.scheme-meta {

    display: flex;

    flex-wrap: wrap;

    align-items: center;

    gap: 9px;

    color: #60718a;

    font-size: 13px;
}


.meta-item {

    background: #f5f8fd;

    padding: 6px 10px;

    border-radius: 7px;

    border:
        1px solid #e6edf6;
}


.meta-item strong {

    color: #1c355d;
}


.scheme-id {

    color: #8290a3;

    font-size: 11px;

    margin-top: 10px;
}


/* =========================================================
   STATUS
========================================================= */

.status-wrapper {

    position: relative;

    z-index: 2;
}


.status {

    display: inline-flex;

    align-items: center;

    gap: 7px;

    background:
        linear-gradient(
            135deg,
            #e2f8eb,
            #d5f5e2
        );

    color: #15803d;

    padding: 9px 15px;

    border-radius: 30px;

    font-size: 12px;

    font-weight: 700;

    border:
        1px solid #bce8cb;

    box-shadow:
        0 4px 10px rgba(22,163,74,0.08);
}


.status-dot {

    width: 7px;

    height: 7px;

    background: #16a34a;

    border-radius: 50%;

    box-shadow:
        0 0 0 4px rgba(22,163,74,0.12);
}


/* =========================================================
   QUICK INFO BAR
========================================================= */

.quick-info {

    display: grid;

    grid-template-columns:
        repeat(4, 1fr);

    gap: 15px;

    margin-bottom: 22px;
}


.quick-card {

    background: white;

    border:
        1px solid #e4ecf7;

    border-radius: 13px;

    padding: 17px;

    display: flex;

    align-items: center;

    gap: 13px;

    box-shadow:
        0 4px 15px rgba(30,60,90,0.06);

    transition:
        all 0.3s ease;
}


.quick-card:hover {

    transform:
        translateY(-4px);

    box-shadow:
        0 10px 25px rgba(30,60,90,0.11);
}


.quick-icon {

    width: 43px;

    height: 43px;

    border-radius: 11px;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 20px;
}


.quick-icon.blue {

    background: #eaf3ff;
}

.quick-icon.green {

    background: #e6f8ed;
}

.quick-icon.purple {

    background: #f0eaff;
}

.quick-icon.orange {

    background: #fff1e3;
}


.quick-label {

    font-size: 11px;

    color: #718096;

    margin-bottom: 2px;
}


.quick-value {

    font-size: 14px;

    font-weight: 700;

    color: #172a4d;
}


/* =========================================================
   DETAILS GRID
========================================================= */

.details-grid {

    display: grid;

    grid-template-columns:
        1fr 1fr;

    gap: 20px;
}


/* =========================================================
   CARD
========================================================= */

.card {

    background: white;

    border:
        1px solid #e4ecf7;

    border-radius: 16px;

    padding: 25px;

    box-shadow:
        0 5px 18px rgba(30,60,90,0.06);

    transition:
        all 0.3s ease;

    position: relative;

    overflow: hidden;
}


.card:hover {

    transform:
        translateY(-3px);

    box-shadow:
        0 10px 28px rgba(30,60,90,0.10);
}


.card.full {

    grid-column: 1 / -1;
}


/* Top accent */

.card::before {

    content: "";

    position: absolute;

    top: 0;

    left: 0;

    width: 100%;

    height: 3px;

    background:
        linear-gradient(
            90deg,
            #1769e0,
            #4b91ed
        );

    opacity: 0;

    transition:
        opacity 0.3s ease;
}


.card:hover::before {

    opacity: 1;
}


/* =========================================================
   CARD HEADER
========================================================= */

.card-header {

    display: flex;

    align-items: center;

    gap: 12px;

    margin-bottom: 18px;

    padding-bottom: 13px;

    border-bottom:
        1px solid #e7edf5;
}


.card-icon {

    width: 39px;

    height: 39px;

    border-radius: 10px;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 19px;

    flex-shrink: 0;
}


.card-icon.blue {

    background: #eaf3ff;

    color: #1769e0;
}

.card-icon.green {

    background: #e5f8ec;

    color: #16a34a;
}

.card-icon.purple {

    background: #f0eaff;

    color: #6d3bd1;
}

.card-icon.orange {

    background: #fff0df;

    color: #f97316;
}

.card-icon.red {

    background: #ffeaea;

    color: #dc2626;
}


.card-header h2 {

    font-size: 18px;

    color: #14213d;

    font-weight: 700;
}


/* =========================================================
   CONTENT TEXT
========================================================= */

.content-text {

    color: #56677f;

    font-size: 14px;

    line-height: 1.9;

    white-space: pre-line;
}


/* =========================================================
   HIGHLIGHT BOX
========================================================= */

.highlight-box {

    background:
        linear-gradient(
            135deg,
            #f7faff,
            #f3f8ff
        );

    border:
        1px solid #dfeaf8;

    border-radius: 12px;

    padding: 18px;

    position: relative;

    transition:
        all 0.3s ease;
}


.highlight-box:hover {

    background:
        linear-gradient(
            135deg,
            #f1f7ff,
            #edf5ff
        );

    border-color: #cbdff7;
}


.highlight-box::before {

    content: "";

    position: absolute;

    left: 0;

    top: 12px;

    bottom: 12px;

    width: 4px;

    background: #1769e0;

    border-radius: 5px;
}


/* =========================================================
   BENEFITS BOX
========================================================= */

.benefits-box {

    background:
        linear-gradient(
            135deg,
            #f2fcf6,
            #f7fdf9
        );

    border:
        1px solid #d6efdf;

    border-radius: 12px;

    padding: 18px;

    position: relative;
}


.benefits-box::before {

    content: "";

    position: absolute;

    left: 0;

    top: 12px;

    bottom: 12px;

    width: 4px;

    background: #16a34a;

    border-radius: 5px;
}


/* =========================================================
   INFORMATION ROW
========================================================= */

.info-row {

    display: flex;

    justify-content: space-between;

    align-items: center;

    gap: 20px;

    padding: 14px 0;

    border-bottom:
        1px solid #edf1f5;

    transition:
        padding-left 0.2s ease;
}


.info-row:last-child {

    border-bottom: none;
}


.info-row:hover {

    padding-left: 5px;
}


.info-label {

    color: #60718a;

    font-size: 13px;

    display: flex;

    align-items: center;

    gap: 8px;
}


.info-label::before {

    content: "•";

    color: #1769e0;

    font-size: 17px;
}


.info-value {

    color: #172a4d;

    font-size: 13px;

    font-weight: 700;

    text-align: right;

    background: #f7faff;

    padding: 5px 10px;

    border-radius: 6px;
}


/* =========================================================
   APPLICATION PROCESS
========================================================= */

.process-box {

    display: grid;

    gap: 12px;
}


.process-step {

    display: flex;

    align-items: flex-start;

    gap: 13px;

    padding: 14px;

    border:
        1px solid #e6edf5;

    border-radius: 10px;

    background: #fbfdff;

    transition:
        all 0.25s ease;
}


.process-step:hover {

    transform:
        translateX(5px);

    border-color: #cbdff7;

    background: #f6faff;
}


.step-number {

    width: 29px;

    height: 29px;

    min-width: 29px;

    border-radius: 50%;

    background:
        linear-gradient(
            135deg,
            #1769e0,
            #4b91ed
        );

    color: white;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 12px;

    font-weight: 700;
}


.step-content {

    color: #53657d;

    font-size: 13px;

    line-height: 1.7;

    white-space: pre-line;
}


/* =========================================================
   DOCUMENT BOX
========================================================= */

.documents-box {

    display: grid;

    grid-template-columns:
        repeat(2, 1fr);

    gap: 10px;
}


.document-item {

    padding: 12px 14px;

    background: #f8faff;

    border:
        1px solid #e5edf7;

    border-radius: 9px;

    font-size: 13px;

    color: #52647d;

    transition:
        all 0.25s ease;
}


.document-item:hover {

    background: #eef5ff;

    border-color: #cbdff7;

    transform:
        translateY(-2px);
}


/* =========================================================
   APPLY SECTION
========================================================= */

.apply-section {

    margin-top: 22px;

    background:
        linear-gradient(
            120deg,
            #0d3976,
            #1769e0
        );

    border-radius: 17px;

    padding: 30px;

    text-align: center;

    color: white;

    position: relative;

    overflow: hidden;

    box-shadow:
        0 10px 30px rgba(23,105,224,0.20);
}


.apply-section::before {

    content: "";

    position: absolute;

    width: 220px;

    height: 220px;

    border-radius: 50%;

    border:
        1px solid rgba(255,255,255,0.10);

    right: -70px;

    top: -110px;
}


.apply-section::after {

    content: "";

    position: absolute;

    width: 160px;

    height: 160px;

    border-radius: 50%;

    border:
        1px solid rgba(255,255,255,0.08);

    left: -70px;

    bottom: -90px;
}


.apply-content {

    position: relative;

    z-index: 2;
}


.apply-icon {

    font-size: 32px;

    margin-bottom: 7px;
}


.apply-title {

    font-size: 21px;

    font-weight: 700;

    margin-bottom: 6px;
}


.apply-description {

    color:
        rgba(255,255,255,0.80);

    font-size: 13px;

    margin-bottom: 20px;
}


.apply-button {

    display: inline-flex;

    align-items: center;

    justify-content: center;

    gap: 8px;

    background: white;

    color: #1769e0;

    text-decoration: none;

    padding: 12px 24px;

    border-radius: 9px;

    font-size: 13px;

    font-weight: 700;

    transition:
        all 0.3s ease;

    box-shadow:
        0 5px 15px rgba(0,0,0,0.12);
}


.apply-button:hover {

    transform:
        translateY(-3px);

    box-shadow:
        0 9px 20px rgba(0,0,0,0.18);

    background: #f8fbff;
}


/* =========================================================
   NO WEBSITE
========================================================= */

.no-website {

    display: inline-block;

    padding: 10px 15px;

    border-radius: 8px;

    background:
        rgba(255,255,255,0.10);

    color:
        rgba(255,255,255,0.80);

    font-size: 12px;
}


/* =========================================================
   FOOTER
========================================================= */

.footer {

    text-align: center;

    color: #8290a3;

    font-size: 11px;

    padding: 25px 0 15px;

    letter-spacing: 0.2px;
}


/* =========================================================
   ANIMATION
========================================================= */

@keyframes fadeUp {

    from {

        opacity: 0;

        transform:
            translateY(12px);
    }

    to {

        opacity: 1;

        transform:
            translateY(0);
    }
}


.scheme-header,
.quick-card,
.card,
.apply-section {

    animation:
        fadeUp 0.5s ease both;
}


.quick-card:nth-child(2) {
    animation-delay: 0.05s;
}

.quick-card:nth-child(3) {
    animation-delay: 0.10s;
}

.quick-card:nth-child(4) {
    animation-delay: 0.15s;
}


/* =========================================================
   RESPONSIVE
========================================================= */

@media (max-width: 950px) {

    .header {

        padding: 0 25px;
    }

    .container {

        padding: 0 18px;
    }

    .quick-info {

        grid-template-columns:
            repeat(2, 1fr);
    }
}


@media (max-width: 750px) {

    .header {

        height: auto;

        min-height: 70px;

        padding: 14px 18px;

        gap: 12px;
    }


    .header-title {

        font-size: 16px;
    }


    .header-subtitle {

        display: none;
    }


    .back-button {

        padding: 9px 12px;

        font-size: 11px;
    }


    .scheme-header {

        flex-direction: column;

        text-align: center;

        padding: 25px 18px;
    }


    .scheme-meta {

        justify-content: center;
    }


    .scheme-title {

        font-size: 24px;
    }


    .status-wrapper {

        margin-top: 5px;
    }


    .details-grid {

        grid-template-columns: 1fr;
    }


    .card.full {

        grid-column: auto;
    }


    .documents-box {

        grid-template-columns: 1fr;
    }


    .info-row {

        flex-direction: column;

        align-items: flex-start;

        gap: 7px;
    }


    .info-value {

        text-align: left;
    }
}


@media (max-width: 520px) {

    .quick-info {

        grid-template-columns: 1fr;
    }


    .container {

        margin-top: 20px;

        padding: 0 12px;
    }


    .scheme-icon {

        width: 75px;

        height: 75px;

        min-width: 75px;

        font-size: 37px;
    }


    .scheme-title {

        font-size: 21px;
    }


    .card {

        padding: 19px;
    }


    .card-header h2 {

        font-size: 16px;
    }


    .apply-section {

        padding: 25px 18px;
    }


    .apply-title {

        font-size: 18px;
    }
}

</style>

</head>


<body>


<!-- =========================================================
     HEADER
========================================================= -->

<header class="header">

    <div class="header-left">

        <div class="header-logo">
            🏛️
        </div>

        <div>

            <div class="header-title">
                Government Scheme Portal
            </div>

            <div class="header-subtitle">
                Smart Government Scheme Eligibility System
            </div>

        </div>

    </div>


    <a href="User_Dashboard_servler"
       class="back-button">

        ← Back to Dashboard

    </a>

</header>



<!-- =========================================================
     MAIN CONTAINER
========================================================= -->

<div class="container">


    <!-- BREADCRUMB -->

    <div class="breadcrumb">

        <span>Dashboard</span>

        <span>›</span>

        <span>Eligible Schemes</span>

        <span>›</span>

        <span>Scheme Details</span>

    </div>



    <!-- =====================================================
         SCHEME HERO
    ====================================================== -->

    <div class="scheme-header">


        <div class="scheme-icon">
            🇮🇳
        </div>


        <div class="scheme-title-area">

            <div class="scheme-title">
                <%= schemeName %>
            </div>


            <div class="scheme-meta">

                <div class="meta-item">
                    Category:
                    <strong><%= category %></strong>
                </div>

                <div class="meta-item">
                    Candidate:
                    <strong><%= candidateType %></strong>
                </div>

            </div>


            <div class="scheme-id">

                Scheme ID:
                <strong><%= schemeId %></strong>

            </div>

        </div>


        <div class="status-wrapper">

            <span class="status">

                <span class="status-dot"></span>

                <%= status %>

            </span>

        </div>

    </div>



    <!-- =====================================================
         QUICK INFORMATION
    ====================================================== -->

    <div class="quick-info">


        <div class="quick-card">

            <div class="quick-icon blue">
                👤
            </div>

            <div>

                <div class="quick-label">
                    Candidate Type
                </div>

                <div class="quick-value">
                    <%= candidateType %>
                </div>

            </div>

        </div>


        <div class="quick-card">

            <div class="quick-icon green">
                📂
            </div>

            <div>

                <div class="quick-label">
                    Scheme Category
                </div>

                <div class="quick-value">
                    <%= category %>
                </div>

            </div>

        </div>


        <div class="quick-card">

            <div class="quick-icon purple">
                🎯
            </div>

            <div>

                <div class="quick-label">
                    Eligibility
                </div>

                <div class="quick-value">
                    Profile Matched
                </div>

            </div>

        </div>


        <div class="quick-card">

            <div class="quick-icon orange">
                🌐
            </div>

            <div>

                <div class="quick-label">
                    Application
                </div>

                <div class="quick-value">
                    Online
                </div>

            </div>

        </div>

    </div>



    <!-- =====================================================
         DETAILS GRID
    ====================================================== -->

    <div class="details-grid">


        <!-- =================================================
             ABOUT SCHEME
        ================================================== -->

        <div class="card full">

            <div class="card-header">

                <div class="card-icon blue">
                    📄
                </div>

                <h2>
                    About This Scheme
                </h2>

            </div>


            <div class="content-text">
                <%= description %>
            </div>

        </div>



        <!-- =================================================
             ELIGIBILITY
        ================================================== -->

        <div class="card">

            <div class="card-header">

                <div class="card-icon green">
                    ✓
                </div>

                <h2>
                    Eligibility Criteria
                </h2>

            </div>


            <div class="highlight-box">

                <div class="content-text">
                    <%= eligibility %>
                </div>

            </div>

        </div>



        <!-- =================================================
             BENEFITS
        ================================================== -->

        <div class="card">

            <div class="card-header">

                <div class="card-icon green">
                    🎁
                </div>

                <h2>
                    Benefits
                </h2>

            </div>


            <div class="benefits-box">

                <div class="content-text">
                    <%= benefits %>
                </div>

            </div>

        </div>



        <!-- =================================================
             BASIC ELIGIBILITY
        ================================================== -->

        <div class="card">

            <div class="card-header">

                <div class="card-icon purple">
                    👤
                </div>

                <h2>
                    Basic Eligibility
                </h2>

            </div>


            <div class="info-row">

                <span class="info-label">
                    Minimum Age
                </span>

                <span class="info-value">

                    <%
                    if (minAge != null) {
                    %>

                        <%= minAge %> Years

                    <%
                    } else {
                    %>

                        No Limit

                    <%
                    }
                    %>

                </span>

            </div>


            <div class="info-row">

                <span class="info-label">
                    Maximum Age
                </span>

                <span class="info-value">

                    <%
                    if (maxAge != null) {
                    %>

                        <%= maxAge %> Years

                    <%
                    } else {
                    %>

                        No Limit

                    <%
                    }
                    %>

                </span>

            </div>


            <div class="info-row">

                <span class="info-label">
                    Maximum Annual Income
                </span>

                <span class="info-value">

                    <%
                    if (maxIncome != null) {
                    %>

                        ₹ <%= maxIncome %>

                    <%
                    } else {
                    %>

                        No Limit

                    <%
                    }
                    %>

                </span>

            </div>


            <div class="info-row">

                <span class="info-label">
                    Gender Required
                </span>

                <span class="info-value">

                    <%= (genderRequired == null ||
                         genderRequired.trim().isEmpty())
                         ? "Any"
                         : genderRequired %>

                </span>

            </div>

        </div>



        <!-- =================================================
             OTHER REQUIREMENTS
        ================================================== -->

        <div class="card">

            <div class="card-header">

                <div class="card-icon orange">
                    📋
                </div>

                <h2>
                    Other Requirements
                </h2>

            </div>


            <div class="info-row">

                <span class="info-label">
                    Category Required
                </span>

                <span class="info-value">

                    <%= (categoryRequired == null ||
                         categoryRequired.trim().isEmpty())
                         ? "Any"
                         : categoryRequired %>

                </span>

            </div>


            <div class="info-row">

                <span class="info-label">
                    Disability Required
                </span>

                <span class="info-value">

                    <%= (disabilityRequired == null ||
                         disabilityRequired.trim().isEmpty())
                         ? "Any"
                         : disabilityRequired %>

                </span>

            </div>


            <div class="info-row">

                <span class="info-label">
                    Bank Account Required
                </span>

                <span class="info-value">

                    <%= (bankRequired == null ||
                         bankRequired.trim().isEmpty())
                         ? "Any"
                         : bankRequired %>

                </span>

            </div>

        </div>



        <!-- =================================================
             APPLICATION PROCESS
        ================================================== -->

        <div class="card full">

            <div class="card-header">

                <div class="card-icon blue">
                    📝
                </div>

                <h2>
                    Application Process
                </h2>

            </div>


            <div class="process-box">

                <div class="process-step">

                    <div class="step-number">
                        1
                    </div>

                    <div class="step-content">
                        <%= applicationProcess %>
                    </div>

                </div>

            </div>

        </div>



        <!-- =================================================
             REQUIRED DOCUMENTS
        ================================================== -->

        <div class="card full">

            <div class="card-header">

                <div class="card-icon orange">
                    📑
                </div>

                <h2>
                    Required Documents
                </h2>

            </div>


            <div class="highlight-box">

                <div class="content-text">
                    <%= requiredDocuments %>
                </div>

            </div>

        </div>


    </div>



    <!-- =====================================================
         APPLY ONLINE
    ====================================================== -->

    <div class="apply-section">

        <div class="apply-content">

            <div class="apply-icon">
                🌐
            </div>

            <div class="apply-title">
                Ready to Apply?
            </div>

            <div class="apply-description">

                Visit the official government website
                to learn more or submit your application.

            </div>


           <%
if (websiteLink != null && !websiteLink.trim().isEmpty()) {
%>

    <a href="Apply_Scheme_servlet?schemeId=<%= schemeId %>"
       class="apply-button">

        Apply Now
        <span>→</span>

    </a>

<%
} else {
%>

    <div class="no-website">
        Official website link is not available.
    </div>

<%
}
%>
        </div>

    </div>



    <!-- =====================================================
         FOOTER
    ====================================================== -->

    <div class="footer">

        © Smart Government Scheme Eligibility System
        &nbsp; • &nbsp;
        Government Scheme Information Portal

    </div>


</div>


</body>

</html>