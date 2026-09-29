package Saved_Schemes_servlet;

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

@WebServlet("/Saved_Schemes_servlet")
public class Saved_Schemes_servlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String URL =
            "jdbc:mysql://localhost:3306/skill_tracking_system";

    private static final String USER = "root";
    private static final String PASSWORD = "root";


    // =========================================================
    // POST = SAVE SCHEME
    // =========================================================

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {
    	 System.out.println("========== SAVE SCHEME POST CALLED ==========");

        HttpSession session = request.getSession(false);

        // CHECK LOGIN
        if (session == null ||
            session.getAttribute("userId") == null) {

            response.sendRedirect("Login_page.jsp");
            return;
        }


        // GET USER ID
        int userId;

        try {

            userId = Integer.parseInt(
                    session.getAttribute("userId").toString()
            );

        } catch (Exception e) {

            response.sendRedirect("Login_page.jsp");
            return;
        }


        // GET SCHEME ID
        String schemeIdString =
                request.getParameter("schemeId");

        if (schemeIdString == null ||
            schemeIdString.trim().isEmpty()) {

            response.sendRedirect(
                    "User_Dashboard_servler?message=invalidScheme"
            );

            return;
        }


        int schemeId;

        try {

            schemeId =
                    Integer.parseInt(schemeIdString);

        } catch (NumberFormatException e) {

            response.sendRedirect(
                    "User_Dashboard_servler?message=invalidScheme"
            );

            return;
        }


        // =====================================================
        // DATABASE
        // =====================================================

        try {

            Class.forName(
                    "com.mysql.cj.jdbc.Driver"
            );

            try (Connection con =
                    DriverManager.getConnection(
                            URL,
                            USER,
                            PASSWORD)) {


                // =================================================
                // CHECK IF ALREADY SAVED
                // =================================================

                String checkSql =
                        "SELECT save_id  " +
                        "FROM saved_schemes " +
                        "WHERE user_id = ? " +
                        "AND scheme_id = ?";


                try (PreparedStatement ps =
                        con.prepareStatement(checkSql)) {

                    ps.setInt(1, userId);
                    ps.setInt(2, schemeId);


                    try (ResultSet rs =
                            ps.executeQuery()) {

                        if (rs.next()) {

                            response.sendRedirect(
                                    "User_Dashboard_servler" +
                                    "?message=alreadySaved"
                            );

                            return;
                        }
                    }
                }


                // =================================================
                // SAVE SCHEME
                // =================================================

                String insertSql =
                        "INSERT INTO saved_schemes " +
                        "(user_id, scheme_id, saved_date) " +
                        "VALUES (?, ?, NOW())";


                try (PreparedStatement ps =
                        con.prepareStatement(insertSql)) {

                    ps.setInt(1, userId);
                    ps.setInt(2, schemeId);

                    int result =
                            ps.executeUpdate();


                    if (result > 0) {

                        response.sendRedirect(
                                "User_Dashboard_servler" +
                                "?message=saved"
                        );

                    } else {

                        response.sendRedirect(
                                "User_Dashboard_servler" +
                                "?message=error"
                        );
                    }
                }
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "User_Dashboard_servler" +
                    "?message=error"
            );
        }
    }


    // =========================================================
    // GET = DISPLAY SAVED SCHEMES
    // =========================================================

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);


        // CHECK LOGIN
        if (session == null ||
            session.getAttribute("userId") == null) {

            response.sendRedirect("Login_page.jsp");
            return;
        }


        // GET USER ID
        int userId;

        try {

            userId = Integer.parseInt(
                    session.getAttribute("userId").toString()
            );

        } catch (Exception e) {

            response.sendRedirect("Login_page.jsp");
            return;
        }


        // =====================================================
        // LISTS FOR JSP
        // =====================================================

        List<Integer> schemeIds =
                new ArrayList<>();

        List<String> schemeNames =
                new ArrayList<>();

        List<String> descriptions =
                new ArrayList<>();

        List<String> savedDates =
                new ArrayList<>();


        // =====================================================
        // DATABASE
        // =====================================================

        try {

            Class.forName(
                    "com.mysql.cj.jdbc.Driver"
            );

            try (Connection con =
                    DriverManager.getConnection(
                            URL,
                            USER,
                            PASSWORD)) {


                String sql =
                        "SELECT s.scheme_id, " +
                        "s.scheme_name, " +
                        "s.description, " +
                        "ss.saved_date " +
                        "FROM saved_schemes ss " +
                        "INNER JOIN schemes s " +
                        "ON ss.scheme_id = s.scheme_id " +
                        "WHERE ss.user_id = ? " +
                        "ORDER BY ss.saved_date DESC";


                try (PreparedStatement ps =
                        con.prepareStatement(sql)) {

                    ps.setInt(1, userId);


                    try (ResultSet rs =
                            ps.executeQuery()) {

                        while (rs.next()) {

                            schemeIds.add(
                                    rs.getInt("scheme_id")
                            );

                            schemeNames.add(
                                    rs.getString("scheme_name")
                            );

                            descriptions.add(
                                    rs.getString("description")
                            );

                            savedDates.add(
                                    rs.getString("saved_date")
                            );
                        }
                    }
                }
            }


            // =================================================
            // SEND DATA TO JSP
            // =================================================

            request.setAttribute(
                    "schemeIds",
                    schemeIds
            );

            request.setAttribute(
                    "schemeNames",
                    schemeNames
            );

            request.setAttribute(
                    "descriptions",
                    descriptions
            );

            request.setAttribute(
                    "savedDates",
                    savedDates
            );


            // =================================================
            // OPEN SAVED SCHEMES PAGE
            // =================================================

            request.getRequestDispatcher(
                    "Saved_Schemes.jsp"
            ).forward(
                    request,
                    response
            );


        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType(
                    "text/html;charset=UTF-8"
            );

            response.getWriter().println(
                    "<h2>Error loading saved schemes</h2>"
            );

            response.getWriter().println(
                    "<p>" + e.getMessage() + "</p>"
            );
        }
    }
}