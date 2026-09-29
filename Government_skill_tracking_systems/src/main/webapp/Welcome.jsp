<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background:url('gb.png') no-repeat center center/cover;
            color: #333;
        }

        .overlay {
            background: rgba(255, 255, 255, 0.3);
            height: 100vh;
            padding: 40px;
        }

        .container {
            max-width: 1100px;
            margin: auto;
        }

        h1 {
            color: #1e7d32;
            font-size: 40px;
            margin-bottom: 5px;
        }

        h2 {
            font-weight: normal;
            color: #555;
            margin-bottom: 30px;
        }

        .tagline {
            font-size: 26px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .subtext {
            margin-bottom: 40px;
            color: #666;
        }

        .buttons {
            display: flex;
            gap: 30px;
        }

        .card {
            background: #fff;
            padding: 25px;
            border-radius: 10px;
            width: 250px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        .card h3 {
            margin-bottom: 10px;
        }

        .btn {
            margin-top: 15px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 15px;
        }

        .user-btn {
            background: #2e7d32;
            color: white;
        }

        .admin-btn {
            background: #1565c0;
            color: white;
        }

        .features {
            margin-top: 60px;
            display: flex;
            justify-content: space-between;
        }

        .feature {
            width: 23%;
            text-align: center;
        }

        footer {
            margin-top: 50px;
            text-align: center;
            font-size: 14px;
            color: #777;
        }
    </style>
</head>
<body>

<div class="overlay">
    <div class="container">

        <h1>Smart Government</h1>
        <h2>Scheme Eligibility Checker</h2>

        <div class="tagline">
            Find the Right Schemes. Build a Better Tomorrow.
        </div>

        <div class="subtext">
            Check your eligibility, discover government schemes and get the support you deserve.
        </div>

        <div class="buttons">

            <div class="card">
                <h3>User Login</h3>
                <p>Check eligibility and view schemes</p>
                <button class="btn user-btn" onclick="userLogin()">User Login</button>
            </div>

            <div class="card">
                <h3>Admin Login</h3>
                <p>Manage schemes and applications</p>
                <button class="btn admin-btn" onclick="adminLogin()">Admin Login</button>
            </div>

        </div>

        
</div>

<script>
    function userLogin() {
        window.location.href = "Login_page.jsp";
    }

    function adminLogin() {
        window.location.href = "Admin_Login.jsp";
    }
</script>

</body>

</html>