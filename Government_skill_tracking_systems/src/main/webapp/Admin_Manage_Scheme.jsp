
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    // ================= DATABASE CONNECTION =================
    String url = "jdbc:mysql://localhost:3306/skill_tracking_system";
    String dbUser = "root";
    String dbPassword = "root";

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Schemes</title>

<!-- Font Awesome -->
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
/* ================= GENERAL ================= */
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI', sans-serif;
}

body{
    background:#f5f7fb;
}

/* ================= LAYOUT ================= */
.wrapper{
    display:flex;
    min-height:100vh;
}

/* ================= SIDEBAR ================= */
.sidebar{
    width:260px;
    background:linear-gradient(180deg,#0b2e63,#082348);
    color:white;
    padding:20px 0;
}

.logo{
    padding:0 25px 25px;
    font-size:24px;
    font-weight:bold;
    border-bottom:1px solid rgba(255,255,255,0.1);
}

.logo i{
    margin-right:10px;
}

.menu{
    margin-top:30px;
}

.menu a{
    display:block;
    padding:14px 25px;
    color:#d8e4ff;
    text-decoration:none;
    font-size:16px;
    transition:0.3s;
}

.menu a:hover,
.menu a.active{
    background:#2d6df6;
    color:white;
    border-radius:8px;
    margin:0 15px;
}

/* ================= MAIN CONTENT ================= */
.main{
    flex:1;
    padding:30px;
}

.header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:30px;
}

.header h1{
    font-size:36px;
    color:#1a2b49;
}

.header p{
    color:#64748b;
    margin-top:8px;
}

.add-btn{
    background:#2d6df6;
    color:white;
    padding:12px 22px;
    border-radius:8px;
    text-decoration:none;
    font-weight:600;
}

.add-btn:hover{
    background:#1f5be0;
}

/* ================= CARD ================= */
.card{
    background:white;
    border-radius:16px;
    padding:25px;
    box-shadow:0 4px 20px rgba(0,0,0,0.05);
}

/* ================= FILTERS ================= */
.filters{
    display:flex;
    justify-content:space-between;
    margin-bottom:25px;
    flex-wrap:wrap;
    gap:15px;
}

.search-box input,
.filters select{
    padding:12px 15px;
    border:1px solid #dcdfe6;
    border-radius:8px;
    font-size:14px;
    outline:none;
}

.search-box input{
    width:320px;
}

/* ================= TABLE ================= */
table{
    width:100%;
    border-collapse:collapse;
}

th{
    background:#f8fafc;
    color:#1a2b49;
    padding:15px;
    text-align:left;
    font-weight:600;
    border-bottom:1px solid #e6eaf2;
}

td{
    padding:18px 15px;
    border-bottom:1px solid #eef1f6;
    vertical-align:top;
}

.scheme-name{
    font-weight:600;
    color:#2563eb;
    margin-bottom:4px;
}

.scheme-desc{
    font-size:13px;
    color:#64748b;
}

/* ================= BADGES ================= */
.badge{
    display:inline-block;
    padding:5px 12px;
    border-radius:20px;
    font-size:12px;
    font-weight:600;
}

.badge-blue{
    background:#dbeafe;
    color:#2563eb;
}

.badge-green{
    background:#dcfce7;
    color:#16a34a;
}

.status-active{
    background:#dcfce7;
    color:#16a34a;
}

.status-inactive{
    background:#f1f5f9;
    color:#64748b;
}

/* ================= ACTION BUTTONS ================= */
.actions a{
    display:inline-block;
    width:36px;
    height:36px;
    line-height:36px;
    text-align:center;
    border-radius:8px;
    margin-right:5px;
    text-decoration:none;
    font-size:14px;
}

.view-btn{
    border:1px solid #3b82f6;
    color:#3b82f6;
}

.edit-btn{
    border:1px solid #f59e0b;
    color:#f59e0b;
}

.delete-btn{
    border:1px solid #ef4444;
    color:#ef4444;
}
</style>
</head>
<body>

<div class="wrapper">

    <!-- ================= SIDEBAR ================= -->
    <div class="sidebar">
        <div class="logo">
            <i class="fas fa-landmark"></i> Scheme Checker
        </div>

        <div class="menu">
            <a href="Admin_Dashboard_servlet">
                <i class="fas fa-home"></i> Dashboard
            </a>

            <a href="Admin_Add_Scheme.jsp">
                <i class="fas fa-plus-circle"></i> Add Scheme
            </a>

            <a href="Admin_Manage_Scheme.jsp" class="active">
                <i class="fas fa-list"></i> Manage Schemes
            </a>

            <a href="Logout_Servlet">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
        </div>
    </div>

    <!-- ================= MAIN CONTENT ================= -->
    <div class="main">

        <!-- Header -->
        <div class="header">
            <div>
                <h1>Manage Schemes</h1>
                <p>View, edit and delete government schemes.</p>
            </div>

            <a href="Admin_Add_Scheme.jsp" class="add-btn">
                <i class="fas fa-plus"></i> Add New Scheme
            </a>
        </div>

        <!-- Card -->
        <div class="card">

            <!-- Filters -->
            <div class="filters">
                <form method="get" action="Admin_Manage_Scheme.jsp">

<div class="search-box">

    <input type="text"
           name="search"
           placeholder="Search schemes..."
           value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">

</div>

</form>

                <div>
                    <select>
                        <option>All Categories</option>
                    </select>

                    <select>
                        <option>All Status</option>
                    </select>
                </div>
            </div>

            <!-- Table -->
            <table>
                <thead>
                    <tr>
                        <th>Scheme Id</th>
                        <th>Scheme Name</th>
                        <th>Category</th>
                        <th>Eligibility Criteria</th>
                        <th>Status</th>
                        <th>Date Added</th>
                        <th>Actions</th>
                    </tr>
                </thead>

                <tbody>
                <%
try {

    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection(url, dbUser, dbPassword);

    String search = request.getParameter("search");

    String sql;

    if(search != null && !search.trim().equals("")){

        sql = "SELECT * FROM schemes WHERE "
            + "scheme_name LIKE ? OR "
            + "category LIKE ? OR "
            + "description LIKE ? "
            + "ORDER BY scheme_id DESC";

        ps = con.prepareStatement(sql);

        ps.setString(1, "%" + search + "%");
        ps.setString(2, "%" + search + "%");
        ps.setString(3, "%" + search + "%");

    } else {

        sql = "SELECT * FROM schemes ORDER BY scheme_id DESC";

        ps = con.prepareStatement(sql);
    }

    // IMPORTANT: execute only once here
    rs = ps.executeQuery();

    int srNo = 1;

    while (rs.next()) {

        int schemeId = rs.getInt("scheme_id");
        String schemeName = rs.getString("scheme_name");
        String description = rs.getString("description");
        String category = rs.getString("category");
        String eligibility = rs.getString("eligibility");
        String status = rs.getString("status");
        String createdAt = rs.getString("created_at");

        String statusClass = "status-inactive";
        if ("Active".equalsIgnoreCase(status)) {
            statusClass = "status-active";
        }
%>
                    <tr>
                        <td><%= srNo++ %></td>

                        <td>
                            <div class="scheme-name">
                                <%= schemeName %>
                            </div>
                            <div class="scheme-desc">
                                <%= description %>
                            </div>
                        </td>

                        <td>
                            <span class="badge badge-blue">
                                <%= category %>
                            </span>
                        </td>

                        <td>
                            <%= eligibility %>
                        </td>

                        <td>
                            <span class="badge <%= statusClass %>">
                                <%= status %>
                            </span>
                        </td>

                        <td>
                            <%= createdAt %>
                        </td>

                        <td class="actions">
                            <a href="Admin_View_Particular_Scheme.jsp?id=<%= schemeId %>"
                               class="view-btn"
                               title="View">
                                <i class="fas fa-eye"></i>
                            </a>

                            <a href="Admin_Edit_Scheme.jsp?id=<%= schemeId %>"
                               class="edit-btn"
                               title="Edit">
                                <i class="fas fa-pen"></i>
                            </a>

                            <a href="Admin_Delete_Scheme.jsp?id=<%= rs.getInt("scheme_id") %>"
   								class="delete-btn" title="Delete"
   								onclick="return confirm('Are you sure you want to delete this scheme?');">

  							 <i class="fas fa-trash"></i>
   								
							</a>
                        </td>
                    </tr>

                <%
                        } // end while

                    } catch(Exception e) {
                %>
                    <tr>
                        <td colspan="7" style="text-align:center; color:red;">
                            Error: <%= e.getMessage() %>
                        </td>
                    </tr>
                <%
                    } finally {
                        try { if(rs != null) rs.close(); } catch(Exception ex) {}
                        try { if(ps != null) ps.close(); } catch(Exception ex) {}
                        try { if(con != null) con.close(); } catch(Exception ex) {}
                    }
                %>
                </tbody>
            </table>

        </div>
    </div>
</div>

</body>
</html>