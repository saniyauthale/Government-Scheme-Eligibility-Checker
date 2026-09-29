package Girl_Profile_servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Girl_Profile_servlet")
public class Girl_Profile_servlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // =========================
    // DATABASE DETAILS
    // =========================

    private static final String DB_URL =
            "jdbc:mysql://localhost:3306/skill_tracking_system";

    private static final String DB_USER = "root";

    private static final String DB_PASSWORD = "root";


    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");


        // =========================
        // GET FORM DATA
        // =========================

        // ---------- PERSONAL ----------
        String fullName = request.getParameter("name");
        String dob = request.getParameter("dob");
        String ageStr = request.getParameter("age");
        String gender = request.getParameter("gender");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");

        String state = request.getParameter("state");
        String district = request.getParameter("district");
        String address = request.getParameter("address");


        // ---------- EDUCATION ----------
        String education =
                request.getParameter("education");

        String course =
                request.getParameter("course");

        String year =
                request.getParameter("year_semester");

        String institution =
                request.getParameter("institution_name");

        String mode =
                request.getParameter("mode_of_study");

        String hostel =
                request.getParameter("hostel_resident");


        // ---------- FAMILY ----------
        String income =
                request.getParameter("family_income");

        String familyType =
                request.getParameter("family_type");

        String category =
                request.getParameter("category");

        String disability =
                request.getParameter("differently_abled");

        String occupation =
                request.getParameter("parent_occupation");

        String benefits =
                request.getParameter("government_benefits");


        // ---------- SKILLS ----------
        String[] skillsArr =
                request.getParameterValues("skills");

        String skills = "";

        if (skillsArr != null) {
            skills = String.join(", ", skillsArr);
        }


        // ---------- INTERESTS ----------
        String[] interestArr =
                request.getParameterValues("interests");

        String interests = "";

        if (interestArr != null) {
            interests = String.join(", ", interestArr);
        }


        // ---------- ADDITIONAL ----------
        String bank =
                request.getParameter("bank_account");

        String laptop =
                request.getParameter("laptop_owned");

        String internet =
                request.getParameter("internet_access");


        // =========================
        // VALIDATE EMAIL
        // =========================

        if (email == null || email.trim().isEmpty()) {

            response.getWriter().println(
                    "<script>"
                    + "alert('Email is required.');"
                    + "window.history.back();"
                    + "</script>"
            );

            return;
        }


        // =========================
        // SAFE AGE
        // =========================

        int age = 0;

        if (ageStr != null && !ageStr.trim().isEmpty()) {

            try {

                age = Integer.parseInt(ageStr);

            } catch (NumberFormatException e) {

                response.getWriter().println(
                        "<script>"
                        + "alert('Please enter a valid age.');"
                        + "window.history.back();"
                        + "</script>"
                );

                return;
            }
        }


        // =========================
        // DATABASE
        // =========================

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");


            try (Connection con =
                    DriverManager.getConnection(
                            DB_URL,
                            DB_USER,
                            DB_PASSWORD)) {


                // ==========================================
                // 1. FIND USER ID USING EMAIL
                // ==========================================

                String userSql =
                        "SELECT user_id FROM registration WHERE email = ?";

                int userId = 0;

                try (PreparedStatement userPs =
                        con.prepareStatement(userSql)) {

                    userPs.setString(1, email);

                    try (ResultSet rs =
                            userPs.executeQuery()) {

                        if (rs.next()) {

                            userId = rs.getInt("user_id");

                        } else {

                            response.getWriter().println(
                                    "<script>"
                                    + "alert('Email is not registered. Please register first.');"
                                    + "window.location.href='Registration.jsp';"
                                    + "</script>"
                            );

                            return;
                        }
                    }
                }


                // ==========================================
                // 2. INSERT GIRL STUDENT PROFILE
                // ==========================================

                String sql =
                        "INSERT INTO girl_student_profile ("
                        + "user_id, "
                        + "full_name, "
                        + "dob, "
                        + "age, "
                        + "gender, "
                        + "mobile, "
                        + "email, "
                        + "state, "
                        + "district, "
                        + "address, "
                        + "education_level, "
                        + "course, "
                        + "year_semester, "
                        + "institution_name, "
                        + "mode_of_study, "
                        + "hostel_resident, "
                        + "family_income, "
                        + "family_type, "
                        + "category, "
                        + "differently_abled, "
                        + "parent_occupation, "
                        + "government_benefits, "
                        + "interests, "
                        + "bank_account, "
                        + "laptop_owned, "
                        + "internet_access"
                        + ") VALUES "
                        + "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
                        + "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
                        + "?, ?, ?, ?, ?, ?)";


                try (PreparedStatement ps =
                        con.prepareStatement(sql)) {


                    // ==========================================
                    // SET VALUES
                    // ==========================================

                    // 1 user_id
                    ps.setInt(1, userId);

                    // 2 full name
                    ps.setString(2, fullName);

                    // 3 DOB
                    if (dob != null && !dob.trim().isEmpty()) {

                        ps.setDate(
                                3,
                                Date.valueOf(dob)
                        );

                    } else {

                        ps.setNull(
                                3,
                                java.sql.Types.DATE
                        );
                    }

                    // 4 age
                    ps.setInt(4, age);

                    // 5 gender
                    ps.setString(5, gender);

                    // 6 mobile
                    ps.setString(6, mobile);

                    // 7 email
                    ps.setString(7, email);

                    // 8 state
                    ps.setString(8, state);

                    // 9 district
                    ps.setString(9, district);

                    // 10 address
                    ps.setString(10, address);

                    // 11 education
                    ps.setString(11, education);

                    // 12 course
                    ps.setString(12, course);

                    // 13 year/semester
                    ps.setString(13, year);

                    // 14 institution
                    ps.setString(14, institution);

                    // 15 mode
                    ps.setString(15, mode);

                    // 16 hostel
                    ps.setString(16, hostel);

                    // 17 family income
                    ps.setString(17, income);

                    // 18 family type
                    ps.setString(18, familyType);

                    // 19 category
                    ps.setString(19, category);

                    // 20 disability
                    ps.setString(20, disability);

                    // 21 parent occupation
                    ps.setString(21, occupation);

                    // 22 government benefits
                    ps.setString(22, benefits);

                    // 23 interests
                    ps.setString(23, interests);

                    // 24 bank account
                    ps.setString(24, bank);

                    // 25 laptop
                    ps.setString(25, laptop);

                    // 26 internet
                    ps.setString(26, internet);


                    // ==========================================
                    // EXECUTE INSERT
                    // ==========================================

                    int rows = ps.executeUpdate();


                    // ==========================================
                    // SUCCESS
                    // ==========================================

                    if (rows > 0) {

                        System.out.println(
                                "Girl student profile saved successfully."
                        );

                        response.getWriter().println(
                                "<script>"
                                + "alert('Girl Student Profile Submitted Successfully!');"
                                + "window.location.href='Login_page.jsp';"
                                + "</script>"
                        );


                    } else {

                        // ======================================
                        // FAILED
                        // ======================================

                        response.getWriter().println(
                                "<script>"
                                + "alert('Failed to save profile. Please try again.');"
                                + "window.history.back();"
                                + "</script>"
                        );
                    }
                }
            }


        } catch (Exception e) {

            e.printStackTrace();

            String errorMessage =
                    e.getMessage();

            if (errorMessage == null) {
                errorMessage = "Unknown database error";
            }

            // Remove apostrophe so JavaScript doesn't break
            errorMessage =
                    errorMessage.replace("'", "");

            response.getWriter().println(
                    "<script>"
                    + "alert('Database Error: "
                    + errorMessage
                    + "');"
                    + "window.history.back();"
                    + "</script>"
            );
        }
    }
}