<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Login - Smart Government</title>

<!-- Font Awesome Icons -->
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
    min-height: 100vh;
    background: #f8fbff; /* Clean whitish background */
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 40px;
    color: #1f2937;
}

/* Main Container */
.container {
    width: 100%;
    max-width: 1400px;
    display: grid;
    grid-template-columns: 1.1fr 0.9fr;
    gap: 60px;
    align-items: center;
}

/* Left Section */
.left-section {
    padding: 20px;
}

/* Government of India Header */
.gov-header {
    display: flex;
    align-items: center;
    gap: 15px;
    margin-bottom: 40px;
}

.gov-header img {
    width: 55px;
    height: auto;
}

.gov-header h4 {
    font-size: 16px;
    color: #0b2e6b;
    font-weight: 700;
    margin-bottom: 3px;
}

.gov-header p {
    font-size: 14px;
    color: #6b7280;
}

/* Main Title */
.main-title {
    font-size: 72px;
    font-weight: 800;
    color: #0b3b91;
    line-height: 1.05;
    margin-bottom: 10px;
}

.sub-title {
    font-size: 30px;
    color: #374151;
    font-weight: 500;
    margin-bottom: 25px;
}

/* Tricolor Line */
.tricolor-line {
    display: flex;
    width: 300px;
    height: 4px;
    border-radius: 10px;
    overflow: hidden;
    margin-bottom: 35px;
}

.tricolor-line span:nth-child(1) {
    flex: 1;
    background: #ff9933;
}

.tricolor-line span:nth-child(2) {
    flex: 1;
    background: #ffffff;
    border-top: 1px solid #e5e7eb;
    border-bottom: 1px solid #e5e7eb;
}

.tricolor-line span:nth-child(3) {
    flex: 1;
    background: #138808;
}

.description {
    font-size: 20px;
    line-height: 1.8;
    color: #4b5563;
    max-width: 650px;
    margin-bottom: 60px;
}

/* Features */
.features {
    display: flex;
    gap: 50px;
    flex-wrap: wrap;
}

.feature {
    text-align: center;
    color: #0b3b91;
}

.feature i {
    font-size: 32px;
    margin-bottom: 15px;
}

.feature p {
    font-size: 18px;
    font-weight: 500;
    line-height: 1.4;
}

/* Right Login Card */
.login-card {
    background: #ffffff;
    border-radius: 25px;
    padding: 50px;
    box-shadow: 0 15px 40px rgba(0, 0, 0, 0.08);
    position: relative;
}

/* Tricolor Top Border */
.login-card::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 5px;
    border-radius: 25px 25px 0 0;
    background: linear-gradient(to right,
        #ff9933 0%, #ff9933 33.33%,
        #ffffff 33.33%, #ffffff 66.66%,
        #138808 66.66%, #138808 100%);
}

.card-icon {
    width: 110px;
    height: 110px;
    background: #eef4ff;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 25px;
    font-size: 48px;
    color: #0b3b91;
}

.login-card h2 {
    text-align: center;
    font-size: 42px;
    color: #0b2e6b;
    margin-bottom: 10px;
}

.login-card .subtitle {
    text-align: center;
    font-size: 18px;
    color: #6b7280;
    margin-bottom: 35px;
}

/* Input Fields */
.input-group {
    position: relative;
    margin-bottom: 25px;
}

.input-group i {
    position: absolute;
    left: 18px;
    top: 50%;
    transform: translateY(-50%);
    color: #6b7280;
    font-size: 18px;
}

.input-group input {
    width: 100%;
    height: 60px;
    border: 1px solid #d1d5db;
    border-radius: 12px;
    padding: 0 20px 0 55px;
    font-size: 18px;
    outline: none;
    transition: 0.3s;
}

.input-group input:focus {
    border-color: #0b5ed7;
    box-shadow: 0 0 0 3px rgba(11, 94, 215, 0.12);
}

/* Options */
.options {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 25px;
    font-size: 16px;
}

.options label {
    display: flex;
    align-items: center;
    gap: 8px;
    color: #374151;
}

.options a {
    color: #0b5ed7;
    text-decoration: none;
    font-weight: 500;
}

.options a:hover {
    text-decoration: underline;
}

/* Login Button */
.login-btn {
    width: 100%;
    height: 60px;
    border: none;
    border-radius: 12px;
    background: linear-gradient(135deg, #0d47a1, #1565c0);
    color: white;
    font-size: 22px;
    font-weight: 600;
    cursor: pointer;
    transition: 0.3s;
    box-shadow: 0 8px 20px rgba(13, 71, 161, 0.25);
}

.login-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 12px 24px rgba(13, 71, 161, 0.30);
}

/* Register Link */
.register {
    text-align: center;
    margin-top: 30px;
    font-size: 17px;
    color: #6b7280;
}

.register a {
    color: #0b5ed7;
    text-decoration: none;
    font-weight: 600;
}

.register a:hover {
    text-decoration: underline;
}

/* Responsive */
@media (max-width: 992px) {
    .container {
        grid-template-columns: 1fr;
        gap: 40px;
    }

    .main-title {
        font-size: 52px;
    }

    .sub-title {
        font-size: 24px;
    }

    .login-card {
        padding: 35px;
    }
}
</style>
</head>
<body>

<div class="container">

    <!-- Left Section -->
    <div class="left-section">

        <div class="gov-header">
            
            
        </div>

        <h1 class="main-title">Smart Government</h1>
        <h2 class="sub-title">Government Scheme Eligibility Checker</h2>

        <div class="tricolor-line">
            <span></span>
            <span></span>
            <span></span>
        </div>

        <p class="description">
            Check your eligibility and discover government schemes tailored
            to your needs.
        </p>

        <div class="features">
            <div class="feature">
                <i class="fas fa-users"></i>
                <p>Multiple<br>Schemes</p>
            </div>

            <div class="feature">
                <i class="fas fa-shield-alt"></i>
                <p>Eligible &<br>Secure</p>
            </div>

            <div class="feature">
                <i class="fas fa-file-alt"></i>
                <p>Easy<br>Application</p>
            </div>

            <div class="feature">
                <i class="fas fa-headset"></i>
                <p>24x7<br>Support</p>
            </div>
        </div>
    </div>

    <!-- Right Login Card -->
    <div class="login-card">

        <div class="card-icon">
            <i class="fas fa-landmark"></i>
        </div>

        <h2>User Login</h2>
        <p class="subtitle">Login to access your account</p>

        <form action="User_Login_servlet" method="post">

            <div class="input-group">
                <i class="fas fa-user"></i>
                <input type="text" name="username"
                       placeholder="Enter Username" required>
            </div>

            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input type="password" name="password"
                       placeholder="Enter Password" required>
            </div>

            <div class="options">
               
                <a href="ForgotPassword.jsp">Forgot Password?</a>
            </div>

            <button type="submit" class="login-btn">
                <i class="fas fa-sign-in-alt"></i> Login
            </button>

            <div class="register">
                New User? <a href="RegisterPage.jsp">Register Here</a>
            </div>

        </form>
    </div>

</div>

</body>
</html>