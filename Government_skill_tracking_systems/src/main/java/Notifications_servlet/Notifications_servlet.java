package Notifications_servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Notifications_servlet")
public class Notifications_servlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // =========================================================
    // DATABASE CONFIGURATION
    // =========================================================

    private static final String URL =
            "jdbc:mysql://localhost:3306/skill_tracking_system";

    private static final String USER = "root";

    private static final String PASSWORD = "root";


    // =========================================================
    // DO GET
    // =========================================================

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // =====================================================
        // 1. GET SESSION
        // =====================================================

        HttpSession session = request.getSession(false);


        // =====================================================
        // 2. CHECK LOGIN
        // =====================================================

        if (session == null ||
            session.getAttribute("userId") == null) {

            response.sendRedirect("User_Login.jsp");

            return;
        }


        // =====================================================
        // 3. GET USER ID
        // =====================================================

        int userId;

        try {

            userId = Integer.parseInt(
                    session.getAttribute("userId").toString()
            );

        } catch (Exception e) {

            response.sendRedirect("User_Login.jsp");

            return;
        }


        // =====================================================
        // 4. CREATE NOTIFICATION LIST
        // =====================================================

        List<Map<String, Object>> notifications =
                new ArrayList<>();

        int unreadCount = 0;


        // =====================================================
        // 5. LOAD MYSQL DRIVER
        // =====================================================

        try {

            Class.forName(
                    "com.mysql.cj.jdbc.Driver"
            );


            // =================================================
            // 6. DATABASE CONNECTION
            // =================================================

            try (Connection con =
                    DriverManager.getConnection(
                            URL,
                            USER,
                            PASSWORD)) {


                // =================================================
                // 7. GET ALL NOTIFICATIONS
                // =================================================

                String sql =
                        "SELECT notification_id, " +
                        "notification_text, " +
                        "notification_type, " +
                        "notification_time, " +
                        "is_read " +
                        "FROM notifications " +
                        "WHERE user_id = ? " +
                        "ORDER BY notification_time DESC";


                try (PreparedStatement ps =
                        con.prepareStatement(sql)) {

                    ps.setInt(1, userId);


                    try (ResultSet rs =
                            ps.executeQuery()) {

                        while (rs.next()) {

                            Map<String, Object> notification =
                                    new HashMap<>();


                            // ---------------------------------
                            // NOTIFICATION ID
                            // ---------------------------------

                            notification.put(
                                    "notification_id",
                                    rs.getInt(
                                            "notification_id")
                            );


                            // ---------------------------------
                            // NOTIFICATION TEXT
                            // ---------------------------------

                            notification.put(
                                    "notification_text",
                                    rs.getString(
                                            "notification_text")
                            );


                            // ---------------------------------
                            // NOTIFICATION TYPE
                            // ---------------------------------

                            notification.put(
                                    "notification_type",
                                    rs.getString(
                                            "notification_type")
                            );


                            // ---------------------------------
                            // NOTIFICATION TIME
                            // ---------------------------------

                            notification.put(
                                    "notification_time",
                                    rs.getTimestamp(
                                            "notification_time")
                            );


                            // ---------------------------------
                            // READ / UNREAD
                            // ---------------------------------

                            notification.put(
                                    "is_read",
                                    rs.getString(
                                            "is_read")
                            );


                            // Add notification to list

                            notifications.add(
                                    notification
                            );
                        }
                    }
                }


                // =================================================
                // 8. GET UNREAD NOTIFICATION COUNT
                // =================================================

                String countSql =
                        "SELECT COUNT(*) " +
                        "FROM notifications " +
                        "WHERE user_id = ? " +
                        "AND is_read = 'No'";


                try (PreparedStatement ps =
                        con.prepareStatement(countSql)) {

                    ps.setInt(1, userId);


                    try (ResultSet rs =
                            ps.executeQuery()) {

                        if (rs.next()) {

                            unreadCount =
                                    rs.getInt(1);
                        }
                    }
                }
            }


        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "error",
                    "Unable to load notifications: "
                    + e.getMessage()
            );
        }


        // =====================================================
        // 9. SEND DATA TO JSP
        // =====================================================

        request.setAttribute(
                "notifications",
                notifications
        );


        request.setAttribute(
                "unreadCount",
                unreadCount
        );


        // =====================================================
        // 10. FORWARD TO NOTIFICATIONS JSP
        // =====================================================

        request.getRequestDispatcher(
                "Notifications.jsp"
        ).forward(
                request,
                response
        );
    }


    // =========================================================
    // DO POST
    // =========================================================

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        doGet(
                request,
                response
        );
    }

} // END CLASS