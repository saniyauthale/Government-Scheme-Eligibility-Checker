package Edit_Profile_servlet;

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

@WebServlet("/Edit_Profile_servlet")
public class Edit_Profile_servlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String URL =
            "jdbc:mysql://localhost:3306/skill_tracking_system";

    private static final String USER = "root";
    private static final String PASSWORD = "root";

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // ============================================
        // 1. GET SESSION
        // ============================================

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("userId") == null) {

            response.sendRedirect("Login_page.jsp");
            return;
        }

        // ============================================
        // 2. GET USER ID
        // ============================================

        int userId;

        try {

            userId = Integer.parseInt(
                    session.getAttribute("userId").toString()
            );

        } catch (Exception e) {

            response.sendRedirect("Login_page.jsp");
            return;
        }

        // ============================================
        // 3. GET CATEGORY
        // ============================================

        String category =
                (String) session.getAttribute("category");

        if (category == null ||
            category.trim().isEmpty()) {

            response.sendRedirect("Login_page.jsp");
            return;
        }

        category = category.trim();

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    URL,
                    USER,
                    PASSWORD
            );

            // ============================================
            // STUDENT
            // ============================================

            if (category.equalsIgnoreCase("Student")) {

                String sql =
                        "SELECT * FROM student_profile WHERE user_id=?";

                PreparedStatement ps =
                        con.prepareStatement(sql);

                ps.setInt(1, userId);

                ResultSet rs = ps.executeQuery();

                if (rs.next()) {

                    request.setAttribute("fullName",
                            rs.getString("full_name"));

                    request.setAttribute("age",
                            rs.getString("age"));

                    request.setAttribute("gender",
                            rs.getString("gender"));

                    request.setAttribute("mobile",
                            rs.getString("mobile"));

                    request.setAttribute("state",
                            rs.getString("state"));

                    request.setAttribute("district",
                            rs.getString("district"));

                    request.setAttribute("educationLevel",
                            rs.getString("education_level"));

                    request.setAttribute("courseName",
                            rs.getString("courseName"));

                    request.setAttribute("annualIncome",
                            rs.getString("annualIncome"));

                    request.setAttribute("category",
                            rs.getString("category"));

                    request.setAttribute("disability",
                            rs.getString("disabled"));

                    request.setAttribute("bankAccount",
                            rs.getString("bank"));
                }

                rs.close();
                ps.close();
            }

            // ============================================
            // GIRL STUDENT
            // ============================================

            else if (category.equalsIgnoreCase("Girl Student")) {

                String sql =
                        "SELECT * FROM girl_student_profile WHERE user_id=?";

                PreparedStatement ps =
                        con.prepareStatement(sql);

                ps.setInt(1, userId);

                ResultSet rs = ps.executeQuery();

                if (rs.next()) {

                    request.setAttribute("fullName",
                            rs.getString("full_name"));

                    request.setAttribute("age",
                            rs.getString("age"));

                    request.setAttribute("gender",
                            rs.getString("gender"));

                    request.setAttribute("mobile",
                            rs.getString("mobile"));

                    request.setAttribute("state",
                            rs.getString("state"));

                    request.setAttribute("district",
                            rs.getString("district"));

                    request.setAttribute("educationLevel",
                            rs.getString("education_level"));

                    request.setAttribute("courseName",
                            rs.getString("course"));

                    request.setAttribute("annualIncome",
                            rs.getString("family_income"));

                    request.setAttribute("category",
                            rs.getString("category"));

                    request.setAttribute("disability",
                            rs.getString("differently_abled"));

                    request.setAttribute("bankAccount",
                            rs.getString("bank_account"));
                }

                rs.close();
                ps.close();
            }

            // ============================================
            // FARMER
            // ============================================

            else if (category.equalsIgnoreCase("Farmer")) {

                String sql =
                        "SELECT * FROM farmer_profile WHERE user_id=?";

                PreparedStatement ps =
                        con.prepareStatement(sql);

                ps.setInt(1, userId);

                ResultSet rs = ps.executeQuery();

                if (rs.next()) {

                    request.setAttribute("fullName",
                            rs.getString("full_name"));

                    request.setAttribute("age",
                            rs.getString("age"));

                    request.setAttribute("gender",
                            rs.getString("gender"));

                    request.setAttribute("mobile",
                            rs.getString("mobile"));

                    request.setAttribute("state",
                            rs.getString("state"));

                    request.setAttribute("district",
                            rs.getString("district"));

                    request.setAttribute("annualIncome",
                            rs.getString("annual_income"));

                    request.setAttribute("category",
                            rs.getString("category"));

                    request.setAttribute("disability",
                            rs.getString("disability"));

                    request.setAttribute("bankAccount",
                            rs.getString("kisan_credit_card"));
                }

                rs.close();
                ps.close();
            }

            // ============================================
            // BUSINESS
            // ============================================

            else if (category.equalsIgnoreCase("Business")) {

                String sql =
                        "SELECT * FROM business_profile WHERE user_id=?";

                PreparedStatement ps =
                        con.prepareStatement(sql);

                ps.setInt(1, userId);

                ResultSet rs = ps.executeQuery();

                if (rs.next()) {

                    request.setAttribute("fullName",
                            rs.getString("fullName"));

                    request.setAttribute("age",
                            rs.getString("age"));

                    request.setAttribute("gender",
                            rs.getString("gender"));

                    request.setAttribute("mobile",
                            rs.getString("mobile"));

                    request.setAttribute("state",
                            rs.getString("state"));

                    request.setAttribute("district",
                            rs.getString("district"));

                    request.setAttribute("courseName",
                            rs.getString("businessName"));

                    request.setAttribute("educationLevel",
                            rs.getString("businessType"));

                    request.setAttribute("annualIncome",
                            rs.getString("familyIncome"));

                    request.setAttribute("category",
                            rs.getString("category"));

                    request.setAttribute("disability",
                            rs.getString("differentlyAbled"));

                    request.setAttribute("bankAccount",
                            rs.getString("bankAccount"));
                }

                rs.close();
                ps.close();
            }

            // ============================================
            // SENIOR CITIZEN
            // ============================================

            else if (category.equalsIgnoreCase("Senior Citizen")) {

                String sql =
                        "SELECT * FROM senior_citizen_profile WHERE user_id=?";

                PreparedStatement ps =
                        con.prepareStatement(sql);

                ps.setInt(1, userId);

                ResultSet rs = ps.executeQuery();

                if (rs.next()) {

                    request.setAttribute("fullName",
                            rs.getString("full_name"));

                    request.setAttribute("age",
                            rs.getString("age"));

                    request.setAttribute("gender",
                            rs.getString("gender"));

                    request.setAttribute("mobile",
                            rs.getString("mobile"));

                    request.setAttribute("state",
                            rs.getString("state"));

                    request.setAttribute("district",
                            rs.getString("district"));

                    request.setAttribute("annualIncome",
                            rs.getString("family_income"));

                    request.setAttribute("category",
                            rs.getString("category"));

                    request.setAttribute("disability",
                            rs.getString("differently_abled"));

                    request.setAttribute("bankAccount",
                            rs.getString("bank_account"));
                }

                rs.close();
                ps.close();
            }

            // ============================================
            // WOMEN
            // ============================================

            else if (category.equalsIgnoreCase("Women")) {

                String sql =
                        "SELECT * FROM women_profile WHERE user_id=?";

                PreparedStatement ps =
                        con.prepareStatement(sql);

                ps.setInt(1, userId);

                ResultSet rs = ps.executeQuery();

                if (rs.next()) {

                    request.setAttribute("fullName",
                            rs.getString("full_name"));

                    request.setAttribute("age",
                            rs.getString("age"));

                    request.setAttribute("gender",
                            rs.getString("gender"));

                    request.setAttribute("mobile",
                            rs.getString("mobile"));

                    request.setAttribute("state",
                            rs.getString("state"));

                    request.setAttribute("district",
                            rs.getString("district"));

                    request.setAttribute("annualIncome",
                            rs.getString("family_income"));

                    request.setAttribute("category",
                            rs.getString("category"));

                    request.setAttribute("disability",
                            rs.getString("differently_abled"));

                    request.setAttribute("bankAccount",
                            rs.getString("business_registered"));
                }

                rs.close();
                ps.close();
            }

            con.close();

            // ============================================
            // OPEN EDIT PAGE
            // ============================================

            request.getRequestDispatcher(
                    "Edit_Profile.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType("text/html;charset=UTF-8");

            response.getWriter().println(
                    "<h2>Error loading edit profile</h2>"
            );

            response.getWriter().println(
                    "<p>" + e.getMessage() + "</p>"
            );
        }
    }
}