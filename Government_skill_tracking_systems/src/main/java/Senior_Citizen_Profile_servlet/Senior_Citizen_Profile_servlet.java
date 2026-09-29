package Senior_Citizen_Profile_servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Senior_Citizen_Profile_servlet")
public class Senior_Citizen_Profile_servlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // ==========================================
    // DATABASE DETAILS
    // ==========================================

    private static final String URL =
            "jdbc:mysql://localhost:3306/skill_tracking_system";

    private static final String USER = "root";

    private static final String PASSWORD = "root";


    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");


        // ==========================================
        // 1. PERSONAL INFORMATION
        // ==========================================

        String fullName =
                request.getParameter("fullName");

        String dob =
                request.getParameter("dob");

        String age =
                request.getParameter("age");

        String gender =
                request.getParameter("gender");

        String mobile =
                request.getParameter("mobile");

        String email =
                request.getParameter("email");

        String state =
                request.getParameter("state");

        String district =
                request.getParameter("district");

        String address =
                request.getParameter("address");

        String pincode =
                request.getParameter("pincode");


        // ==========================================
        // 2. FAMILY INFORMATION
        // ==========================================

        String familyIncome =
                request.getParameter("familyIncome");

        String livingArrangement =
                request.getParameter("livingArrangement");

        String liveAlone =
                request.getParameter("liveAlone");

        String familyMembers =
                request.getParameter("familyMembers");

        String dependentMembers =
                request.getParameter("dependentMembers");

        String spouse =
                request.getParameter("spouse");

        String category =
                request.getParameter("category");

        String differentlyAbled =
                request.getParameter("differentlyAbled");


        // ==========================================
        // 3. HEALTH INFORMATION
        // ==========================================

        String healthNeed =
                request.getParameter("healthNeed");

        String healthInsurance =
                request.getParameter("healthInsurance");

        String disability =
                request.getParameter("disability");


        // ==========================================
        // 4. FINANCIAL INFORMATION
        // ==========================================

        String bankAccount =
                request.getParameter("bankAccount");

        String pensionType =
                request.getParameter("pensionType");

        String pensionAmount =
                request.getParameter("pensionAmount");

        String otherIncome =
                request.getParameter("otherIncome");


        // ==========================================
        // 5. ADDITIONAL INFORMATION
        // ==========================================

        String previousBenefit =
                request.getParameter("previousBenefit");

        String seniorCitizenCard =
                request.getParameter("seniorCitizenCard");

        String occupation =
                request.getParameter("occupation");


        // ==========================================
        // VALIDATE EMAIL
        // ==========================================

        if (email == null || email.trim().isEmpty()) {

            response.getWriter().println(
                    "<script>"
                    + "alert('Email is required.');"
                    + "window.history.back();"
                    + "</script>"
            );

            return;
        }


        // ==========================================
        // DATABASE CONNECTION
        // ==========================================

        try {

            Class.forName(
                    "com.mysql.cj.jdbc.Driver"
            );


            try (Connection con =
                    DriverManager.getConnection(
                            URL,
                            USER,
                            PASSWORD)) {


                // ==========================================
                // 1. FIND USER ID FROM REGISTRATION
                // ==========================================

                String userSql =
                        "SELECT user_id "
                        + "FROM registration "
                        + "WHERE email = ?";

                int userId = 0;


                try (PreparedStatement userPs =
                        con.prepareStatement(userSql)) {

                    userPs.setString(1, email);


                    try (ResultSet rs =
                            userPs.executeQuery()) {

                        if (rs.next()) {

                            userId =
                                    rs.getInt("user_id");

                        } else {

                            // EMAIL NOT REGISTERED

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
                // 2. INSERT SENIOR CITIZEN PROFILE
                // ==========================================

                String sql =
                        "INSERT INTO senior_citizen_profile ("
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
                        + "pincode, "
                        + "family_income, "
                        + "living_arrangement, "
                        + "live_alone, "
                        + "family_members, "
                        + "dependent_members, "
                        + "spouse, "
                        + "category, "
                        + "differently_abled, "
                        + "health_need, "
                        + "health_insurance, "
                        + "disability, "
                        + "bank_account, "
                        + "pension_type, "
                        + "pension_amount, "
                        + "other_income, "
                        + "previous_benefit, "
                        + "senior_citizen_card, "
                        + "occupation"
                        + ") VALUES ("
                        + "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
                        + "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
                        + "?, ?, ?, ?, ?, ?, ?, ?, ?"
                        + ")";


                try (PreparedStatement ps =
                        con.prepareStatement(sql)) {


                    // ==========================================
                    // SET VALUES
                    // ==========================================

                    // 1. USER ID
                    ps.setInt(1, userId);

                    // 2. FULL NAME
                    ps.setString(2, fullName);

                    // 3. DOB
                    if (dob != null &&
                        !dob.trim().isEmpty()) {

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


                    // 4. AGE
                    if (age != null &&
                        !age.trim().isEmpty()) {

                        ps.setInt(
                                4,
                                Integer.parseInt(age)
                        );

                    } else {

                        ps.setNull(
                                4,
                                java.sql.Types.INTEGER
                        );
                    }


                    // 5. GENDER
                    ps.setString(5, gender);

                    // 6. MOBILE
                    ps.setString(6, mobile);

                    // 7. EMAIL
                    ps.setString(7, email);

                    // 8. STATE
                    ps.setString(8, state);

                    // 9. DISTRICT
                    ps.setString(9, district);

                    // 10. ADDRESS
                    ps.setString(10, address);

                    // 11. PINCODE
                    ps.setString(11, pincode);

                    // 12. FAMILY INCOME
                    ps.setString(12, familyIncome);

                    // 13. LIVING ARRANGEMENT
                    ps.setString(13, livingArrangement);

                    // 14. LIVE ALONE
                    ps.setString(14, liveAlone);


                    // 15. FAMILY MEMBERS
                    if (familyMembers != null &&
                        !familyMembers.trim().isEmpty()) {

                        ps.setInt(
                                15,
                                Integer.parseInt(familyMembers)
                        );

                    } else {

                        ps.setNull(
                                15,
                                java.sql.Types.INTEGER
                        );
                    }


                    // 16. DEPENDENT MEMBERS
                    ps.setString(
                            16,
                            dependentMembers
                    );

                    // 17. SPOUSE
                    ps.setString(
                            17,
                            spouse
                    );

                    // 18. CATEGORY
                    ps.setString(
                            18,
                            category
                    );

                    // 19. DIFFERENTLY ABLED
                    ps.setString(
                            19,
                            differentlyAbled
                    );

                    // 20. HEALTH NEED
                    ps.setString(
                            20,
                            healthNeed
                    );

                    // 21. HEALTH INSURANCE
                    ps.setString(
                            21,
                            healthInsurance
                    );

                    // 22. DISABILITY
                    ps.setString(
                            22,
                            disability
                    );

                    // 23. BANK ACCOUNT
                    ps.setString(
                            23,
                            bankAccount
                    );

                    // 24. PENSION TYPE
                    ps.setString(
                            24,
                            pensionType
                    );


                    // 25. PENSION AMOUNT
                    if (pensionAmount != null &&
                        !pensionAmount.trim().isEmpty()) {

                        ps.setBigDecimal(
                                25,
                                new BigDecimal(pensionAmount)
                        );

                    } else {

                        ps.setNull(
                                25,
                                java.sql.Types.DECIMAL
                        );
                    }


                    // 26. OTHER INCOME
                    if (otherIncome != null &&
                        !otherIncome.trim().isEmpty()) {

                        ps.setBigDecimal(
                                26,
                                new BigDecimal(otherIncome)
                        );

                    } else {

                        ps.setNull(
                                26,
                                java.sql.Types.DECIMAL
                        );
                    }


                    // 27. PREVIOUS BENEFIT
                    ps.setString(
                            27,
                            previousBenefit
                    );

                    // 28. SENIOR CITIZEN CARD
                    ps.setString(
                            28,
                            seniorCitizenCard
                    );

                    // 29. OCCUPATION
                    ps.setString(
                            29,
                            occupation
                    );


                    // ==========================================
                    // EXECUTE INSERT
                    // ==========================================

                    int result =
                            ps.executeUpdate();


                    // ==========================================
                    // SUCCESS
                    // ==========================================

                    if (result > 0) {

                        System.out.println(
                                "Senior Citizen profile saved successfully."
                        );


                        response.getWriter().println(
                                "<script>"
                                + "alert('Senior Citizen Profile Submitted Successfully!');"
                                + "window.location.href='Login_page.jsp';"
                                + "</script>"
                        );


                    } else {

                        // ======================================
                        // FAILED
                        // ======================================

                        response.getWriter().println(
                                "<script>"
                                + "alert('Failed to save Senior Citizen profile. Please try again.');"
                                + "window.history.back();"
                                + "</script>"
                        );
                    }
                }
            }


        } catch (NumberFormatException e) {

            e.printStackTrace();

            response.getWriter().println(
                    "<script>"
                    + "alert('Please enter valid numbers for Age, Family Members or Amount fields.');"
                    + "window.history.back();"
                    + "</script>"
            );


        } catch (IllegalArgumentException e) {

            e.printStackTrace();

            response.getWriter().println(
                    "<script>"
                    + "alert('Please enter a valid date.');"
                    + "window.history.back();"
                    + "</script>"
            );


        } catch (Exception e) {

            e.printStackTrace();

            String errorMessage =
                    e.getMessage();

            if (errorMessage == null) {
                errorMessage = "Unknown database error";
            }

            // Prevent JavaScript from breaking
            errorMessage =
                    errorMessage
                    .replace("'", "")
                    .replace("\"", "");

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