package Scheme_Details_servlet;

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

@WebServlet("/Scheme_Details_servlet")
public class Scheme_Details_servlet extends HttpServlet {

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
        // 1. CHECK USER LOGIN
        // =====================================================

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("userId") == null) {

            response.sendRedirect("Login_page.jsp");
            return;
        }


        // =====================================================
        // 2. GET SCHEME ID
        // =====================================================

        String schemeIdParam = request.getParameter("id");

        if (schemeIdParam == null ||
            schemeIdParam.trim().isEmpty()) {

            response.sendRedirect("User_Dashboard_servler");
            return;
        }


        int schemeId;

        try {

            schemeId = Integer.parseInt(schemeIdParam);

        } catch (NumberFormatException e) {

            response.sendRedirect("User_Dashboard_servler");
            return;
        }


        // =====================================================
        // 3. LOAD MYSQL DRIVER
        // =====================================================

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");


            // =================================================
            // 4. DATABASE CONNECTION
            // =================================================

            try (Connection con =
                    DriverManager.getConnection(
                            URL,
                            USER,
                            PASSWORD)) {


                // =================================================
                // 5. SQL QUERY
                // =================================================

                String sql =
                        "SELECT " +
                        "scheme_id, " +
                        "scheme_name, " +
                        "category, " +
                        "candidate_type, " +
                        "status, " +
                        "description, " +
                        "eligibility, " +
                        "benefits, " +
                        "application_process, " +
                        "required_documents, " +
                        "website_link, " +
                        "last_date, " +
                        "pdf_file_name, " +
                        "min_age, " +
                        "max_age, " +
                        "max_income, " +
                        "gender_required, " +
                        "category_required, " +
                        "disability_required, " +
                        "health_insurance_required, " +
                        "bank_account_required " +
                        "FROM schemes " +
                        "WHERE scheme_id = ?";


                try (PreparedStatement ps =
                        con.prepareStatement(sql)) {

                    ps.setInt(1, schemeId);


                    try (ResultSet rs =
                            ps.executeQuery()) {


                        // =============================================
                        // SCHEME FOUND
                        // =============================================

                        if (rs.next()) {

                            // -----------------------------------------
                            // BASIC INFORMATION
                            // -----------------------------------------

                            request.setAttribute(
                                    "schemeId",
                                    rs.getInt("scheme_id")
                            );

                            request.setAttribute(
                                    "schemeName",
                                    rs.getString("scheme_name")
                            );

                            request.setAttribute(
                                    "category",
                                    rs.getString("category")
                            );

                            request.setAttribute(
                                    "candidateType",
                                    rs.getString("candidate_type")
                            );

                            request.setAttribute(
                                    "status",
                                    rs.getString("status")
                            );


                            // -----------------------------------------
                            // DESCRIPTION & ELIGIBILITY
                            // -----------------------------------------

                            request.setAttribute(
                                    "description",
                                    rs.getString("description")
                            );

                            request.setAttribute(
                                    "eligibility",
                                    rs.getString("eligibility")
                            );

                            request.setAttribute(
                                    "benefits",
                                    rs.getString("benefits")
                            );

                            request.setAttribute(
                                    "applicationProcess",
                                    rs.getString("application_process")
                            );


                            // -----------------------------------------
                            // DOCUMENTS & WEBSITE
                            // -----------------------------------------

                            request.setAttribute(
                                    "requiredDocuments",
                                    rs.getString("required_documents")
                            );

                            request.setAttribute(
                                    "websiteLink",
                                    rs.getString("website_link")
                            );


                            // -----------------------------------------
                            // LAST DATE
                            // -----------------------------------------

                            request.setAttribute(
                                    "lastDate",
                                    rs.getDate("last_date")
                            );


                            // -----------------------------------------
                            // PDF FILE
                            // -----------------------------------------

                            request.setAttribute(
                                    "pdfFileName",
                                    rs.getString("pdf_file_name")
                            );


                            // -----------------------------------------
                            // AGE & INCOME
                            // -----------------------------------------

                            request.setAttribute(
                                    "minAge",
                                    rs.getObject("min_age")
                            );

                            request.setAttribute(
                                    "maxAge",
                                    rs.getObject("max_age")
                            );

                            request.setAttribute(
                                    "maxIncome",
                                    rs.getObject("max_income")
                            );


                            // -----------------------------------------
                            // OTHER ELIGIBILITY REQUIREMENTS
                            // -----------------------------------------

                            request.setAttribute(
                                    "genderRequired",
                                    rs.getString("gender_required")
                            );

                            request.setAttribute(
                                    "categoryRequired",
                                    rs.getString("category_required")
                            );

                            request.setAttribute(
                                    "disabilityRequired",
                                    rs.getString("disability_required")
                            );

                            request.setAttribute(
                                    "healthInsuranceRequired",
                                    rs.getString(
                                            "health_insurance_required"
                                    )
                            );

                            request.setAttribute(
                                    "bankRequired",
                                    rs.getString(
                                            "bank_account_required"
                                    )
                            );


                            // =============================================
                            // FORWARD TO JSP
                            // =============================================

                            request.getRequestDispatcher(
                                    "Scheme_Details.jsp"
                            ).forward(
                                    request,
                                    response
                            );


                        } else {

                            // =============================================
                            // SCHEME NOT FOUND
                            // =============================================

                            response.sendRedirect(
                                    "User_Dashboard_servler" +
                                    "?error=scheme_not_found"
                            );
                        }
                    }
                }
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType(
                    "text/html;charset=UTF-8"
            );

            response.getWriter().println(
                    "<h2>Error loading scheme details</h2>"
            );

            response.getWriter().println(
                    "<p>" + e.getMessage() + "</p>"
            );
        }
    }
}