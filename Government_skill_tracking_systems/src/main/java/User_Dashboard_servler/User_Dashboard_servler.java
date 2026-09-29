package User_Dashboard_servler;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/User_Dashboard_servler")
public class User_Dashboard_servler extends HttpServlet {

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
        // 1. GET SESSION
        // =====================================================

        HttpSession session = request.getSession(false);


        // =====================================================
        // 2. CHECK LOGIN
        // =====================================================

        if (session == null ||
            session.getAttribute("userId") == null) {

            response.sendRedirect("Login_page.jsp");
            return;
        }


        // =====================================================
        // 3. GET USER ID
        // =====================================================

        int userId;

        try {

            userId = Integer.parseInt(
                    session.getAttribute("userId").toString()
            );

            System.out.println(
                    "Logged-in User ID = " + userId
            );

        } catch (Exception e) {

            response.sendRedirect("Login_page.jsp");
            return;
        }


        // =====================================================
        // 4. GET CATEGORY FROM SESSION
        // =====================================================

        String category =
                (String) session.getAttribute("category");


        if (category == null ||
            category.trim().isEmpty()) {

            response.sendRedirect("Login_page.jsp");
            return;
        }


        category = category.trim();


        // =====================================================
        // 5. COMMON PROFILE VARIABLES
        // =====================================================

        String fullName = "";
        String email = "";
        String age = "";
        String gender = "";
        String mobile = "";
        String state = "";
        String district = "";
        String educationLevel = "";
        String courseName = "";
        String annualIncome = "";
        String profileCategory = "";

        String disability = "";
        String bankAccount = "";


        // =====================================================
        // 6. ELIGIBLE SCHEMES
        // =====================================================

        List<Map<String, Object>> eligibleSchemes =
                new ArrayList<>();


        // =====================================================
        // 7. NOTIFICATIONS
        // =====================================================

        List<Map<String, Object>> notifications =
                new ArrayList<>();


        // =====================================================
        // 8. COUNTS
        // =====================================================

        int applicationCount = 0;
        int savedSchemeCount = 0;
        int notificationCount = 0;


        try {

            // =================================================
            // LOAD MYSQL DRIVER
            // =================================================

            Class.forName("com.mysql.cj.jdbc.Driver");


            // =================================================
            // DATABASE CONNECTION
            // =================================================

            try (Connection con =
                    DriverManager.getConnection(
                            URL,
                            USER,
                            PASSWORD)) {


                // =================================================
                // 9. GET EMAIL FROM REGISTRATION
                // =================================================

                String emailSql =
                        "SELECT email " +
                        "FROM registration " +
                        "WHERE user_id = ?";


                try (PreparedStatement ps =
                        con.prepareStatement(emailSql)) {

                    ps.setInt(1, userId);


                    try (ResultSet rs =
                            ps.executeQuery()) {

                        if (rs.next()) {

                            email =
                                    rs.getString("email");
                        }
                    }
                }


                // =================================================
                // 10. GET SAVED SCHEME COUNT
                // =================================================

                String savedSql =
                        "SELECT COUNT(*) " +
                        "FROM saved_schemes " +
                        "WHERE user_id = ?";


                try (PreparedStatement ps =
                        con.prepareStatement(savedSql)) {

                    ps.setInt(1, userId);


                    try (ResultSet rs =
                            ps.executeQuery()) {

                        if (rs.next()) {

                            savedSchemeCount =
                                    rs.getInt(1);
                        }
                    }
                }


                // =================================================
                // 11. LOAD PROFILE - STUDENT
                // =================================================

                if (category.equalsIgnoreCase("Student")) {

                    String sql =
                            "SELECT full_name, age, gender, " +
                            "mobile, state, district, " +
                            "education_level, courseName, " +
                            "annualIncome, category, disabled, bank " +
                            "FROM student_profile " +
                            "WHERE user_id = ?";


                    try (PreparedStatement ps =
                            con.prepareStatement(sql)) {

                        ps.setInt(1, userId);


                        try (ResultSet rs =
                                ps.executeQuery()) {

                            if (rs.next()) {

                                fullName =
                                        rs.getString("full_name");

                                age =
                                        rs.getString("age");

                                gender =
                                        rs.getString("gender");

                                mobile =
                                        rs.getString("mobile");

                                state =
                                        rs.getString("state");

                                district =
                                        rs.getString("district");

                                educationLevel =
                                        rs.getString(
                                                "education_level");

                                courseName =
                                        rs.getString(
                                                "courseName");

                                annualIncome =
                                        rs.getString(
                                                "annualIncome");

                                profileCategory =
                                        rs.getString("category");

                                disability =
                                        rs.getString("disabled");

                                bankAccount =
                                        rs.getString("bank");

                            } else {

                                response.sendRedirect(
                                        "Student_Forms.jsp?error=profile_not_found"
                                );

                                return;
                            }
                        }
                    }
                }


                // =================================================
                // 12. GIRL STUDENT
                // =================================================

                else if (
                        category.equalsIgnoreCase("Girl Student")) {

                    String sql =
                            "SELECT full_name, age, gender, " +
                            "mobile, state, district, " +
                            "education_level, course, family_income, " +
                            "category, differently_abled, bank_account " +
                            "FROM girl_student_profile " +
                            "WHERE user_id = ?";


                    try (PreparedStatement ps =
                            con.prepareStatement(sql)) {

                        ps.setInt(1, userId);


                        try (ResultSet rs =
                                ps.executeQuery()) {

                            if (rs.next()) {

                                fullName =
                                        rs.getString("full_name");

                                age =
                                        rs.getString("age");

                                gender =
                                        rs.getString("gender");

                                mobile =
                                        rs.getString("mobile");

                                state =
                                        rs.getString("state");

                                district =
                                        rs.getString("district");

                                educationLevel =
                                        rs.getString(
                                                "education_level");

                                courseName =
                                        rs.getString("course");

                                annualIncome =
                                        rs.getString(
                                                "family_income");

                                profileCategory =
                                        rs.getString("category");

                                disability =
                                        rs.getString(
                                                "differently_abled");

                                bankAccount =
                                        rs.getString(
                                                "bank_account");

                            } else {

                                response.sendRedirect(
                                        "Girl_Student_Forms.jsp?error=profile_not_found"
                                );

                                return;
                            }
                        }
                    }
                }


                // =================================================
                // 13. FARMER
                // =================================================

                else if (
                        category.equalsIgnoreCase("Farmer")) {

                    String sql =
                            "SELECT full_name, age, gender, mobile, " +
                            "state, district, annual_income, category, " +
                            "disability, kisan_credit_card " +
                            "FROM farmer_profile " +
                            "WHERE user_id = ?";


                    try (PreparedStatement ps =
                            con.prepareStatement(sql)) {

                        ps.setInt(1, userId);


                        try (ResultSet rs =
                                ps.executeQuery()) {

                            if (rs.next()) {

                                fullName =
                                        rs.getString("full_name");

                                age =
                                        rs.getString("age");

                                gender =
                                        rs.getString("gender");

                                mobile =
                                        rs.getString("mobile");

                                state =
                                        rs.getString("state");

                                district =
                                        rs.getString("district");

                                annualIncome =
                                        rs.getString(
                                                "annual_income");

                                profileCategory =
                                        rs.getString("category");

                                disability =
                                        rs.getString(
                                                "disability");

                                bankAccount =
                                        rs.getString(
                                                "kisan_credit_card");

                            } else {

                                response.sendRedirect(
                                        "Farmer_Form.jsp?error=profile_not_found"
                                );

                                return;
                            }
                        }
                    }
                }


                // =================================================
                // 14. BUSINESS
                // =================================================

                else if (
                        category.equalsIgnoreCase("Business")) {

                    String sql =
                            "SELECT fullName, age, gender, " +
                            "mobile, state, district, businessName, " +
                            "businessType, familyIncome, category, " +
                            "differentlyAbled, bankAccount " +
                            "FROM business_profile " +
                            "WHERE user_id = ?";


                    try (PreparedStatement ps =
                            con.prepareStatement(sql)) {

                        ps.setInt(1, userId);


                        try (ResultSet rs =
                                ps.executeQuery()) {

                            if (rs.next()) {

                                fullName =
                                        rs.getString("fullName");

                                age =
                                        rs.getString("age");

                                gender =
                                        rs.getString("gender");

                                mobile =
                                        rs.getString("mobile");

                                state =
                                        rs.getString("state");

                                district =
                                        rs.getString("district");

                                courseName =
                                        rs.getString(
                                                "businessName");

                                educationLevel =
                                        rs.getString(
                                                "businessType");

                                annualIncome =
                                        rs.getString(
                                                "familyIncome");

                                profileCategory =
                                        rs.getString("category");

                                disability =
                                        rs.getString(
                                                "differentlyAbled");

                                bankAccount =
                                        rs.getString(
                                                "bankAccount");

                            } else {

                                response.sendRedirect(
                                        "Business_Form.jsp?error=profile_not_found"
                                );

                                return;
                            }
                        }
                    }
                }


                // =================================================
                // 15. SENIOR CITIZEN
                // =================================================

                else if (
                        category.equalsIgnoreCase(
                                "Senior Citizen")) {

                    String sql =
                            "SELECT full_name, age, gender, " +
                            "mobile, state, district, family_income, " +
                            "category, differently_abled, bank_account " +
                            "FROM senior_citizen_profile " +
                            "WHERE user_id = ?";


                    try (PreparedStatement ps =
                            con.prepareStatement(sql)) {

                        ps.setInt(1, userId);


                        try (ResultSet rs =
                                ps.executeQuery()) {

                            if (rs.next()) {

                                fullName =
                                        rs.getString("full_name");

                                age =
                                        rs.getString("age");

                                gender =
                                        rs.getString("gender");

                                mobile =
                                        rs.getString("mobile");

                                state =
                                        rs.getString("state");

                                district =
                                        rs.getString("district");

                                annualIncome =
                                        rs.getString(
                                                "family_income");

                                profileCategory =
                                        rs.getString("category");

                                disability =
                                        rs.getString(
                                                "differently_abled");

                                bankAccount =
                                        rs.getString(
                                                "bank_account");

                            } else {

                                response.sendRedirect(
                                        "Senior_Citizen_Form.jsp?error=profile_not_found"
                                );

                                return;
                            }
                        }
                    }
                }


                // =================================================
                // 16. WOMEN
                // =================================================

                else if (
                        category.equalsIgnoreCase("Women")) {

                    String sql =
                            "SELECT full_name, age, gender, " +
                            "mobile, state, district, family_income, " +
                            "category, differently_abled, " +
                            "business_registered " +
                            "FROM women_profile " +
                            "WHERE user_id = ?";


                    try (PreparedStatement ps =
                            con.prepareStatement(sql)) {

                        ps.setInt(1, userId);


                        try (ResultSet rs =
                                ps.executeQuery()) {

                            if (rs.next()) {

                                fullName =
                                        rs.getString("full_name");

                                age =
                                        rs.getString("age");

                                gender =
                                        rs.getString("gender");

                                mobile =
                                        rs.getString("mobile");

                                state =
                                        rs.getString("state");

                                district =
                                        rs.getString("district");

                                annualIncome =
                                        rs.getString(
                                                "family_income");

                                profileCategory =
                                        rs.getString("category");

                                disability =
                                        rs.getString(
                                                "differently_abled");

                                bankAccount =
                                        rs.getString(
                                                "business_registered");

                            } else {

                                response.sendRedirect(
                                        "Women_Form.jsp?error=profile_not_found"
                                );

                                return;
                            }
                        }
                    }
                }


                // =================================================
                // 17. INVALID CATEGORY
                // =================================================

                else {

                    response.sendRedirect(
                            "Login_page.jsp?error=invalid_category"
                    );

                    return;
                }


                // =================================================
                // 18. CONVERT AGE
                // =================================================

                int userAge = 0;

                try {

                    if (age != null &&
                        !age.trim().isEmpty()) {

                        userAge =
                                Integer.parseInt(
                                        age.trim()
                                );
                    }

                } catch (Exception e) {

                    userAge = 0;
                }


                // =================================================
                // 19. CONVERT INCOME
                // =================================================

                double userIncome = 0;

                try {

                    if (annualIncome != null &&
                        !annualIncome.trim().isEmpty()) {

                        userIncome =
                                Double.parseDouble(
                                        annualIncome
                                                .replace(",", "")
                                                .replace("₹", "")
                                                .trim()
                                );
                    }

                } catch (Exception e) {

                    userIncome = 0;
                }


                // =================================================
                // 20. GET ELIGIBLE SCHEMES
                // =================================================

                String schemeSql =
                        "SELECT scheme_id, scheme_name, description, " +
                        "min_age, max_age, max_income, " +
                        "gender_required, category_required, " +
                        "disability_required, bank_account_required " +
                        "FROM schemes " +
                        "WHERE candidate_type = ? " +
                        "AND status = 'Active'";


                try (PreparedStatement ps =
                        con.prepareStatement(schemeSql)) {

                    ps.setString(1, category);


                    try (ResultSet rs =
                            ps.executeQuery()) {

                        while (rs.next()) {

                            Integer minAge = null;
                            Integer maxAge = null;
                            Double maxIncome = null;


                            int tempMinAge =
                                    rs.getInt("min_age");

                            if (!rs.wasNull()) {

                                minAge = tempMinAge;
                            }


                            int tempMaxAge =
                                    rs.getInt("max_age");

                            if (!rs.wasNull()) {

                                maxAge = tempMaxAge;
                            }


                            double tempMaxIncome =
                                    rs.getDouble("max_income");

                            if (!rs.wasNull()) {

                                maxIncome = tempMaxIncome;
                            }


                            String requiredGender =
                                    rs.getString(
                                            "gender_required");

                            String requiredCategory =
                                    rs.getString(
                                            "category_required");

                            String requiredDisability =
                                    rs.getString(
                                            "disability_required");

                            String requiredBank =
                                    rs.getString(
                                            "bank_account_required");


                            // ==========================================
                            // CALCULATE DYNAMIC MATCH PERCENTAGE
                            // ==========================================

                            int matchPercentage =
                                    calculateMatchPercentage(
                                            userAge,
                                            userIncome,
                                            gender,
                                            profileCategory,
                                            disability,
                                            bankAccount,
                                            minAge,
                                            maxAge,
                                            maxIncome,
                                            requiredGender,
                                            requiredCategory,
                                            requiredDisability,
                                            requiredBank
                                    );


                            Map<String, Object> scheme =
                                    new HashMap<>();


                            scheme.put(
                                    "scheme_id",
                                    rs.getInt("scheme_id")
                            );


                            scheme.put(
                                    "scheme_name",
                                    rs.getString("scheme_name")
                            );


                            scheme.put(
                                    "description",
                                    rs.getString("description")
                            );


                            scheme.put(
                                    "matchPercentage",
                                    matchPercentage
                            );


                            // Only show schemes having
                            // at least 60% match

                            if (matchPercentage >= 60) {

                                eligibleSchemes.add(scheme);
                            }

                        } // END while(rs.next())


                        // =================================================
                        // SORT SCHEMES BY MATCH PERCENTAGE - DESCENDING
                        // =================================================

                        Collections.sort(
                                eligibleSchemes,
                                (scheme1, scheme2) -> {

                                    int score1 =
                                            (Integer) scheme1.get(
                                                    "matchPercentage");

                                    int score2 =
                                            (Integer) scheme2.get(
                                                    "matchPercentage");

                                    return Integer.compare(
                                            score2,
                                            score1
                                    );
                                }
                        );

                    } // END ResultSet try

                } // END PreparedStatement try


                // =================================================
                // 21. APPLICATION COUNT
                // =================================================

                String applicationSql =
                        "SELECT COUNT(*) " +
                        "FROM applied_schemes " +
                        "WHERE user_id = ?";


                try (PreparedStatement ps =
                        con.prepareStatement(
                                applicationSql)) {

                    ps.setInt(1, userId);


                    try (ResultSet rs =
                            ps.executeQuery()) {

                        if (rs.next()) {

                            applicationCount =
                                    rs.getInt(1);
                        }
                    }
                }


                

                // =====================================================
                // 23. SET DATA FOR JSP
                // =====================================================

                request.setAttribute(
                        "fullName",
                        fullName
                );


                request.setAttribute(
                        "email",
                        email
                );


                request.setAttribute(
                        "age",
                        age
                );


                request.setAttribute(
                        "gender",
                        gender
                );


                request.setAttribute(
                        "mobile",
                        mobile
                );


                request.setAttribute(
                        "state",
                        state
                );


                request.setAttribute(
                        "district",
                        district
                );


                request.setAttribute(
                        "educationLevel",
                        educationLevel
                );


                request.setAttribute(
                        "courseName",
                        courseName
                );


                request.setAttribute(
                        "annualIncome",
                        annualIncome
                );


                request.setAttribute(
                        "studentCategory",
                        profileCategory
                );


                request.setAttribute(
                        "category",
                        category
                );


                // =====================================================
                // ELIGIBLE SCHEMES
                // =====================================================

                request.setAttribute(
                        "eligibleSchemes",
                        eligibleSchemes
                );


                request.setAttribute(
                        "schemeCount",
                        eligibleSchemes.size()
                );


                // =====================================================
                // APPLICATIONS
                // =====================================================

                request.setAttribute(
                        "applicationCount",
                        applicationCount
                );


                // =====================================================
                // SAVED SCHEMES
                // =====================================================

                request.setAttribute(
                        "savedSchemeCount",
                        savedSchemeCount
                );


                // =====================================================
                // NOTIFICATIONS
                // =====================================================

                request.setAttribute(
                        "notifications",
                        notifications
                );


                request.setAttribute(
                        "notificationCount",
                        notificationCount
                );


                // =====================================================
                // 24. FORWARD TO DASHBOARD
                // =====================================================

                request.getRequestDispatcher(
                        "User_Dashboard.jsp"
                ).forward(
                        request,
                        response
                );

            } // END DATABASE CONNECTION

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType(
                    "text/html;charset=UTF-8"
            );

            response.getWriter().println(
                    "<h2>Error loading dashboard</h2>"
            );

            response.getWriter().println(
                    "<p>" + e.getMessage() + "</p>"
            );
        }

    } // END doGet()


    // =========================================================
    // CHECK YES / NO REQUIREMENTS
    // =========================================================

    private boolean checkRequirement(
            String required,
            String userValue) {

        if (required == null ||
            required.trim().isEmpty()) {

            return true;
        }


        if (userValue == null ||
            userValue.trim().isEmpty()) {

            return false;
        }


        String req =
                required.trim().toLowerCase();

        String value =
                userValue.trim().toLowerCase();


        // =====================================================
        // REQUIRED YES
        // =====================================================

        if (req.equals("yes") ||
            req.equals("true") ||
            req.equals("1")) {

            return value.equals("yes") ||
                   value.equals("true") ||
                   value.equals("1");
        }


        // =====================================================
        // REQUIRED NO
        // =====================================================

        if (req.equals("no") ||
            req.equals("false") ||
            req.equals("0")) {

            return value.equals("no") ||
                   value.equals("false") ||
                   value.equals("0");
        }


        // =====================================================
        // OTHER VALUES
        // =====================================================

        return req.equals(value);
    }


    // =========================================================
    // CALCULATE MATCH PERCENTAGE
    // =========================================================

    private int calculateMatchPercentage(
            int userAge,
            double userIncome,
            String userGender,
            String userCategory,
            String userDisability,
            String userBankAccount,

            Integer minAge,
            Integer maxAge,
            Double maxIncome,
            String requiredGender,
            String requiredCategory,
            String requiredDisability,
            String requiredBank) {

        int totalCriteria = 0;
        int matchedCriteria = 0;


        // =====================================================
        // AGE
        // =====================================================

        if (minAge != null ||
            maxAge != null) {

            totalCriteria++;

            boolean ageMatch = true;


            if (minAge != null &&
                userAge < minAge) {

                ageMatch = false;
            }


            if (maxAge != null &&
                userAge > maxAge) {

                ageMatch = false;
            }


            if (ageMatch) {

                matchedCriteria++;
            }
        }


        // =====================================================
        // INCOME
        // =====================================================

        if (maxIncome != null) {

            totalCriteria++;

            if (userIncome <= maxIncome) {

                matchedCriteria++;
            }
        }


        // =====================================================
        // GENDER
        // =====================================================

        if (requiredGender != null &&
            !requiredGender.trim().isEmpty() &&
            !requiredGender.equalsIgnoreCase("Any")) {

            totalCriteria++;


            if (userGender != null &&
                requiredGender.trim()
                        .equalsIgnoreCase(
                                userGender.trim())) {

                matchedCriteria++;
            }
        }


        // =====================================================
        // CATEGORY
        // =====================================================

        if (requiredCategory != null &&
            !requiredCategory.trim().isEmpty() &&
            !requiredCategory.equalsIgnoreCase("Any")) {

            totalCriteria++;


            if (userCategory != null &&
                requiredCategory.trim()
                        .equalsIgnoreCase(
                                userCategory.trim())) {

                matchedCriteria++;
            }
        }


        // =====================================================
        // DISABILITY
        // =====================================================

        if (requiredDisability != null &&
            !requiredDisability.trim().isEmpty() &&
            !requiredDisability.equalsIgnoreCase("Any")) {

            totalCriteria++;


            if (checkRequirement(
                    requiredDisability,
                    userDisability)) {

                matchedCriteria++;
            }
        }


        // =====================================================
        // BANK ACCOUNT
        // =====================================================

        if (requiredBank != null &&
            !requiredBank.trim().isEmpty() &&
            !requiredBank.equalsIgnoreCase("Any")) {

            totalCriteria++;


            if (checkRequirement(
                    requiredBank,
                    userBankAccount)) {

                matchedCriteria++;
            }
        }


        // =====================================================
        // NO CRITERIA
        // =====================================================

        if (totalCriteria == 0) {

            return 0;
        }


        // =====================================================
        // FINAL MATCH PERCENTAGE
        // =====================================================

        return (matchedCriteria * 100)
                / totalCriteria;
    }

} // END CLASS