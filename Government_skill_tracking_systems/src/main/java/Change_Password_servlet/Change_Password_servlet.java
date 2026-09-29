package Change_Password_servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Change_Password_servlet")
public class Change_Password_servlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // =========================================================
    // DATABASE CONFIGURATION
    // =========================================================

    private static final String DB_URL =
            "jdbc:mysql://localhost:3306/skill_tracking_system";

    private static final String DB_USER = "root";

    private static final String DB_PASSWORD = "root";


    // =========================================================
    // GET REQUEST
    // =========================================================

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("Change_Password.jsp");
    }


    // =========================================================
    // POST REQUEST
    // =========================================================

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("Change_Password_servlet called");


        // =====================================================
        // GET SESSION
        // =====================================================

        HttpSession session = request.getSession(false);


        // =====================================================
        // CHECK LOGIN
        // =====================================================

        if (session == null ||
            session.getAttribute("userId") == null) {

            response.sendRedirect("Login_page.jsp");

            return;
        }


        // =====================================================
        // GET USER ID FROM SESSION
        // =====================================================

        int userId =
                (Integer) session.getAttribute("userId");


        // =====================================================
        // GET PASSWORD VALUES
        // =====================================================

        String currentPassword =
                request.getParameter("currentPassword");

        String newPassword =
                request.getParameter("newPassword");

        String confirmPassword =
                request.getParameter("confirmPassword");


        // =====================================================
        // CHECK EMPTY VALUES
        // =====================================================

        if (currentPassword == null ||
            newPassword == null ||
            confirmPassword == null ||
            currentPassword.isEmpty() ||
            newPassword.isEmpty() ||
            confirmPassword.isEmpty()) {

            response.sendRedirect(
                    "Change_Password.jsp?message=error"
            );

            return;
        }


        // =====================================================
        // CHECK NEW PASSWORD MATCH
        // =====================================================

        if (!newPassword.equals(confirmPassword)) {

            response.sendRedirect(
                    "Change_Password.jsp?message=mismatch"
            );

            return;
        }


        // =====================================================
        // CHECK SAME PASSWORD
        // =====================================================

        if (currentPassword.equals(newPassword)) {

            response.sendRedirect(
                    "Change_Password.jsp?message=same"
            );

            return;
        }


        // =====================================================
        // SQL
        // =====================================================

        String selectSql =
                "SELECT password FROM registration WHERE user_id=?";


        String updateSql =
                "UPDATE registration " +
                "SET password=?, c_password=? " +
                "WHERE user_id=?";


        // =====================================================
        // DATABASE CONNECTION
        // =====================================================

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");


            try (Connection con =
                    DriverManager.getConnection(
                            DB_URL,
                            DB_USER,
                            DB_PASSWORD
                    )) {


                // =================================================
                // GET CURRENT PASSWORD
                // =================================================

                try (PreparedStatement ps =
                        con.prepareStatement(selectSql)) {

                    ps.setInt(1, userId);


                    try (ResultSet rs =
                            ps.executeQuery()) {


                        // =================================================
                        // USER FOUND
                        // =================================================

                        if (rs.next()) {

                            String databasePassword =
                                    rs.getString("password");


                            // =============================================
                            // CHECK CURRENT PASSWORD
                            // =============================================

                            if (!currentPassword.equals(databasePassword)) {

                                response.sendRedirect(
                                        "Change_Password.jsp?message=incorrect"
                                );

                                return;
                            }
                        }
                        else {

                            response.sendRedirect(
                                    "Change_Password.jsp?message=error"
                            );

                            return;
                        }
                    }
                }


                // =================================================
                // UPDATE PASSWORD
                // =================================================

                try (PreparedStatement ps =
                        con.prepareStatement(updateSql)) {

                    ps.setString(1, newPassword);

                    ps.setString(2, newPassword);

                    ps.setInt(3, userId);


                    int rowsUpdated =
                            ps.executeUpdate();


                    // =================================================
                    // SUCCESS
                    // =================================================

                    if (rowsUpdated > 0) {

                        response.sendRedirect(
                                "Change_Password.jsp?message=success"
                        );

                    }
                    else {

                        response.sendRedirect(
                                "Change_Password.jsp?message=error"
                        );
                    }
                }
            }

        }
        catch (ClassNotFoundException e) {

            e.printStackTrace();

            response.sendRedirect(
                    "Change_Password.jsp?message=error"
            );

        }
        catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "Change_Password.jsp?message=error"
            );
        }
    }
}