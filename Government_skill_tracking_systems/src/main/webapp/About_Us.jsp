<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>About Us - Government Scheme Eligibility Checker</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Poppins', sans-serif;
      background-color: #f7f9fc;
      color: #1f2937;
      line-height: 1.7;
    }

    .container {
      width: 95%;
      max-width: 1300px;
      margin: auto;
    }

    header {
      background: #ffffff;
      border-bottom: 1px solid #dbe3ef;
      padding: 22px 0;
    }

    .navbar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      flex-wrap: wrap;
      gap: 20px;
    }

    .logo-section {
      display: flex;
      align-items: center;
      gap: 16px;
    }

    .logo-section img {
      width: 60px;
    }

    .logo-text h2 {
      font-size: 30px;
      color: #0f2b6b;
      font-weight: 700;
    }

    .logo-text p {
      font-size: 18px;
      color: #5c677d;
      margin-top: -6px;
    }

    .top-icons {
      display: flex;
      gap: 40px;
      text-align: center;
    }

    .icon-box {
      color: #0f2b6b;
      font-size: 15px;
      font-weight: 500;
    }

    .icon-box span {
      display: block;
      font-size: 30px;
      margin-bottom: 6px;
    }

    .about-section {
      padding: 40px 0;
    }

    .about-grid {
      display: grid;
      grid-template-columns: 1.1fr 1fr;
      gap: 50px;
      align-items: center;
    }

    .about-content h1 {
      font-size: 58px;
      color: #0f2b6b;
      margin-bottom: 15px;
      line-height: 1.1;
    }

    .underline {
      width: 90px;
      height: 5px;
      background: #2851b3;
      margin-bottom: 28px;
      border-radius: 10px;
    }

    .tagline {
      font-size: 24px;
      color: #2851b3;
      font-weight: 600;
      margin-bottom: 28px;
      line-height: 1.4;
    }

    .about-content p {
      font-size: 17px;
      color: #4b5563;
      margin-bottom: 25px;
    }

    .info-card {
      background: #ffffff;
      border-radius: 20px;
      padding: 35px;
      box-shadow: 0 4px 20px rgba(0,0,0,0.05);
      border: 1px solid #e7edf7;
    }

    .info-item {
      display: flex;
      gap: 22px;
      margin-bottom: 35px;
      padding-bottom: 30px;
      border-bottom: 1px solid #e5e7eb;
    }

    .info-item:last-child {
      margin-bottom: 0;
      padding-bottom: 0;
      border-bottom: none;
    }

    .info-icon {
      min-width: 70px;
      height: 70px;
      border-radius: 50%;
      background: #eef3ff;
      display: flex;
      justify-content: center;
      align-items: center;
      font-size: 32px;
    }

    .info-text h3 {
      color: #0f2b6b;
      font-size: 28px;
      margin-bottom: 8px;
    }

    .info-text p {
      font-size: 18px;
      color: #4b5563;
      margin: 0;
    }

    .steps-section {
      padding-bottom: 40px;
    }

    .steps-grid {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 25px;
    }

    .step-card {
      background: #ffffff;
      padding: 30px 25px;
      border-radius: 18px;
      text-align: center;
      border: 1px solid #e7edf7;
      transition: 0.3s ease;
    }

    .step-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 8px 18px rgba(0,0,0,0.08);
    }

    .step-icon {
      width: 75px;
      height: 75px;
      border-radius: 50%;
      background: #eef3ff;
      display: flex;
      justify-content: center;
      align-items: center;
      font-size: 34px;
      margin: auto;
      margin-bottom: 18px;
    }

    .step-card h3 {
      color: #0f2b6b;
      font-size: 24px;
      margin-bottom: 12px;
    }

    .step-card p {
      color: #5c677d;
      font-size: 17px;
    }

    footer {
      background: #0f2b6b;
      color: #ffffff;
      text-align: center;
      padding: 22px;
      font-size: 18px;
      margin-top: 20px;
    }

    @media(max-width: 1100px) {
      .about-grid {
        grid-template-columns: 1fr;
      }

      .steps-grid {
        grid-template-columns: repeat(2, 1fr);
      }

      .about-content h1 {
        font-size: 40px;
      }
    }

    @media(max-width: 768px) {
      .container {
        width: 92%;
      }

      .navbar {
        flex-direction: column;
        align-items: flex-start;
      }

      .top-icons {
        gap: 20px;
        flex-wrap: wrap;
      }

      .about-content h1 {
        font-size: 48px;
      }

      .tagline {
        font-size: 24px;
      }

      .about-content p,
      .info-text p,
      .step-card p {
        font-size: 16px;
      }

      .steps-grid {
        grid-template-columns: 1fr;
      }
    }
    
    /* Navbar */
.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 50px;
    background: #1e3a8a;
    color: white;
}

.navbar h2 {
    margin: 0;
}

.nav-links a {
    color: white;
    text-decoration: none;
    margin: 0 12px;
    font-size: 14px;
}

.nav-links a:hover {
    color: #ffcc00;
}
    
  </style>
</head>
<body>

 
<div class="navbar">
    <h2>Government Scheme Eligibility Checker System</h2>
    <div class="nav-links">
        <a href="Home.jsp">Home</a>
        <a href="About_Us.jsp">About</a>
        
        <a href="Admin_Login.jsp" class="login-btn">Login</a>
    </div>
</div>

  <section class="about-section">
    <div class="container about-grid">

      <div class="about-content">
        <h1>About Us</h1>
        <div class="underline"></div>

        <div class="tagline">
          Empowering Citizens. Enabling Access.<br>
          Building a Welfare-First India.
        </div>

        <p>
          The Government Scheme Eligibility Checker System is a digital platform designed to simplify access to government welfare schemes. The system helps citizens quickly identify schemes for which they are eligible in a transparent and user-friendly manner.
        </p>

        <p>
          Our mission is to bridge the gap between citizens and government welfare programs by using technology to ensure that every deserving individual receives the right information and benefits.
        </p>
      </div>


      <div class="info-card">

        <div class="info-item">
          <div class="info-icon">🎯</div>

          <div class="info-text">
            <h3>Our Mission</h3>
            <p>
              To ensure that no eligible citizen is left behind from accessing the benefits of government schemes.
            </p>
          </div>
        </div>


        <div class="info-item">
          <div class="info-icon">👁️</div>

          <div class="info-text">
            <h3>Our Vision</h3>
            <p>
              To create a transparent, inclusive, and efficient digital ecosystem for welfare accessibility.
            </p>
          </div>
        </div>


        <div class="info-item">
          <div class="info-icon">⚖️</div>

          <div class="info-text">
            <h3>Our Values</h3>
            <p>
              Integrity • Transparency • Inclusiveness • Accountability
            </p>
          </div>
        </div>

      </div>

    </div>
  </section>


  <section class="steps-section">
    <div class="container">

      <div class="steps-grid">

        <div class="step-card">
          <div class="step-icon">🔍</div>
          <h3>Discover</h3>
          <p>
            Find government schemes you may be eligible for.
          </p>
        </div>


        <div class="step-card">
          <div class="step-icon">✅</div>
          <h3>Check</h3>
          <p>
            Enter details and verify your eligibility.
          </p>
        </div>


        <div class="step-card">
          <div class="step-icon">📋</div>
          <h3>View Results</h3>
          <p>
            Get a list of schemes matching your profile.
          </p>
        </div>


        <div class="step-card">
          <div class="step-icon">🤝</div>
          <h3>Get Benefits</h3>
          <p>
            Apply and avail benefits from suitable schemes.
          </p>
        </div>

      </div>

    </div>
  </section>


  <footer>
    Our commitment is to build a stronger, inclusive and empowered India by ensuring the right welfare reaches the right citizens.
  </footer>

</body>
</html>
