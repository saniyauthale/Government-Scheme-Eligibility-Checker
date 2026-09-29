package Update_Profile_servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Update_Profile_servlet")
public class Update_Profile_servlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String URL =
            "jdbc:mysql://localhost:3306/skill_tracking_system";

    private static final String USER = "root";
    private static final String PASSWORD = "root";

    @Override
    protected void doPost(HttpServletRequest request,
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

        // ============================================
        // 4. GET FORM VALUES
        // ============================================

        String fullName = request.getParameter("fullName");
        String age = request.getParameter("age");
        String gender = request.getParameter("gender");
        String mobile = request.getParameter("mobile");
        String state = request.getParameter("state");
        String district = request.getParameter("district");
        String educationLevel = request.getParameter("educationLevel");
        String courseName = request.getParameter("courseName");
        String annualIncome = request.getParameter("annualIncome");
        String disability = request.getParameter("disability");
        String bankAccount = request.getParameter("bankAccount");

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    URL,
                    USER,
                    PASSWORD
            );

            int result = 0;

            // ============================================
            // STUDENT
            // ============================================

            if (category.equalsIgnoreCase("Student")) {

                String sql =
                    "UPDATE student_profile SET " +
                    "full_name=?, age=?, gender=?, mobile=?, " +
                    "state=?, district=?, education_level=?, " +
                    "courseName=?, annualIncome=?, " +
                    "category=?, disabled=?, bank=? " +
                    "WHERE user_id=?";

                PreparedStatement ps =
                        con.prepareStatement(sql);

                ps.setString(1, fullName);
                ps.setString(2, age);
                ps.setString(3, gender);
                ps.setString(4, mobile);
                ps.setString(5, state);
                ps.setString(6, district);
                ps.setString(7, educationLevel);
                ps.setString(8, courseName);
                ps.setString(9, annualIncome);
                ps.setString(10, category);
                ps.setString(11, disability);
                ps.setString(12, bankAccount);
                ps.setInt(13, userId);

                result = ps.executeUpdate();

                ps.close();
            }

            // ============================================
            // GIRL STUDENT
            // ============================================

            else if (category.equalsIgnoreCase("Girl Student")) {

                String sql =
                    "UPDATE girl_student_profile SET " +
                    "full_name=?, age=?, gender=?, mobile=?, " +
                    "state=?, district=?, education_level=?, " +
                    "course=?, family_income=?, category=?, " +
                    "differently_abled=?, bank_account=? " +
                    "WHERE user_id=?";

                PreparedStatement ps =
                        con.prepareStatement(sql);

                ps.setString(1, fullName);
                ps.setString(2, age);
                ps.setString(3, gender);
                ps.setString(4, mobile);
                ps.setString(5, state);
                ps.setString(6, district);
                ps.setString(7, educationLevel);
                ps.setString(8, courseName);
                ps.setString(9, annualIncome);
                ps.setString(10, category);
                ps.setString(11, disability);
                ps.setString(12, bankAccount);
                ps.setInt(13, userId);

                result = ps.executeUpdate();

                ps.close();
            }

            // ============================================
            // FARMER
            // ============================================

            else if (category.equalsIgnoreCase("Farmer")) {

                String sql =
                    "UPDATE farmer_profile SET " +
                    "full_name=?, age=?, gender=?, mobile=?, " +
                    "state=?, district=?, annual_income=?, " +
                    "category=?, disability=?, " +
                    "kisan_credit_card=? " +
                    "WHERE user_id=?";

                PreparedStatement ps =
                        con.prepareStatement(sql);

                ps.setString(1, fullName);
                ps.setString(2, age);
                ps.setString(3, gender);
                ps.setString(4, mobile);
                ps.setString(5, state);
                ps.setString(6, district);
                ps.setString(7, annualIncome);
                ps.setString(8, category);
                ps.setString(9, disability);
                ps.setString(10, bankAccount);
                ps.setInt(11, userId);

                result = ps.executeUpdate();

                ps.close();
            }

            // ============================================
            // BUSINESS
            // ============================================

            else if (category.equalsIgnoreCase("Business")) {

                String sql =
                    "UPDATE business_profile SET " +
                    "fullName=?, age=?, gender=?, mobile=?, " +
                    "state=?, district=?, businessName=?, " +
                    "businessType=?, familyIncome=?, category=?, " +
                    "differentlyAbled=?, bankAccount=? " +
                    "WHERE user_id=?";

                PreparedStatement ps =
                        con.prepareStatement(sql);

                ps.setString(1, fullName);
                ps.setString(2, age);
                ps.setString(3, gender);
                ps.setString(4, mobile);
                ps.setString(5, state);
                ps.setString(6, district);
                ps.setString(7, courseName);
                ps.setString(8, educationLevel);
                ps.setString(9, annualIncome);
                ps.setString(10, category);
                ps.setString(11, disability);
                ps.setString(12, bankAccount);
                ps.setInt(13, userId);

                result = ps.executeUpdate();

                ps.close();
            }

            // ============================================
            // SENIOR CITIZEN
            // ============================================

            else if (category.equalsIgnoreCase("Senior Citizen")) {

                String sql =
                    "UPDATE senior_citizen_profile SET " +
                    "full_name=?, age=?, gender=?, mobile=?, " +
                    "state=?, district=?, family_income=?, " +
                    "category=?, differently_abled=?, " +
                    "bank_account=? " +
                    "WHERE user_id=?";

                PreparedStatement ps =
                        con.prepareStatement(sql);

                ps.setString(1, fullName);
                ps.setString(2, age);
                ps.setString(3, gender);
                ps.setString(4, mobile);
                ps.setString(5, state);
                ps.setString(6, district);
                ps.setString(7, annualIncome);
                ps.setString(8, category);
                ps.setString(9, disability);
                ps.setString(10, bankAccount);
                ps.setInt(11, userId);

                result = ps.executeUpdate();

                ps.close();
            }

            // ============================================
            // WOMEN
            // ============================================

            else if (category.equalsIgnoreCase("Women")) {

                String sql =
                    "UPDATE women_profile SET " +
                    "full_name=?, age=?, gender=?, mobile=?, " +
                    "state=?, district=?, family_income=?, " +
                    "category=?, differently_abled=?, " +
                    "business_registered=? " +
                    "WHERE user_id=?";

                PreparedStatement ps =
                        con.prepareStatement(sql);

                ps.setString(1, fullName);
                ps.setString(2, age);
                ps.setString(3, gender);
                ps.setString(4, mobile);
                ps.setString(5, state);
                ps.setString(6, district);
                ps.setString(7, annualIncome);
                ps.setString(8, category);
                ps.setString(9, disability);
                ps.setString(10, bankAccount);
                ps.setInt(11, userId);

                result = ps.executeUpdate();

                ps.close();
            }

            con.close();

            // ============================================
            // UPDATE SUCCESS
            // ============================================

            if (result > 0) {

                response.sendRedirect(
                    request.getContextPath() +
                    "/User_Dashboard_servler?updated=success"
                );

            } else {

                response.sendRedirect(
                    request.getContextPath() +
                    "/Edit_Profile_servlet?updated=failed"
                );
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType(
                    "text/html;charset=UTF-8");

            response.getWriter().println(
                    "<h2>Error updating profile</h2>"
            );

            response.getWriter().println(
                    "<p>" + e.getMessage() + "</p>"
            );
        }
    }
}