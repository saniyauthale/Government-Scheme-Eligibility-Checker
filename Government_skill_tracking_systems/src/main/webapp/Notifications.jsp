<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>

<%
    List<Map<String, Object>> notifications =
            (List<Map<String, Object>>)
            request.getAttribute("notifications");

    Integer unreadCount =
            (Integer) request.getAttribute("unreadCount");

    if (notifications == null) {
        notifications =
                new java.util.ArrayList<>();
    }

    if (unreadCount == null) {
        unreadCount = 0;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Notifications</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f5f7fb;
            color: #10244a;
        }

        .container {
            width: 90%;
            max-width: 1100px;
            margin: 40px auto;
        }

        .top-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .title-section h1 {
            font-size: 30px;
            margin-bottom: 7px;
        }

        .title-section p {
            color: #64748b;
            font-size: 14px;
        }

        .back-button {
            text-decoration: none;
            background: #164a9b;
            color: white;
            padding: 11px 18px;
            border-radius: 7px;
            font-size: 14px;
        }

        .back-button:hover {
            background: #0f3b7d;
        }

        .count-card {
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 3px 12px rgba(30,60,90,0.08);
            margin-bottom: 20px;
        }

        .count-card h3 {
            font-size: 16px;
            margin-bottom: 8px;
        }

        .count {
            font-size: 28px;
            font-weight: bold;
            color: #164a9b;
        }

        .notification-list {
            background: white;
            border-radius: 12px;
            box-shadow: 0 3px 12px rgba(30,60,90,0.08);
            overflow: hidden;
        }

        .notification-header {
            padding: 20px;
            border-bottom: 1px solid #e5e7eb;
        }

        .notification-header h2 {
            font-size: 20px;
        }

        .notification-row {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 20px;
            border-bottom: 1px solid #edf0f4;
        }

        .notification-row:last-child {
            border-bottom: none;
        }

        .notification-row.unread {
            background: #f8fbff;
        }

        .notification-dot {
            width: 11px;
            height: 11px;
            background: #ff8a00;
            border-radius: 50%;
            flex-shrink: 0;
        }

        .notification-content {
            flex: 1;
        }

        .notification-text {
            font-size: 15px;
            font-weight: 600;
            color: #1e293b;
            margin-bottom: 7px;
        }

        .notification-type {
            display: inline-block;
            font-size: 11px;
            padding: 4px 9px;
            border-radius: 12px;
            background: #eaf2ff;
            color: #164a9b;
            margin-right: 8px;
        }

        .notification-time {
            font-size: 12px;
            color: #64748b;
        }

        .read-status {
            font-size: 12px;
            color: #64748b;
        }

        .no-notifications {
            padding: 50px;
            text-align: center;
            color: #64748b;
        }

        .no-notifications-icon {
            font-size: 40px;
            margin-bottom: 15px;
        }

        @media (max-width: 700px) {

            .container {
                width: 94%;
                margin: 25px auto;
            }

            .top-section {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .notification-row {
                align-items: flex-start;
            }

        }

    </style>

</head>

<body>

<div class="container">

    <!-- HEADER -->

    <div class="top-section">

        <div class="title-section">

            <h1>🔔 Notifications</h1>

            <p>
                View updates and notifications related to your schemes.
            </p>

        </div>

        <a href="User_Dashboard_servler"
           class="back-button">
            ← Back to Dashboard
        </a>

    </div>


    <!-- UNREAD COUNT -->

    <div class="count-card">

        <h3>Unread Notifications</h3>

        <div class="count">
            <%= unreadCount %>
        </div>

    </div>


    <!-- NOTIFICATIONS -->

    <div class="notification-list">

        <div class="notification-header">

            <h2>All Notifications</h2>

        </div>


        <%
            if (notifications.isEmpty()) {
        %>

            <div class="no-notifications">

                <div class="no-notifications-icon">
                    🔔
                </div>

                <div>
                    No notifications available.
                </div>

            </div>

        <%
            } else {

                for (Map<String, Object> notification
                        : notifications) {

                    String text =
                            notification.get(
                                    "notification_text")
                                    == null
                                    ? "New notification"
                                    : notification.get(
                                        "notification_text")
                                        .toString();

                    String type =
                            notification.get(
                                    "notification_type")
                                    == null
                                    ? "GENERAL"
                                    : notification.get(
                                        "notification_type")
                                        .toString();

                    String time =
                            notification.get(
                                    "notification_time")
                                    == null
                                    ? ""
                                    : notification.get(
                                        "notification_time")
                                        .toString();

                    String isRead =
                            notification.get(
                                    "is_read")
                                    == null
                                    ? "No"
                                    : notification.get(
                                        "is_read")
                                        .toString();

                    String rowClass =
                            "No".equalsIgnoreCase(isRead)
                            ? "notification-row unread"
                            : "notification-row";
        %>


            <div class="<%= rowClass %>">

                <div class="notification-dot"></div>

                <div class="notification-content">

                    <div class="notification-text">
                        <%= text %>
                    </div>

                    <span class="notification-type">
                        <%= type %>
                    </span>

                    <span class="notification-time">
                        <%= time %>
                    </span>

                </div>

                <div class="read-status">

                    <%
                        if ("No".equalsIgnoreCase(isRead)) {
                    %>
                        Unread
                    <%
                        } else {
                    %>
                        Read
                    <%
                        }
                    %>

                </div>

            </div>


        <%
                }
            }
        %>

    </div>

</div>

</body>

</html>