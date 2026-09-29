package User_Dashboard_servler;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/My_Applications_servlet")
public class My_Applications_servlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String URL =
            "jdbc:mysql://localhost:3306/skill_tracking_system";

    private static final String USER = "root";
    private static final String PASSWORD = "root";

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Get existing session
        HttpSession session = request.getSession(false);

        // Check login
        if (session == null ||
            session.getAttribute("userId") == null) {

            response.sendRedirect("Login_page.jsp");
            return;
        }

        // Get user ID
        int userId;

        try {

            userId = Integer.parseInt(
                    session.getAttribute("userId").toString()
            );

        } catch (Exception e) {

            response.sendRedirect("Login_page.jsp");
            return;
        }

        List<Application> applications =
                new ArrayList<>();

        try {

            // Load MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Database connection
            try (Connection con =
                         DriverManager.getConnection(
                                 URL,
                                 USER,
                                 PASSWORD)) {

                String sql =
                        "SELECT a.application_id, " +
                        "a.scheme_id, " +
                        "s.scheme_name, " +
                        "a.application_date, " +
                        "a.status " +
                        "FROM applied_schemes a " +
                        "JOIN schemes s " +
                        "ON a.scheme_id = s.scheme_id " +
                        "WHERE a.user_id = ? " +
                        "ORDER BY a.application_date DESC";

                try (PreparedStatement ps =
                             con.prepareStatement(sql)) {

                    ps.setInt(1, userId);

                    try (ResultSet rs =
                                 ps.executeQuery()) {

                        while (rs.next()) {

                            Application app =
                                    new Application();

                            app.setApplicationId(
                                    rs.getInt("application_id")
                            );

                            app.setSchemeId(
                                    rs.getInt("scheme_id")
                            );

                            app.setSchemeName(
                                    rs.getString("scheme_name")
                            );

                            app.setApplicationDate(
                                    rs.getTimestamp(
                                            "application_date"
                                    )
                            );

                            app.setStatus(
                                    rs.getString("status")
                            );

                            applications.add(app);
                        }
                    }
                }
            }

            // Send data to JSP
            request.setAttribute(
                    "applications",
                    applications
            );

            request.setAttribute(
                    "applicationCount",
                    applications.size()
            );

            // Open My Applications page
            request.getRequestDispatcher(
                    "My_Applications.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType("text/html");

            response.getWriter().println(
                    "<h2>Error loading applications</h2>"
            );

            response.getWriter().println(
                    "<p>" + e.getMessage() + "</p>"
            );
        }
    }


    // =========================================================
    // APPLICATION CLASS
    // =========================================================

    public static class Application {

        private int applicationId;
        private int schemeId;
        private String schemeName;
        private java.sql.Timestamp applicationDate;
        private String status;


        public int getApplicationId() {
            return applicationId;
        }

        public void setApplicationId(int applicationId) {
            this.applicationId = applicationId;
        }


        public int getSchemeId() {
            return schemeId;
        }

        public void setSchemeId(int schemeId) {
            this.schemeId = schemeId;
        }


        public String getSchemeName() {
            return schemeName;
        }

        public void setSchemeName(String schemeName) {
            this.schemeName = schemeName;
        }


        public java.sql.Timestamp getApplicationDate() {
            return applicationDate;
        }

        public void setApplicationDate(
                java.sql.Timestamp applicationDate) {

            this.applicationDate = applicationDate;
        }


        public String getStatus() {
            return status;
        }

        public void setStatus(String status) {
            this.status = status;
        }
    }
}