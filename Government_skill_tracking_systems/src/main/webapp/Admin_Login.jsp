
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Login - Government Scheme Eligibility Checker</title>

<!-- Font Awesome Icons -->
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
    background: linear-gradient(135deg, #f9fbff, #eef3f9);
    display: flex;
    flex-direction: column;
}

/* Header */
.header {
    width: 100%;
    background: #ffffff;
    border-bottom: 1px solid #e5e7eb;
    padding: 20px 60px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.logo-section {
    display: flex;
    align-items: center;
    gap: 15px;
}

.logo {
    width: 55px;
    height: 55px;
    background: #0b2e6b;
    color: #ffffff;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 26px;
}

.logo-text h1 {
    font-size: 34px;
    color: #0b2e6b;
    font-weight: 700;
}

.logo-text p {
    font-size: 18px;
    color: #6b7280;
    margin-top: 2px;
}

.security-info {
    display: flex;
    align-items: center;
    gap: 12px;
    color: #0b2e6b;
}

.security-info i {
    font-size: 28px;
}

.security-info h3 {
    font-size: 22px;
    margin-bottom: 3px;
}

.security-info p {
    font-size: 14px;
    color: #6b7280;
}

/* Main Section */
.main-container {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
}

/* Login Card */
.login-card {
    background: #ffffff;
    width: 100%;
    max-width: 460px;
    border-radius: 20px;
    padding: 30px;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.08);
    border: 1px solid #f1f5f9;
}

/* Top Icon */
.card-icon {
    width: 70px;
    height: 70px;
    background: #eaf2ff;
    color: #0b2e6b;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 0 auto 18px;
    font-size: 30px;
}

/* Heading */
.login-card h2 {
    text-align: center;
    font-size: 32px;
    color: #0b2e6b;
    margin-bottom: 8px;
    font-weight: 700;
}

.subtitle {
    text-align: center;
    font-size: 14px;
    color: #6b7280;
    margin-bottom: 25px;
}

/* Form Groups */
.form-group {
    margin-bottom: 16px;
}

.form-group label {
    display: block;
    font-size: 14px;
    font-weight: 600;
    color: #374151;
    margin-bottom: 6px;
}

/* Input Group */
.input-group {
    position: relative;
}

.input-group i {
    position: absolute;
    left: 15px;
    top: 50%;
    transform: translateY(-50%);
    color: #9ca3af;
    font-size: 16px;
}

.input-group input {
    width: 100%;
    height: 46px;
    border: 1px solid #d1d5db;
    border-radius: 10px;
    padding: 0 16px 0 45px;
    font-size: 14px;
    outline: none;
    transition: 0.3s;
}

.input-group input:focus {
    border-color: #1565c0;
    box-shadow: 0 0 0 3px rgba(21, 101, 192, 0.1);
}

/* Login Button */
.login-btn {
    width: 100%;
    height: 48px;
    border: none;
    border-radius: 10px;
    background: linear-gradient(135deg, #0d47a1, #1565c0);
    color: #ffffff;
    font-size: 18px;
    font-weight: 600;
    cursor: pointer;
    margin-top: 8px;
    transition: 0.3s;
}

.login-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 12px 24px rgba(13, 71, 161, 0.25);
}

/* Bottom Link */
.bottom-link {
    text-align: center;
    margin-top: 18px;
    font-size: 14px;
    color: #6b7280;
}

.bottom-link a {
    color: #1565c0;
    text-decoration: none;
    font-weight: 600;
    margin-left: 5px;
}

.bottom-link a:hover {
    text-decoration: underline;
}

/* Responsive */
@media (max-width: 768px) {
    .header {
        padding: 20px;
        flex-direction: column;
        gap: 20px;
        text-align: center;
    }

    .logo-text h1 {
        font-size: 26px;
    }

    .logo-text p {
        font-size: 15px;
    }

    .security-info {
        justify-content: center;
    }

    .login-card {
        padding: 25px 20px;
    }

    .login-card h2 {
        font-size: 28px;
    }
}
</style>
</head>
<body>

<!-- Header -->
<div class="header">
    <div class="logo-section">
        <div class="logo">
            <i class="fas fa-landmark"></i>
        </div>
        <div class="logo-text">
            <h1>Government Scheme</h1>
            <p>Eligibility Checker System</p>
        </div>
    </div>

    <div class="security-info">
        <i class="fas fa-user-shield"></i>
        <div>
            <h3>Administrator Access</h3>
            <p>Secure management portal</p>
        </div>
    </div>
</div>

<!-- Main Content -->
<div class="main-container">
    <div class="login-card">

        <div class="card-icon">
            <i class="fas fa-user-shield"></i>
        </div>

        <h2>Admin Login</h2>
        <p class="subtitle">
            Sign in to manage schemes and applications.
        </p>

        <form action="Admin_Login_servlet" method="post">

            <div class="form-group">
                <label>Admin Username</label>
                <div class="input-group">
                    <i class="fas fa-user"></i>
                    <input type="text"
                           name="username"
                           placeholder="Enter admin username"
                           required>
                </div>
            </div>

            <div class="form-group">
                <label>Password</label>
                <div class="input-group">
                    <i class="fas fa-lock"></i>
                    <input type="password"
                           name="password"
                           placeholder="Enter password"
                           required>
                </div>
            </div>

            <button type="submit" class="login-btn">
                <i class="fas fa-sign-in-alt"></i> Admin Login
            </button>

        </form>

        <div class="bottom-link">
            Return to
            <a href="Home.jsp">Home Page</a>
        </div>

    </div>
</div>

</body>
</html>