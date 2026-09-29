<%@ page import="java.util.*" %>
<%@ page import="UsersServlet.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    List<User> list = (List<User>) request.getAttribute("userList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registered Users</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: #f4f6f9;
        margin: 0;
        padding: 20px;
    }

    .container {
        padding: 20px;
        background: white;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }

    /* Header section for title and back button */
    .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
        flex-wrap: wrap;
        gap: 10px;
    }

    .title {
        font-size: 28px;
        font-weight: bold;
        color: #333;
        margin: 0;
    }

    /* Back button style similar to Add Scheme button */
    .back-btn {
        background: #0d6efd;
        color: white;
        text-decoration: none;
        padding: 12px 24px;
        border-radius: 10px;
        font-size: 18px;
        font-weight: bold;
        display: inline-block;
        transition: background 0.3s ease;
    }

    .back-btn:hover {
        background: #0b5ed7;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background: white;
        border-radius: 10px;
        overflow: hidden;
    }

    th, td {
        padding: 12px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }

    th {
        background: #0d6efd;
        color: white;
    }

    tr:hover {
        background: #f1f1f1;
    }

    .no-data {
        padding: 20px;
        color: red;
        font-weight: bold;
        text-align: center;
    }
</style>
</head>

<body>

<div class="container">

    <!-- Title and Back Button -->
    <div class="header">
        <div class="title">Registered Users</div>
        <a href="Admin_Dashboard.jsp" class="back-btn">← Back</a>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Age</th>
            <th>Gender</th>
            <th>Mobile</th>
            <th>Email</th>
            
            <th>Category</th>
            
        </tr>

        <%
            if (list != null && !list.isEmpty()) {
                for (User u : list) {
        %>
        <tr>
            <td><%= u.getUserId() %></td>
            <td><%= u.getFullName() %></td>
            <td><%= u.getAge() %></td>
            <td><%= u.getGender() %></td>
            <td><%= u.getMobile() %></td>
            <td><%= u.getEmail() %></td>
            
            <td><%= u.getCategory() %></td>
            
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="11" class="no-data">
                No users found in registration table.
            </td>
        </tr>
        <%
            }
        %>

    </table>
</div>

</body>
</html>