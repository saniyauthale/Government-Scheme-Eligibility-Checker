package Farmer_Profile_servelet;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Farmer_Profile_servelet")
public class Farmer_Profile_servelet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // =========================================================
    // DATABASE CONFIGURATION
    // =========================================================

    private static final String DB_URL =
            "jdbc:mysql://localhost:3306/skill_tracking_system";

    private static final String DB_USER = "root";

    private static final String DB_PASSWORD = "root";


    // =========================================================
    // POST
    // =========================================================

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

    	response.setContentType("text/html;charset=UTF-8");

    	String userIdStr = request.getParameter("userId");

    	if (userIdStr == null || userIdStr.trim().isEmpty()) {
    	    showError(response, "User ID not found.");
    	    return;
    	}

    	int userId = Integer.parseInt(userIdStr);
        
        // =====================================================
        // GET FARMER FORM DATA
        // =====================================================

        String fullName =
                request.getParameter("full_name");

        String ageStr =
                request.getParameter("age");

        String gender =
                request.getParameter("gender");

        String mobile =
                request.getParameter("mobile");

        String state =
                request.getParameter("state");

        String district =
                request.getParameter("district");

        String village =
                request.getParameter("village");

        String farmerType =
                request.getParameter("farmer_type");

        String landHoldingStr =
                request.getParameter("land_holding");

        String mainCrop =
                request.getParameter("main_crop");

        String irrigationFacility =
                request.getParameter("irrigation_facility");

        String annualIncome =
                request.getParameter("annual_income");

        String kisanCreditCard =
                request.getParameter("kisan_credit_card");

        String farmMachinery =
                request.getParameter("farm_machinery");

        String category =
                request.getParameter("category");

        String farmerGroupMember =
                request.getParameter("farmer_group_member");

        String disability =
                request.getParameter("disability");

        String otherIncomeSource =
                request.getParameter("other_income_source");

        String availedSchemeBefore =
                request.getParameter("availed_scheme_before");

        String schemeName =
                request.getParameter("scheme_name");


        // =====================================================
        // VALIDATE FULL NAME
        // =====================================================

        
        if (fullName == null ||
            fullName.trim().isEmpty()) {

            showError(
                response,
                "Full Name is required."
            );

            return;
        }


        // =====================================================
        // VALIDATE AGE
        // =====================================================

        if (ageStr == null ||
            ageStr.trim().isEmpty()) {

            showError(
                response,
                "Age is required."
            );

            return;
        }

        int age;

        try {

            age = Integer.parseInt(
                    ageStr.trim()
            );

        } catch (NumberFormatException e) {

            showError(
                response,
                "Please enter a valid age."
            );

            return;
        }


        // =====================================================
        // VALIDATE LAND HOLDING
        // =====================================================

        if (landHoldingStr == null ||
            landHoldingStr.trim().isEmpty()) {

            showError(
                response,
                "Land Holding is required."
            );

            return;
        }

        BigDecimal landHolding;

        try {

            landHolding =
                    new BigDecimal(
                        landHoldingStr.trim()
                    );

        } catch (NumberFormatException e) {

            showError(
                response,
                "Please enter a valid land holding value."
            );

            return;
        }


        // =====================================================
        // DEFAULT VALUES
        // =====================================================

        if (irrigationFacility == null ||
            irrigationFacility.trim().isEmpty()) {

            irrigationFacility = "No";
        }

        if (kisanCreditCard == null ||
            kisanCreditCard.trim().isEmpty()) {

            kisanCreditCard = "No";
        }

        if (farmMachinery == null ||
            farmMachinery.trim().isEmpty()) {

            farmMachinery = "No";
        }

        if (farmerGroupMember == null ||
            farmerGroupMember.trim().isEmpty()) {

            farmerGroupMember = "No";
        }

        if (disability == null ||
            disability.trim().isEmpty()) {

            disability = "No";
        }

        if (otherIncomeSource == null ||
            otherIncomeSource.trim().isEmpty()) {

            otherIncomeSource = "No";
        }

        if (availedSchemeBefore == null ||
            availedSchemeBefore.trim().isEmpty()) {

            availedSchemeBefore = "No";
        }

        if (category == null ||
            category.trim().isEmpty()) {

            category = "Farmer";
        }


        // =====================================================
        // DATABASE CONNECTION
        // =====================================================

        try {

            Class.forName(
                "com.mysql.cj.jdbc.Driver"
            );

            try (Connection con =
                    DriverManager.getConnection(
                        DB_URL,
                        DB_USER,
                        DB_PASSWORD
                    )) {


                // =================================================
                // INSERT FARMER PROFILE
                // =================================================

                String sql =
                    "INSERT INTO farmer_profile (" +

					"user_id,"+
                    "full_name, " +
                    "age, " +
                    "gender, " +
                    "mobile, " +
                    "state, " +
                    "district, " +
                    "village, " +
                    "farmer_type, " +
                    "land_holding, " +
                    "main_crop, " +
                    "irrigation_facility, " +
                    "annual_income, " +
                    "kisan_credit_card, " +
                    "farm_machinery, " +
                    "category, " +
                    "farmer_group_member, " +
                    "disability, " +
                    "other_income_source, " +
                    "availed_scheme_before, " +
                    "scheme_name" +

                    ") VALUES (" +

                    "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, " +
                    "?, ?, ?, ?, ?, ?, ?, ?, ?, ? " +

                    ")";


                try (PreparedStatement ps =
                        con.prepareStatement(sql)) {


                    // =================================================
                    // SET DATABASE VALUES
                    // =================================================

                    

                	ps.setInt(1, userId);
                	ps.setString(2, fullName);
                	ps.setInt(3, age);
                	ps.setString(4, gender);
                	ps.setString(5, mobile);
                	ps.setString(6, state);
                	ps.setString(7, district);
                	ps.setString(8, village);
                	ps.setString(9, farmerType);
                	ps.setBigDecimal(10, landHolding);
                	ps.setString(11, mainCrop);
                	ps.setString(12, irrigationFacility);
                	ps.setString(13, annualIncome);
                	ps.setString(14, kisanCreditCard);
                	ps.setString(15, farmMachinery);
                	ps.setString(16, category);
                	ps.setString(17, farmerGroupMember);
                	ps.setString(18, disability);
                	ps.setString(19, otherIncomeSource);
                	ps.setString(20, availedSchemeBefore);
                	ps.setString(21, schemeName);


                    // =================================================
                    // SAVE PROFILE
                    // =================================================

                    int rows =
                            ps.executeUpdate();


                    // =================================================
                    // SUCCESS
                    // =================================================

                    if (rows > 0) {
                        response.sendRedirect("Login_page.jsp");
                    

                    } else {

                        showError(
                            response,
                            "Failed to save Farmer Profile."
                        );
                    }
                }
            }


        } catch (Exception e) {

            e.printStackTrace();

            String errorMessage =
                    e.getMessage();

            if (errorMessage == null) {

                errorMessage =
                    "Unknown database error.";
            }

            errorMessage =
                    errorMessage
                        .replace("'", "")
                        .replace("\"", "")
                        .replace("\n", " ")
                        .replace("\r", " ");

            response.getWriter().println(
                "<script>" +
                "alert('Database Error: " +
                errorMessage +
                "');" +
                "window.history.back();" +
                "</script>"
            );
        }
    }


    // =========================================================
    // ERROR METHOD
    // =========================================================

    private void showError(
            HttpServletResponse response,
            String message)
            throws IOException {

        response.setContentType(
            "text/html;charset=UTF-8"
        );

        response.getWriter().println(
            "<script>" +
            "alert('" +
            message.replace("'", "") +
            "');" +
            "window.history.back();" +
            "</script>"
        );
    }
}