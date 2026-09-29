<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select User Category</title>

<!-- Font Awesome for Icons -->
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
    min-height: 100vh;
    background: linear-gradient(135deg, #001f54, #003b8e);
    padding: 0;
}

/* ===== HEADER ===== */
.header {
    width: 100%;
    background: rgba(0, 16, 64, 0.95);
    color: white;
    padding: 20px 50px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 4px 15px rgba(0,0,0,0.25);
}

.logo-section {
    display: flex;
    align-items: center;
    gap: 20px;
}

.logo {
    font-size: 60px;
    color: white;
}

.logo-text h1 {
    font-size: 44px;
    font-weight: 700;
    line-height: 1.1;
}

.logo-text p {
    font-size: 22px;
    opacity: 0.95;
}

.header-right {
    display: flex;
    align-items: center;
    gap: 15px;
    font-size: 20px;
}

.header-right i {
    font-size: 42px;
}

/* ===== MAIN CARD ===== */
.main-container {
    width: 90%;
    max-width: 1400px;
    margin: 40px auto;
    background: #ffffff;
    border-radius: 30px;
    padding: 50px 40px 60px;
    box-shadow: 0 20px 50px rgba(0,0,0,0.25);
}

/* ===== TOP ICON ===== */
.top-icon {
    width: 110px;
    height: 110px;
    margin: -100px auto 20px;
    background: #002d72;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    color: white;
    font-size: 48px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.25);
}

.title {
    text-align: center;
    font-size: 56px;
    color: #0a2c73;
    font-weight: 700;
    margin-bottom: 10px;
}

.subtitle {
    text-align: center;
    font-size: 26px;
    color: #4a5a78;
    margin-bottom: 15px;
}

.divider {
    width: 80px;
    height: 5px;
    background: #0a2c73;
    margin: 0 auto 50px;
    border-radius: 5px;
}

/* ===== CATEGORY GRID ===== */
.category-grid {
    display: grid;
    grid-template-columns: repeat(6, 1fr);
    gap: 20px;
    margin-bottom: 50px;
}

.category-card {
    border: 2px solid #dbe3f3;
    border-radius: 20px;
    padding: 30px 20px;
    text-align: center;
    transition: 0.3s ease;
    cursor: pointer;
    position: relative;
    background: #fff;
}

.category-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 15px 35px rgba(0, 45, 114, 0.15);
    border-color: #0a2c73;
}

.category-card input[type="radio"] {
    position: absolute;
    opacity: 0;
}

.category-card input[type="radio"]:checked + .card-content {
    color: #0a2c73;
}

.category-card input[type="radio"]:checked + .card-content .icon-circle {
    background: #0a2c73;
}

.category-card input[type="radio"]:checked + .card-content .radio-indicator {
    border-color: #0a2c73;
    background: #0a2c73;
    box-shadow: inset 0 0 0 5px white;
}

.icon-circle {
    width: 110px;
    height: 110px;
    margin: 0 auto 25px;
    background: #0a2c73;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    color: white;
    font-size: 48px;
    transition: 0.3s;
}

.card-content h3 {
    font-size: 24px;
    color: #0a2c73;
    margin-bottom: 15px;
    font-weight: 700;
}

.card-content p {
    font-size: 15px;
    color: #45526d;
    line-height: 1.6;
    min-height: 120px;
}

.radio-indicator {
    width: 28px;
    height: 28px;
    border: 3px solid #0a2c73;
    border-radius: 50%;
    margin: 20px auto 0;
    transition: 0.3s;
}

/* ===== CONTINUE BUTTON ===== */
.button-container {Width: 220px
Height: 55px
Border Radius: 15px;
text-align: center;
}

.continue-btn {
    background: linear-gradient(to right, #002d72, #004aad);
    color: white;
    border: none;
    padding: 18px 70px;
    font-size: 28px;
    border-radius: 14px;
    cursor: pointer;
    font-weight: 600;
    box-shadow: 0 8px 20px rgba(0, 45, 114, 0.25);
    transition: 0.3s;
}

.continue-btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 12px 25px rgba(0, 45, 114, 0.35);
}

/* ===== RESPONSIVE ===== */
@media (max-width: 1400px) {
    .category-grid {
        grid-template-columns: repeat(3, 1fr);
    }
}

@media (max-width: 900px) {
    .category-grid {
        grid-template-columns: repeat(2, 1fr);
    }

    .title {
        font-size: 42px;
    }

    .subtitle {
        font-size: 20px;
    }
}

@media (max-width: 600px) {
    .category-grid {
        grid-template-columns: 1fr;
    }

    .header {
        flex-direction: column;
        gap: 20px;
        text-align: center;
        padding: 20px;
    }

    .logo-text h1 {
        font-size: 30px;
    }

    .logo-text p {
        font-size: 16px;
    }

    .title {
        font-size: 34px;
    }

    .subtitle {
        font-size: 18px;
    }
}
</style>
</head>
<body>

<!-- HEADER -->
<div class="header">
    <div class="logo-section">
        <div class="logo">
            <i class="fas fa-landmark"></i>
        </div>
        <div class="logo-text">
            <h1>Government Scheme</h1>
            <p>Eligibility Checker & Tracking System</p>
        </div>
    </div>

    <div class="header-right">
        <i class="fas fa-shield-alt"></i>
        <div>
            <div>Transparent Services</div>
            <div>Better Tomorrow</div>
        </div>
    </div>
</div>

<!-- MAIN CARD -->
<div class="main-container">

    <!-- TOP ICON -->
    <div class="top-icon">
        <i class="fas fa-users"></i>
    </div>

    <h1 class="title">Select User Category</h1>
    <p class="subtitle">
        Please select the category that best describes you to continue
    </p>
    <div class="divider"></div>

    <!-- FORM -->
    <form action="Select_User_Category_servlet" method="post">
<input type="hidden"
       name="userId"
       value="<%= request.getParameter("userId") %>">
       
        <div class="category-grid">

            <!-- Farmer -->
            <label class="category-card">
                <input type="radio" name="category" value="Farmer" required>
                <div class="card-content">
                    <div class="icon-circle">
                        <i class="fas fa-tractor"></i>
                    </div>
                    <h3>Farmer</h3>
                    <p>For individuals engaged in farming activities and agricultural schemes.</p>
                    <div class="radio-indicator"></div>
                </div>
            </label>

            <!-- Student -->
            <label class="category-card">
                <input type="radio" name="category" value="Student">
                <div class="card-content">
                    <div class="icon-circle">
                        <i class="fas fa-graduation-cap"></i>
                    </div>
                    <h3>Student</h3>
                    <p>For students pursuing education and scholarship opportunities.</p>
                    <div class="radio-indicator"></div>
                </div>
            </label>

            <!-- Women -->
            <label class="category-card">
                <input type="radio" name="category" value="Women">
                <div class="card-content">
                    <div class="icon-circle">
                        <i class="fas fa-female"></i>
                    </div>
                    <h3>Women</h3>
                    <p>For women empowerment, welfare and entrepreneurship schemes.</p>
                    <div class="radio-indicator"></div>
                </div>
            </label>

            <!-- Business -->
            <label class="category-card">
                <input type="radio" name="category" value="Business">
                <div class="card-content">
                    <div class="icon-circle">
                        <i class="fas fa-briefcase"></i>
                    </div>
                    <h3>Business</h3>
                    <p>For individuals engaged in business and self-employment.</p>
                    <div class="radio-indicator"></div>
                </div>
            </label>

            <!-- Senior Citizen -->
            <label class="category-card">
                <input type="radio" name="category" value="Senior Citizen">
                <div class="card-content">
                    <div class="icon-circle">
                        <i class="fas fa-user-clock"></i>
                    </div>
                    <h3>Senior Citizen</h3>
                    <p>For pension and welfare schemes for senior citizens.</p>
                    <div class="radio-indicator"></div>
                </div>
            </label>

            <!-- Other -->
            <label class="category-card">
                <input type="radio" name="category" value="Girls Students">
                <div class="card-content">
                    <div class="icon-circle">
                    <i class="fas fa-female"></i>
                    </div>
                    <h3>Girls Students</h3>
                    <p>For Girls Student eligible applicants and government welfare schemes.</p>
                    <div class="radio-indicator"></div>
                     
                </div>
            </label>

        </div>

        <!-- BUTTON -->
        <div class="button-container">
            <button type="submit" class="continue-btn">
                Continue <i class="fas fa-arrow-right" style="margin-left:12px;"></i>
            </button>
        </div>

    </form>
</div>

</body>
</html>