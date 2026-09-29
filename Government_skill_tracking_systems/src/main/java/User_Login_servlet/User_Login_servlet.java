package User_Login_servlet;

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

@WebServlet("/User_Login_servlet")
public class User_Login_servlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // =========================================================
    // DATABASE CONFIGURATION
    // =========================================================

    private static final String DB_URL =
            "jdbc:mysql://localhost:3306/skill_tracking_system";

    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";


    // =========================================================
    // POST LOGIN
    // =========================================================

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {
    	System.out.println("User_Login_servlet called");
        // =====================================================
        // GET LOGIN DETAILS
        // =====================================================

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Remove spaces
        if (username != null) {
            username = username.trim();
        }

        if (password != null) {
            password = password.trim();
        }

        // Check empty fields
        if (username == null || username.isEmpty()
                || password == null || password.isEmpty()) {

            response.setContentType("text/html;charset=UTF-8");

            response.getWriter().println(
                    "<script>"
                    + "alert('Please enter username and password.');"
                    + "window.location='Login_page.jsp';"
                    + "</script>"
            );

            return;
        }


       
        // IMPORTANT:
        // Login is using EMAIL + PASSWORD.
        //
        // =====================================================

        String loginSql =
        		"SELECT user_id, full_name, email, mobile_no, category " +
        		"FROM registration " +
        		"WHERE email=? AND password=?";

        // =====================================================
        // DATABASE CONNECTION
        // =====================================================

        try {

            // Load MySQL Driver
            Class.forName("com.mysql.cj.jdbc.Driver");


            // Connect database
            try (Connection con =
                    DriverManager.getConnection(
                            DB_URL,
                            DB_USER,
                            DB_PASSWORD
                    );

                 PreparedStatement ps =
                    con.prepareStatement(loginSql)) {


                // =================================================
                // SET LOGIN VALUES
                // =================================================

                ps.setString(1, username);
                ps.setString(2, password);


                // =================================================
                // EXECUTE LOGIN QUERY
                // =================================================

                try (ResultSet rs = ps.executeQuery()) {


                    // =================================================
                    // LOGIN SUCCESS
                    // =================================================

                	if (rs.next()) {

                	    HttpSession session = request.getSession(true);

                	    session.setAttribute("userId", rs.getInt("user_id"));
                	    session.setAttribute("fullName", rs.getString("full_name"));
                	    session.setAttribute("email", rs.getString("email"));
                	    session.setAttribute("mobile", rs.getString("mobile_no"));
                	    session.setAttribute("category", rs.getString("category"));
                	    response.sendRedirect("User_Dashboard_servler");
                	    return;
                	}else {

                        // =================================================
                        // LOGIN FAILED
                        // =================================================

                        response.setContentType(
                                "text/html;charset=UTF-8"
                        );

                        response.getWriter().println(
                                "<script>"
                                + "alert('Invalid Email or Password.');"
                                + "window.location='Login_page.jsp';"
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
                    + "window.location='Login_page.jsp';"
                    + "</script>"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType(
                    "text/html;charset=UTF-8"
            );

            response.getWriter().println(
                    "<script>"
                    + "alert('Database Error: "
                    + e.getMessage()
                            .replace("'", "")
                            .replace("\"", "")
                    + "');"
                    + "window.location='Login_page.jsp';"
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

        response.sendRedirect("Login_page.jsp");
    }
}