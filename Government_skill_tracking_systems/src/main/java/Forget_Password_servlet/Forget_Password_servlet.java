package Forget_Password_servlet;

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

@WebServlet("/Forget_Password_servlet")
public class Forget_Password_servlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Database Configuration
    private static final String URL =
            "jdbc:mysql://localhost:3306/skill_tracking_system";

    private static final String USER = "root";

    private static final String PASSWORD = "root";


    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {


        // =====================================================
        // GET FORM VALUES
        // =====================================================

    	String username = request.getParameter("username");
    	String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");


        // Remove unnecessary spaces

        if (username != null) {
            username = username.trim();
        }

        if (email != null) {
            email = email.trim();
        }


        // =====================================================
        // CHECK EMPTY FIELDS
        // =====================================================

        if (username == null || username.isEmpty()
                || email == null || email.isEmpty()
                || newPassword == null || newPassword.isEmpty()
                || confirmPassword == null || confirmPassword.isEmpty()) {

            response.setContentType("text/html;charset=UTF-8");

            response.getWriter().println(
                    "<script>"
                    + "alert('Please fill all fields.');"
                    + "window.location='ForgotPassword.jsp';"
                    + "</script>"
            );

            return;
        }


        // =====================================================
        // CHECK PASSWORD MATCH
        // =====================================================

        if (!newPassword.equals(confirmPassword)) {

            response.setContentType("text/html;charset=UTF-8");

            response.getWriter().println(
                    "<script>"
                    + "alert('New Password and Confirm Password do not match.');"
                    + "window.location='ForgotPassword.jsp';"
                    + "</script>"
            );

            return;
        }


        // =====================================================
        // CHECK PASSWORD LENGTH
        // =====================================================

        if (newPassword.length() < 6) {

            response.setContentType("text/html;charset=UTF-8");

            response.getWriter().println(
                    "<script>"
                    + "alert('Password must contain at least 6 characters.');"
                    + "window.location='ForgotPassword.jsp';"
                    + "</script>"
            );

            return;
        }


        // =====================================================
        // CHECK USERNAME + EMAIL
        // =====================================================

        String checkSql =
                "SELECT user_id FROM registration " +
                "WHERE full_name = ? AND email = ?";


        // =====================================================
        // UPDATE PASSWORD
        // =====================================================

        String updateSql =
                "UPDATE registration " +
                "SET password = ?, c_password = ? " +
                "WHERE full_name = ? AND email = ?";


        try {

            // Load MySQL Driver

            Class.forName("com.mysql.cj.jdbc.Driver");


            // =================================================
            // DATABASE CONNECTION
            // =================================================

            try (Connection con =
                    DriverManager.getConnection(
                            URL,
                            USER,
                            PASSWORD
                    );

                 PreparedStatement checkPs =
                    con.prepareStatement(checkSql)) {


                // Set username and email

                checkPs.setString(1, username);

                checkPs.setString(2, email);


                // Execute verification

                try (ResultSet rs = checkPs.executeQuery()) {


                    // =================================================
                    // USER FOUND
                    // =================================================

                    if (rs.next()) {


                        try (PreparedStatement updatePs =
                                con.prepareStatement(updateSql)) {


                            // Set new password

                            updatePs.setString(1, newPassword);

                            // Set confirm password

                            updatePs.setString(2, confirmPassword);

                            // Set username

                            updatePs.setString(3, username);

                            // Set email

                            updatePs.setString(4, email);


                            // Execute update

                            int rowsUpdated =
                                    updatePs.executeUpdate();


                            // =================================================
                            // PASSWORD UPDATED
                            // =================================================

                            if (rowsUpdated > 0) {

                                response.setContentType(
                                        "text/html;charset=UTF-8"
                                );

                                response.getWriter().println(
                                        "<script>"
                                        + "alert('Password updated successfully! Please login with your new password.');"
                                        + "window.location='Login_page.jsp';"
                                        + "</script>"
                                );

                            } else {

                                response.setContentType(
                                        "text/html;charset=UTF-8"
                                );

                                response.getWriter().println(
                                        "<script>"
                                        + "alert('Unable to update password. Please try again.');"
                                        + "window.location='ForgotPassword.jsp';"
                                        + "</script>"
                                );
                            }
                        }


                    } else {


                        // =================================================
                        // USERNAME + EMAIL NOT FOUND
                        // =================================================

                        response.setContentType(
                                "text/html;charset=UTF-8"
                        );

                        response.getWriter().println(
                                "<script>"
                                + "alert('Invalid Username or Registered Email.');"
                                + "window.location='ForgotPassword.jsp';"
                                + "</script>"
                        );
                    }
                }
            }


        } catch (ClassNotFoundException e) {

            e.printStackTrace();

            response.setContentType(
                    "text/html;charset=UTF-8"
            );

            response.getWriter().println(
                    "<script>"
                    + "alert('MySQL Driver not found.');"
                    + "window.location='ForgotPassword.jsp';"
                    + "</script>"
            );


        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType(
                    "text/html;charset=UTF-8"
            );

            response.getWriter().println(
                    "<script>"
                    + "alert('Something went wrong. Please try again later.');"
                    + "window.location='ForgotPassword.jsp';"
                    + "</script>"
            );
        }
    }


    // =========================================================
    // GET REQUEST
    // =========================================================

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("ForgotPassword.jsp");
    }
}