package Women_Profile_Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Date;
import java.sql.Types;

@WebServlet("/Women_Profile_Servlet")
public class Women_Profile_Servlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // =========================
    // DATABASE DETAILS
    // =========================

    private static final String URL =
            "jdbc:mysql://localhost:3306/skill_tracking_system";

    private static final String USER = "root";

    private static final String PASSWORD = "root";


    // =========================
    // DO POST
    // =========================

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");


        // =========================
        // 1. PERSONAL INFORMATION
        // =========================

        String fullName = request.getParameter("fullName");
        String dob = request.getParameter("dob");
        String age = request.getParameter("age");
        String gender = request.getParameter("gender");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");

        String state = request.getParameter("state");
        String district = request.getParameter("district");
        String pincode = request.getParameter("pincode");


        // =========================
        // 2. FAMILY INFORMATION
        // =========================

        String familyIncome = request.getParameter("familyIncome");
        String familyType = request.getParameter("familyType");
        String category = request.getParameter("category");
        String familyMembers = request.getParameter("familyMembers");

        String differentlyAbled =
                request.getParameter("differentlyAbled");

        String governmentBenefits =
                request.getParameter("governmentBenefits");


        // =========================
        // 3. EDUCATION & SKILLS
        // =========================

        String educationLevel =
                request.getParameter("educationLevel");

        String qualification =
                request.getParameter("qualification");

        String[] skillsArray =
                request.getParameterValues("skills");

        String skills = "";

        if (skillsArray != null && skillsArray.length > 0) {
            skills = String.join(", ", skillsArray);
        }


        // =========================
        // 4. EMPLOYMENT & BUSINESS
        // =========================

        String occupation =
                request.getParameter("occupation");

        String selfEmployed =
                request.getParameter("selfEmployed");

        String ownBusiness =
                request.getParameter("ownBusiness");

        String businessType =
                request.getParameter("businessType");

        String businessRegistered =
                request.getParameter("businessRegistered");

        String turnover =
                request.getParameter("turnover");


        // =========================
        // 5. PREFERENCES
        // =========================

        String[] preferencesArray =
                request.getParameterValues("preferences");

        String preferences = "";

        if (preferencesArray != null && preferencesArray.length > 0) {
            preferences = String.join(", ", preferencesArray);
        }


        // =========================
        // SQL QUERY
        // =========================

        String sql =
                "INSERT INTO women_profile ("
                + "full_name, dob, age, gender, mobile, email, "
                + "state, district, pincode, "
                + "family_income, family_type, category, family_members, "
                + "differently_abled, government_benefits, "
                + "education_level, qualification, skills, "
                + "occupation, self_employed, own_business, "
                + "business_type, business_registered, turnover, "
                + "preferences"
                + ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";


        // =========================
        // DATABASE CONNECTION
        // =========================

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");


            // =========================
            // TRY WITH RESOURCES
            // =========================

            try (Connection con = DriverManager.getConnection(
                        URL,
                        USER,
                        PASSWORD);

                 PreparedStatement ps = con.prepareStatement(sql)) {


                // =========================
                // SET VALUES
                // =========================

                // 1. Full Name
                ps.setString(1, fullName);

                // 2. DOB
                if (dob != null && !dob.trim().isEmpty()) {

                    ps.setDate(2, Date.valueOf(dob));

                } else {

                    ps.setNull(2, Types.DATE);
                }

                // 3. Age
                if (age != null && !age.trim().isEmpty()) {

                    ps.setInt(3, Integer.parseInt(age));

                } else {

                    ps.setNull(3, Types.INTEGER);
                }

                // 4. Gender
                ps.setString(4, gender);

                // 5. Mobile
                ps.setString(5, mobile);

                // 6. Email
                ps.setString(6, email);

                // 7. State
                ps.setString(7, state);

                // 8. District
                ps.setString(8, district);

                // 9. Pincode
                ps.setString(9, pincode);

                // 10. Family Income
                ps.setString(10, familyIncome);

                // 11. Family Type
                ps.setString(11, familyType);

                // 12. Category
                ps.setString(12, category);

                // 13. Family Members
                if (familyMembers != null &&
                    !familyMembers.trim().isEmpty()) {

                    ps.setInt(13, Integer.parseInt(familyMembers));

                } else {

                    ps.setNull(13, Types.INTEGER);
                }

                // 14. Differently Abled
                ps.setString(14, differentlyAbled);

                // 15. Government Benefits
                ps.setString(15, governmentBenefits);

                // 16. Education Level
                ps.setString(16, educationLevel);

                // 17. Qualification
                ps.setString(17, qualification);

                // 18. Skills
                ps.setString(18, skills);

                // 19. Occupation
                ps.setString(19, occupation);

                // 20. Self Employed
                ps.setString(20, selfEmployed);

                // 21. Own Business
                ps.setString(21, ownBusiness);

                // 22. Business Type
                ps.setString(22, businessType);

                // 23. Business Registered
                ps.setString(23, businessRegistered);

                // 24. Turnover
                ps.setString(24, turnover);

                // 25. Preferences
                ps.setString(25, preferences);


                // =========================
                // EXECUTE INSERT
                // =========================

                int result = ps.executeUpdate();


                // =========================
                // SUCCESS / FAILURE
                // =========================

                if (result > 0) {

                    System.out.println(
                            "Women profile saved successfully."
                    );

                    response.setContentType("text/html");
                    response.setCharacterEncoding("UTF-8");

                    response.getWriter().println(
                            "<script>"
                            + "alert('Women profile submitted successfully!');"
                            + "window.location.href='Login_page.jsp';"
                            + "</script>"
                    );

                } else {

                    response.setContentType("text/html");
                    response.setCharacterEncoding("UTF-8");

                    response.getWriter().println(
                            "<script>"
                            + "alert('Failed to submit women profile. Please try again.');"
                            + "window.location.href='Women_Forms.jsp';"
                            + "</script>"
                    );
                }

            } // <-- IMPORTANT: closes try-with-resources


        } catch (NumberFormatException e) {

            e.printStackTrace();

            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");

            response.getWriter().println(
                    "<script>"
                    + "alert('Please enter valid numbers for Age and Family Members.');"
                    + "window.location.href='Women_Forms.jsp';"
                    + "</script>"
            );


        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");

            response.getWriter().println("<h2>Database Error</h2>");
            response.getWriter().println("<pre>");

            e.printStackTrace(
                    response.getWriter()
            );

            response.getWriter().println("</pre>");
        }
    }
}