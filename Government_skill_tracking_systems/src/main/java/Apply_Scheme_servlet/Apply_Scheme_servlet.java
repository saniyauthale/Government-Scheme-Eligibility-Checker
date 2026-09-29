package Apply_Scheme_servlet;

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

@WebServlet("/Apply_Scheme_servlet")
public class Apply_Scheme_servlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String URL =
            "jdbc:mysql://localhost:3306/skill_tracking_system";

    private static final String USER =
            "root";

    private static final String PASSWORD =
            "root";

    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check login
        if (session == null || session.getAttribute("userId") == null) {

            response.sendRedirect("Login.jsp");
            return;
        }

        Object userIdObj = session.getAttribute("userId");

        String schemeIdStr = request.getParameter("schemeId");

        if (schemeIdStr == null || schemeIdStr.trim().isEmpty()) {

            response.sendRedirect("User_Dashboard_servler");

            return;
        }

        int userId = Integer.parseInt(userIdObj.toString());
        int schemeId = Integer.parseInt(schemeIdStr);

        Connection con = null;
        PreparedStatement checkStmt = null;
        PreparedStatement insertStmt = null;
        PreparedStatement websiteStmt = null;
        ResultSet rs = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                    URL,
                    USER,
                    PASSWORD
            );

            // -----------------------------------------
            // CHECK WHETHER ALREADY APPLIED
            // -----------------------------------------

            String checkSql =
                    "SELECT application_id " +
                    "FROM applied_schemes " +
                    "WHERE user_id = ? AND scheme_id = ?";

            checkStmt = con.prepareStatement(checkSql);

            checkStmt.setInt(1, userId);
            checkStmt.setInt(2, schemeId);

            rs = checkStmt.executeQuery();

            if (rs.next()) {

                // Already applied
                response.sendRedirect(
                        "My_Applications_servlet"
                );

                return;
            }

            rs.close();
            checkStmt.close();

            // -----------------------------------------
            // INSERT APPLICATION
            // -----------------------------------------

            String insertSql =
                    "INSERT INTO applied_schemes " +
                    "(user_id, scheme_id) " +
                    "VALUES (?, ?)";

            insertStmt = con.prepareStatement(insertSql);

            insertStmt.setInt(1, userId);
            insertStmt.setInt(2, schemeId);

            insertStmt.executeUpdate();
            insertStmt.close();

            // -----------------------------------------
            // GET OFFICIAL WEBSITE
            // -----------------------------------------

            String websiteSql =
                    "SELECT website_link " +
                    "FROM schemes " +
                    "WHERE scheme_id = ?";

            websiteStmt = con.prepareStatement(websiteSql);

            websiteStmt.setInt(1, schemeId);

            rs = websiteStmt.executeQuery();

            if (rs.next()) {

                String websiteLink =
                        rs.getString("website_link");

                if (websiteLink != null &&
                    !websiteLink.trim().isEmpty()) {

                    response.sendRedirect(websiteLink);

                } else {

                    response.sendRedirect(
                            "My_Applications_servlet"
                    );
                }

            } else {

                response.sendRedirect(
                        "My_Applications_servlet"
                );
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType("text/html");

            response.getWriter().println(
                    "<h3>Application Error</h3>"
            );

            response.getWriter().println(
                    "<p>" + e.getMessage() + "</p>"
            );

        } finally {

            try {
                if (rs != null)
                    rs.close();
            } catch (Exception e) {
            }

            try {
                if (checkStmt != null)
                    checkStmt.close();
            } catch (Exception e) {
            }

            try {
                if (insertStmt != null)
                    insertStmt.close();
            } catch (Exception e) {
            }

            try {
                if (websiteStmt != null)
                    websiteStmt.close();
            } catch (Exception e) {
            }

            try {
                if (con != null)
                    con.close();
            } catch (Exception e) {
            }
        }
    }
}