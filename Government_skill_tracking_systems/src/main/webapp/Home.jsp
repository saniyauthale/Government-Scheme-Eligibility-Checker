<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Smart Government Scheme Eligibility Checker</title>

<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<!-- Font Awesome -->

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{

    background:#f6f8fc;
    overflow-x:hidden;

}

/*================== COLORS ==================*/

:root{

--navy:#0B2C5F;
--gold:#F4B400;
--white:#ffffff;
--light:#f8f9fc;
--shadow:0 15px 40px rgba(0,0,0,.12);

}

/*================== NAVBAR ==================*/

.navbar{

background:linear-gradient(90deg,#081E4A,#0B2C5F);

padding:18px 0;

box-shadow:0 4px 15px rgba(0,0,0,.20);

}

.logo-title{

font-size:15px;

font-weight:700;

line-height:24px;

color:white;

text-transform:uppercase;

}

.logo-sub{

font-size:14px;

color:#FFD54F;

font-weight:500;

}

.navbar .container{
display:flex;
align-items:center;
justify-content:space-between;
}

.navbar-collapse{
justify-content:flex-end;
}

.navbar-brand img{

height:70px;

}

.nav-link{

color:white !important;

font-size:18px;

font-weight:500;

margin-left:20px;

transition:.3s;

}

.nav-link:hover{

color:#FFD54F !important;

}

.login-btn{

border:1px solid rgba(255,255,255,.4);

padding:10px 25px;

border-radius:8px;

}

/*================== HERO ==================*/

.hero{

padding:25px 0;

background:
linear-gradient(rgba(255,255,255,.94),rgba(255,255,255,.96)),
url('https://www.transparenttextures.com/patterns/cubes.png');

}

.hero small{

font-size:18px;

font-weight:700;

color:var(--navy);

letter-spacing:2px;

}

.hero h1{

font-size:44px;
line-height:55px;
font-weight:800;

color:var(--navy);

line-height:72px;

margin-top:10px;

}

.hero p{

font-size:18px;
margin-top:10px;
color:#555;

margin-top:25px;

line-height:38px;

}

.title-line{

width:140px;

height:4px;

background:var(--gold);

margin:30px auto;

border-radius:20px;

position:relative;

}

.title-line::after{

content:"";

width:16px;

height:16px;

background:var(--navy);

position:absolute;

left:50%;

top:50%;

transform:translate(-50%,-50%);

border-radius:50%;

}

/*================== PORTAL TITLE ==================*/

.portal-title{

font-size:28px;
margin-top:25px;
margin-bottom:30px;


font-weight:700;

color:var(--navy);

margin-top:40px;

margin-bottom:50px;

text-transform:uppercase;

}

/*================== CARD ==================*/

.portal-card{

background:linear-gradient(145deg,#0A2356,#12397B);

border-radius:18px;

padding:25px;
width:360px;
height:330px;
margin:auto;
border-radius:18px;

text-align:center;

color:white;

box-shadow:var(--shadow);

transition:.35s;

height:100%;

}

.portal-card:hover{

transform:translateY(-10px);

}

.icon-box{

width:90px;
height:90px;
background:white;

border-radius:50%;

display:flex;

align-items:center;

justify-content:center;

margin:auto;

margin-bottom:25px;

}

.icon-box i{

font-size:42px;

color:var(--navy);

}

.portal-card h3{

font-size:28px;
margin-bottom:15px;

font-weight:700;

margin-bottom:20px;

}

.portal-card p{

font-size:16px;
line-height:28px;
color:white;
opacity:1;

}

.portal-btn{

display:inline-block;

margin-top:30px;

padding:15px 35px;

background:white;

color:var(--navy);

font-weight:700;

border-radius:10px;

text-decoration:none;

transition:.3s;

}

.portal-btn:hover{

background:var(--gold);

color:#000;

}

/*================== FEATURES ==================*/

.feature-box{

background:white;

padding:18px;
margin-top:25px;

border-radius:15px;

box-shadow:0 8px 30px rgba(0,0,0,.08);

margin-top:60px;

}

.feature-icon{

font-size:45px;

color:var(--navy);

}

/*================== FOOTER ==================*/

.footer{

background:linear-gradient(90deg,#081E4A,#0B2C5F);

color:white;

padding:10px;

margin-top:60px;

text-align:center;

font-size:16px;

}


</style>

</head>
<body>

<!-- ===================== NAVBAR ===================== -->

<nav class="navbar navbar-expand-lg">

<div class="container">

<a class="navbar-brand" href="#">

<div style="font-size:60px;color:white;">
<i class="fa-solid fa-landmark"></i>
</div>

<div>

<div class="logo-title">

SMART GOVERNMENT <br>

SCHEME ELIGIBILITY CHECKER

</div>

<div class="logo-sub">

Empowering Citizens, Enabling Opportunities

</div>

</div>

</a>

<button class="navbar-toggler"
type="button"
data-bs-toggle="collapse"
data-bs-target="#navbarMenu">

<span class="navbar-toggler-icon"></span>

</button>

<div class="collapse navbar-collapse"
id="navbarMenu">

<ul class="navbar-nav ms-auto">
<li class="nav-item">

<a class="nav-link active" href="Home.jsp">

<i class="fa-solid fa-house"></i>

&nbsp;Home

</a>

</li>

<li class="nav-item">

<a class="nav-link" href="About_Us.jsp">

About Us

</a>

</li>



<li class="nav-item ms-3">

<a href="Admin_Login.jsp"
class="nav-link login-btn">

<i class="fa-solid fa-user-shield"></i>

&nbsp;Admin Login

</a>

</li>

</ul>

</div>

</div>

</nav>

<!-- ===================== HERO SECTION ===================== -->

<section class="hero">

<div class="container">

<div class="row justify-content-center">

<div class="col-lg-10 text-center">

<small>

WELCOME TO

</small>

<h1>

Smart Government Scheme

<br>

Eligibility Checker

</h1>

<div class="title-line"></div>

<p>

Check your eligibility for various government schemes

and discover opportunities that match your profile.

</p>

<h2 class="portal-title">

Choose Your Portal

</h2>

<div class="row justify-content-center g-4">
<!-- ===================== USER MODULE ===================== -->

<div class="col-lg-5 col-md-6">

    <div class="portal-card">

        <div class="icon-box">

            <i class="fa-solid fa-users"></i>

        </div>

        <h3>

            USER MODULE

        </h3>

        <p>

            Register yourself, create your profile,

            check eligibility and explore

            government schemes that match

            your profile.

        </p>

        <a href="#" class="portal-btn">

            <i class="fa-solid fa-user"></i>

            &nbsp;

            Enter User Module

            &nbsp;

            <i class="fa-solid fa-arrow-right"></i>

        </a>

    </div>

</div>

<!-- ===================== ADMIN MODULE ===================== -->

<div class="col-lg-5 col-md-6">

    <div class="portal-card">

        <div class="icon-box">

            <i class="fa-solid fa-user-shield"></i>

        </div>

        <h3>

            ADMIN MODULE

        </h3>

        <p>

            Add new schemes,

            update scheme details,

            manage users and

            maintain the system.

        </p>

        <a href="Admin_Login.jsp" class="portal-btn">

            <i class="fa-solid fa-shield-halved"></i>

            &nbsp;

            Enter Admin Module

            &nbsp;

            <i class="fa-solid fa-arrow-right"></i>

        </a>

    </div>

</div>

</div>

<!-- ===================== FEATURE SECTION ===================== -->

<div class="row justify-content-center mt-5">

    <div class="col-lg-10">

        <div class="feature-box">

            <div class="row text-center">

                <div class="col-md-6">

                    <i class="fa-solid fa-shield-halved feature-icon"></i>

                    <h4 class="mt-3 fw-bold text-primary">

                        Secure & Transparent

                    </h4>

                    <p>

                        Your personal information is protected

                        and securely stored.

                    </p>

                </div>

                <div class="col-md-6">

                    <i class="fa-solid fa-building-columns feature-icon"></i>

                    <h4 class="mt-3 fw-bold text-primary">

                        Digital Governance

                    </h4>

                    <p>

                        Helping citizens discover

                        government schemes quickly

                        and easily.

                    </p>

                </div>

            </div>

        </div>

    </div>

</div>

</div>

</section>
<!-- ===================== FOOTER ===================== -->

<footer class="footer">

<div class="container">

<div class="row align-items-center">

<div class="col-md-6 text-md-start text-center">

<h5 class="mb-2 fw-bold">

<i class="fa-solid fa-landmark"></i>

Smart Government Scheme Eligibility Checker

</h5>

<p class="mb-0">

Empowering Citizens through Digital Governance

</p>

</div>

<div class="col-md-6 text-md-end text-center mt-3 mt-md-0">

<p class="mb-0">

© 2026 All Rights Reserved

</p>

</div>

</div>

</div>

</footer>

<!-- Bootstrap JS -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>