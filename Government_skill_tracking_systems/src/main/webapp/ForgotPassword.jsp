<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Forgot Password - Government Scheme Eligibility Checker</title>

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

/* Card - Reduced size so it fits on a single screen */
.forgot-card {
    background: #ffffff;
    width: 100%;
    max-width: 520px;          /* Reduced from 720px */
    border-radius: 20px;
    padding: 25px 30px;        /* Reduced padding */
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.08);
    border: 1px solid #f1f5f9;
}

/* Top Lock Icon */
.card-icon {
    width: 65px;               /* Reduced from 90px */
    height: 65px;
    background: #eaf2ff;
    color: #0b2e6b;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 0 auto 15px;
    font-size: 28px;
}

/* Heading */
.forgot-card h2 {
    text-align: center;
    font-size: 32px;           /* Reduced from 44px */
    color: #0b2e6b;
    margin-bottom: 8px;
    font-weight: 700;
}

.subtitle {
    text-align: center;
    font-size: 14px;           /* Reduced from 18px */
    color: #6b7280;
    margin-bottom: 20px;
}

/* Form Groups */
.form-group {
    margin-bottom: 14px;       /* Reduced spacing */
}

.form-group label {
    display: block;
    font-size: 14px;
    font-weight: 600;
    color: #374151;
    margin-bottom: 6px;
}

/* Input Fields */
.input-group input {
    width: 100%;
    height: 46px;              /* Reduced from 58px */
    border: 1px solid #d1d5db;
    border-radius: 10px;
    padding: 0 16px 0 45px;
    font-size: 14px;
    outline: none;
    transition: 0.3s;
}

.input-group i {
    position: absolute;
    left: 15px;
    top: 50%;
    transform: translateY(-50%);
    color: #9ca3af;
    font-size: 16px;
}

/* Reset Button */
.reset-btn {
    width: 100%;
    height: 48px;              /* Reduced from 58px */
    border: none;
    border-radius: 10px;
    background: linear-gradient(135deg, #0d47a1, #1565c0);
    color: #ffffff;
    font-size: 18px;           /* Reduced from 22px */
    font-weight: 600;
    cursor: pointer;
    margin-top: 6px;
    transition: 0.3s;
}

/* Footer Link */
.bottom-link {
    text-align: center;
    margin-top: 18px;
    font-size: 14px;
    color: #6b7280;
}

/* Responsive */
@media (max-height: 900px) {
    .header {
        padding: 15px 40px;
    }

    .logo-text h1 {
        font-size: 28px;
    }

    .security-info h3 {
        font-size: 18px;
    }

    .forgot-card {
        max-width: 500px;
        padding: 22px 28px;
    }

    .forgot-card h2 {
        font-size: 32px;
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
        <i class="fas fa-shield-alt"></i>
        <div>
            <h3>Secure Account Recovery</h3>
            <p>Reset your password securely</p>
        </div>
    </div>
</div>

<!-- Main Content -->
<div class="main-container">
    <div class="forgot-card">

        <div class="card-icon">
            <i class="fas fa-lock"></i>
        </div>

        <h2>Forgot Password</h2>
        <p class="subtitle">
            Enter your registered details and create a new password.
        </p>

        <form action="Forget_Password_servlet" method="post">

            <div class="form-group">
                <label>Username</label>
                <div class="input-group">
                    <i class="fas fa-user"></i>
                    <input type="text" name="username"
                           placeholder="Enter your username" required>
                </div>
            </div>

            <div class="form-group">
                <label>Registered Email</label>
                <div class="input-group">
                    <i class="fas fa-envelope"></i>
                    <input type="email" name="email"
                           placeholder="Enter your registered email" required>
                </div>
            </div>

            <div class="form-group">
                <label>New Password</label>
                <div class="input-group">
                    <i class="fas fa-lock"></i>
                    <input type="password" name="newPassword"
                           placeholder="Enter new password" required>
                </div>
            </div>

            <div class="form-group">
                <label>Confirm Password</label>
                <div class="input-group">
                    <i class="fas fa-lock"></i>
                    <input type="password" name="confirmPassword"
                           placeholder="Confirm new password" required>
                </div>
            </div>

            <button type="submit" class="reset-btn">
                <i class="fas fa-key"></i> Reset Password
            </button>

        </form>

        <div class="bottom-link">
            Remember your password?
            <a href="Login_page.jsp">Login Here</a>
        </div>

    </div>
</div>

</body>
</html>