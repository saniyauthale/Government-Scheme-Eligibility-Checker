
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    // ================= GET SCHEME ID =================
    String id = request.getParameter("id");

    // ================= VALIDATION =================
    if(id == null || id.trim().equals("")){

        response.sendRedirect("Admin_Manage_Scheme.jsp");
        return;
    }

    // ================= DATABASE =================
    String url = "jdbc:mysql://localhost:3306/skill_tracking_system";
    String dbUser = "root";
    String dbPassword = "root";

    Connection con = null;
    PreparedStatement ps = null;

    try{

        // Load Driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Connection
        con = DriverManager.getConnection(
        		"jdbc:mysql://localhost:3306/skill_tracking_system",
                "root",
                "root");

        // ================= DELETE QUERY =================
        String sql =
        "DELETE FROM schemes WHERE scheme_id=?";

        ps = con.prepareStatement(sql);

        ps.setInt(1, Integer.parseInt(id));

        // Execute
        int rows = ps.executeUpdate();

        // ================= SUCCESS =================
        if(rows > 0){

            response.sendRedirect(
            "Admin_Manage_Scheme.jsp?msg=deleted");

        } else{

            response.sendRedirect(
            "Admin_Manage_Scheme.jsp?msg=failed");
        }

    } catch(Exception e){
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Error</title>

<style>

body{
    font-family:Arial;
    background:#f5f7fb;
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
}

.error-box{
    background:white;
    padding:30px;
    border-radius:12px;
    box-shadow:0 4px 20px rgba(0,0,0,0.08);
    width:500px;
    text-align:center;
}

.error-box h2{
    color:#dc2626;
    margin-bottom:15px;
}

.back-btn{
    display:inline-block;
    margin-top:20px;
    background:#2563eb;
    color:white;
    padding:12px 20px;
    border-radius:8px;
    text-decoration:none;
    font-weight:600;
}

.back-btn:hover{
    background:#1d4ed8;
}

</style>
</head>

<body>

<div class="error-box">

    <h2>Delete Failed</h2>

    <p>
        <%= e.getMessage() %>
    </p>

    <a href="Admin_Manage_Scheme.jsp"
       class="back-btn">

       Back to Manage Schemes
    </a>

</div>

</body>
</html>

<%
    } finally{

        // ================= CLOSE CONNECTION =================
        try{
            if(ps != null) ps.close();
        } catch(Exception e){}

        try{
            if(con != null) con.close();
        } catch(Exception e){}
    }
%>