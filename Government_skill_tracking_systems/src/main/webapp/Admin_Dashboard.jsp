<%@ page import="java.util.ArrayList" %>
<%@ page import="Admin_Dashboard_servlet.Scheme" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Admin Dashboard</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family: Arial, sans-serif;
}

body{
    background:#f4f7fc;
}

/* MAIN LAYOUT */

.container{
    display:flex;
    min-height:100vh;
}

/* SIDEBAR */

.sidebar{
    width:250px;
    background:#071739;
    color:white;
    padding:20px;
}

.logo{
    font-size:30px;
    font-weight:bold;
    margin-bottom:40px;
}

.menu{
    list-style:none;
}

.menu li{
    margin:20px 0;
}

.menu li a{
    text-decoration:none;
    color:white;
    display:flex;
    align-items:center;
    gap:12px;
    padding:12px;
    border-radius:10px;
    transition:0.3s;
}

.menu li a:hover{
    background:#0d6efd;
}

/* MAIN CONTENT */

.main{
    flex:1;
    padding:25px;
}

/* HEADER */

.header{
    background:white;
    border-radius:15px;
    padding:30px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    box-shadow:0 2px 10px rgba(0,0,0,0.08);
}

.header-text h1{
    font-size:42px;
    margin-bottom:10px;
}

.header-text p{
    color:gray;
    font-size:18px;
}

.header img{
    width:220px;
}

/* CARDS */

.cards{
    display:grid;
    grid-template-columns:repeat(4,1fr);
    gap:20px;
    margin-top:25px;
}

.card{
    background:white;
    padding:25px;
    border-radius:15px;
    box-shadow:0 2px 10px rgba(0,0,0,0.08);
    display:flex;
    align-items:center;
    gap:20px;
}

.card i{
    font-size:35px;
    padding:20px;
    border-radius:50%;
}

.blue{
    background:#dbeafe;
    color:#2563eb;
}

.green{
    background:#dcfce7;
    color:#16a34a;
}

.orange{
    background:#ffedd5;
    color:#ea580c;
}

.purple{
    background:#f3e8ff;
    color:#9333ea;
}

.card h2{
    font-size:32px;
    margin-top:5px;
}

/* BUTTONS */

.actions{
    display:grid;
    grid-template-columns:repeat(3,1fr);
    gap:20px;
    margin-top:25px;
}

.btn{
    padding:18px;
    border:none;
    border-radius:12px;
    font-size:18px;
    cursor:pointer;
    transition:0.3s;
    font-weight:bold;

    text-decoration:none;
    display:flex;
    align-items:center;
    justify-content:center;
    gap:10px;
}

.btn-primary{
    background:#0d6efd;
    color:white;
}

.btn-light{
    background:white;
    border:1px solid #ccc;
}

.btn-danger{
    background:white;
    border:1px solid #ccc;
    color:red;
}

.btn:hover{
    transform:translateY(-2px);
}

/* TABLE */

.table-section{
    margin-top:30px;
    background:white;
    border-radius:15px;
    padding:25px;
    box-shadow:0 2px 10px rgba(0,0,0,0.08);
}

.table-section h2{
    margin-bottom:20px;
}

table{
    width:100%;
    border-collapse:collapse;
}

table th{
    background:#f1f5f9;
    padding:15px;
    text-align:left;
}

table td{
    padding:15px;
    border-bottom:1px solid #eee;
}

.status{
    padding:6px 12px;
    border-radius:8px;
    font-size:14px;
    font-weight:bold;
}

.active{
    background:#dcfce7;
    color:#15803d;
}

.inactive{
    background:#ffedd5;
    color:#ea580c;
}

.action-btn{
    border:none;
    padding:10px 12px;
    border-radius:8px;
    cursor:pointer;
    background:#eff6ff;
    color:#2563eb;
}

/* RESPONSIVE */

@media(max-width:1000px){

    .cards{
        grid-template-columns:repeat(2,1fr);
    }

    .actions{
        grid-template-columns:1fr;
    }
}

@media(max-width:700px){

    .container{
        flex-direction:column;
    }

    .sidebar{
        width:100%;
    }

    .cards{
        grid-template-columns:1fr;
    }

    .header{
        flex-direction:column;
        text-align:center;
    }

    .header img{
        margin-top:20px;
    }
}

</style>
</head>
<body>

<div class="container">

    <!-- SIDEBAR -->

    <div class="sidebar">

        <div class="logo">
            Admin Panel
        </div>

        <ul class="menu">

            <li>
               <a href="Admin_Dashboard_servlet">
                    <i class="fa-solid fa-house"></i>
                    Dashboard
                </a>
            </li>

            <li>
               <a href="Admin_Manage_Scheme.jsp">
                    <i class="fa-solid fa-list"></i>
                    Manage Schemes
                </a>
            </li>

            <li>
                <a href="UsersServlet">
                    <i class="fa-solid fa-users"></i>
                    Users
                </a>
            </li>

            <li>
               <a href="Admin_Login.jsp">
                    <i class="fa-solid fa-right-from-bracket"></i>
                    Logout
                </a>
            </li>

        </ul>

    </div>

    <!-- MAIN -->

    <div class="main">

        <!-- HEADER -->

        <div class="header">

            <div class="header-text">

                <h1>Welcome Admin</h1>

                <p>Manage schemes efficiently</p>

            </div>

            <img src="https://cdn-icons-png.flaticon.com/512/4140/4140048.png">

        </div>

        <!-- CARDS -->

        <div class="cards">

            <div class="card">

                <i class="fa-solid fa-file blue"></i>

                <div>

                    <p>Total Schemes</p>

                    <h2>
                        <%= request.getAttribute("totalSchemes") %>
                    </h2>

                </div>

            </div>

            <div class="card">

                <i class="fa-solid fa-check green"></i>

                <div>

                    <p>Active</p>

                    <h2>
                        <%= request.getAttribute("activeSchemes") %>
                    </h2>

                </div>

            </div>

            <div class="card">

                <i class="fa-solid fa-pause orange"></i>

                <div>

                    <p>Inactive</p>

                    <h2>
                        <%= request.getAttribute("inactiveSchemes") %>
                    </h2>

                </div>

            </div>

            <div class="card">

                <i class="fa-solid fa-users purple"></i>

                <div>

                    <p>Users</p>

                    <h2><%= request.getAttribute("totalUsers") %></h2>

                </div>

            </div>

        </div>

        <!-- BUTTONS -->

        <div class="actions">

           <a href="Admin_Add_Scheme.jsp" class="btn btn-primary">
    <i class="fa-solid fa-plus"></i>
    Add Scheme
</a>

               

           <a href="Admin_Manage_Scheme.jsp" class="btn btn-light">
    <i class="fa-solid fa-list"></i>
    Manage Schemes
</a>

           <a href="Admin_Login.jsp" class="btn btn-danger">
    <i class="fa-solid fa-right-from-bracket"></i>
    Logout
</a>
        </div>

        <!-- TABLE -->

        <div class="table-section">

            <h2>Recent Schemes</h2>

            <table>

                <thead>

                    <tr>

                        <th>ID</th>
                        <th>Scheme Name</th>
                        <th>Category</th>
                        <th>Candidate Type</th>
                        <th>Status</th>
                        <th>Last Date</th>
                       

                    </tr>

                </thead>

                <tbody>

                <%

                ArrayList<Scheme> list =
                (ArrayList<Scheme>)request.getAttribute("schemeList");

                if(list != null){

                    for(Scheme s : list){

                %>

                    <tr>

                        <td><%= s.getSchemeId() %></td>

                        <td><%= s.getSchemeName() %></td>

                        <td><%= s.getCategory() %></td>

                        <td><%= s.getCandidateType() %></td>

                        <td>

                            <span class="status
                            <%= s.getStatus().equalsIgnoreCase("Active")
                            ? "active" : "inactive" %>">

                            <%= s.getStatus() %>

                            </span>

                        </td>

                        <td><%= s.getLastDate() %></td>

                       

                    </tr>

                <%
                    }
                }
                %>

                </tbody>

            </table>

        </div>

    </div>

</div>
</body>
</html>