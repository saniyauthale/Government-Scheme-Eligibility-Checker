<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // Check whether user is logged in
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("Login_page.jsp");
        return;
    }

    String fullName = (String) session.getAttribute("fullName");
    String category = (String) session.getAttribute("category");

    if (fullName == null) {
        fullName = "User";
    }

    if (category == null) {
        category = "User";
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Help & Support</title>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

body {
    background: #f4f7fb;
    color: #333;
}

/* ================= SIDEBAR ================= */

.sidebar {
    width: 275px;
    height: 100vh;
    position: fixed;
    left: 0;
    top: 0;

    background: linear-gradient(180deg, #123d7a, #082b5c);

    color: white;
    padding-top: 25px;
    overflow-y: auto;
}

.logo {
    text-align: center;
    margin-bottom: 30px;
}

.logo h2 {
    font-size: 23px;
    margin-bottom: 5px;
}

.logo p {
    font-size: 13px;
    color: #dbe8ff;
}

.menu {
    margin-top: 20px;
}

.menu a {
    display: flex;
    align-items: center;

    padding: 15px 25px;

    color: white;
    text-decoration: none;

    font-size: 15px;

    transition: 0.3s;
}

.menu a:hover {
    background: rgba(255,255,255,0.12);
}

.menu a.active {
    background: rgba(255,255,255,0.20);
    border-left: 4px solid white;
}

.menu-icon {
    width: 35px;
    font-size: 20px;
}

/* ================= MAIN CONTENT ================= */

.main-content {
    margin-left: 275px;
    min-height: 100vh;
}

/* ================= TOP HEADER ================= */

.top-header {
    height: 80px;

    background: white;

    display: flex;
    align-items: center;
    justify-content: space-between;

    padding: 0 35px;

    border-bottom: 1px solid #e3e8ef;
}

.header-title h1 {
    font-size: 25px;
    color: #123d7a;
}

.header-title p {
    margin-top: 5px;
    font-size: 13px;
    color: #777;
}

.user-info {
    display: flex;
    align-items: center;
    gap: 12px;
}

.user-icon {
    width: 45px;
    height: 45px;

    border-radius: 50%;

    background: #123d7a;
    color: white;

    display: flex;
    align-items: center;
    justify-content: center;

    font-size: 20px;
}

.user-details {
    text-align: right;
}

.user-details h4 {
    color: #333;
    font-size: 14px;
}

.user-details p {
    color: #777;
    font-size: 12px;
    margin-top: 3px;
}

/* ================= CONTENT ================= */

.content {
    padding: 30px 35px;
}

/* Welcome box */

.welcome-box {
    background: linear-gradient(135deg, #123d7a, #2862a8);

    color: white;

    padding: 25px;

    border-radius: 12px;

    margin-bottom: 25px;

    box-shadow: 0 4px 12px rgba(0,0,0,0.08);
}

.welcome-box h2 {
    font-size: 22px;
    margin-bottom: 8px;
}

.welcome-box p {
    font-size: 14px;
    line-height: 1.6;
}

/* ================= SUPPORT CARDS ================= */

.support-grid {
    display: grid;

    grid-template-columns: repeat(3, 1fr);

    gap: 20px;

    margin-bottom: 25px;
}

.support-card {
    background: white;

    border-radius: 12px;

    padding: 25px;

    box-shadow: 0 3px 10px rgba(0,0,0,0.06);

    border: 1px solid #e8edf3;
}

.support-icon {
    width: 50px;
    height: 50px;

    border-radius: 10px;

    background: #eaf2ff;

    display: flex;
    align-items: center;
    justify-content: center;

    font-size: 25px;

    margin-bottom: 15px;
}

.support-card h3 {
    color: #123d7a;

    font-size: 17px;

    margin-bottom: 10px;
}

.support-card p {
    color: #666;

    font-size: 13px;

    line-height: 1.6;
}

/* ================= SECTION ================= */

.section {
    background: white;

    padding: 25px;

    border-radius: 12px;

    margin-bottom: 25px;

    box-shadow: 0 3px 10px rgba(0,0,0,0.06);

    border: 1px solid #e8edf3;
}

.section-title {
    color: #123d7a;

    font-size: 20px;

    margin-bottom: 20px;

    padding-bottom: 12px;

    border-bottom: 1px solid #e5eaf0;
}

/* ================= FAQ ================= */

.faq-item {
    border-bottom: 1px solid #e5eaf0;

    margin-bottom: 5px;
}

.faq-question {
    width: 100%;

    padding: 16px 10px;

    border: none;

    background: white;

    text-align: left;

    font-size: 15px;

    font-weight: bold;

    color: #333;

    cursor: pointer;

    display: flex;

    justify-content: space-between;

    align-items: center;
}

.faq-question:hover {
    color: #123d7a;
}

.arrow {
    font-size: 18px;

    color: #123d7a;
}

.faq-answer {
    display: none;

    padding: 0 10px 16px 10px;

    color: #666;

    font-size: 14px;

    line-height: 1.7;
}

/* ================= HOW IT WORKS ================= */

.steps {
    display: grid;

    grid-template-columns: repeat(4, 1fr);

    gap: 15px;
}

.step {
    text-align: center;

    padding: 20px 15px;

    background: #f7f9fc;

    border-radius: 10px;
}

.step-number {
    width: 40px;
    height: 40px;

    margin: 0 auto 12px;

    border-radius: 50%;

    background: #123d7a;

    color: white;

    display: flex;

    align-items: center;
    justify-content: center;

    font-weight: bold;
}

.step h4 {
    color: #123d7a;

    margin-bottom: 7px;

    font-size: 14px;
}

.step p {
    font-size: 12px;

    color: #666;

    line-height: 1.5;
}

/* ================= CONTACT ================= */

.contact-grid {
    display: grid;

    grid-template-columns: repeat(3, 1fr);

    gap: 20px;
}

.contact-item {
    background: #f7f9fc;

    padding: 20px;

    border-radius: 10px;
}

.contact-item h4 {
    color: #123d7a;

    margin-bottom: 8px;

    font-size: 15px;
}

.contact-item p {
    color: #666;

    font-size: 13px;

    line-height: 1.6;
}

/* ================= BACK BUTTON ================= */

.back-button {
    display: inline-block;

    background: #123d7a;

    color: white;

    padding: 12px 22px;

    border-radius: 7px;

    text-decoration: none;

    font-size: 14px;

    margin-top: 5px;

    transition: 0.3s;
}

.back-button:hover {
    background: #082b5c;
}

/* ================= RESPONSIVE ================= */

@media (max-width: 1000px) {

    .support-grid {
        grid-template-columns: 1fr;
    }

    .steps {
        grid-template-columns: repeat(2, 1fr);
    }

    .contact-grid {
        grid-template-columns: 1fr;
    }
}

@media (max-width: 700px) {

    .sidebar {
        width: 220px;
    }

    .main-content {
        margin-left: 220px;
    }

    .top-header {
        padding: 0 20px;
    }

    .content {
        padding: 20px;
    }

    .steps {
        grid-template-columns: 1fr;
    }

    .user-details {
        display: none;
    }
}

</style>
</head>

<body>

<!-- ================= SIDEBAR ================= -->

<div class="sidebar">

    <div class="logo">
        <h2>Government Scheme</h2>
        <p>Eligibility Checker</p>
    </div>

    <div class="menu">

        <a href="User_Dashboard_servler">
            <span class="menu-icon">⌂</span>
            <span>Dashboard</span>
        </a>

        <a href="User_Profile.jsp">
            <span class="menu-icon">👤</span>
            <span>My Profile</span>
        </a>

        <a href="New_Schemes.jsp">
            <span class="menu-icon">📋</span>
            <span>New Schemes</span>
        </a>

        <a href="Saved_Schemes.jsp">
            <span class="menu-icon">💾</span>
            <span>Saved Schemes</span>
        </a>

        <a href="Notifications.jsp">
            <span class="menu-icon">🔔</span>
            <span>Notifications</span>
        </a>

        <a href="Change_Password.jsp">
            <span class="menu-icon">🔐</span>
            <span>Change Password</span>
        </a>

        <!-- ACTIVE HELP & SUPPORT -->

        <a href="Help_Support.jsp" class="active">
            <span class="menu-icon">♧</span>
            <span>Help &amp; Support</span>
        </a>

        <a href="Logout_Servlet">
            <span class="menu-icon">↪</span>
            <span>Logout</span>
        </a>

    </div>

</div>


<!-- ================= MAIN CONTENT ================= -->

<div class="main-content">

    <!-- TOP HEADER -->

    <div class="top-header">

        <div class="header-title">

            <h1>Help &amp; Support</h1>

            <p>Get help and information about the Government Scheme Eligibility Checker</p>

        </div>


        <div class="user-info">

            <div class="user-details">

                <h4>
                    <%= fullName %>
                </h4>

                <p>
                    <%= category %>
                </p>

            </div>

            <div class="user-icon">
                👤
            </div>

        </div>

    </div>


    <!-- ================= PAGE CONTENT ================= -->

    <div class="content">

        <!-- Welcome -->

        <div class="welcome-box">

            <h2>How can we help you?</h2>

            <p>
                Welcome to the Help &amp; Support section.
                Here you can find answers to common questions and
                information about how to use the Government Scheme
                Eligibility Checker System.
            </p>

        </div>


        <!-- ================= SUPPORT CARDS ================= -->

        <div class="support-grid">

            <div class="support-card">

                <div class="support-icon">
                    ❓
                </div>

                <h3>Frequently Asked Questions</h3>

                <p>
                    Find answers to common questions related to
                    registration, eligibility, schemes and your account.
                </p>

            </div>


            <div class="support-card">

                <div class="support-icon">
                    📖
                </div>

                <h3>How It Works</h3>

                <p>
                    Learn how the system checks your information
                    and displays suitable government schemes.
                </p>

            </div>


            <div class="support-card">

                <div class="support-icon">
                    📞
                </div>

                <h3>Contact Support</h3>

                <p>
                    If you need additional assistance, you can
                    contact the support team using the provided details.
                </p>

            </div>

        </div>


        <!-- ================= FAQ SECTION ================= -->

        <div class="section">

            <h2 class="section-title">
                Frequently Asked Questions
            </h2>


            <div class="faq-item">

                <button class="faq-question" onclick="toggleFAQ(this)">

                    How do I register in the system?

                    <span class="arrow">+</span>

                </button>

                <div class="faq-answer">

                    Click on the Registration option and enter your
                    required personal information such as name, email,
                    mobile number, password and category.
                    After successful registration, you can log in
                    using your registered email and password.

                </div>

            </div>


            <div class="faq-item">

                <button class="faq-question" onclick="toggleFAQ(this)">

                    How does the system check my eligibility?

                    <span class="arrow">+</span>

                </button>

                <div class="faq-answer">

                    The system compares the information provided in
                    your profile with the eligibility requirements
                    of available government schemes. Suitable schemes
                    are then displayed on your dashboard.

                </div>

            </div>


            <div class="faq-item">

                <button class="faq-question" onclick="toggleFAQ(this)">

                    Where can I see eligible schemes?

                    <span class="arrow">+</span>

                </button>

                <div class="faq-answer">

                    After logging in, eligible government schemes
                    are displayed on your dashboard according to
                    your profile information and eligibility criteria.

                </div>

            </div>


            <div class="faq-item">

                <button class="faq-question" onclick="toggleFAQ(this)">

                    Can I save a government scheme?

                    <span class="arrow">+</span>

                </button>

                <div class="faq-answer">

                    Yes. You can save a suitable scheme and view
                    your saved schemes later from the
                    <b>Saved Schemes</b> section.

                </div>

            </div>


            <div class="faq-item">

                <button class="faq-question" onclick="toggleFAQ(this)">

                    How can I change my password?

                    <span class="arrow">+</span>

                </button>

                <div class="faq-answer">

                    Go to the <b>Change Password</b> option from the
                    sidebar. Enter your current password, new password
                    and confirm the new password to update it.

                </div>

            </div>


            <div class="faq-item">

                <button class="faq-question" onclick="toggleFAQ(this)">

                    What should I do if I find incorrect information?

                    <span class="arrow">+</span>

                </button>

                <div class="faq-answer">

                    If your profile information is incorrect, update
                    your profile information if the option is available.
                    For other issues, contact the system administrator
                    or support team.

                </div>

            </div>

        </div>


        <!-- ================= HOW SYSTEM WORKS ================= -->

        <div class="section">

            <h2 class="section-title">
                How the System Works
            </h2>


            <div class="steps">

                <div class="step">

                    <div class="step-number">
                        1
                    </div>

                    <h4>Register</h4>

                    <p>
                        Create your account by providing
                        the required information.
                    </p>

                </div>


                <div class="step">

                    <div class="step-number">
                        2
                    </div>

                    <h4>Complete Profile</h4>

                    <p>
                        Provide your personal and category-related
                        information.
                    </p>

                </div>


                <div class="step">

                    <div class="step-number">
                        3
                    </div>

                    <h4>Check Eligibility</h4>

                    <p>
                        The system compares your profile
                        with scheme requirements.
                    </p>

                </div>


                <div class="step">

                    <div class="step-number">
                        4
                    </div>

                    <h4>View Schemes</h4>

                    <p>
                        View suitable government schemes
                        and their benefits.
                    </p>

                </div>

            </div>

        </div>


        <!-- ================= CONTACT SUPPORT ================= -->

        <div class="section">

            <h2 class="section-title">
                Contact Support
            </h2>


            <div class="contact-grid">

                <div class="contact-item">

                    <h4>📧 Email Support</h4>

                    <p>
                        support@example.com
                    </p>

                </div>


                <div class="contact-item">

                    <h4>📞 Phone Support</h4>

                    <p>
                        +91 XXXXX XXXXX
                    </p>

                </div>


                <div class="contact-item">

                    <h4>🕒 Support Hours</h4>

                    <p>
                        Monday - Friday<br>
                        10:00 AM - 5:00 PM
                    </p>

                </div>

            </div>

        </div>


        <!-- ================= BACK BUTTON ================= -->

        <a href="User_Dashboard_servler" class="back-button">
            ← Back to Dashboard
        </a>

    </div>

</div>


<!-- ================= JAVASCRIPT ================= -->

<script>

function toggleFAQ(button) {

    var answer = button.nextElementSibling;

    var arrow = button.querySelector(".arrow");


    if (answer.style.display === "block") {

        answer.style.display = "none";

        arrow.innerHTML = "+";

    } else {

        answer.style.display = "block";

        arrow.innerHTML = "−";

    }

}

</script>

</body>
</html>